***ejecutar comandos
docker exec laravel_php echo '000'

***Para iniciar un nuevo proyecto, dar permisos 777 a la carpeta www:***
docker compose run --rm composer create-project laravel/laravel .

***Parametros mysql
MYSQL_DATABASE: db_ejm1
MYSQL_USER: user1
MYSQL_PASSWORD: user1.pa55
MYSQL_ROOT_PASSWORD: root.pa55

***Mostrar archivos ocultos wn WINSCP con Ctrol+Alt+H

***Por defecto Laravel usa sqlite, para cambiar a mysql ubicar
DB_CONNECTION=sqlite
# DB_HOST=127.0.0.1
# DB_PORT=3306
# DB_DATABASE=laravel
# DB_USERNAME=root
# DB_PASSWORD=

y cambiarlo por
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=db_ejm1
DB_USERNAME=user1
DB_PASSWORD=user1.pa55



***Iniciar migración
docker compose run --rm artisan config:cache
docker compose run --rm artisan migrate

***Instalar API
docker compose run --rm artisan install:api

***Cargar la migración a la BD
docker compose run --rm artisan make:migration create_productos_table
docker compose run --rm artisan migrate

***crear modelo y controlador
docker compose run --rm artisan make:model Productos
docker compose run --rm artisan make:controller ProductosController --resource

***Listar rutas
docker compose run --rm artisan route:list