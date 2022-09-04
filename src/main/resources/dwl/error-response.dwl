%dw 2.0
output application/json
---
{
  "success": false,
  "apiName": p('app.name'),
  "version": "1.0.0",
  "source": "H2 Database",
  "correlationId": vars.uuid,
  "timestamp": now(),
  "errorDetails": {
    "code": vars.statusCode,
    "description": payload.errorMessage
  }
}