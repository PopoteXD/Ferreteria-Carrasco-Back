# Presentación EP3/EFT — Ferretería Carrasco

Fecha: 27 de noviembre de 2026. Duración: 15 minutos de presentación + 5 de preguntas.

## 1. La noche anterior

1. Encender el laboratorio: **AWS Academy → Start Lab**, esperar el indicador verde.
2. **EC2 → Instances**: si la instancia está `Stopped`, seleccionarla y **Instance state → Start instance**.
3. Esperar 3 a 5 minutos y comprobar:
   ```bash
   curl -s -o /dev/null -w "%{http_code}\n" http://ferreteriacarrasco.duckdns.org/
   curl -s -o /dev/null -w "%{http_code}\n" http://ferreteriacarrasco.duckdns.org/api/v1/productos
   ```
   Deben responder `200` y `200`.
4. Desplegar el aviso de inicio de sesión (opcional, ya está en GitHub):
   ```bash
   cd ~/Ferreteria-Carrasco && git pull
   docker compose build --no-cache frontend
   docker compose up -d --force-recreate --no-deps frontend
   ```
5. Importar en Postman `postman/Ferreteria-Carrasco-Microservicios.postman_collection.json` y completar las variables `adminCorreo` y `adminClave`.
6. Ejecutar una vez `npm test` y `mvn clean test` en `microservicios/ms-usuarios` para confirmar que corren en el equipo.
7. Tener a mano los tres archivos de entrega: `Ferreteria-Carrasco-Front.zip`, `Ferreteria-Carrasco-Back.zip` y `ERS_Ferreteria_Carrasco.docx`.
8. Cargar el notebook y cerrar pestañas con contraseñas, tokens o el ID de la cuenta de AWS.

## 2. Treinta minutos antes

1. Start Lab y Start instance otra vez, si el laboratorio se cerró.
2. Abrir en este orden: sitio, `/api/v1/productos`, Swagger `:8081`, Swagger `:8082`, Postman y la terminal de la EC2.
3. Si se mostrará el celular: desactivar en el navegador la conexión forzada a HTTPS y escribir `http://` completo.
4. Silenciar notificaciones.

## 3. Guion de 15 minutos

| Minuto | Contenido |
|---|---|
| 0–2 | Presentación: tienda de ferretería, React 19 + 5 microservicios Spring Boot + MySQL, desplegada en AWS EC2 con Docker. |
| 2–4 | Portada, catálogo, filtro por categoría y detalle de producto. |
| 4–6 | Carrito, cantidades y total; confirmación del pedido. |
| 6–8 | Registro con validaciones (RUN, correo, región y comuna) e inicio de sesión con JWT. |
| 8–10 | Rutas protegidas: con Cliente, `/admin` queda bloqueado. |
| 10–12 | Panel Administrador: CRUD de productos, usuarios y cambio de estado de un pedido. |
| 12–13 | Rol Vendedor: solo productos y pedidos; sin usuarios, ofertas ni acciones de escritura. |
| 13–14 | Postman en vivo y Swagger. |
| 14–15 | Repositorios, pruebas automatizadas y cierre. |

## 4. Postman en vivo

| Petición | Resultado esperado |
|---|---|
| `GET /api/v1/usuarios` sin token | 401 |
| `POST /api/v1/auth/login` con la cuenta administradora | 200 con token |
| `GET /api/v1/usuarios` con token ADMIN | 200 |
| `POST /api/v1/auth/login` con `prueba.permisos.403@gmail.com` | 200 con token de Cliente |
| `GET /api/v1/usuarios` con token Cliente | 403 |
| `GET /api/v1/productos` | 200 con JSON |
| `GET /api/v1/productos/NOEXISTE` | 404 |

El script de la petición de login guarda el token en la variable `token` de la colección; no hay que copiarlo a mano.

## 5. Pruebas en vivo

```bash
npm test
```
24 pruebas de Jasmine y Karma; el reporte queda en `coverage-karma/`.

```bash
cd microservicios/ms-usuarios && mvn clean test
```
11 pruebas. En total el backend suma 36: 10 de productos, 11 de usuarios, 6 de pedidos, 5 de contacto y 4 de pagos.

## 6. Explicación de AWS

- **EC2** con Amazon Linux 2023 y Docker instalado; 7 contenedores: MySQL, 5 microservicios y nginx.
- **Security Group**: puerto 80 abierto a todos; 8081 a 8085 para Swagger; SSH solo desde la IP propia y el rango de EC2 Instance Connect; 3306 cerrado.
- **Elastic IP** para que la IP pública no cambie, y **DuckDNS** para el dominio `ferreteriacarrasco.duckdns.org`.
- **nginx** publica el frontend y enruta `/api/*` y `/api/v1/*` al microservicio correspondiente, así el navegador solo necesita el puerto 80.
- **Secretos** en `.env`, fuera del repositorio: `JWT_SECRET`, `DB_PASSWORD`, `DB_ROOT_PASSWORD` y `ADMIN_CLAVE`.

## 7. Preguntas probables

- **¿Cómo se protege la API?** JWT firmado con HS256, validado en los cinco servicios con el mismo secreto; roles ADMIN, VENDEDOR, CLIENTE y SERVICIO; contraseñas con BCrypt.
- **¿Por qué microservicios?** Separación por dominio, despliegue independiente y puerto propio; comparten MySQL y el secreto JWT.
- **¿Cómo se comunican entre servicios?** ms-pedidos pide un token interno con rol SERVICIO para descontar stock en ms-productos.
- **¿Qué pasa si expira el token?** El frontend llama a `/api/v1/auth/refresh`; si falla, cierra la sesión y redirige al login.
- **¿Por qué `/api/v1`?** Versionado de la API; se mantiene el alias `/api` para no romper clientes anteriores.
- **¿Qué cubren las pruebas?** Códigos 200, 201, 204, 400, 401, 403 y 404, rechazo sin token y bloqueo de operaciones de administración para Cliente.
- **¿Dónde están los secretos?** En `.env` del servidor, excluido por `.gitignore`; el repositorio solo incluye `.env.example`.

## 8. Plan B

- **El laboratorio se apagó**: Start Lab y Start Instance; tarda unos minutos. Mientras tanto, mostrar el código y los documentos.
- **El sitio no responde**: `docker compose ps` y `docker compose logs --tail=20 frontend` en la EC2.
- **El celular falla**: usar Chrome o la IP `http://34.194.173.232`.
- **Postman falla**: mostrar las capturas de `documentos/capturas/` y los códigos ya verificados.
- **No pulsar Reset** en AWS Academy: borra todos los recursos.
