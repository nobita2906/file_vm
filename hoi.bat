@echo off
chcp 65001 >nul

:: Ẩn CMD và chạy PowerShell để hiển thị thông báo
powershell -WindowStyle Hidden -Command "[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); $message = 'B1 - Check Open Proxy?' + [Environment]::NewLine + 'B2 - Chạy Start RTC' + [Environment]::NewLine +  'B3 - Check Time whoer.net' + [Environment]::NewLine + 'B4 - Mở hiabc.xyz' + [Environment]::NewLine + 'B5 - Tạo thêm cookie web'; $result = [System.Windows.Forms.MessageBox]::Show($message, 'Chú ý đọc trước khi mở Chrome', [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question); exit ([int]$result)"

:: Kiểm tra kết quả trả về từ hộp thoại PowerShell
if %errorlevel%==6 (
    echo Ban da chay WebRTC, mo Chrome...
    
    exit
) else (
    echo Ban chua chay Start WebRTC. -> Chay Start WebRTC di roi hay mo Chrome
    pause
    exit
)
