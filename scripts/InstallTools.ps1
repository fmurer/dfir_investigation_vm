$TOOL_FOLDER="C:/TOOLS/"
$HAYABUSA_VERSION="3.6.0"

# Choco Tools
choco install C:/vagrant/ansible/resources/forensic_tools.config --yes

# KAPE
$kape_target_file = "C:\Windows\Temp\kape.zip"
$kape_download_link = "https://bit.ly/2Ei31Ga"
IWR -Uri $kape_download_link -OutFile $kape_target_file -ErrorAction:Stop
Expand-Archive -Path $kape_target_file -DestinationPath "$TOOL_FOLDER\" -Force
rm $kape_target_file

# Hayabusa
mkdir -p "$TOOL_FOLDER\hayabusa"
$hayabusa_target_file = "C:\Windows\Temp\hayabusa.zip"
$hayabusa_download_link = "https://github.com/Yamato-Security/hayabusa/releases/download/v$HAYABUSA_VERSION/hayabusa-$HAYABUSA_VERSION-win-x64.zip"
IWR -Uri $hayabusa_download_link -OutFile $hayabusa_target_file -ErrorAction:Stop
Expand-Archive -Path $hayabusa_target_file -DestinationPath "$TOOL_FOLDER\hayabusa" -Force
rm $hayabusa_target_file

# EZ Tools
mkdir -p "$TOOL_FOLDER\ericzimmerman"
$ez_target_file = "C:\Windows\Temp\ez.zip"
$ez_download_link = "https://download.ericzimmermanstools.com/Get-ZimmermanTools.zip"
IWR -Uri $ez_download_link -OutFile $ez_target_file -ErrorAction:Stop
Expand-Archive -Path $ez_target_file -DestinationPath "$TOOL_FOLDER\ericzimmerman" -Force
cd "$TOOL_FOLDER\ericzimmerman"
& "$TOOL_FOLDER\ericzimmerman\Get-ZimmermanTools.ps1"
rm $ez_target_file

# Sysinternals
mkdir -p "$TOOL_FOLDER\sysinternals"
$sys_target_file = "C:\Windows\Temp\sys.zip"
$sys_download_link = "https://download.sysinternals.com/files/SysinternalsSuite.zip"
IWR -Uri $sys_download_link -OutFile $sys_target_file -ErrorAction:Stop
Expand-Archive -Path $sys_target_file -DestinationPath "$TOOL_FOLDER\sysinternals" -Force
rm $sys_target_file

# Nirlauncher
mkdir -p "$TOOL_FOLDER\nirsoft"
$nir_target_file = "C:\Windows\Temp\nir.zip"
$nir_download_link = "https://download.nirsoft.net/nirsoft_package_enc_1.30.20.zip"
IWR -Uri $nir_download_link -OutFile $nir_target_file -ErrorAction:Stop  -Headers @{ "Referer" = "https://launcher.nirsoft.net/" }
7z.exe x $nir_target_file -p"nirsoft9876$" -o"$TOOL_FOLDER\nirsoft" -y
rm $nir_target_file

# FTK Imager
mkdir -p "$TOOL_Folder\ftkimager"
$ftk_target_file = "$TOOL_Folder\ftkimager\ftk_installer.exe"
$ftk_download_link = "https://d1kpmuwb7gvu1i.cloudfront.net/Imgr/4.7.3.81%20Release/Exterro_FTK_Imager_%28x64%29-4.7.3.81.exe"
IWR -Uri $ftk_download_link -OutFile $ftk_target_file -ErrorAction:Stop

# Cleanup / Move Shortcuts to Tools Folder
mv "C:\Users\Public\Desktop\Libre*.lnk" "$TOOL_FOLDER\"
mv "C:\Users\Public\Desktop\Thunderbird.lnk" "$TOOL_FOLDER\"
mv "C:\Users\Public\Desktop\Visual Studio Code.lnk" "$TOOL_FOLDER\"
mv "C:\Users\Public\Desktop\Firefox.lnk" "$TOOL_FOLDER\"
mv "C:\Users\vagrant\Desktop\Tor*.lnk" "$TOOL_FOLDER\"
cp "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Notepad*.lnk" "$TOOL_FOLDER\"
cp "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Wireshark.lnk" "$TOOL_FOLDER\"
cp "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Sublime*.lnk" "$TOOL_FOLDER\"
New-Item -ItemType SymbolicLink -Path "$TOOL_FOLDER\ArsenalImageMounter.lnk" -Target "$TOOL_FOLDER\chocolatey\bin\ArsenalImageMounter.exe"
