Para iniciar la conexión entre el backend y el frontend

1. Importar la base de datos "seremi" en la respectiva plataforma para bases de datos y tenerla disponible.
2. En el backend, crear un archivo que se llame ".env"
3. Copiar y pegar los siguientes parámetros:
PORT=3000
SECRET_KEY= "No es necesario añadir nada acá"
DB_HOST=localhost
DB_USER=root
DB_PASSWORD="Rellenar con la contraseña que tenga cada uno, si es que su base de datos tiene contraseña, como nosotros si tenemos contraseña, se la añadimos"
DB_NAME=Seremi

4. Escribir "ionic serve" en la terminal del frontend y "node app.js" en la terminal de backend

