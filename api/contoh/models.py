#model
from ..database import conn, select, select2, insert, insert2, row_count2, select_limit , select_row

#Class 
class Data:
	def __init__(self):
		self.mydb = conn()

	#Fungsi ambil data dokter
	def get_data(self, query, values):
		return select(query, values, self.mydb)

	def get_data2(self, query, values):
		return select2(query, values, self.mydb)	

	def get_data_row(self, query, values):
		return select_row(query, values, self.mydb)	
	
	def get_data_lim(self, query, values, page):
		return select_limit(query, values, self.mydb, page)

	#Fungsi ambil data dokter
	def insert_data(self, query, val):
		return insert(query, val, self.mydb)

	def insert_data_last_row(self, query, val):
		return insert2(query, val, self.mydb)

	def row_count(self, query , val ):
		return row_count2(query , val, self.mydb)
