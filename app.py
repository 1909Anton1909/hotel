from flask import Flask, render_template, request, redirect
from flask_login import *

from Conntroller.ClientController import ClientController
from Conntroller.UserController import UserController

application = Flask(__name__)


@application.route('/', methods=['POST', 'GET'])
def home():
    title = "Вход"

    login = request.form.get('login')
    password = request.form.get('password')

    if request.method == 'POST':
        if UserController.auth(login, password):  # Если аутентификация успешна
            user = UserController.show_login(login)
            login_user(user)
            if user is None:
                message = 'неверный логин или пароль'
            else:

                role_id = user.role_id.id  # Получаем числовой идентификатор роли
                if role_id == 1:  # Администратор
                    return redirect('/admin')
                elif role_id == 2:  # Менеджер
                    return redirect('/Booking')
        else:
            message = 'неверный логин или пароль'

    return render_template('login.html',
                             title = title)



# @application.route('/', methods = ['POST', 'GET'])
# def home():
#     title = 'Вход'
#     login_user = request.form.get(id)
#
#     if request.method == 'POST':
#         pass
#
#     return render_template('login.html',
#                            title = title)

@application.route('/admin')
def admin():
        return render_template('admin.html')
@application.route('/Booking')
def Booking():
        return render_template('Booking.html')

if __name__ == "__main__":
    application.run(debug=True)
