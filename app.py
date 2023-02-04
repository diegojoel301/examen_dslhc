from flask import Flask, request, redirect, render_template, make_response
import jwt
from datetime import datetime
import time
import json
import mysql.connector
import sqlite3
import hashlib

app = Flask(__name__)

con = mysql.connector.connect(
  host="127.0.0.1",
  user="root",
  password="bghegwegewyt26734764",
  database="store"
)

#con = sqlite3.connect("test.db")

cur = con.cursor()

cur.execute("SELECT username, password FROM Users")

users = cur.fetchall()

print(users)

@app.route('/')
def index():
    return render_template('login.html')

@app.route('/login', methods = ['POST', 'GET'])
def login():
    if request.method == 'POST':
        user = request.form['username']
        password = request.form['password']
      
        print(user, password)

        md5_pass = search_first_value(users, user)[0][1]
        
        encode_md5 = hashlib.md5(password.encode()).hexdigest()

        print("xd:", encode_md5)

        if search_first_value(users, user)[0][1] == hashlib.md5(password.strip().encode()).hexdigest():

            now = int(time.time())
            expires = now + 3600

            payload_data = {
                'user': user,
                'iat': now,
                'exp': expires
            }

            encode_jwt = jwt.encode(payload = payload_data, key = "DSLHC_lab_1", algorithm="HS256")

            #ans = make_response(render_template('comentarios.html', comentarios = comentarios))
            ans = redirect('/store', 302)
            ans.set_cookie("JWT_token", encode_jwt)

            return ans
    return render_template('login.html')

@app.route("/store")
def store():
    
    if check_jwt(request.cookies.get('JWT_token')) != False:
        con = mysql.connector.connect(
            host="127.0.0.1",
            user="root",
            password="bghegwegewyt26734764",
            database="store"
            )

        cur = con.cursor()

        cur.execute("SELECT * FROM Product")

        return render_template('products.html', products = cur.fetchall())
    return redirect('/login', 302)

@app.route("/search")
def search():
    
    if check_jwt(request.cookies.get('JWT_token')) != False:
        nombre = request.args.get('search')


        con = mysql.connector.connect(
            host="127.0.0.1",
            user="root",
            password="bghegwegewyt26734764",
            database="store"
            )

        cur = con.cursor()

        cur.execute("SELECT * FROM Product WHERE name_prod LIKE '%s'" % nombre)

        return render_template('products.html', products = cur.fetchall())
    return redirect('/login', 302)

def check_jwt(token):

    try:
        decode = jwt.decode(token, key = "DSLHC_lab_1", algorithms=['HS256', ]) # Realizaremos la verificacion del token

        return decode

    except:
        return False

def search_first_value(tuples, value):
  return list(filter(lambda x: x[0] == value, tuples))