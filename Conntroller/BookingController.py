from Model.Booking import *


class BookingController:
    @classmethod
    def get(cls):
        return Booking.select()

    @classmethod
    def show(cls, id):
        return Booking.get_or_none(id)

    @classmethod
    def add(cls, order_id, good_id):
        Booking.create(order_id = order_id, good_id = good_id)

    @classmethod
    def update(cls, id, **filds):
        for key, value in filds.items():
            Booking.update({key: value}).where(Booking.id == id).execute()

    @classmethod
    def delete(cls, *id):
            for good_orders in id:
                Booking.delete_by_id(good_orders)




if __name__ == "__main__":
    print(BookingController.get())