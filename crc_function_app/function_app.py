import azure.functions as func
import logging

# Define the Function App instance with anonymous HTTP auth level
app = func.FunctionApp(http_auth_level=func.AuthLevel.ANONYMOUS)

# Decorator for queue output binding:
# This binds the output to a queue named "outqueue", using the connection string specified in "AzureWebJobsStorage"
@app.queue_output(arg_name="msg", queue_name="outqueue", connection="AzureWebJobsStorage")

# Decorator for Cosmos DB output binding:
# This binds the output to a Cosmos DB container called "my-container" in the "my-database" database
# The connection string for Cosmos DB is specified in "CosmosDbConnectionSetting"
@app.cosmos_db_output(arg_name="outputDocument", database_name="my-database", 
    container_name="my-container", connection="CosmosDbConnectionSetting")

# HTTP Trigger function: This function is triggered via an HTTP request at the route "httpExample"
# It has output bindings for both a queue message and a Cosmos DB document
@app.route(route="httpExample")
def httpExample(req: func.HttpRequest, 
                msg: func.Out[func.QueueMessage],  # Queue output binding parameter
                outputDocument: func.Out[func.Document]) -> func.HttpResponse:  # Cosmos DB output binding parameter
    
    # Log that the HTTP trigger has been invoked
    logging.info('Python HTTP trigger function processed a request.')
    
    # Attempt to retrieve the 'name' parameter from the query string
    name = req.params.get('name')
    
    # If the 'name' parameter isn't present in the query string, try to get it from the request body
    if not name:
        try:
            req_body = req.get_json()  # Attempt to parse the request body as JSON
        except ValueError:
            pass  # If the body doesn't contain valid JSON, do nothing
        else:
            name = req_body.get('name')  # Try to retrieve the 'name' key from the JSON body

    # If a name was found either in the query string or the request body
    if name:
        # Create a document for Cosmos DB where the 'id' is set to the value of 'name'
        outputDocument.set(func.Document.from_dict({"id": name}))
        
        # Set the 'name' value as the content of the queue message
        msg.set(name)
        
        # Return an HTTP response with a personalized message using the name
        return func.HttpResponse(f"Hello, {name}. This HTTP triggered function executed successfully.")
    
    # If no name was provided, return a generic success response asking for a name
    else:
        return func.HttpResponse(
            "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.",
            status_code=200
        )
