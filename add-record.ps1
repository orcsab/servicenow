
$cred = Get-Credential

$random = Get-Random -Minimum 0.01 -Maximum 30.00
$record = @{
  u_device_name = "test script"
  u_temperature = $random
}
$bodyJson = $record | ConvertTo-Json

$response = Invoke-WebRequest -Uri https://drummonds.service-now.com/api/now/table/u_fridge -Credential $cred -Method Post -Body $bodyJson -ContentType "application/json"
