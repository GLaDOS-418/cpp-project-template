.PHONY: build rebuild clean


build:
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
	cmake --build build

clean:
	/bin/rm -rf build

rebuild: clean build
