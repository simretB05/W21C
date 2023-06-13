from flask import Flask, request, make_response,jsonify ## Importing the Flask class and request,make_response,jsonify  variable from FLASK
import dbhelper ,apiHelper # Importing the dbhelper  andapiHelper module
import uuid #  imoprt uuid module for generating  hexadecimal string values
# Creating a Flask application instance

app=Flask(__name__)

# Client table with (POST) requests
# POST REQUEST
# Added Route decorator for handling POST requests to the  '/api/client' endpoint adding a client
@app.post('/api/client')
#  Created  POST request handler function that handles the POST data sent from client
def post_new_client():
# Check if all required information is provided in the request and if not return an error message
        error=apiHelper.check_endpoint_info(request.json,["username","password"]) 
         # if error is type string/str then that means we have an error  send HTTP status code  error message with code 400 to show there was an error with the request sent,
         #  and the other code wont  continue to excute
        if(error != None):
         return make_response(jsonify(error), 400) 
         # but if there is no error, code will continue to excute and return results from the procedure call function and add a new client r to the database
        results = dbhelper.run_procedure('CAll add_new_client(?,?)',[request.json.get("username"),request.json.get("password")])
          # Checking if the results are of type list
        if(type(results)==list):
        # And if so convert the results in to json file and send a HTTP  status code 200 that represents that the process returned with result successfully
             return make_response(jsonify(results), 200)
        else:
            # or if not came with 500 HTTP satatus code response indicating server error with result representing the database procedure result 
            return make_response(jsonify(results), 500) 

# Login table with (POST) requests
# POST REQUEST
# Added Route decorator for handling POST requests to the  '/api/login' endpoint adding a client
@app.post('/api/login')
def post_new_login():
        # Convert UUID/uuid4 to string and store it in  uuid_value variable 
        uuid_value = uuid.uuid4()
        # if error is type string/str then that means we have an error  send HTTP status code  error message with code 400 to show there was an error with the request sent,
        #  and the other code wont  continue to excute
        error=apiHelper.check_endpoint_info(request.json,["username","password"]) 
        # if there was no error set token variable to the value of uuid_value converted to string
        if (error==None):
            token = str(uuid_value)
        elif(error != None):
         return make_response(jsonify(error), 400)
        # but if there is no error, code will continue to excute and return results from the procedure call function and add a  tokenr to the database
        results = dbhelper.run_procedure('CAll add_new_login(?,?,?)',[request.json.get("username"),request.json.get("password"),token])
        # Checking if the results are of type list
        if(type(results)==list):
        # And if so convert the results in to json file and send a HTTP  status code 200 that represents that the process returned with result successfully
             return make_response(jsonify(results), 200)
        else:
            # or if not came with 500 HTTP satatus code response indicating server error with result representing the database procedure result 
            return make_response(jsonify(results), 500) 

        
# Post table with (POST) requests
# POST REQUEST
# Added Route decorator for handling POST requests to the  '/api/post' endpoint adding a client
@app.post('/api/post')
def post_new_post():
         # if error is type string/str then that means we have an error  send HTTP status code  error message with code 400 to show there was an error with the request sent,
        #  and the other code wont  continue to excute
        error=apiHelper.check_endpoint_info(request.json,["token","content"]) 
        if(error != None):
         return make_response(jsonify(error), 400)
        # but if there is no error, code will continue to excute and return results from the procedure call function and add a  tokenr to the database
        results = dbhelper.run_procedure('CAll add_new_post(?,?,?)',[request.json.get("token"),request.json.get("content")])
     # Checking if the results are of type list
        if(type(results)==list):
        # And if so convert the results in to json file and send a HTTP  status code 200 that represents that the process returned with result successfully
             return make_response(jsonify(results), 200)
        else:
            # or if not came with 500 HTTP satatus code response indicating server error with result representing the database procedure result 
            return make_response(jsonify(results), 500) 

        
# Run the Flask application

app.run(debug=True)
