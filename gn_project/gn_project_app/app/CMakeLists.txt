cmake_minimum_required(VERSION 3.4.1)

#asm 用clang编译。  nasm 用yasm编译
#enable_language(ASM)
enable_language(CXX)

set(LIB_DIR ${CMAKE_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI})
include_directories(src/main/cpp/include)

add_library(gn_wrapper STATIC IMPORTED)
set_target_properties(gn_wrapper PROPERTIES IMPORTED_LOCATION ${LIB_DIR}/libgn_wrapperDebug.a)

add_library(
        gn_study
        SHARED
        src/main/cpp/JNIEntry.cpp
)
find_library( # Sets the name of the path variable.
        log-lib

        # Specifies the name of the NDK library that
        # you want CMake to locate.
        log)

target_link_libraries(
        gn_study
        gn_wrapper
        ${log-lib}
)