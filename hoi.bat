@echo off
chcp 65001 >nul

:ask_webrtc
echo Da chay Start WebRTC chua? 
echo Chua chay thi chay di roi chon Yes...

:: Sử dụng PowerShell để hiện lên hộp thoại với thông báo trên nhiều dòng
powershell -command "[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); $message = 'Đã chạy Start WebRTC chưa?' + [Environment]::NewLine + 'Chạy rồi thì chọn Yes đi' + [Environment]::NewLine + 'Chưa chạy thì chạy đi rồi chọn Yes'; $result = [System.Windows.Forms.MessageBox]::Show($message, 'Thông báo', [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question); exit ([int]$result)"

:: Kiểm tra kết quả trả về từ hộp thoại PowerShell
if %errorlevel%==6 (
    echo Ban da chay WebRTC, mo Chrome...
    start chrome
    exit
) else (
    echo Ban chua chay Start WebRTC. -> Chay Start WebRTC di roi hay mo Chrome
    pause
    exit
)
