SET MINGW=D:/msys2/mingw64
SET GIT_BIN=D:/Program Files/Git/usr/bin
SET PATH=%PATH%;%MINGW%/bin;%GIT_BIN%
make -f makefile_win 
@rem mingw-gcc-debug32 mingw-gcc-release32 mingw-gcc-debug64 mingw-gcc-release64
make -f makefile_win mingw-gcc-debug64
@PAUSE