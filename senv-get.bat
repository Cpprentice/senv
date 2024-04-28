@echo off

if "%~1"=="" (
    echo "No argument specified"
    exit /b 1
)

SET FILE=

if exist "%USERPROFILE%\.senv.conf" (
    SET "FILE=%USERPROFILE%\.senv.conf"
) else if exist "%~dp0\.senv.conf" (
    SET "FILE=%~dp0\.senv.conf"
) else (
    echo No sENVs configured
    exit /b 2
)

for /F "usebackq" %%a in ("%FILE%") do (

    @REM echo %%a

    for /F "tokens=1 delims=|" %%b in ("%%a") do (
        @REM echo %%b
        SET "PROFILE_NAME=%%b"
    )
    @REM echo %PROFILE_NAME%
    if "%PROFILE_NAME%"=="%~1" (
        for /F "tokens=2,3 delims=|" %%b in ("%%a") do (
            if "%%b" NEQ "" (
                echo %%b^|%%c
            )
        )
        for /F "tokens=4,5 delims=|" %%b in ("%%a") do (
            if "%%b" NEQ "" (
                echo %%b^|%%c
            )
        )
        for /F "tokens=6,7 delims=|" %%b in ("%%a") do (
            if "%%b" NEQ "" (
                echo %%b^|%%c
            )
        )
        for /F "tokens=8,9 delims=|" %%b in ("%%a") do (
            if "%%b" NEQ "" (
                echo %%b^|%%c
            )
        )
        for /F "tokens=10,11 delims=|" %%b in ("%%a") do (
            if "%%b" NEQ "" (
                echo %%b^|%%c
            )
        )
        for /F "tokens=12,13 delims=|" %%b in ("%%a") do (
            if "%%b" NEQ "" (
                echo %%b^|%%c
            )
        )
        for /F "tokens=14,15 delims=|" %%b in ("%%a") do (
            if "%%b" NEQ "" (
                echo %%b^|%%c
            )
        )
    )

    @REM echo %PROFILE_NAME%

    
)
