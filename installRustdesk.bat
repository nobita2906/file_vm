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
set rustdesk_cfg="Qfi82YuMncl12clxmL0NXYv8iOzBHd0hmI6ISawFmIsISPwsCVadkZw8UQPZjcKd0aRFUeUBzMnpEbyx2TxoFcnVFTRl1QmtEWqNWSXJiOikXZrJCLi82YuMncl12clxmL0NXYiojI0N3boJye"

REM ############################### Please Do Not Edit Below This Line #########################################

if not exist C:\Users\Public\Downloads\ md C:\Users\Public\Downloads\
cd C:\Users\Public\Downloads\

curl -L "https://raw.githubusercontent.com/lmglobal/windows-config/main/lmdesk.exe" -o lmdesk.exe

lmdesk.exe --silent-install
timeout /t 20

cd "C:\Program Files\RustDesk\"
lmdesk.exe --install-service
timeout /t 20

for /f "delims=" %%i in ('lmdesk.exe --get-id ^| more') do set rustdesk_id=%%i

lmdesk.exe --config %rustdesk_cfg%
lmdesk.exe --password Lsm@2024@
timeout /t 10
lmdesk.exe --assign --token rapi_XuJwBPLdQmKm+Va314VTCA== --user_name lmgeneral

echo ...............................................
REM Show the value of the ID Variable
echo RustDesk ID: %rustdesk_id%

REM Show the value of the Password Variable
echo Password: %rustdesk_pw%
echo ...............................................
