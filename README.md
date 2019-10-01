# WebChat (Ruby on Rails + Vue)
El proyecto consiste en una plataforma de chat web que permite a los usuarios conectarse a las distintas salas existentes o crear una nueva.
La arquitectura en el core de la aplicación sigue el patrón 'Convention over Configuration' típico de _Rails_ con algunas variaciones realizadas tratando de aproximar éste al patrón de 'Arquitectura Hexagonal'. Respecto al front, se ha mantenido la estructura preconfigurada gracias a vue-cli

## Instalación

### Base de Datos
* La aplicación requiere de _MongoDB_ para la persistencia en BD (Utiliza el cliente Mongoid para su manejo desde el backend en RoR). La BD del proyecto es *web_chat_development*
* Para la comunicación webSocket también se ha utilizado _Redis_

### Backend
* Instalar _Bundler_ para la gestión de gemas

```bash
cd webChat-back
gem install bundler
```

* Instalar las dependencias definidas en nuestro `GemFile`

```bash
bundle install
```

### Frontend
* Instalar las dependencias definidas en nuestro fichero `package.json`:

```bash
cd webChat-front
npm install
```

## Despliegue

### Base de Datos
Es necesario que el cliente de MongoDB esté ejecutándose de fondo, podemos levantarlo desde una terminal con el comando `mongod` que mantendrá en ejecución el daemon de esta BD por defecto en el puerto 27017

Para la comunicación webSocket en la sala de chat también necesitamos la ejecución de Redis, el comando `redis-server` levantará el daemon por defecto en el puerto 6379

### Backend
Nos dirigimos al directorio de la aplicación Rails y lanzamos el servidor, que escuchará por defecto desde el puerto 3000

```bash
cd webChat-back
rails server
```

### Frontend
Nos dirigimos al directorio del proyecto de la aplicación Vue y lanzamos el servidor, que escuchará por defecto desde el puerto 8080

```bash
cd webChat-front
npm run dev
```

## Ejecución de Tests

Se han desarrollado diferentes suites de tests, tanto para el código de Rails utilizando `Rspec`:

```bash
cd webChat-back
rspec
```

Como para el código de Vue utilizando `Jest` y `Vue test-utils`:

```bash
cd webChat-front
npm run test
```