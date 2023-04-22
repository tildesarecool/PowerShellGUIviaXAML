Add-Type -AssemblyName PresentationFramework
$window = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader (Get-Content ".\MyWindow.xaml")))
$window.ShowDialog() | Out-Null
