@echo off
REM MinGW download  https://sourceforge.net/projects/mingw-w64/

REM SET PATH VARIABLE TO INCLUDE CMAKE AND MINGW COMPILER
set PATH=C:\Program Files\CMake\bin;%PATH%
set PATH=C:\Programs\TDM-GCC-64\bin;%PATH%
REM the following path can be overridden by the WXWIN define
set PATH=C:\Programs\wxWidgets-3.0.2_mingw;%PATH%

set optsx=-DWXWIN="C:/Programs/WxWidgets-3.1.1_mingw"

REM USE ONE OF THESE OPTIONS
set opts=
:: set opts=-DWXSHARED=ON
:: set opts=-DCMAKE_VERBOSE_MAKEFILE=1
:: set opts=-DCMAKE_BUILD_TYPE=Debug  -DCMAKE_VERBOSE_MAKEFILE=1
:: set opts=-DCMAKE_BUILD_TYPE="MinSizeRel"
:: echo %opts%

REM Executable
echo.
echo * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
echo *               AStyleWx MinGW Executable               *
echo * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
cd  "%USERPROFILE%\Projects\AStyleWx"
if exist aswx-mingw-exe  rmdir /s /q aswx-mingw-exe
md  aswx-mingw-exe
cd  aswx-mingw-exe
cmake  -G "MinGW Makefiles"   %opts%  %optsx%  ../
mingw32-make

echo.
pause
