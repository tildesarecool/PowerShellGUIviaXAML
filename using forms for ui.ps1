Add-Type -AssemblyName System.Windows.Forms, System.Drawing #, System.Management.Automation



<#
if Get-WmiObject is not recognized, try 
Get-CimInstance 
as it seems to take the same arguments
for instances
Get-CimInstance -Class Win32_Bios  | Select-Object -ExpandProperty SerialNumber
outputs the ST of a dell machine


Labels: Display static text on a form
Checkboxes: Allow the user to select one or more options from a list
Radio buttons: Allow the user to select one option from a list
List boxes: Display a list of items and allow the user to select one or more items
Combo boxes: Display a drop-down list of items and allow the user to select one item
Progress bars: Show the progress of a task
Group boxes: Group related controls together
Panels: Provide a container for other controls
Menus: Provide a set of options that the user can select from
Toolbars: Provide shortcuts to commonly used actions
Tree views: Display hierarchical data
Tab controls: Organize content into tabs

#>


# Load the moreicons.dll assembly
#Add-Type -AssemblyName moreicons
# to use an icon from moreicons.dll
#Add-Type -AssemblyName System.Drawing #, PresentationFramework, PresentationCore, WindowsBase


############# setting an icon. just cuz (couldn't get the icon to work)

#$icon = New-Object System.Drawing.Icon([Environment]::SystemDirectory + "\moricons.dll, 3")
#$form.Icon = [System.Windows.Media.Imaging.BitmapFrame]::Create($icon.ToBitmap())


#############  setting an icon. just cuz (couldn't get the icon to work)

$wnFormHeight = 480
$wnFormWidth = 640

############# first create the window
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Documentor"
$Form.ClientSize = New-Object System.Drawing.Size($wnFormWidth, $wnFormHeight)

############# input text box at the top
$TextBox = New-Object System.Windows.Forms.TextBox
$TextBox.Location = New-Object System.Drawing.Point(10, 10)
$TextBox.Size = New-Object System.Drawing.Size(300, 20)
$TextBox.Text = "Enter PC name or IP"
$Form.Controls.Add($TextBox)
############# input text box at the top

#$progbar = New-Object System.Windows.Forms.ProgressBar
#$progbar.

############# query button under the text box
$QButton = New-Object System.Windows.Forms.Button
$QButton.Text = "Query"
$QButton.Location = New-Object System.Drawing.Point(10, 50)
$QButton.Size = New-Object System.Drawing.Size(100, 30)
$QButton.Add_Click({
    
    $computername = $TextBox.Text
    $bios = Invoke-Command -ScriptBlock {  Get-CimInstance -Class Win32_Bios -ComputerName $computername | Select-Object -ExpandProperty SerialNumber } 
    #$bios = $_.trim($bios)
    if ((Test-Connection -ComputerName $computername -Count 1 -Quiet)   ) { # -and ($bios)
        if ($bios) {
            $InfoLabel.Text = $bios.trim()
        } } else { #if (!( $bios  )) {
            $InfoLabel.Text = "Unable to ping"        
        }
    
    <#
try {
        if ((Test-Connection -ComputerName $computername -Count 1 -Quiet)   ) { # -and ($bios)
            if ($bios) {
                $InfoLabel.Text = $bios
            }

        } elseif (!( $bios  )) {
            $InfoLabel.Text = "Unable to ping"        
        }
} catch {
        $InfoLabel.Text = "an error occurred while testing the connection: $($Error[0].Exception.Message)"
    }
#>
    #$PCname = $TextBox.Text
    #$InfoLabel.Text = $TextBox.Text
    #Write-Host $env:systemroot
    #$InfoLabel.Text = [string](Invoke-Command -ScriptBlock { Get-Date })
    # button click event handler code goes here
    # }

})
$Form.Controls.Add($QButton)



############# copy text to clipboard

$CpyButton = New-Object System.Windows.Forms.Button
$CpyButton.Text = "Copy text to clip board"
$CpyButton.Location = New-Object System.Drawing.Point(130, 50)
$CpyButton.Size = New-Object System.Drawing.Size(150, 30)
$CpyButton.Add_Click({
    [System.Windows.Forms.Clipboard]::SetText($InfoLabel.Text)   # SetText($TextBox.Text)
})
$Form.Controls.Add($CpyButton)

############# copy text to clipboard








############# close window button at the bottom

$CButton = New-Object System.Windows.Forms.Button
$CButton.Text = "Close Window"
$CButton.Location = New-Object System.Drawing.Point(10, 400)
$CButton.Size = New-Object System.Drawing.Size(100, 30)
$CButton.Add_Click({
    $Form.Close()
})
$Form.Controls.Add($CButton)

############# close window button at the bottom



############# create a label to show output of queries
$InfoLabel = New-Object System.Windows.Forms.Label
$InfoLabel.Text = "This is the new label"
$InfoLabel.Location = New-Object System.Drawing.Point(10, 100)
$InfoLabel.Size = New-Object System.Drawing.Size(600, 200)
$InfoLabel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$InfoLabel.AutoSize = $true

$Form.Controls.Add($InfoLabel)
############# create a label to show output of queries


$Form.ShowDialog() | Out-Null
