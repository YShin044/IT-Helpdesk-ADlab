Import-Module ActiveDirectory

# Khai báo đường dẫn và mật khẩu mới (fix lại thành đường dẫn đến scripts)
$csvPath = "C:\Company\Scripts\reset_list.csv"
$newPassword = "P@ssword12345"

# Chuyển đổi mật khẩu mới sang SecureString
$securePassword = ConvertTo-SecureString $newPassword -AsPlainText -Force

# Đọc danh sách user cần reset
$usersToReset = Import-Csv -Path $csvPath

foreach ($user in $usersToReset) {
    $userName = $user.UserName
    Write-Host "Đang reset mật khẩu cho $userName..." -ForegroundColor Yellow

    # Đặt mật khẩu mới cho tài khoản
    Set-ADAccountPassword -Identity $userName -NewPassword $securePassword -Reset

    # Bắt buộc người dùng phải đổi mật khẩu trong lần đăng nhập tiếp theo
    Set-ADUser -Identity $userName -ChangePasswordAtLogon $true

    Write-Host "ĐÃ RESET THÀNH CÔNG mật khẩu cho $userName" -ForegroundColor Green
}

Write-Host "Hoàn thành tác vụ!" -ForegroundColor Cyan