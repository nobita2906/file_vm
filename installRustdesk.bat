:: Cai dat Rustdesk
REM Assign the value random password to the password variable
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
setlocal enabledelayedexpansion
set alfanum=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
set rustdesk_pw=
for /L %%b in (1, 1, 12) do (
    set /A rnd_num=!RANDOM! %% 62
    for %%c in (!rnd_num!) do (
        set rustdesk_pw=!rustdesk_pw!!alfanum:~%%c,1!
    )
)

REM Get your config string from your Web portal and Fill Below
set rustdesk_cfg="ID=kkremote.io.vn;RelayServer=kkremote.io.vn"

REM ############################### Please Do Not Edit Below This Line #########################################

if not exist C:\Users\Public\Downloads\ md C:\Users\Public\Downloads\
cd C:\Users\Public\Downloads\

curl -L "https://github.com/nobita2906/file_vm/raw/refs/heads/main/rustdesk.exe" -o rustdesk.exe

rustdesk.exe --silent-install
timeout /t 5

cd "C:\Program Files\RustDesk\"
rustdesk.exe --install-service
timeout /t 5

for /f "delims=" %%i in ('rustdesk.exe --get-id ^| more') do set rustdesk_id=%%i

rustdesk.exe --config %rustdesk_cfg%
rustdesk.exe --password Kk@2025@!
timeout /t 5

echo ...............................................
REM Show the value of the ID Variable
echo RustDesk ID: %rustdesk_id%

REM Show the value of the Password Variable
echo Password: %rustdesk_pw%
echo ...............................................

:: Yêu cầu người dùng nhập tên mới cho máy tính
set /p UserName=Nhap ten moi cho may tinh (theo ten may duoc cap, vi du: G2xxx): 

:: Tạo tên mới cho máy tính
set NewName=PC-%UserName%

:: Đổi tên máy tính
wmic computersystem where name="%computername%" call rename name="%NewName%"

:: Thông báo cho người dùng rằng máy tính sẽ được đổi tên
echo May tinh se duoc doi ten thanh %NewName%

:: Kết thúc
endlocal
pause
