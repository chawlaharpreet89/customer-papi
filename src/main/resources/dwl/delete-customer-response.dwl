%dw 2.0
output application/json
---
{
  "timestamp": now(),
  "version": "1.0.0",
  "apiName": p('app.name'),
  "source": "H2 Database",
  "success": true,
  "correlationId": vars.uuid,
  "data": {
    "message": "Customer with customerId " ++ vars.customerId ++ " deleted successfully."
  }
}