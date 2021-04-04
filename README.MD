# Proyecto Dalilah Resto H1

## Descargar el proyecto

```bash
git clone https://github.com/silvanavinet/acamica_proyecto_3
```

## Corriendo el proyecto

### Primero: Inicialización de la base de datos
Correr el script para crear la BD.

```sql 
CREATE DATABASE restaurante;
```

Crear la tabla de usuario;

Luego se debe importar el archivo de nombre: 

```
./files/restaurante_2021-04-04.sql
```

### Segundo: Instalación NODE modules
Realizar las siguientes pasos para inicializar el servidor

```bash
npm install
```

Y echar a correr el servidor

```
nodemon index.js 
```

### Tercero: Instalacion POSTMAN
Buscar el archivo 
```
./files/RESTAUTANTE.postman_collection.json 
```
e importarlo  a postman para hacer pruebas

### Cuarto: Swagger Specs

El archivo

```
./files/spec.yml
```

contienen las especificaciones de los endpoints en formato ***OpenAPI 3.0.1***