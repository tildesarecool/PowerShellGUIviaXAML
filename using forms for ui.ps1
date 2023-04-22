Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object System.Windows.Forms.Form
$Form.Text = "My Form"
$Form.ClientSize = New-Object System.Drawing.Size(400, 300)

$TextBox = New-Object System.Windows.Forms.TextBox
$TextBox.Location = New-Object System.Drawing.Point(10, 10)
$TextBox.Size = New-Object System.Drawing.Size(100, 20)
$Form.Controls.Add($TextBox)

$Button = New-Object System.Windows.Forms.Button
$Button.Text = "Click Me"
$Button.Location = New-Object System.Drawing.Point(10, 50)
$Button.Size = New-Object System.Drawing.Size(100, 30)
$Button.Add_Click({
    # button click event handler code goes here
})
$Form.Controls.Add($Button)

$Form.ShowDialog() | Out-Null
