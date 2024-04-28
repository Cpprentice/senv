@echo off

FOR /F "tokens=* USEBACKQ" %%a IN (`%~dp0\senv-get.bat %~1`) DO (
    @REM echo %%a
    for /F "tokens=1,2 delims=|" %%b in ("%%a") do (
        @REM echo %%b
        @REM echo %%c
        if "%%b"=="PATH" (
            echo Removing %%c from PATH
            SET PATH=%PATH:%%c;=%
        ) else (
            echo Removing ENV variable %%b
            SET "%%b="
        )
    )
)
