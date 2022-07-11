from flask import Flask, jsonify, make_response
from flask_jwt import JWT, jwt_required, current_identity
from flask_cors import CORS, cross_origin
from time import strftime
from werkzeug.utils import secure_filename

import datetime
import warnings
import bcrypt

from . data import Data

# -------------------- Import Controller -------------------------- #
from . contoh.controllers import contoh
# -------------------- End Import Controller ---------------------- #

warnings.simplefilter("ignore", DeprecationWarning)

# -------------------- CONFIGURATION ---------------------------- #
app = Flask(__name__, static_url_path=None) #panggil modul flask

cors = CORS(app, resources={r"*": {"origins": "*"}})

app.config['SECRET_KEY'] 			= 'm0n1t0r1ngsyst3m' #secret key API
app.config['CORS_HEADERS']			= 'Content-Type'
app.config['JWT_EXPIRATION_DELTA'] 	= datetime.timedelta(days=1) #1 hari token expired
app.config['JWT_DEFAULT_REALM'] 	= 'Login Required'
app.config['LOGS'] 					= '/home/thoriq/Documents/monitoring-system/api-flask/logs'
app.config['UPLOAD_FOLDER_GAMBAR'] 	= '/home/thoriq/Documents/monitoring-system/api-flask/uploads'
# -------------------- END CONFIGURATION ------------------------ #


# -------------------- JWT AUTHENTICATION ----------------------- #
@app.route('/', methods=['GET'])
def start():
	data = 'berhasil'
	return data

class User(object): #Class USer untuk API Auth
	def __init__(self, id):
		self.id = id
	def __str__(self):
		return "User(id='%s')" % self.id

def verify(username, password): #menerima input JSON
	if not (username and password): #jika username dan password kosong
		return False

	values 	= (username, )
	query 	= "SELECT * FROM users WHERE email = %s"
	dt 		= Data()
	result 	= dt.get_data_row(query, values)

	try:
		password_user = str(result[0]['password']).encode('utf-8')
		print(password_user)

		check = bcrypt.checkpw(str(password).encode('utf-8'), password_user)
		if check == True:
			data = result[0]

	except Exception:
		return make_response(jsonify({'description':'User not found!','error': 'Bad Request','status_code':400}), 400)

	id_ = str(data["id"])+'#'+str(data['roles'])
	print(id_)
	logs = "{'id_user':'"+ str(data["id"]) +"','roles':'"+ data['roles'] + "','action':'login','date':'"+secure_filename(strftime("%Y-%m-%d %H:%M:%S"))+"'}\n"
	addLogs(logs)
	return User(id=id_)

def identity(payload): #fungsi payload
    id_ = str(payload['identity']).split("#") #identity payload berisi user id
    return {"user_id": id_[0],"roles":id_[1]} #kembalikan dalam bentuk json

app.config['JWT_AUTH_URL_RULE'] = '/auth'
jwt = JWT(app, verify, identity) #panggil Java Web Token

# Mendapatkan data user ketika sudah login
@app.route('/check-credential', methods=['GET', 'OPTIONS'])
@jwt_required()
@cross_origin()
def cek_credential():
	values = (str(current_identity['user_id']), )
	query = "SELECT * FROM users WHERE id = %s" 
	dt = Data()
	result = dt.get_data(query, values)
	if len(result) == 0:
		return False
		
	return jsonify(result)
# -------------------- END JWT AUTHENTICATION ------------------- #


# -------------------- ERROR HANDLER ---------------------------- #
# fungsi error handle Halaman Tidak Ditemukan
@app.errorhandler(404)
@cross_origin()
def not_found(error):
	return make_response(jsonify({'error': 'Endpoint Not Found','status_code':404}), 404)

# fungsi error handle Halaman internal server error
@app.errorhandler(500)
@cross_origin()
def not_found(error):
	return make_response(jsonify({'error': 'Error Server','status_code':500}), 500)
# -------------------- END ERROR HANDLER ------------------------ #


# -------------------- Function add logs ------------------------ #
def addLogs(logs):
    f = open(app.config['LOGS'] + "/" + secure_filename(strftime("%Y-%m-%d"))+ ".txt", "a")
    f.write(logs)
    f.close()
# -------------------- End Function add logs -------------------- #


# -------------------- REGISTER BLUEPRINT ----------------------- #
app.register_blueprint(contoh, url_prefix='/contoh')
# -------------------- END REGISTER BLUEPRINT ------------------- #