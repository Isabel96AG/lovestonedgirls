# LovestonedGirls

Tienda online de ropa de segunda mano para mujer. Proyecto desarrollado como Trabajo de Fin de Grado donde he construido una aplicación web completa desde cero: tienda, panel de administración y API REST.

## Con qué está hecho

- **Backend:** Laravel 12 con autenticación JWT
- **Tienda:** Angular 17
- **Panel de administración:** Angular 16 con plantilla Metronic
- **Base de datos:** MySQL 8
- **Despliegue:** Docker, Docker Compose y Nginx

## Cómo está organizado

```
lovestonegirls/
├── api_ecommerce/        # La API en Laravel
├── ecommerce/            # La tienda en Angular
├── admin_metronic_8.2/   # El panel de administración
├── db/                   # El script SQL con los datos
├── nginx/                # Configuración del proxy
└── docker-compose.yml    # Para levantar todo junto
```

## Cómo arrancarlo

### Con Docker
```bash
docker-compose up -d
```
Se levantan cinco contenedores: la API, la tienda, el admin, la base de datos y el proxy nginx.

### Con la máquina virtual
Importar el `.ova` en VirtualBox y seguir las instrucciones del manual de despliegue incluido en la documentación.

## URLs (dentro de la VM)

| | URL |
|---|---|
| Tienda | http://lovestonedgirls.daw |
| Admin | http://admin.lovestonedgirls.daw |
| API | http://api.lovestonedgirls.daw/api |

## Credenciales para probar

**Máquina virtual:**
- Usuario: `Isabel`
- Contraseña: `Ratita09`

**Panel de administración:**
- Email: `admin@gmail.com`
- Contraseña: `Ratita09`

**Pago ficticio con Stripe:**
- Tarjeta: `4242 4242 4242 4242`
- Fecha: cualquiera futura
- CVC: cualquiera
