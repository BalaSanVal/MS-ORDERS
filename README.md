# Orders Service

Microservicio de pedidos y carrito del proyecto E-Commerce.

## Requisitos

- Java 17
- MySQL 8.4
- Git
- IntelliJ IDEA o cualquier IDE compatible

No es necesario tener Maven instalado globalmente porque el proyecto incluye Maven Wrapper.

## Base de datos

Crear la base:

```sql
CREATE DATABASE orders_db;
```

Se recomienda crear un usuario para la aplicación:

```sql
CREATE USER 'orders_app'@'localhost'
IDENTIFIED BY 'TU_PASSWORD';

GRANT ALL PRIVILEGES ON orders_db.* TO 'orders_app'@'localhost';

FLUSH PRIVILEGES;
```

## Variables de entorno

Antes de ejecutar el proyecto, configurar:

```text
DB_USERNAME
DB_PASSWORD
```

En PowerShell:

```powershell
$env:DB_USERNAME="orders_app"
$env:DB_PASSWORD="TU_PASSWORD"
```

## Ejecutar pruebas

En Windows:

```powershell
.\mvnw.cmd clean test
```

Si todo está configurado correctamente debe aparecer:

```text
BUILD SUCCESS
```

## Ejecutar el proyecto

```powershell
.\mvnw.cmd spring-boot:run
```

## Configuración

El proyecto utiliza:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/orders_db
spring.datasource.username=${DB_USERNAME}
spring.datasource.password=${DB_PASSWORD}
```

No subir contraseñas ni archivos `.env` al repositorio.