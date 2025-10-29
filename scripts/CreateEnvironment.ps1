mkdir -p C:/TOOLS
mkdir -p C:/CASE
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\Desktop\CASE" -Target "C:/CASE"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\Desktop\TOOLS" -Target "C:/TOOLS"

Set-WinUserLanguageList -Force "de-ch"
Set-TimeZone -Id "UTC"
Powercfg /Change standby-timeout-ac 0
Powercfg /Change standby-timeout-dc 0