
$cred = Get-Credential

$record = @{
  seriesRef = @{
    subject = "D867efbcf1bcd1c10a000fd1f0a4bcb92"
    table = "u_fridge"
    metric = "u_temp"
  }
  values = @(
    @{
    timestamp = "2020-06-01T00:00:00Z"
    value = 0.0
    },
    @{
    timestamp = "2020-06-01T00:01:00Z"
    value = 1.1
    },
    @{
    timestamp = "2020-06-01T00:02:00Z"
    value = 2.2
    }
  )
}

$bodyJson = $record | ConvertTo-Json

$response = Invoke-WebRequest -Uri https://drummonds.service-now.com/api/now/v1/clotho/put?align_time -Credential $cred -Method Post -Body $bodyJson -ContentType "application/json"
