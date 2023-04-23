Add-Type -AssemblyName System.Drawing

# Load the icons from moricons.dll


$iconFile = "C:\Windows\System32\moricons.dll"
#$iconIndex = 2  # index is 0-based, so 2 is the third icon
$icon = New-Object System.Drawing.Icon($iconFile)
$icon.Save("icon588579141.ico")



###############################
#$iconFile = "$env:SystemRoot\System32\moricons.dll"
#$icons = [System.Drawing.Icon]::ExtractAssociatedIcons("$env:SystemRoot\System32\moricons.dll")
#foreach ($icon in $icons) {
#    $iconFile = "icon" + $icon.Handle + ".ico"
#    $fs = New-Object System.IO.FileStream($iconFile, [System.IO.FileMode]::Create)
#    $icon.Save($fs)
#    $fs.Close()
#}
