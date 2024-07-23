.PHONY: build rebuild clean


build:
	conan install . --output-folder=build --build=missing
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake
	cmake --build build

clean:
	/bin/rm -rf build

rebuild: clean build
