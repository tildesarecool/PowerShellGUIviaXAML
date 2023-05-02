# Create a new MMC and add the Group Policy Object Editor snap-in
$mmc = New-Object -ComObject MMC20.Application
$gpSnapIn = $mmc.Load("gpedit.msc")
$gpSnapInRoot = $gpSnapIn.RootNode.Children | Where-Object {$_.Name -eq "Local Computer Policy"}
$gpEditorSnapIn = $mmc.Document.ActiveView
$gpEditorSnapIn.ScopePaneItems.Expand($gpSnapInRoot)
$gpEditorSnapIn.ScopePaneItems.Expand("Administrative Templates")
$gpEditorSnapIn.ScopePaneItems.Expand("Windows Components")

# Add the import settings option to the snap-in
$importSettingsMenu = $gpEditorSnapIn.ContextMenus | Where-Object {$_.Name -eq "File"}
$importSettingsMenuItem = $importSettingsMenu.ChildItems.CreateItem(0, "Import Settings...", "Imports settings from a backup file", "shell32.dll, 138")

# Save the MMC to a file
$mmcFileName = "CustomMMC.mmc"
$mmc.SaveAs($mmcFileName)

# Open the MMC and import the settings
$customMMC = New-Object -ComObject MMC20.Application
$customMMCFile = (Get-Item $mmcFileName).Fullname
$customMMCDocument = $customMMC.Document.ActiveView
$customMMCDocument.ExecuteShellCommand($importSettingsMenuItem.CommandID, "")

