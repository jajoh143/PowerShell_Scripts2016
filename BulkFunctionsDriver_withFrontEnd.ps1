."C:\users\jj044063\Desktop\Powershell\PSBulkFunctions"

$MainMenu = @"
<Window x:Class="WpfApplication1.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication1"
        mc:Ignorable="d"
        Title="MainWindow" Height="350" Width="732.101">
    <Grid>
        <TabControl x:Name="tabControl" HorizontalAlignment="Left" Height="310" VerticalAlignment="Top" Width="714">
            <TabItem Header="Main">
                <Grid Background="#FFE5E5E5">
                    <Label x:Name="label" Content="Jake's AD Account Tool" HorizontalAlignment="Left" Height="52" Margin="240,10,0,0" VerticalAlignment="Top" Width="277" FontSize="21.333"/>
                    <Image x:Name="image" HorizontalAlignment="Left" Height="150" VerticalAlignment="Top" Width="150" Margin="48,10,0,0" Source="C:\Users\jj044063\Desktop\Powershell\koala.jpg" Stretch="Fill"/>
                    <TextBox x:Name="textBox" HorizontalAlignment="Left" Height="81" Margin="214,61,0,0" TextWrapping="Wrap" Text="This tool is fairly straightforward. Select which sort of script you need to run, and then click the tab which corresponds to that action. Try not to blow anything up....&#xD;&#xA;" VerticalAlignment="Top" Width="303"/>
                    <CheckBox x:Name="checkBox" Content="Bulk Account Creation" HorizontalAlignment="Left" Margin="254,152,0,0" VerticalAlignment="Top" Width="223" Height="30"/>
                    <CheckBox x:Name="checkBox1" Content="Bulk Account Extension" HorizontalAlignment="Left" Height="21" Margin="254,180,0,0" VerticalAlignment="Top" Width="147"/>
                    <CheckBox x:Name="checkBox2" Content="Bulk Change Primary Group" HorizontalAlignment="Left" Height="16" Margin="254,208,0,0" VerticalAlignment="Top" Width="204"/>
                    <Button x:Name="choice" Content="Make Your Choice&#xD;&#xA;" HorizontalAlignment="Left" Height="27" Margin="240,244,0,0" VerticalAlignment="Top" Width="178"/>
                </Grid>
            </TabItem>
            <TabItem Header="Create" Margin="0" IsEnabled="False">
                <Grid Background="#FFE5E5E5">
                    <TextBox x:Name="textBox1" HorizontalAlignment="Left" Height="23" Margin="187,104,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="224"/>
                    <Label x:Name="label1" Content="Csv Path:" HorizontalAlignment="Left" Margin="35,104,0,0" VerticalAlignment="Top"/>
                    <TextBox x:Name="textBox2" HorizontalAlignment="Left" Height="23" Margin="187,192,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="224"/>
                    <Label x:Name="label2" Content="Export Csv Path:&#xD;&#xA;&#xD;&#xA;" HorizontalAlignment="Left" Margin="35,197,0,0" VerticalAlignment="Top"/>
                    <Label x:Name="label3" Content="Bulk Account Creation" HorizontalAlignment="Left" Margin="277,0,0,0" VerticalAlignment="Top" FontSize="21.333"/>
                    <Button x:Name="button" Content="Launch&#xD;&#xA;" HorizontalAlignment="Left" Margin="301,237,0,0" VerticalAlignment="Top" Width="142" Height="41" FontSize="18.667"/>
                    <TextBlock x:Name="textBlock" HorizontalAlignment="Left" Height="61" Margin="240,43,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="351"><Run Text="Make sure that the Csv has been set up properly. Field headers need to be in the following format: FName, LName, userID, Email, and Phone"/></TextBlock>
                    <TextBox x:Name="textBox4" HorizontalAlignment="Left" Height="35" Margin="187,138,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="224"/>
                    <Label x:Name="label5" Content="Description to &#xD;&#xA;Associate with Accounts:" HorizontalAlignment="Left" Margin="35,135,0,0" VerticalAlignment="Top" Height="42" Width="147" RenderTransformOrigin="0.548,-0.253"/>
                    <Image x:Name="image1" HorizontalAlignment="Left" Height="80" Margin="24,10,0,0" VerticalAlignment="Top" Width="100" Source="C:\Users\jj044063\Desktop\Powershell\koala.jpg" Stretch="Fill"/>
                    <Label x:Name="label4" Content="Desired OU: " HorizontalAlignment="Left" Height="23" Margin="438,104,0,0" VerticalAlignment="Top" Width="107"/>
                    <TextBox x:Name="textBox3" HorizontalAlignment="Left" Height="23" Margin="545,104,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="136"/>
                    <Label x:Name="label6" Content="Account Life:" HorizontalAlignment="Left" Margin="438,147,0,0" VerticalAlignment="Top"/>
                    <RadioButton x:Name="rB_90" Content="90 Days" HorizontalAlignment="Left" Margin="545,152,0,0" VerticalAlignment="Top"/>
                    <RadioButton x:Name="rb_180" Content="180 Days" HorizontalAlignment="Left" Margin="614,152,0,0" VerticalAlignment="Top"/>
                </Grid>
            </TabItem>
            <TabItem Header="Extend&#xD;&#xA;" HorizontalAlignment="Left" Height="20" VerticalAlignment="Top" Width="57" IsEnabled="False">
                <Grid Background="#FFE5E5E5">
                    <TextBox x:Name="textBox01" HorizontalAlignment="Left" Height="23" Margin="240,104,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="277"/>
                    <Label x:Name="label01" Content="Csv Path:" HorizontalAlignment="Left" Margin="150,104,0,0" VerticalAlignment="Top"/>
                    <Label x:Name="label03" Content="Bulk Account Extension" HorizontalAlignment="Left" Margin="277,0,0,0" VerticalAlignment="Top" FontSize="21.333"/>
                    <Button x:Name="button0" Content="Launch&#xD;&#xA;" HorizontalAlignment="Left" Margin="306,168,0,0" VerticalAlignment="Top" Width="142" Height="41" FontSize="18.667"/>
                    <TextBlock x:Name="textBlock0" HorizontalAlignment="Left" Height="61" Margin="240,43,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="351" Text="All you really need to make sure matches up is the username column, in the format UserID"/>
                    <Image x:Name="image01" HorizontalAlignment="Left" Height="80" Margin="41,13,0,0" VerticalAlignment="Top" Width="100" Source="C:\Users\jj044063\Desktop\Powershell\koala.jpg" Stretch="Fill"/>
                </Grid>
            </TabItem>
            <TabItem Header="Change PrimGrp" HorizontalAlignment="Left" Width="103" Margin="-1,0,0,0" Height="20" VerticalAlignment="Bottom" IsEnabled="False">
                <Grid Background="#FFE5E5E5"/>
            </TabItem>
        </TabControl>

    </Grid>
