import mariadb
import dbcreds

def convert_data(cursor, results):
    # Extract column names from the cursor description
    column_names = [i[0] for i in cursor.description]
    # Initialize an empty list to store converted data
    new_results = []
     # Iterate over each row in the data
    for row in results:
        # Create a dictionary by mapping column names to row values and
        #ppend the row to the new_results list
        new_results.append(dict(zip(column_names, row)))
         # Return the list of new_results data
        return new_results

def run_procedure(sql, args):
        try:
            results = None  # Created a Variable to store the query results
            # Establishing a connection to the database using the connection parameters
            conn = mariadb.connect(**dbcreds.conn_params)
            # Creating a cursor object to execute SQL queries
            cursor = conn.cursor()
            # Executing the SQL query with the provided arguments
            cursor.execute(sql, args)
             # Fetching all the results from the executed query
            results = cursor.fetchall()
            #call convert_data function to pass the tuples we get from result and the 
            # cursor object so it will be converted into  dictionaries
            results = convert_data(cursor, results)
        except mariadb.ProgrammingError as error:
            print('There is an issue with the DB code:', error)
            # Handling an error while connecting to the database
        except mariadb.OperationalError as error:
            print('There is an issue connecting to the DB:', error)
            # Handling any other unknown error
        except Exception as error:
            print('There was an unknown error:', error)
        finally:
            if(cursor != None):
            # Closing the cursor
             cursor.close()
        if(conn != None):
            # Closing the database connection
            conn.close()
             # Returning the query results
        return results
