mklink /D "$($PWD)/nvim" "$($env:LocalAppData)/nvim"

# Setup OpenConsole to replace conhost
# Follow instructions: https://github.com/alacritty/alacritty/issues/1663#issuecomment-644739799
$Account = New-Object System.Security.Principal.NTAccount($env:username)
$Item = Get-Item 'C:/Windows/System32/conhost.exe'
$Acl = Get-Acl -Path $Item.FullName; # Get the ACL from the item
$OldAcl = Get-Acl -Path $Item.FullName
$Acl.SetOwner($Account); # Update the in-memory ACL
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule($env:username, "FullControl", "Allow")
$Acl.SetAccessRule($Ar)
Set-Acl -Path $Item.FullName -AclObject $Acl;  # Set the updated ACL on the target item

$ocFile = Get-ChildItem 'c:\Program Files\WindowsApps' -Filter "Microsoft.WindowsTerminal*" | 
    Sort-Object CreationTime | 
    Select-Object -Last 1 | 
    Get-ChildItem -Filter "OpenConsole.exe"

Rename-Item $Item.FullName "conhost-old-$(Get-Date -Format 'M-d-y').exe"
Copy-Item $ocFile.FullName "C:/Windows/System32/conhost.exe"

Set-Acl -Path 'C:/Windows/System32/conhost.exe' -AclObject $OldAcl
