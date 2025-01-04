@echo off
setlocal enabledelayedexpansion

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