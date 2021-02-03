SET ANDROID_NDK_ROOT=D:/study/android/android-ndk-r19c
SET ANDROID_NDK_CLANG=%ANDROID_NDK_ROOT%/toolchains/llvm/prebuilt/windows-x86_64
SET ANDROID_NDK_ARM=%ANDROID_NDK_ROOT%/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64
SET ANDROID_NDK_ARM64=%ANDROID_NDK_ROOT%/toolchains/aarch64-linux-android-4.9/prebuilt/windows-x86_64
SET ANDROID_NDK_MIPS=%ANDROID_NDK_ROOT%/toolchains/mipsel-linux-android-4.9/prebuilt/windows-x86_64
SET ANDROID_NDK_X86=%ANDROID_NDK_ROOT%/toolchains/x86-4.9/prebuilt/windows-x86_64
SET ANDROID_SDK_ROOT=D:/study/android/sdk
SET GIT_BIN=D:/Program Files/Git/usr/bin
SET PATH=%PATH%;%ANDROID_SDK_ROOT%/platform-tools;%GIT_BIN%
make
@rem make android-arm & make android-arm64 & make android-x86
make android-arm64
@PAUSE