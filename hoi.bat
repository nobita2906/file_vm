@echo off
chcp 65001 >nul

:: Ẩn CMD và chạy PowerShell để hiển thị thông báo
powershell -WindowStyle Hidden -Command "[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); $message = 'Đã chạy Start WebRTC chưa?' + [Environment]::NewLine + 'Chạy rồi thì chọn Yes đi' + [Environment]::NewLine + 'Chưa chạy thì chạy đi rồi chọn Yes'; $result = [System.Windows.Forms.MessageBox]::Show($message, 'Thông báo', [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question); exit ([int]$result)"

:: Kiểm tra kết quả trả về từ hộp thoại PowerShell
if %errorlevel%==6 (
    echo Ban da chay WebRTC, mo Chrome...
    
    exit
) else (
    echo Ban chua chay Start WebRTC. -> Chay Start WebRTC di roi hay mo Chrome
    pause
    exit
)
