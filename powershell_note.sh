# powershell module
.psm1

# powershell script
.ps1

# write to stdout
Write-Host

# get help for command 
Get-Help

# print class object
Write-Host ($obj | Format-Table | Out-String)

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
