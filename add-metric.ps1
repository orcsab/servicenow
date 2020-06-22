
$cred = Get-Credential

$date = Get-Date
$timestamp = $date.ToUniversalTime().toString('yyyy-MM-ddTHH:mm:ss')

$metric = 6.89

$record = @{
  seriesRef = @{
    subject = "71a872a51b6990107d7bedf32a4bcbff"
    table = "u_fridge"
    metric = "u_temp"
  }
  values = @(
    @{
    timestamp = $timestamp
    value = $metric
    }
  )
}

$bodyJson = $record | ConvertTo-Json

$response = Invoke-WebRequest `
  -Uri https://drummonds.service-now.com/api/now/v1/clotho/put `
  -Credential $cred `
  -Method Post `
  -Body $bodyJson `
  -ContentType "application/json" `
  -Headers @{'Accept' = 'application/json'}

"Timestamp = " + $timestamp
"Data = " + $metric
$response
