from Model.Client import *
from bcrypt import checkpw


class ClientController:
    @classmethod
    def get(cls):
        return Client.select()

    @classmethod
    def show(cls, id):
        return Client.get_or_none(id)

    @classmethod
    def add(cls, order_id, good_id):
        Client.create(order_id = order_id, good_id = good_id)

    @classmethod
    def update(cls, id, **filds):
        for key, value in filds.items():
            Client.update({key: value}).where(Client.id == id).execute()

    @classmethod
    def delete(cls, *id):
            for good_orders in id:
                Client.delete_by_id(good_orders)


    @classmethod
    def show_login(cls, login):
        return Client.get_or_none(Client.login == login)

    @classmethod
    def auth(cls,login,password):
        if Client.get_or_none(Client.login == login) != None:
            hspassword = Client.get_or_none(Client.login == login).password

            if checkpw(password.encode('utf-8'),hspassword.encode('utf-8')):
                return True
            return False





if __name__ == "__main__":
    print(ClientController.get())