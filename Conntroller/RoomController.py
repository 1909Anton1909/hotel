from Model.Room import *


class RoomController:
    @classmethod
    def get(cls):
        return Room.select()

    @classmethod
    def show(cls, id):
        return Room.get_or_none(id)

    @classmethod
    def add(cls, order_id, good_id):
        Room.create(order_id = order_id, good_id = good_id)

    @classmethod
    def update(cls, id, **filds):
        for key, value in filds.items():
            Room.update({key: value}).where(Room.id == id).execute()

    @classmethod
    def delete(cls, *id):
            for good_orders in id:
                Room.delete_by_id(good_orders)




if __name__ == "__main__":
    print(RoomController.show)
