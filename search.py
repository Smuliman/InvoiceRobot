from RPA.Outlook.Application import Application
def search_str(file_path, word):
        app = Application()
        
        with open(file_path, 'r') as file:
            content = file.read()
            if word in content:
                print ("on ok")
                app.open_application()
                app.send_message(
                recipients='samuli.tyyska@student.laurea.fi',
                subject='Success',
                body='Lasku on ok')
       


        
            else:
               print ("ei ok")
               app.open_application()
               app.send_message(
                recipients='samuli.tyyska@student.laurea.fi',
                subject='Success',
                body='Lasku pitää tarkistaa')