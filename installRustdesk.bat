:: Cai dat Rustdesk
REM Assign the value random password to the password variable
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
set alfanum=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
set rustdesk_pw=
for /L %%b in (1, 1, 12) do (
    set /A rnd_num=!RANDOM! %% 62
    for %%c in (!rnd_num!) do (
        set rustdesk_pw=!rustdesk_pw!!alfanum:~%%c,1!
    )
)

REM Get your config string from your Web portal and Fill Below
set rustdesk_cfg="SURTZXJ2ZXI9MTAzLjEyNy4xOTUuNDY7UmVsYXlTZXJ2ZXI9MTAzLjEyNy4xOTUuNDY="

REM ############################### Please Do Not Edit Below This Line #########################################

if not exist C:\Users\Public\Downloads\ md C:\Users\Public\Downloads\
cd C:\Users\Public\Downloads\

curl -L "https://github.com/nobita2906/file_vm/raw/refs/heads/main/rustdesk.exe" -o rustdesk.exe

rustdesk.exe --silent-install
timeout /t 20

cd "C:\Program Files\RustDesk\"
rustdesk.exe --install-service
timeout /t 20

for /f "delims=" %%i in ('rustdesk.exe --get-id ^| more') do set rustdesk_id=%%i

rustdesk.exe --config %rustdesk_cfg%
rustdesk.exe --password Kk@2025@!
timeout /t 10

echo ...............................................
REM Show the value of the ID Variable
echo RustDesk ID: %rustdesk_id%

REM Show the value of the Password Variable
echo Password: %rustdesk_pw%
echo ...............................................
