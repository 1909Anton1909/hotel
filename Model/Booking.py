from Model.Base import *




from Model.Client import Client
from Model.Room import *

class Booking(Base):
    id = PrimaryKeyField()
    client_id = ForeignKeyField(Client)
    room_id = ForeignKeyField(Room)
    check_in_date = DateTimeField()
    check_out_date = DateTimeField()
    booking_date = DateTimeField()
    status = CharField()
    total_price = CharField()
    payment_status = CharField()

class Meta:
    table_name = 'Booking'




if __name__ == "__main__":
    connect().create_tables([Booking])
