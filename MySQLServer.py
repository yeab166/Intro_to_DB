import mysql.connector

try:
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="merawomen"
    )

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    print("Error while connecting to MySQL or creating database", err)

finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection closed.")
