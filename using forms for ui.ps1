Add-Type -AssemblyName System.Windows.Forms, System.Drawing

# Load the moreicons.dll assembly
#Add-Type -AssemblyName moreicons
# to use an icon from moreicons.dll
#Add-Type -AssemblyName System.Drawing #, PresentationFramework, PresentationCore, WindowsBase


############# setting an icon. just cuz (couldn't get the icon to work)

#$icon = New-Object System.Drawing.Icon([Environment]::SystemDirectory + "\moricons.dll, 3")
#$form.Icon = [System.Windows.Media.Imaging.BitmapFrame]::Create($icon.ToBitmap())


#############  setting an icon. just cuz (couldn't get the icon to work)


############# first create the window
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Documentor"
$Form.ClientSize = New-Object System.Drawing.Size(640, 480)

############# input text box at the top
$TextBox = New-Object System.Windows.Forms.TextBox
$TextBox.Location = New-Object System.Drawing.Point(10, 10)
$TextBox.Size = New-Object System.Drawing.Size(300, 20)
$Form.Controls.Add($TextBox)

############# query button under the text box
$QButton = New-Object System.Windows.Forms.Button
$QButton.Text = "Query"
$QButton.Location = New-Object System.Drawing.Point(10, 50)
$QButton.Size = New-Object System.Drawing.Size(100, 30)
$QButton.Add_Click({
    # button click event handler code goes here
})
$Form.Controls.Add($QButton)

############# close window button at the bottom

$CButton = New-Object System.Windows.Forms.Button
$CButton.Text = "Close Window"
$CButton.Location = New-Object System.Drawing.Point(10, 400)
$CButton.Size = New-Object System.Drawing.Size(100, 30)
$CButton.Add_Click({
    $Form.Close()
})
$Form.Controls.Add($CButton)

############# create a label to show output of queries
$InfoLabel = New-Object System.Windows.Forms.Label
$InfoLabel.Text = "This is the new label"
$InfoLabel.Location = New-Object System.Drawing.Point(10, 100)
$InfoLabel.Size = New-Object System.Drawing.Size(600, 200)
$InfoLabel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$InfoLabel.AutoSize = $false

$Form.Controls.Add($InfoLabel)



$Form.ShowDialog() | Out-Null
