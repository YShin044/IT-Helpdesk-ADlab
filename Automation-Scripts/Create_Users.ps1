# Import module Active Directory để sử dụng các lệnh liên quan
Import-Module ActiveDirectory

# Khai báo đường dẫn đến file CSV (fix lại thành đường dẫn đến scripts)
$csvPath = "C:\Company\Scripts\new_users.csv"

# Đọc dữ liệu từ file CSV
$users = Import-Csv -Path $csvPath

# Vòng lặp để xử lý từng dòng (từng user) trong file CSV
foreach ($user in $users) {
    # Lấy thông tin từ các cột trong file CSV
    $userName   = $user.UserName
    $firstName  = $user.FirstName
    $lastName   = $user.LastName
    $department = $user.Department
    $ouPath     = $user.OUPath

    # Chuyển đổi mật khẩu từ dạng văn bản thường sang dạng SecureString mà AD yêu cầu
    $password = ConvertTo-SecureString $user.Password -AsPlainText -Force

    Write-Host "Đang xử lý tạo người dùng: $userName..." -ForegroundColor Yellow
    
    # Tạo tài khoản người dùng mới với các thông tin đã lấy
    New-ADUser -Name "$firstName $lastName" `
               -GivenName $firstName `
               -Surname $lastName `
               -SamAccountName $userName `
               -UserPrincipalName "$userName@minhtam.server" `
               -Path $ouPath `
               -AccountPassword $password `
               -Department $department `
               -Enabled $true `
               -ChangePasswordAtLogon $false

    Write-Host "ĐÃ TẠO THÀNH CÔNG người dùng: $userName" -ForegroundColor Green
}

Write-Host "Hoàn thành tác vụ!" -ForegroundColor Cyan