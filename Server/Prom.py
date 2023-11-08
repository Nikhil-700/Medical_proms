import logging
import random
import string
from sys import exception
from flask import Flask, render_template, jsonify, request
import mysql.connector
from flask import Flask
from flask_cors import CORS
# Create a Flask application

app = Flask(__name__)

# Set up the logger configuration
logging.basicConfig(level=logging.INFO)  # Choose the desired logging level
CORS(app)

# Create a logger specific to your Flask app
logger = logging.getLogger(app.name)

# Configuring MySQL connection
app.config['MYSQL_HOST'] = 'mysql-153175-0.cloudclusters.net'
app.config['MYSQL_USER'] = 'admin'
app.config['MYSQL_PASSWORD'] = 'oZ5mcwjP'
app.config['MYSQL_DB'] = 'promsdata'


def connect_to_mysql():
    return mysql.connector.connect(
        host=app.config['MYSQL_HOST'],
        user=app.config['MYSQL_USER'],
        password=app.config['MYSQL_PASSWORD'],
        database=app.config['MYSQL_DB'],
        port=19047
    )

# Create an API route to fetch data
@app.route('/api/data', methods=['GET'])
def handle_data():
    try:
        if request.method == 'GET':
            # Connect to the database and fetch data (same as before)
            conn = connect_to_mysql()
            cursor = conn.cursor()
            query = "SELECT * FROM random_questionare"
            cursor.execute(query)
            data = cursor.fetchall()
            cursor.close()
            conn.close()

            # Convert data to JSON response
            data_list = []
            for row in data:
                data_list.append({
                    'sr_num': row[0],
                    'questions': row[1],
                    'option_a': row[2],
                    'option_b': row[3],
                    'option_c': row[4],
                    'option_d': row[5],
                    'option_e': row[6],
                    'Answer': row[7]
                })
            return jsonify({"Status":200, "message":data_list})
    except exception as e:
        return jsonify({"Status": 400, "message": str(e)})
    

@app.route('/api/save', methods=['POST'])
def save_data():
    try:
        conn = connect_to_mysql()
        cursor = conn.cursor()
        data = request.get_json()  # Assuming the request data is in JSON format
        answers = list(data.get("response"))
        i = 1
        for answer in answers:
            update_query = "UPDATE random_questionare SET Answer = %s WHERE sr_num = %s"
            cursor.execute(update_query, (answer, i))
            i = i+1
            conn.commit()
        cursor.close()
        return jsonify({"Status": 200, "message": "data saved successfully"})
    except exception as e:
        return jsonify({"Status": 400, "message": str(e)})



def generate_responses(data):
    # Assuming 'data' is a list of selected options for each question (0-indexed)
    # This function generates the response array based on the selected options
    response = []
    for option in data:
        response.append(option)
    return response

if __name__ == '__main__':
    app.run(debug=True)