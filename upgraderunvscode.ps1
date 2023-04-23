# Upgrade VSCode using Chocolatey
Start-Process -FilePath 'choco' -ArgumentList 'upgrade', 'vscode', '-y' -Wait

# Launch VSCode
$vscodePath = 'C:\Program Files\Microsoft VS Code\Code.exe'
Start-Process -FilePath $vscodePath
