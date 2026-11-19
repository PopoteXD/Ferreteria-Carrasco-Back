# Guion de demostración — Ferretería Carrasco

Duración objetivo: 6 a 8 minutos. Grabar con el laboratorio de AWS encendido y la instancia en ejecución.

## Antes de grabar

1. Abrir `http://ferreteriacarrasco.duckdns.org` en Chrome y comprobar que carga el catálogo.
2. Tener a mano la cuenta ADMIN (`luis.ferreteria373@gmail.com`) y una cuenta CLIENTE.
3. Cerrar pestañas con contraseñas, tokens o el ID de la cuenta de AWS.

## 1. Portada y catálogo (1 min)

- Mostrar la portada con el video y el menú.
- Entrar a Productos y filtrar por categoría.
- Abrir la ficha de un producto y mostrar precio y stock.

## 2. Carrito y compra (1 min)

- Agregar dos productos al carrito.
- Cambiar cantidades y mostrar el total.
- Finalizar la compra y mostrar la confirmación.

## 3. Registro e inicio de sesión (1 min)

- Registrar un cliente nuevo o iniciar sesión con la cuenta CLIENTE.
- Mostrar el perfil con los datos y el rol.

## 4. Rutas protegidas (1 min)

- Con la sesión CLIENTE, escribir `/admin` en la barra de direcciones.
- Mostrar que la aplicación redirige o bloquea el acceso.

## 5. Panel ADMIN y CRUD (2 min)

- Cerrar sesión e iniciar como ADMIN.
- En `/admin/productos`, crear un producto, editarlo y eliminarlo.
- En `/admin/usuarios`, mostrar el listado y cambiar el estado de un usuario.
- En `/admin/pedidos`, mostrar el pedido creado en el paso 2.

## 6. API y Swagger (1 min)

- Abrir `http://ferreteriacarrasco.duckdns.org/api/productos` y mostrar el JSON.
- Abrir `http://ferreteriacarrasco.duckdns.org:8081/swagger-ui/index.html` y mostrar los endpoints de productos.
- Abrir `http://ferreteriacarrasco.duckdns.org:8082/swagger-ui/index.html` para auth y usuarios.

Nota: Swagger se sirve directo en los puertos 8081 a 8085; el proxy del puerto 80 solo cubre `/api/*`.

## 7. Cierre (30 s)

- Mostrar los dos repositorios: Front y Back.
- Mencionar el respaldo `database/respaldo-ferreteria.sql` y las pruebas automatizadas.
