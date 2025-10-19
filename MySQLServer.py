import mysql.connector
from mysql.connector import Error

def create_database():
    """Create the alx_book_store database if it doesn't already exist."""
    try:
        # Connect to MySQL server
        connection = mysql.connector.connect(
            host="localhost",      # Change if needed
            user="root",           # Replace with your MySQL username
            password="keji" # Replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Close connection properly
        if connection.is_connected():
            cursor.close()
            connection.close()
            # Optional confirmation message
            # print("MySQL connection is closed.")

if __name__ == "__main__":
    create_database()
