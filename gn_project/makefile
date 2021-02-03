#
# Copyright 2011-2020 Branimir Karadzic. All rights reserved.
# License: https://github.com/bkaradzic/bx#license-bsd-2-clause
#
#UNAME := $(shell uname)
#ifeq ($(UNAME),$(filter $(UNAME),Linux GNU Darwin Haiku))
#ifeq ($(UNAME),$(filter $(UNAME),Darwin Haiku))
#ifeq ($(UNAME),$(filter $(UNAME),Darwin))
#OS=darwin
#BUILD_PROJECT_DIR=gmake-osx
#BUILD_OUTPUT_DIR=osx64_clang
#BUILD_TOOLS_CONFIG=release64
#EXE=
#else
#OS=haiku
#BUILD_PROJECT_DIR=gmake-haiku
#BUILD_OUTPUT_DIR=haiku64_gcc
#BUILD_TOOLS_CONFIG=release64
#EXE=
#endif
#else
#OS=linux
#BUILD_PROJECT_DIR=gmake-linux
#BUILD_OUTPUT_DIR=linux64_gcc
#BUILD_TOOLS_CONFIG=release64
#EXE=
#endif
#else
OS=windows
BUILD_PROJECT_DIR=gmake-mingw-gcc
BUILD_OUTPUT_DIR=win32_mingw-gcc
BUILD_TOOLS_CONFIG=release64
EXE=.exe

#endif
 $(info $(OS))

GENIE=../gen_build_tools/$(OS)/genie


#for android need
#SET ANDROID_NDK_ROOT=F:/study/android/android-ndk-r19c
#SET ANDROID_NDK_CLANG=%ANDROID_NDK_ROOT%/toolchains/llvm/prebuilt/windows-x86_64
#SET ANDROID_NDK_ARM=%ANDROID_NDK_ROOT%/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64
#SET ANDROID_NDK_ARM64=%ANDROID_NDK_ROOT%/toolchains/aarch64-linux-android-4.9/prebuilt/windows-x86_64
#SET ANDROID_NDK_MIPS=%ANDROID_NDK_ROOT%/toolchains/mipsel-linux-android-4.9/prebuilt/windows-x86_64
#SET ANDROID_NDK_X86=%ANDROID_NDK_ROOT%/toolchains/x86-4.9/prebuilt/windows-x86_64
#SET ANDROID_SDK_ROOT=F:/study/android_sdk
#SET GIT_BIN=F:/Program Files/Git/usr/bin
#SET PATH=%PATH%;%ANDROID_SDK_ROOT%/platform-tools;%GIT_BIN%
#make
#make android-arm & make android-arm64 & make android-x86
#@PAUSE

#  --with-combined-examples   表示编译添加选项 一般配合lua脚本使用
# newoption {
#	trigger = "with-combined-examples",
#	description = "Enable building examples (combined as single executable).",
#}
#if _OPTIONS["with-examples"]
#or _OPTIONS["with-combined-examples"]
#or _OPTIONS["with-tools"] then
#	group "examples"
#	dofile "example-common.lua"
#end

projgen:
	$(GENIE) vs2017
	$(GENIE) --gcc=android-arm gmake
	$(GENIE) --gcc=android-arm64 gmake
	$(GENIE) --gcc=android-x86 gmake
	$(GENIE) --gcc=mingw-gcc gmake
	$(GENIE) --gcc=linux-gcc gmake
	$(GENIE) --gcc=haiku gmake
	$(GENIE) --gcc=osx gmake
	$(GENIE) --gcc=ios-arm gmake
	$(GENIE) --gcc=ios-simulator gmake
	$(GENIE) --gcc=ios-simulator64 gmake
	$(GENIE) xcode8

.build/projects/gmake-android-arm:
	$(GENIE) --gcc=android-arm gmake
android-arm-debug: .build/projects/gmake-android-arm
	make -R -C .build/projects/gmake-android-arm config=debug
android-arm-release: .build/projects/gmake-android-arm
	make -R -C .build/projects/gmake-android-arm config=release
android-arm: android-arm-debug android-arm-release

.build/projects/gmake-android-arm64:
	$(GENIE) --gcc=android-arm64 gmake
android-arm64-debug: .build/projects/gmake-android-arm64
	make -R -C .build/projects/gmake-android-arm64 config=debug
android-arm64-release: .build/projects/gmake-android-arm64
	make -R -C .build/projects/gmake-android-arm64 config=release
android-arm64: android-arm64-debug android-arm64-release

.build/projects/gmake-android-x86:
	$(GENIE) --gcc=android-x86 gmake
android-x86-debug: .build/projects/gmake-android-x86
	make -R -C .build/projects/gmake-android-x86 config=debug
