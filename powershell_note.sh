# powershell module
.psm1

# powershell script
.ps1

# write to stdout
Write-Host

# get help for command 
Get-Help

# get type of variable
variable.GetType()

# get method of variable
variable | Get-Member

New-Item

Set-Alias

Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -match $name}

Get-PSRepository

Get-Service 

Get-Process

Get-Help

Get-ChildItem

Get-PSSession

Get-Command Get-*Firewall*

Get-Module

Get-Content

Get-AuthenticodeSignature

Get-Alias

Get-Alias -Definition Get-ChildItem

Get-WindowsFeature

Import-Module

Select-String -Pattern "*" -SimpleMatch

Select-Object -First 5

Send-MailMessage

Format-List

Invoke-WebRequest

[Console]::Beep()

Incoke-Command -ScriptBlock $SBMP -Session $SP71

# hash-table
@{;}

# mutiple line String
@'
abc
'@

# array 
%{,}

# execute script or command 
& script\command


