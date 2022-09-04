%dw 2.0
output application/json skipNullOn = "everywhere"
var customerList = vars.customerList
var addressList = vars.addressList
var phoneList = vars.phoneList
var emailList = vars.emailList

---
{
    "timestamp": now(),
    "version": "1.0.0",
    "apiName": p('app.name'),
    "source": "H2 Database",
    "success": true,
    "correlationId": vars.uuid,
    "data": {
        "customers": customerList map (custItem, index) -> 
            {
                "customerId": custItem.CUSTOMERID,
                "firstName": custItem.FIRSTNAME,
                "lastName": custItem.LASTNAME,
                "addresses": {
                    "postal": addressList filter(custItem.CUSTOMERID == $.CUSTOMERID) map(addressItem,index)->
                        {
                            "type": addressItem.TYPE,
                            "isPrimary": if(upper(addressItem.TYPE) == "HOME")true else false,
                            "firstName": addressItem.FIRSTNAME,
                            "lastName": addressItem.LASTNAME,
                            "addressLine1": addressItem.ADDRESSLINE1,
                            "addressLine2": addressItem.ADDRESSLINE2,
                            "city": addressItem.CITY,
                            "state": addressItem.STATE,
                            "ZIP": addressItem.ZIP,
                            "country": addressItem.COUNTRY
                        },
                    "phone": phoneList filter(custItem.CUSTOMERID == $.CUSTOMERID)map (phoneItem, index) -> 
                        {
                            "type": phoneItem.TYPE,
                            "countryCode": phoneItem.COUNTRYCODE,
                            "number": phoneItem.NUMBER,
                            "isPrimary": if(upper(phoneItem.TYPE) == "HOME")true else false,
                        },
                    "email": emailList filter(custItem.CUSTOMERID == $.CUSTOMERID)map (emailItem, index) -> 
                    { 
                            "type": emailItem.TYPE,
                            "email": emailItem.EMAIL,
                            "isPrimary":  if(upper(emailItem.TYPE) == "HOME")true else false,

                    }  
                   
                }
            }
        
    }
}