Add-Type -AssemblyName PresentationFramework

$jsonData = @"
{
    "strProfileName": "•-•",
    "webapi_token": "8aa2600d2ea79e5089b8cffe06866f85",
    "bViewingOwnProfile": false,
    "strSteamId": "76561198273641494",
    "gcpdGames": [730, 620, 205790, 570, 247040, 583950, 1046930, 440],
    "nUserReviewCount": 4,
    "nUserFollowedCount": 0,
    "rgContentDescriptorPreferences": {
        "content_descriptors_to_exclude": [
            {"content_descriptorid": 1, "timestamp_added": null},
            {"content_descriptorid": 3, "timestamp_added": null},
            {"content_descriptorid": 4, "timestamp_added": null}
        ]
    },
    "rgGames": [
        {
            "appid": 400,
            "name": "Portal",
            "playtime_forever": 141,
            "img_icon_url": "cfa928ab4119dd137e50d728e8fe703e4e970aff",
            "has_community_visible_stats": 1,
            "playtime_windows_forever": 141,
            "playtime_mac_forever": 0,
            "playtime_linux_forever": 0,
            "rtime_last_played": 1606856001,
            "has_workshop": 0,
            "has_market": 0,
            "has_dlc": 1
        }
    ]
}
"@

# Convert JSON data to PowerShell object
$data = ConvertFrom-Json $jsonData

# Create XAML code for the table
$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="JSON Data Table" Width="600" Height="400">
    <Grid>
        <DataGrid ItemsSource="{Binding}">
        </DataGrid>
    </Grid>
</Window>
"@

# Create a XAML reader and load the XAML code
$xamlReader = New-Object System.Xml.XmlNodeReader -ArgumentList $xaml
$window = [Windows.Markup.XamlReader]::Load($xamlReader)

# Set the data context for the table
$window.DataContext = $data

# Show the window
$window.ShowDialog() | Out-Null
