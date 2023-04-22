Add-Type -AssemblyName PresentationFramework
$xmlcontent = Get-Content ".\MyWindow.xaml"
$window = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $xmlcontent))

#$window = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader (Get-Content ".\MyWindow.xaml")))
$window.ShowDialog() | Out-Null
