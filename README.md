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

## API pública y Postman

En Postman importa `postman/Ferreteria-Carrasco-Microservicios.postman_collection.json`. Las variables de servicio ya usan el dominio público, enrutado por nginx en el puerto 80: `http://ferreteriacarrasco.duckdns.org`. En la colección, asigna `adminClave` localmente (no la publiques) y ejecuta **Iniciar sesión**; el test guarda el JWT automáticamente en `token`.

Comprobaciones públicas: `GET /api/health` y `GET /api/productos`. Sin JWT, `GET /api/usuarios` devuelve `401`. Para probar el `403`, inicia sesión con una cuenta CLIENTE y usa su token en una operación exclusiva ADMIN. No subas contraseñas, tokens ni capturas que los expongan.

## Tests
```bash
cd microservicios/ms-usuarios && mvn clean test
```
Los secretos van en `.env` (no se sube al repositorio).

Frontend: https://github.com/PopoteXD/Ferreteria-Carrasco-Front
