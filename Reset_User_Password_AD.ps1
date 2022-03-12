$first_name = Read-Host "First name"
$last_name = Read-Host "Last name"
$account_name = Get-ADUser -filter {GivenName -Like $first_name -and Surname -like $last_name} | Select -ExpandProperty samaccountname
$choice = Read-Host "Would you like to reset $first_name $last_name's ($account_name) password?"
$password = (("!@#$%^&*()1234567890qwertyuioasdzxcvbnfghrty").ToCharArray() | Get-Random -Count 12) -join ""

if ($choice -eq "y"){

    write-host $password
    set-adaccountpassword -Identity $account_name -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $password -Force) 
}