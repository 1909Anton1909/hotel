from Model.Base import *


class Room(Base):
    id = PrimaryKeyField()
    room_number = CharField()
    category = CharField()
    floor = IntegerField()
    capacity = CharField()
    price_per_night = CharField()
    description = CharField()
    status = CharField()

class Meta:
    table_name = 'Room'



if __name__ == "__main__":
    connect().create_tables([Room])

