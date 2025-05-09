# powershell set and get environment variable
$path = [System.Environment]::GetEnvironmentVariable('Path', 'User')
$array = $path -split (";")
$array += "C:\Program Files\Java\jdk-19\bin"
$new_path = $array -join ";"
[Environment]::SetEnvironmentVariable('Path',$new_path,'User')

# powershell get environment variable
[System.Environment]::GetEnvironmentVariable('Path', 'Machine')
[System.Environment]::GetEnvironmentVariable('Path', 'User')

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
# example 
Set-Alias -Name list -Value Get-ChildItem

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

#equivalent to history in linux
Get-Content (Get-PSReadlineOption).HistorySavePath

# get drive info 
get-disk
wmic diskdrive list

# automatic nonboot drive create partition
(get-disk|Where-Object -Property IsBoot -EQ $False)`
    | Initialize-Disk -PartitionStyle GPT -passthru `
    | New-Partition -AssignDriveLetter -UseMaximumSize `
    | Format-Volume -FileSystem NTFS -Force $Confirm:$False

# automatic nonboot drive clear partition 
(get-disk|Where-Object -Property IsBoot -EQ $False) | ? PartitionStyle -NE "RAW" `
    | Clear-Disk -RemoveData -RemoveOEM -Confirm:$False -ErrorAction SilentlyContinue

# find msi of installed package for windows
wmic product where "Name like '%%$product_name%%'" get LocalPackage /format:list

# uninstall msi of installed package for windows
wmic product where "Name like '%%$product_name%%'" call uninstall

wmic # The Windows Management Instrumentation Command line (WMIC) is a software utility that allows users to performs Windows Management Instrumentation (WMI) operations with a command prompt.

[System.IO.Path]::GetTempPath() # C:\Users\$Username\AppData\Local\Temp

[System.Guid]::NewGuid() # 5933ea2a-9709-4f6f-a9b6-fd25b3b8ea19

Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath ([System.Guid]::NewGuid())

Try{
    # code 
} catch {
    $_.ScriptStackTrace # trace back of code that throw exception.
}

# start folder in current directory
ii .
# short cut
ctrl + shift + t   # new tab 
ctrl + tab         # next tab
ctrl + shift + tab # prev tab

# quit install msi file
msiexec.exe /i file_name.msi /qb

# quit install exe file
Start-Process -FilePath file_name.exe -ArgumentList "/quiet /norestart" -Wait

# bashrc like script
$profile

# create alias 
Function ws{
    cd ${workspace_dir_path}
}

# get powershell execute script policy
Get-ExecutionPolicy
Get-ExecutionPolicy -List

Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted -Force

