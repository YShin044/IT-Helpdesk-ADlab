# Lấy thông tin nhóm mà người dùng hiện tại đang là thành viên
$userGroups = (Get-ADPrincipalGroupMembership -Identity $env:USERNAME).Name

# Kiểm tra xem ổ đĩa S: đã tồn tại chưa
if (-not (Test-Path S:)) {
    # Nếu người dùng thuộc nhóm "Sales_Users"
    if ($userGroups -contains "Sales_Users") {
        # Map ổ đĩa S: đến thư mục của phòng Sales
        New-PSDrive -Name "S" -PSProvider "FileSystem" -Root "\\DC01\SalesData" -Persist
        Write-Host "Đã map ổ đĩa S: cho phòng Sales."
    }
}

# Kiểm tra xem ổ đĩa H: đã tồn tại chưa
if (-not (Test-Path H:)) {
    # Nếu người dùng thuộc nhóm "HR_Users" (ví dụ)
    if ($userGroups -contains "HR_Users") {
        # Map ổ đĩa H: đến thư mục của phòng HR
        New-PSDrive -Name "H" -PSProvider "FileSystem" -Root "\\DC01\HRData" -Persist
        Write-Host "Đã map ổ đĩa H: cho phòng HR."
    }
}