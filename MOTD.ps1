# reference article
# https://ctrlaltzzz.wordpress.com/2023/05/03/how-to-create-guis-in-powershell/#table-of-contents



#Clear all variables
Remove-Variable * -ErrorAction SilentlyContinue


#Initialize Form
Add-Type -AssemblyName System.Windows.Forms


#Clear all variables
Remove-Variable * -ErrorAction SilentlyContinue
 
#Initialize Form
Add-Type -AssemblyName System.Windows.Forms
 
#---FUNCTIONS---#
function Form{
    param(
        $title,
        $width=10,
        $height=10
    )
    $Form = New-Object system.Windows.Forms.Form
    $Form.text = $title
    $Form.ClientSize = "$width,$height"
    return $Form
}
 
function Label{
    param(
    )
}
 
function TextBox{
    param(
    )
}
 
function Button{
    param(
    )
}
 
#---MAIN---#
# the -title below creates the variable $title used above
$window = Form -title "First WinForm" -width 640 -height 480
 
 
 
#---BUTTONS ACTION---#
 
 
#--BOTTOM OF SCRIPT---#
$window.ShowDialog()