android-x86-release: .build/projects/gmake-android-x86
	make -R -C .build/projects/gmake-android-x86 config=release
android-x86: android-x86-debug android-x86-release

.build/projects/gmake-linux:
	$(GENIE) --gcc=linux-gcc gmake
linux-debug64: .build/projects/gmake-linux
	make -R -C .build/projects/gmake-linux config=debug64
linux-release64: .build/projects/gmake-linux
	make -R -C .build/projects/gmake-linux config=release64
linux: linux-debug64 linux-release64

.build/projects/gmake-haiku:
	$(GENIE) --gcc=haiku gmake
haiku-debug64: .build/projects/gmake-haiku
	make -R -C .build/projects/gmake-haiku config=debug64
haiku-release64: .build/projects/gmake-haiku
	make -R -C .build/projects/gmake-haiku config=release64
haiku: haiku-debug64 haiku-release64

.build/projects/gmake-mingw-gcc:
	$(GENIE) --gcc=mingw-gcc gmake
mingw-gcc-debug32: .build/projects/gmake-mingw-gcc
	make -R -C .build/projects/gmake-mingw-gcc config=debug32
mingw-gcc-release32: .build/projects/gmake-mingw-gcc
	make -R -C .build/projects/gmake-mingw-gcc config=release32
mingw-gcc-debug64: .build/projects/gmake-mingw-gcc
	make -R -C .build/projects/gmake-mingw-gcc config=debug64
mingw-gcc-release64: .build/projects/gmake-mingw-gcc
	make -R -C .build/projects/gmake-mingw-gcc config=release64
mingw-gcc: mingw-gcc-debug32 mingw-gcc-release32 mingw-gcc-debug64 mingw-gcc-release64

.build/projects/gmake-mingw-clang:
	$(GENIE) --clang=mingw-clang gmake
mingw-clang-debug32: .build/projects/gmake-mingw-clang
	make -R -C .build/projects/gmake-mingw-clang config=debug32
mingw-clang-release32: .build/projects/gmake-mingw-clang
	make -R -C .build/projects/gmake-mingw-clang config=release32
mingw-clang-debug64: .build/projects/gmake-mingw-clang
	make -R -C .build/projects/gmake-mingw-clang config=debug64
mingw-clang-release64: .build/projects/gmake-mingw-clang
	make -R -C .build/projects/gmake-mingw-clang config=release64
mingw-clang: mingw-clang-debug32 mingw-clang-release32 mingw-clang-debug64 mingw-clang-release64

.build/projects/vs2017:
	$(GENIE) vs2017

.build/projects/gmake-osx:
	$(GENIE) --gcc=osx gmake
osx-debug64: .build/projects/gmake-osx
	make -C .build/projects/gmake-osx config=debug64
osx-release64: .build/projects/gmake-osx
	make -C .build/projects/gmake-osx config=release64
osx: osx-debug64 osx-release64

.build/projects/gmake-ios-arm:
	$(GENIE) --gcc=ios-arm gmake
ios-arm-debug: .build/projects/gmake-ios-arm
	make -R -C .build/projects/gmake-ios-arm config=debug
ios-arm-release: .build/projects/gmake-ios-arm
	make -R -C .build/projects/gmake-ios-arm config=release
ios-arm: ios-arm-debug ios-arm-release

.build/projects/gmake-ios-simulator:
	$(GENIE) --gcc=ios-simulator gmake
ios-simulator-debug: .build/projects/gmake-ios-simulator
	make -R -C .build/projects/gmake-ios-simulator config=debug
ios-simulator-release: .build/projects/gmake-ios-simulator
	make -R -C .build/projects/gmake-ios-simulator config=release
ios-simulator: ios-simulator-debug ios-simulator-release

.build/projects/gmake-ios-simulator64:
	$(GENIE) --gcc=ios-simulator64 gmake
ios-simulator64-debug: .build/projects/gmake-ios-simulator64
	make -R -C .build/projects/gmake-ios-simulator64 config=debug
ios-simulator64-release: .build/projects/gmake-ios-simulator64
	make -R -C .build/projects/gmake-ios-simulator64 config=release
ios-simulator64: ios-simulator64-debug ios-simulator64-release

rebuild-shaders:
	make -R -C examples rebuild

analyze:
	cppcheck src/
	cppcheck examples/

docs:
	doxygen scripts/bgfx.doxygen
	markdown README.md > .build/docs/readme.html

clean:
	@echo Cleaning...
	-@rm -rf .build
	@mkdir .build
	
.PHONY: help

help:
	@echo Available targets:
	@grep -E "^[a-zA-Z0-9_-]+:.*?## .*$$" $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
###

SILENT ?= @



 
 
 
 
 
