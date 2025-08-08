# Sistema de Microservicios con BPMN

Este repositorio contiene un sistema completo de microservicios implementado con Spring Boot, React y Camunda BPMN.

## 🏗️ Arquitectura del Sistema

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │   Auth Service  │    │ Publication     │
│   (React)       │◄──►│   (Spring Boot) │◄──►│   Service       │
│                 │    │                 │    │   (Spring Boot) │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Eureka        │    │   Camunda       │    │   RabbitMQ      │
│   Service       │    │   BPMN Engine   │    │   Message       │
│   Discovery     │    │                 │    │   Broker        │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### Componentes del Sistema

- **Frontend**: Aplicación React para gestión de publicaciones
- **Auth Service**: Microservicio de autenticación y autorización
- **Publication Service**: Microservicio de gestión de publicaciones
- **Eureka Service**: Servicio de descubrimiento de microservicios
- **Camunda BPMN**: Motor de procesos de negocio
- **RabbitMQ**: Broker de mensajes para comunicación asíncrona

## 🚀 Instrucciones de Despliegue

### Prerrequisitos

- Java 17 o superior
- Node.js 16 o superior
- Docker y Docker Compose
- Maven 3.6+
- Camunda Modeler (para editar modelos BPMN)

### 1. Clonar el Repositorio

```bash
git clone https://github.com/tu-usuario/nombre-del-repositorio.git
cd nombre-del-repositorio
```

### 2. Configurar Variables de Entorno

Crear archivos `.env` en cada servicio o configurar las variables de entorno:

```bash
# Auth Service
export SPRING_PROFILES_ACTIVE=dev
export JWT_SECRET=tu-jwt-secret-aqui
export DATABASE_URL=jdbc:postgresql://localhost:5432/auth_db

# Publication Service
export SPRING_PROFILES_ACTIVE=dev
export RABBITMQ_HOST=localhost
export RABBITMQ_PORT=5672
```

### 3. Desplegar con Docker Compose

```bash
# Desplegar todos los servicios
docker-compose up -d

# O desplegar servicios individuales
cd auth-service && docker-compose up -d
cd ../publication-service && docker-compose up -d
cd ../eureka-service && docker-compose up -d
```

### 4. Desplegar Frontend

```bash
cd frontend-publicaciones
npm install
npm start
```

### 5. Acceder a los Servicios

- **Frontend**: http://localhost:3000
- **Auth Service**: http://localhost:8081
- **Publication Service**: http://localhost:8082
- **Eureka Dashboard**: http://localhost:8761
- **Camunda Cockpit**: http://localhost:8080

## 📋 Modelo BPMN

El modelo BPMN se encuentra en el directorio `bpmn-models/` y puede ser editado con Camunda Modeler.

### Proceso de Publicación

1. **Crear Publicación**: Usuario crea una nueva publicación
2. **Validar Contenido**: Sistema valida el contenido
3. **Aprobar/Rechazar**: Proceso de aprobación manual
4. **Publicar**: Si es aprobada, se publica automáticamente

## 🛠️ Desarrollo Local

### Backend (Spring Boot)

```bash
# Auth Service
cd auth-service
./mvnw spring-boot:run

# Publication Service
cd publication-service
./mvnw spring-boot:run

# Eureka Service
cd eureka-service
./mvnw spring-boot:run
```

### Frontend (React)

```bash
cd frontend-publicaciones
npm install
npm start
```

## 📁 Estructura del Proyecto

```
├── auth-service/              # Microservicio de autenticación
├── publication-service/       # Microservicio de publicaciones
├── eureka-service/           # Servicio de descubrimiento
├── frontend-publicaciones/   # Frontend React
├── bpmn-models/             # Modelos BPMN de Camunda
├── docker-compose.yml       # Configuración Docker
└── README.md               # Este archivo
```

## 🔧 Configuración de Base de Datos

### PostgreSQL

```sql
-- Crear base de datos para auth service
CREATE DATABASE auth_db;

-- Crear base de datos para publication service
CREATE DATABASE publication_db;
```

### RabbitMQ

RabbitMQ se configura automáticamente con Docker Compose.

## 🧪 Testing

```bash
# Ejecutar tests de backend
cd auth-service && ./mvnw test
cd ../publication-service && ./mvnw test

# Ejecutar tests de frontend
cd frontend-publicaciones && npm test
```

## 📝 API Documentation

### Auth Service Endpoints

- `POST /api/auth/register` - Registrar usuario
- `POST /api/auth/login` - Iniciar sesión
- `GET /api/auth/validate` - Validar token

### Publication Service Endpoints

- `GET /api/publications` - Obtener publicaciones
- `POST /api/publications` - Crear publicación
- `PUT /api/publications/{id}` - Actualizar publicación
- `DELETE /api/publications/{id}` - Eliminar publicación

## 🤝 Contribución

1. Fork el proyecto
2. Crear una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para detalles.

## 👥 Autores

- Bryan Alexander Alarcón Iza, Elias Mateo Espinosa Vera

## 🙏 Agradecimientos

- Spring Boot Team
- React Team

- Camunda Team 
