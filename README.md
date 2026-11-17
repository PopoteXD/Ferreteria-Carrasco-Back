# Ferreteria Carrasco - Backend

Microservicios Spring Boot (Java) con JWT, roles ADMIN/CLIENTE, BCrypt, Swagger y MySQL.

| Servicio | Carpeta | Puerto |
|---|---|---|
| ms-productos (productos y ofertas) | `backend/` | 8081 |
| ms-usuarios (auth y usuarios) | `microservicios/ms-usuarios` | 8082 |
| ms-pedidos | `microservicios/ms-pedidos` | 8083 |
| ms-contacto | `microservicios/ms-contacto` | 8084 |
| ms-pagos | `microservicios/ms-pagos` | 8085 |

Contenido: `database/ferreteria.sql` (script de la BD), `postman/` (colección), `ERS_Ferreteria_Carrasco.docx`, `DESPLIEGUE_AWS.md`.

## Ejecutar con Docker
```bash
cp .env.example .env   # completar JWT_SECRET, DB_PASSWORD, ADMIN_CLAVE
docker compose up -d --build
```
Swagger: `http://localhost:8081/swagger-ui.html` (y 8082-8085).

## Tests
```bash
cd microservicios/ms-usuarios && mvn clean test
```
Los secretos van en `.env` (no se sube al repositorio).

Frontend: https://github.com/PopoteXD/Ferreteria-Carrasco-Front
