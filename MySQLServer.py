import mysql.connector

def create_database():
    """Create the alx_book_store database if it doesn't already exist."""
    try:
        # Connect to MySQL server (not a specific database)
        connection = mysql.connector.connect(
            host="localhost",       # Change if needed
            user="root",            # Replace with your MySQL username
            password="keji" # Replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database safely
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        print(f"Error while connecting to MySQL: {err}")

    finally:
        # Always close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_database()
