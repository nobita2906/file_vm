@echo off
setlocal

REM Đường dẫn tải xuống RustDesk client
set "rustDeskUrl=https://github.com/rustdesk/rustdesk/releases/download/1.1.9/rustdesk-1.1.9-windows-x64.exe"
set "destinationPath=%TEMP%\rustdesk_installer.exe"

REM Tải xuống RustDesk client
powershell -Command "Invoke-WebRequest -Uri %rustDeskUrl% -OutFile %destinationPath%"

REM Cài đặt RustDesk client
start /wait %destinationPath% /silent

REM Tạo file cấu hình cho RustDesk
set "configPath=%APPDATA%\RustDesk\config\RustDesk"
if not exist "%APPDATA%\RustDesk\config" mkdir "%APPDATA%\RustDesk\config"
(
    echo [server]
    echo id = kkremote.io.vn
    echo relay = kkremote.io.vn
    echo key = 
    echo 
    echo [client]
    echo password = Khakim@198#
) > "%configPath%"

REM Hiển thị thông báo hoàn thành
echo RustDesk client đã được cài đặt và cấu hình thành công!
pause

endlocal
