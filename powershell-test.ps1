$cred = Get-Credential

$record = @{
    description = "test from script"
}
$bodyJson = $record | ConvertTo-Json

$response = Invoke-WebRequest -Uri https://drummonds.service-now.com/api/now/table/sc_req_item -Credential $cred -Method Post -Body $bodyJson -ContentType "application/json"