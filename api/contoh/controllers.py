
from flask import Blueprint, jsonify, request, make_response
from flask_jwt import JWT, jwt_required, current_identity
from flask import current_app as app
from flask_cors import cross_origin
from werkzeug.utils import secure_filename
import datetime
from .models import Data
from time import gmtime, strftime
from werkzeug.datastructures import ImmutableMultiDict

now = datetime.datetime.now()

contoh = Blueprint('contoh', __name__, static_folder = '../../uploads', static_url_path="/media")
#UNTUK SAVE GAMBAR
# def save(encoded_data, filename):
# 	arr = np.fromstring(base64.b64decode(encoded_data), np.uint8)
# 	img = cv2.imdecode(arr, cv2.IMREAD_UNCHANGED)
# 	return cv2.imwrite(filename, img)

def addLogs(logs):
	f = open(app.config['LOGS'] + "/" + secure_filename(strftime("%Y-%m-%d"))+ ".txt", "a")
	f.write(logs)
	f.close()


# ========================= GET AREA ===============================
@contoh.route('/get', methods=['GET', 'OPTIONS'])
# @jwt_required()
@cross_origin()
def get_contoh():
	query = "SELECT * FROM pos_jaga WHERE 1"
	values = ()	

	page = request.args.get("page")
	site_id = request.args.get("site_id")
	q = request.args.get("q")

	if (page == None):
		page = 1
	if site_id:
		query = query + " AND site_id = %s "
		values = values + (site_id, )
	
	# for search using LIKE
	# if q:
	# 	query += " AND CONCAT_WS('|', judul, deskripsi) LIKE %s "
	# 	values += ('%'+q+'%',)
	
	dt = Data()
	rowCount = dt.row_count(query, values)
	hasil = dt.get_data_lim(query, values, page)
	hasil = {
		'data': hasil , 
		'status_code': 200, 
		'page': page, 
		'offset': '10', 
		'row_count': rowCount
	}

	########## INSERT LOG ##############
	imd = ImmutableMultiDict(request.args)
	imd = imd.to_dict()
	param_logs = "[" + str(imd) + "]"
	logs = "{'action':'Get data','params':'"+ param_logs +"','date':'"+secure_filename(strftime("%Y-%m-%d %H:%M:%S"))+"'}\n"
	addLogs(logs)
	####################################

	return make_response(jsonify(hasil),200)


# ================================= POST AREA ==============================
@contoh.route('/insert', methods=['POST', 'OPTIONS'])
@jwt_required()
@cross_origin()
def insert_contoh():
	query = "INSERT INTO `pos_jaga` (`site_id`,`client_id`,`id_pos`,`nama_pos_jaga`,`longitude`,`latitude`,`deskripsi`) VALUES (%s,%s,%s,%s,%s,%s,%s) "
	values = ()

	try:
		data = request.json
		
		site_id = data['site_id']
		client_id = data['client_id']
		id_pos = data['id_pos']
		nama_pos_jaga = data['nama_pos_jaga']
		longitude = data['longitude']
		latitude = data['latitude']
		deskripsi = data['deskripsi']

		dt = Data()
		values = (site_id, client_id, id_pos, nama_pos_jaga, longitude, latitude, deskripsi)
		dt.insert_data(query, values)

		hasil = "berhasil"
		logs = "{'id_user':'"+ str(current_identity['user_id']) +"','roles':'"+ str(current_identity['roles']) +"','action':'Tambah Pos Jaga','date':'"+secure_filename(strftime("%Y-%m-%d %H:%M:%S"))+"'}\n"
		addLogs(logs)
	except Exception as e:
			return make_response(jsonify({'description':str(e),'error': 'Bad Request','status_code':400}), 400)
	return make_response(jsonify({'status_code':200, 'description': hasil } ), 200)

# ================================ UPDATE AREA =================================
@contoh.route('/update', methods=['PUT', 'OPTIONS'])
@jwt_required()
@cross_origin()
def update_contoh():
	tableName = "pos_jaga"
	try:
		dt = Data()
		data = request.json

		query = "UPDATE "+tableName+" SET id = id"

		values = ()

		id = data['id']

		if 'site_id' in data:
			site_id = data["site_id"]
			query = query + ", site_id = %s"
			values = values + (site_id, )

		query = query + " WHERE id = %s "
		values = values + (id, )
		dt = Data()
		dt.insert_data(query,values)

		
		hasil = "berhasil"
		param_logs = "[" + str(data) + "]"
		logs = "{'id_user':'"+ str(current_identity['user_id']) +"','roles':'"+ str(current_identity['roles']) +"','action':'Update Pos Jaga','params':'"+ param_logs +"','date':'"+secure_filename(strftime("%Y-%m-%d %H:%M:%S"))+"'}\n"
		addLogs(logs)
	except Exception as e:
		return make_response(jsonify({'description':str(e),'error': 'Bad Request','status_code':400}), 400)
	return make_response(jsonify({'status_code':200, 'description': hasil } ), 200)
