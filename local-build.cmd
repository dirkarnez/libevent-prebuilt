REM run as Administrator
@echo off
cd /d %~dp0

@REM set DOWNLOAD_DIR=%USERPROFILE%\Downloads
@REM set DOWNLOAD_DIR_LINUX=%DOWNLOAD_DIR:\=/%
@REM SET PATH=^
@REM %DOWNLOAD_DIR%\PortableGit\bin;^
@REM %DOWNLOAD_DIR%\x86_64-8.1.0-release-win32-seh-rt_v6-rev0;^
@REM %DOWNLOAD_DIR%\x86_64-8.1.0-release-win32-seh-rt_v6-rev0\bin;^
@REM %DOWNLOAD_DIR%\cmake-3.22.2-windows-x86_64\bin;^

set PATH=^
D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64;^
D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64\bin;^
D:\Softwares\cmake-3.23.0-rc1-windows-x86_64\bin;

cmake.exe -G"MinGW Makefiles" ^
-DCMAKE_BUILD_TYPE=Release ^
-DBUILD_SHARED_LIBS=OFF ^
-DEVENT__LIBRARY_TYPE="STATIC" ^
-DEVENT__DISABLE_MBEDTLS=ON ^
-DEVENT__DISABLE_SAMPLES=ON ^
-DEVENT__DISABLE_TESTS=ON ^
-DEVENT__DISABLE_REGRESS=ON ^
-DOPENSSL_DIR="D:/Code Projects/cpp-libraries/openssl-installation" ^
-DOPENSSL_USE_STATIC_LIBS=TRUE ^
-DCMAKE_INSTALL_PREFIX="build/libevent-installation" -B./build

cd build
cmake --build . && cmake --install .
pause
REM GOTO rebuild_and_startapp