from pymongo import MongoClient
import certifi


client = MongoClient('mongodb+srv://juliusdb:bTsayCCTdQXZ7Ysn@cluster0.eyxrb.mongodb.net/Rocklov-Julius?retryWrites=true&w=majority', tlsCAFile=certifi.where())
db= client['Rocklov-Julius']

def remove_user_by_email(user_email):
    users = db['users']
    # users.delete_many({'email': user_email})
    users.delete_many({'email': user_email})

def remove_equipo(equipo_name):
    equipos = db['equipos']
    equipos.delete_many({'name': equipo_name})

