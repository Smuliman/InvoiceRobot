def search_str(file_path, word):
        with open(file_path, 'r') as file:
            content = file.read()
            if word in content:
                print ("on ok")


        
            else:
               print ("ei ok")