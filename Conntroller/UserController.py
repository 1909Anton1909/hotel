from bcrypt import *
from Model.User import *


class UserController:

    @classmethod
    def show_login(cls, login):
        return User.get_or_none(User.login == login)


    @classmethod
    def show(cls, id):
        return User.get_or_none(id)

    @classmethod
    def auth(cls,login,password):
        if User.get_or_none(User.login == login) != None:
            hspassword = User.get_or_none(User.login == login).password

            if checkpw(password.encode('utf-8'),hspassword.encode('utf-8')):
                return True
            return False

    @classmethod
    def registration(cls, login, password, role_id=1):
        if User.select().where(User.login == login).exists():
            print("Пользователь с таким логином уже существует")
            return False

        try:
            hash_password = hashpw(password.encode('utf-8'), gensalt())
            User.create(login=login, password=hash_password, role_id=role_id)
            print("Пользователь успешно создан")
            return True
        except Exception as error:
            print(f"Ошибка при создании пользователя: {error}")
            return False
if __name__ == "__main__":
    UserController.registration('admin','admin',)