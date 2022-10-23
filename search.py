from ast import Return
from os import kill
from tkinter import END
from RPA.Outlook.Application import Application
def search_str(file_path, word):
        app = Application()
        
        
        with open(file_path, 'r') as file:
            content = file.read()
            if word in content:
                app.open_application()
                app.send_message(
                recipients='samuli.tyyska@student.laurea.fi',
                subject='Laskun tarkistus',
                body='Lasku on ok')
                return True
       


        
            else:
                app.open_application()
                app.send_message(
                recipients='samuli.tyyska@student.laurea.fi',
                subject='Laskun tarkistus Error',
                body='Lasku pitää tarkistaa')
                return False

                
               