</Window>


"@


$MainMenu = $MainMenu -replace 'mc:Ignorable="d"','' -replace "x:N",'N' -replace '^<Win.*', '<Window'
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $MainMenu
#Read XAML

    $reader=(New-Object System.Xml.XmlNodeReader $xaml) 
  try{$Form=[Windows.Markup.XamlReader]::Load( $reader )}
catch [System.Management.Automation.MethodInvocationException] {
    Write-Warning "We ran into a problem with the XAML code.  Check the syntax for this control..."
    write-host $error[0].Exception.Message -ForegroundColor Red
    if ($error[0].Exception.Message -like "*button*"){
        write-warning "Ensure your &lt;button in the `$inputXML does NOT have a Click=ButtonClick property.  PS can't handle this`n`n`n`n"}
}
catch{
    Write-Host "Doesn't look like .NET is working properly for you...."
        }
$xaml.SelectNodes("//*[@Name]") | %{Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)}

Function Get-FormVariables{
    if ($global:ReadmeDisplay -ne $true)
    {
        Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}
        write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
        Get-variable WPF*
}
 
Get-FormVariables

$WPFchoice.Add_Click{
if ($WPFcheckBox.IsChecked -eq $true)
{
    $WPFtabControl.Items[1] | % {$_.IsEnabled = $true }
}
if ($WPFcheckBox1.IsChecked -eq $true)
{
    $WPFtabControl.Items[2] | % {$_.IsEnabled = $true }
}
if ($WPFcheckBox2.IsChecked -eq $true)
{
    $WPFtabControl.Items[3] | % {$_.IsEnabled = $true }
}

}

if($WPFrB_90.IsChecked -eq $true) { $exp = 90 }
    elseif ($WPFrB_180.IsChecked -eq $true) { $exp = 180}
$csv = $WPFtextBox1.Text

$path = $WPFtextBox3.Text

$Descr = $WPFtextBox4.Text

$expPath = $WPFtextBox2.Text

$WPFbutton.Add_Click{
   CreateAccount -csv $csv -path $path -Descr $Descr -exp $exp -expPath $expPat

}

$Form.ShowDialog() | Out-Null
