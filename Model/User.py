from flask_login import UserMixin

from Model.Base import *


class User(Base, UserMixin):
    id = PrimaryKeyField()
    login = CharField()
    password = CharField()
    role_id = IntegerField()

class Meta:
    table_name = 'User'



if __name__ == "__main__":
    connect().create_tables([User])

