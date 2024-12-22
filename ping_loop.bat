:: Disables echoing of the command itself in the terminal.
@echo off
:: Enables delayed expansion of environment variables (useful for advanced scripting).
setlocal enabledelayedexpansion

REM Check if the IP address is provided as a parameter
if "%1"=="" (
    echo Error: No IP address provided.
    echo "Usage: %0 <IP_Address>"
    exit /b 1
)
set ip=%1

:: Another way to accept input
::REM Prompt the user to enter the IP address
::set /p ip="Enter the IP address to ping: "

REM Ping the IP address until it is reachable
set count=0
set maxCount=2
:pingloop
if !count! == !maxCount! (
    exit /b 1
)
:: Pings the IP address once. The >nul part suppresses the output.
ping -n 1 %ip% >nul
if errorlevel 1 (
    echo %ip% is unreachable. Retrying...
    :: Waits for 1 seconds before retrying.
    timeout /t 1 >nul
    :: Count loop number
    set /a count+=1
    :: Continue
    goto pingloop
) else (
    echo %ip% is reachable.
)

echo Script completed.

@echo off
setlocal enabledelayedexpansion

REM Initialize the number variable
set number=0

:: Another way to do loop
::REM Loop to increment the number 1000 times
::for /L %%i in (1,1,1000) do (
::    ...
::)
