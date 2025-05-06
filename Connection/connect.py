from peewee import *

def connect():
    mysql_db = MySQLDatabase(
            'RobA1234_hotel',
            user='RobA1234_SuperA',
            password='123456',
            host='10.11.13.118',
            port=3306)
    return mysql_db

if __name__ == '__main__':
    print(connect().connect())