from Model.Base import *

class Client(Base):
    id = PrimaryKeyField()
    first_name = CharField()
    last_name = CharField()
    phone = CharField()
    passport_date = DateTimeField()
    registration_date = DateTimeField()
    loyalty_level = CharField()

class Meta:
    table_name = 'client'



if __name__ == "__main__":
    connect().create_tables([Client])

