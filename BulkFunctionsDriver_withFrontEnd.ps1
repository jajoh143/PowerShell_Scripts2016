."C:\users\jj044063\Desktop\Powershell\PSBulkFunctions"

$MainMenu = @"
<Window x:Class="WpfApplication2.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication2"
        mc:Ignorable="d"
        Title="MainWindow" Height="350" Width="525">
    <Grid>
        <Label x:Name="label" Content="Jake's Bulk Add Powershell Tool" HorizontalAlignment="Left" Margin="124,10,0,0" VerticalAlignment="Top" Height="34" Width="274" FontSize="18.667"/>
        <TextBlock x:Name="textBlock" HorizontalAlignment="Left" Margin="194,108,0,0" TextWrapping="Wrap" Text="Desired Action" VerticalAlignment="Top" Height="37" Width="114" FontSize="16" TextDecorations="Underline"/>
        <Button x:Name="button" Content="Bulk Account Creation" HorizontalAlignment="Left" Margin="176,150,0,0" VerticalAlignment="Top" Width="146" Height="31"/>
        <Button x:Name="button1" Content="Bulk Account Extension" HorizontalAlignment="Left" Margin="176,200,0,0" VerticalAlignment="Top" Width="146" Height="31"/>
        <Button x:Name="button2" Content="Change Primary Group" HorizontalAlignment="Left" Margin="176,245,0,0" VerticalAlignment="Top" Width="146" Height="31"/>

    </Grid>
</Window>
"@
$MainMenu = $MainMenu -replace 'mc:Ignorable="d"','' -replace "x:N",'N' -replace '^<Win.*', '<Window'
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $MainMenu

    $reader = (New-Object System.Xml.XmlNodeReader $XAML)
    try
    {
        $Form=[Windows.Markup.XamlReader]::Load($reader)
    }
    catch
    {
        Write-Host "Unable to load the Windows.Markup.XamlReader. You may have screwed up and not installed .net.... ugh"
    }

$XAML.SelectNodes("//*[@Name]") | %{Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)}

Function Get-FormVariables{
    if ($global:ReadmeDisplay -ne $true)
    {
        Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}
        write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
        Get-variable WPF*
}
 
Get-FormVariables

$WPFbutton.Add_Click({
    CreateAccount
})

$Form.ShowDialog() | out-null
