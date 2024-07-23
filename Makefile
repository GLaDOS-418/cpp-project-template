export PROJECT_NAME=project_name
export CC=clang
export CXX=clang++

# define docker names
IMAGE_NAME=cppdev
IMAGE_TAG=latest
CONTAINER_NAME=${IMAGE_NAME}_container

# cmake build directory
BUILD_DIR=build

# cmake build type
BUILD_TYPE=Debug

# Define the container home directory variable
CONTAINER_HOME_DIR=/home/${PROJECT_NAME}

.PHONY: build clean rebuild test testprint package run deepclean terminal image format

format:
	git ls-files -cmo --exclude-standard | grep -iE '\.(c|cc|cpp|cxx|txx|h|hpp|tpp)$$' | xargs clang-format -i
package:
	mkdir -p ${BUILD_DIR}
	conan install . \
		--output-folder=${BUILD_DIR} \
		--build=missing \
		--profile:build=conan.profile \
		--profile:host=conan.profile
build: package
	mkdir -p logs
	@NOW=$$(date +"%Y%m%d_%H%M%S"); \
	LOG_FILE="buildlog_$${NOW}.txt"; \
	cmake -S . -B ${BUILD_DIR} -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
	-DCMAKE_C_COMPILER=${CC} -DCMAKE_CXX_COMPILER=${CXX} \
	-DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake 2>&1 | tee logs/$${LOG_FILE}; \
	cmake --build ${BUILD_DIR} 2>&1 | tee -a logs/$${LOG_FILE}

clean:
	/bin/rm -rf ${BUILD_DIR}
deepclean: clean
	conan remove -c "*"
rebuild: clean build
	echo "clean + build successfull!"
test:
	cd ${BUILD_DIR} && ctest -C ${BUILD_TYPE} && cd ..
testprint:
	cd ${BUILD_DIR} && \
		ctest --rerun-failed --output-on-failure -C ${BUILD_TYPE} && cd ..
run: check_project_name check_project_exists
	./build/${PROJECT_NAME}

check_project_name:
	@if [ -z "${PROJECT_NAME}" ]; then \
		echo "Error: PROJECT_NAME is empty. Set a valid project name."; \
		exit 1; \
	fi
check_project_exists:
	@if [ ! -e ./build/${PROJECT_NAME} ]; then \
		echo "Error: ${PROJECT_NAME} executable not found. Run 'make build' first."; \
		exit 1; \
	fi
image:
	docker build -f ./.devcontainer/Dockerfile \
		--tag=${IMAGE_NAME}:${IMAGE_TAG} .
terminal:
	if [ $$(docker ps -aq -f name=${CONTAINER_NAME}) ]; then \
		docker start ${CONTAINER_NAME} || true; \
		docker exec -it ${CONTAINER_NAME} /bin/bash; \
	else \
		docker run --net=host -it \
			--name ${CONTAINER_NAME} \
			-v ${PWD}:${CONTAINER_HOME_DIR} \
 			-u $(id -u):$(id -g) \
			-w ${CONTAINER_HOME_DIR} \
			${IMAGE_NAME}:${IMAGE_TAG}; \
	fi
