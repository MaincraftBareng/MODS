@echo off
setlocal EnableDelayedExpansion
set MCDIR=%1
set CHECK=mods
if not exist %MCDIR%\%CHECK% goto ERR1
del /S /Q %MCDIR%\%CHECK%\*
set CHECK=config
if not exist %MCDIR%\%CHECK%\* goto ERR1
del /S /Q %MCDIR%\%CHECK%
goto PART1
:ERR1
echo FATAL ERROR: you don't have folder mods in %MCDIR%
echo - are %MCDIR% is the correct minecraft folder?
echo - have you install and run minecraft forge?
exit /b 1
:PART1
for %%f in (mod_*.md) do (
    echo processing %%~nf
    set FN=%%~nf.jar
    for /F "DELIMS=':' TOKENS=1,2" %%l in (%%f) do (
        if not "%%m" == " dummy" (
            if "%%l" == "- location_client" (
                set TFN=%%m
                echo copy mods\!TFN:~1! %MCDIR%\mods\!TFN:~1!
                copy mods\!TFN:~1! %MCDIR%\mods\!TFN:~1!
                )
            )
        if "%%l" == "- mod_name" (
            set TMN=%%m
            echo copy config\!TMN:~1!\* %MCDIR%\config\
            copy config\!TMN:~1!\* %MCDIR%\config\
            )
    )
    copy config\%%~nf
)