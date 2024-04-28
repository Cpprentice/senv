@echo off

powershell -File %~dp0\list-senv.ps1
Exit /b


SET FILE=

if exist "%USERPROFILE%\.senv.conf" (
    SET "FILE=%USERPROFILE%\.senv.conf"
) else if exist "%~dp0\.senv.conf" (
    SET "FILE=%~dp0\.senv.conf"
) else (
    echo No sENVs configured
    exit /b 1
)

@REM SET "TEST=jre17|PATH|C:\Development\Tools\OpenJDKJRE64\bin|JAVA_HOME|C:\Development\Tools\OpenJDKJRE64"

@REM echo test
@REM for /F "tokens=1-3 delims=|" %%a in ("%TEST%") do (
@REM     echo %%a
@REM     echo %%b
@REM     echo %%c
@REM     echo %%d
@REM     echo %%e
@REM     echo troll
@REM )

echo Listing envs

for /F "usebackq" %%a in ("%FILE%") do (

    @REM echo %%a

    for /F "tokens=1 delims=|" %%b in ("%%a") do (
        @REM echo %%b
        SET "PROFILE_NAME=%%b"
    )

    echo %PROFILE_NAME%

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
)
