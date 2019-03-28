#User data import (Future with ServiceNow Integration)
$employee_number = Read-Host 'Employee number: '
$firstname = Read-Host 'First name: '
$lastname = Read-Host 'Last name: '
$birthdate = Read-Host 'Birthdate (dd-mm-jjjj): '
$phone = Read-Host 'Phone number: '
$job_title = Read-Host 'Job title: '

$listCompanys = 'OU=Accounts,dc=reesink,dc=nl'
Write-Host 'Select a company'
$company = Get-ADOrganizationalUnit -Filter * -SearchBase $listCompanys -SearchScope OneLevel | Sort {-join ($_.distinguishedname[($_.distinguishedname.length-1)..0])} | Sort-Object | Select name, DistinguishedName |Out-GridView -Title "Select a company for $firstname" -Passthru #list all opco's under AccountsOU
$company.DistinguishedName=$company.DistinguishedName.Insert(0,'OU=Gebruikers,')
$company.Name = 'Gebruikers'
$department = Get-ADOrganizationalUnit -Filter * -SearchBase $company.DistinguishedName -SearchScope OneLevel | Sort {-join ($_.distinguishedname[($_.distinguishedname.length-1)..0])} | Sort-Object | Select name, DistinguishedName |Out-GridView -Title "Select a department for $firstname" -Passthru #list all department of company
$location
$country
