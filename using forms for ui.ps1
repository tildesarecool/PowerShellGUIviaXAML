Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Documentor"
$Form.ClientSize = New-Object System.Drawing.Size(640, 480)

$TextBox = New-Object System.Windows.Forms.TextBox
$TextBox.Location = New-Object System.Drawing.Point(10, 10)
$TextBox.Size = New-Object System.Drawing.Size(300, 20)
$Form.Controls.Add($TextBox)

$QButton = New-Object System.Windows.Forms.Button
$QButton.Text = "Query"
$QButton.Location = New-Object System.Drawing.Point(10, 50)
$QButton.Size = New-Object System.Drawing.Size(100, 30)
$QButton.Add_Click({
    # button click event handler code goes here
})
$Form.Controls.Add($QButton)

$CButton = New-Object System.Windows.Forms.Button
$CButton.Text = "Close Window"
$CButton.Location = New-Object System.Drawing.Point(10, 400)
$CButton.Size = New-Object System.Drawing.Size(100, 30)
$CButton.Add_Click({
    # button click event handler code goes here
})
$Form.Controls.Add($CButton)


$Form.ShowDialog() | Out-Null
