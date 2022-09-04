# customer-papi
# Operations
	1) GET/customer - This operation retrieves the list of customers from the database.
	2) POST/customer - This operation creates a new customer into the database along with the contact details.
	3) PATCH/customer/{id} - This operation updates the contact details of a customer where {id} is the customer's unique id.
	4) DELETE/customer/{id} - This operation deletes the customer record from the database using customer's unique id.
	
	
# RAML - 
	\src\main\resources\api

# Postman Collection - 
	\Customer PAPI.postman_collection.json

# Installation on local - 

This project uses H2 Database as the backend for storing the customer and it's contact details.

To get the DB working, change the db.config.URL in local.properties file to the path where you want to have the database file.
After successful execution, a file with ".mv.db" extension should be created at the above path. 

In the runtime args pass "-Denv=local" and Run the application.

The file database.xml corresponds to the Database folder in the Postman Collection and is simply created to perform CRUD operations
on the database. 


	
