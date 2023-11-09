#Version de python
FROM python:3.11

#Crear la carpeta donde va a estar los archivos
RUN mkdir /app
WORKDIR /app

#copiamos el requirements.txt para tener las librerias necesarias
COPY requirements.txt .

#instalamos las librerias
RUN pip install -r requirements.txt

#Copiamos los archivos de api-peliculas en el directorio app
COPY . /app

#Definimos el puerto donde va a estar la app    
EXPOSE 5000

#Definimos las variables de entorno para poder ejecutarlo
ENV FLASK_APP="entrypoint:app"
ENV FLASK_ENV="development"
ENV APP_SETTINGS_MODULE="config.default"

#inicia la aplicacion
CMD ["flask", "run", "--host","0.0.0.0"]


