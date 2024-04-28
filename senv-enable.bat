@echo off

FOR /F "tokens=* USEBACKQ" %%a IN (`%~dp0\senv-get.bat %~1`) DO (
    @REM echo %%a
    for /F "tokens=1,2 delims=|" %%b in ("%%a") do (
        echo %%b
        echo %%c
        if "%%b"=="PATH" (
            SET "PATH=%%c;%PATH%"
        ) else (
            SET "%%b=%%c"
        )
    )
)

@REM exit /b

@REM if "%~1"=="" (
@REM     echo "No argument specified"
@REM     exit /b 1
@REM )

@REM FOR /F "tokens=* USEBACKQ" %%F IN (`command`) DO (
@REM SET var=%%F
@REM )
@REM ECHO %var%

@REM powershell -File %~dp0\enable-senv.ps1 -Name %~1


@REM for /F "tokens=2,3 delims=|" %%b in ("%%a") do (
@REM     SET "%%b=%%c"
@REM )
@REM for /F "tokens=4,5 delims=|" %%b in ("%%a") do (
@REM     SET "%%b=%%c"
@REM )
@REM for /F "tokens=6,7 delims=|" %%b in ("%%a") do (
@REM     SET "%%b=%%c"
@REM )
@REM for /F "tokens=8,9 delims=|" %%b in ("%%a") do (
@REM     SET "%%b=%%c"
@REM )
@REM for /F "tokens=10,11 delims=|" %%b in ("%%a") do (
@REM     SET "%%b=%%c"
@REM )
@REM for /F "tokens=12,13 delims=|" %%b in ("%%a") do (
@REM     SET "%%b=%%c"
@REM )
@REM for /F "tokens=14,15 delims=|" %%b in ("%%a") do (
@REM     SET "%%b=%%c"
@REM )