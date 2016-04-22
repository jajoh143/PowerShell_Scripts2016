@"
* This function is specifically intended for bulk AD account creations
* from a CSV file. 
"@
#Creates an area where Details of AD Accounts can be stored
$results = @()

Function CreateAccount($csv, $path, $Descr, $exp, $expPath)
{
    $csvinfo = Import-Csv $csv
    #Creates an area where Details of AD Accounts can be stored
    $results = @()

    #Runs a ForEach Loop on each row of the Csv, format of names must match declared values
    ForEach($user in $csvinfo)
    {
        #Declares all variables for use in account creation
        $FName = $user.FName
        Write-Host "This user's first name is $FName"
        $LName = $user.LName
        Write-Host "This user's last name is $LName"
        $join = $user.FName + ' ' + $user.LName
        $DispName = [string]::join('',$join)
        Write-Host "Display name: $DispName"
        $userID = $user.userID
        Write-Host "The user's ID is $userID"
        $userPrin = $userID + "@cernerasp.com"
        Write-Host "The User Principal name is $userPrin"
        $Email = $user.Email
        Write-Host "The user's email address is $Email"
        $Descript = $Descr
        $Path = $path
        Write-Host "The path to the OU containing this assocaite is: $Path"
        $Phone = $usGivener.Phone
        $primGrp = Get-ADGroup "PrimGrp"
        Write-Host "The primary Group for $userID is $primGrp"

        #Checks to see if the user already exists. If not, it runs. 
        If ((Get-ADUser -LDAPFilter "(SAMAccountName=$userID)") -eq $Null)
        {
            $alphabet=$NULL;For ($a=33;$a –le 126;$a++) {$alphabet+=,[char][byte]$a }
            $passback = GET-Temppassword -length 10 -sourcedata $alphabet
            $Password = 'Cern' + $passback
            $Pass1 = $Password
            Write-Host "The password for assocaite $DispName is $Pass1"

            #Create the new AD User
            New-ADUser `
            -Name $DispName `
            -Path $Path `
            -GivenName $FName `
            -Surname $LName `
            -SamAccountName $userID `
            -EmailAddress $Email `
            -AccountPassword(ConvertTo-SecureString $Pass1 -AsPlainText -Force) `
            -ChangePasswordAtLogon $false `
            -Enabled $true `
            -Description $Descript `
            -UserPrincipalName $userPrin `
            -AccountExpirationDate $exp `
            -OfficePhone $Phone

            $details = @{
                    Name = $UserDisplayName
                    Username = $userID
                    Password = $Pass1
                    Email = $EmailAddress
                }

        }
        Else
        {
            Write-Host "$DispName already exists and has $primGrp set as their primary group."
            $details = @{
                    Name = $UserDisplayName
                    Username = $userID
                    Email = $EmailAddress
                }
        }
        $results += New-Object PSObject -Property $details
    }

    #Pushes the PowerShell object results to a new spreadsheet
    $results | Export-Csv -Path $expPath -NoTypeInformation  
}

#Function for generating the random password for user

Function GET-Temppassword() {

Param(

[int]$length=10,

[string[]]$sourcedata

)

 

For ($loop=1; $loop –le $length; $loop++) {

            $TempPassword+=($sourcedata | GET-RANDOM)

            }

return $TempPassword

}


Function ExtFromCSV()
{
    Write-Host "Please provide the path to your CSv file"
    $csv_in = Read-Host -prompt "Path: "
    $csv = $csv_in

    ForEach($test in $csv)
    {
        $userID = $test.UserID
        Write-Host $userID
        $extTime = "10/2/2016"
        Set-ADAccountExpiration -Identity $userID -DateTime $extTime
    }
}

function checkADUser {
    param([string]$ID )

    if (Get-ADUser $ID)
    {
        Write-Host $userID
    }
    else 
    {
        Write-Host "$userID is not in AD"
    }
}

Function cPrim()
{
    $results = @()
    Write-Host "Please provide the path to your CSv file"
    $csv_in = Read-Host -prompt "Path: "
    $csv = $csv_in
    ForEach ($test in $csv) 
    {
 
 
        $userID = $test.userid

        Add-ADPrincipalGroupMembership -Identity $userID -MemberOf "XXXXXXXX"
        Add-ADPrincipalGroupMembership -Identity $userID -MemberOf "XXXXXXXX"
        $Primary = Get-ADGroup "XXXXXXXXX"
        $PrimSID = $Primary.sid
        $PrimSID
        [int]$GroupID = $PrimSID.Value.Substring($PrimSID.Value.LastIndexOf("-")+1)
        Get-ADUser $userID | Set-ADObject -Replace @{primaryGroupID="$GroupID"}
        Remove-ADgroupMember -Identity "XXXXXXXX" -Members $userID -Confirm:$False
        #Places their account information within the details array
        $details = @{
                    Name = $UserDisplayName
                    Username = $userID
                    Email = $EmailAddress
                }
        Write-Host " $userID has been added to PrimGrp and gRemedyUsersNonCerner, deleted from Domain Users"
        $results += New-Object PSObject -Property $details
    }
    #Pushes the PowerShell object results to a new spreadsheet
    $results | Export-Csv -Path "" -NoTypeInformation  
}

Function Testfun()
{
    Write-Host "Eureka!"
}