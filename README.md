# WebChat (Ruby on Rails + Vue)
El proyecto consiste en una plataforma de chat web que permite a los usuarios conectarse a las distintas salas existentes o crear una nueva.
La arquitectura en el core de la aplicación sigue el patrón 'Convention over configuration' típico de _Rails_.

## Instalación

### Backend
* Instalar las dependencias definidas en nuestro `GemFile`

### Frontend
* Instalar las dependencias definidas en nuestro fichero `package.json`:

## Despliegue

### Backend
Nos dirigimos al directorio de la aplicación Rails y lanzamos el servidor, que escuchará por defecto desde el puerto 3000

> cd webChat
> rails server

### Frontend
Nos dirigimos al directorio del proyecto de la aplicación Vue y lanzamos el servidor, que escuchará por defecto desde el puerto 8080

> cd webChat
> npm run dev

## Ejecución de Tests

Se han desarrollado diferentes suites de tests, tanto para el código de Rails utilizando `Rspec`:

> rspec

Como para el código de Vue utilizando `Jest`:

> npm run test
