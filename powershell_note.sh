# powershell module
.psm1

# powershell script
.ps1

# print to stdout as one line
Write-Host 

# print each item as one line
Write-Output 

# get help for command 
Get-Help cmdlet

# print class object
Write-Host ($obj | Format-Table | Out-String)

# get type of variable
variable.GetType()

# get method of variable
variable | Get-Member

# powershell get environment variable
Get-Item -Path Env:*

New-Item

Set-Location # change directory equivalent cd 

Set-Alias

Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -match $name}

Get-PSRepository

Get-Service 

Get-Process

Get-Help

Get-ChildItem # equivalent ls

Get-PSSession

# get all cmdlet command in the system
Get-Command

Get-Command Get-*Firewall*

Get-Module

Get-Content

Get-AuthenticodeSignature

# get all alias in the system
Get-Alias

Get-Alias -Definition Get-ChildItem

Get-WindowsFeature

Import-Module

Select-String -Pattern "*" -SimpleMatch

Select-Object -First 5

Send-MailMessage

Format-List

Invoke-WebRequest

# join path
Join-Path -Path path -ChildPath child_path

# split path 
Split-Path -path path
Split-Path -Path "C:\WINDOWS\system32\WindowsPowerShell\V1.0\about_*.txt"
C:\WINDOWS\system32\WindowsPowerShell\V1.0

Split-Path -path path -Leaf
Split-Path -Path "C:\Test\Logs\*.log" -Leaf -Resolve
Pass1.log
Pass2.log

Split-Path -path path -LeafBase
Split-Path -path "C:\Test\Logs\Pass1.log" -LeafBase
Pass1

Split-Path -path path -Extension
Split-Path -path "C:\Test\Logs\Pass1.log" -Extension
.log

Split-Path -path path -Qualifier
Split-Path -Path "HKCU:\Software\Microsoft" -Qualifier
HKCU:

Split-Path -path path -NoQualifier
Split-Path -path "C:\Test\Logs\Pass1.log" -NoQualifier
\Test\Logs\Pass1.log.

Split-Path -path path -IsAbsolute
Split-Path -Path ".\My Pictures\*.jpg" -IsAbsolute
False

Split-Path -path path -LiteralPath 

# Resolves the wildcard characters in a path, and displays the path contents.
Resolve-Path

Test-Path path -PathType Container

[Console]::Beep()

$dateformat = "%Y-%m-%d %T%Z"
# get date time in certain format
Get-Date -UFormat $dateformat

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

# cast class object to psobject
foreach ($obj in $objs.PSObject.Properties){
    $obj
    $obj.Name
    $obj.Value
}

[String]
[Int]
[Bool]
[System.Collections.Generic.List[SystemA.Object]]
[System.Collections.Generic.List[System.Management.Automation.PSMethod]]
[hashtable]$var= @{;}

# convert json string to powershell PSCustomObject and Array
$json_string|ConvertFrom-Json

# convert powershell object and hashtable to compact json string
$powershell_object|ConvertTo-Json -compress

# convert json string to compact json string
$json_string|ConvertFrom-Json|ConvertTo-Json -compress

# remote control 
Write-Output "Ensure the computer name is a trusted host using an Administrative Powershell: `"Set-Item WSMan:\localhost\Client\TrustedHosts -Value '*'`""
Write-Output "Ensure the remote system has PSRemoting enabled: `"Enable-PSRemoting -Force`""
Write-Output "Ensure WinRM is running on the remote system: `"WinRM quickconfig`""
param (
[Parameter()]
[String]
$ComputerName,
[Parameter()]
[PSCredential]
$Credential = (New-Object System.Management.Automation.PSCredential "Username",(ConvertTo-SecureString -AsPlainText -String "Password" -Force))
)
$file_byte = [system.io.file]::ReadAllBytes("read_from_path")
Invoke-Command -ComputerName $ComputerName -Credential ($Credential) -ErrorAction Continue -ScriptBlock {
    [System.IO.File]::WriteAllBytes("write_to_path", $using:file_byte)
}

# Hides the output instead of sending it down the pipeline or displaying it.
Out-Null
# holds the last error code in the powershell script to return the error codes from the powershell script
$LASTEXITCODE

