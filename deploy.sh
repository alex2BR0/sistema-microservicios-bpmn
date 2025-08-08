#!/bin/bash

echo "🚀 Iniciando despliegue del sistema de microservicios..."

# Verificar que Docker esté instalado
if ! command -v docker &> /dev/null; then
    echo "❌ Docker no está instalado. Por favor, instala Docker primero."
    exit 1
fi

# Verificar que Docker Compose esté instalado
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose no está instalado. Por favor, instala Docker Compose primero."
    exit 1
fi

echo "✅ Docker y Docker Compose están instalados"

# Construir los servicios Java
echo "🔨 Construyendo servicios Java..."

# Eureka Service
echo "📦 Construyendo Eureka Service..."
cd eureka-service
./mvnw clean package -DskipTests
cd ..

# Auth Service
echo "📦 Construyendo Auth Service..."
cd auth-service
./mvnw clean package -DskipTests
cd ..

# Publication Service
echo "📦 Construyendo Publication Service..."
cd publication-service
./mvnw clean package -DskipTests
cd ..

echo "✅ Servicios Java construidos"

# Construir el frontend
echo "🔨 Construyendo Frontend..."
cd frontend-publicaciones
npm install
npm run build
cd ..

echo "✅ Frontend construido"

# Desplegar con Docker Compose
echo "🐳 Desplegando con Docker Compose..."
docker-compose up -d

echo "⏳ Esperando a que los servicios estén listos..."
sleep 30

# Verificar el estado de los servicios
echo "🔍 Verificando estado de los servicios..."

# Verificar Eureka
if curl -s http://localhost:8761 > /dev/null; then
    echo "✅ Eureka Service está funcionando en http://localhost:8761"
else
    echo "❌ Eureka Service no está respondiendo"
fi

# Verificar Auth Service
if curl -s http://localhost:8081/actuator/health > /dev/null; then
    echo "✅ Auth Service está funcionando en http://localhost:8081"
else
    echo "❌ Auth Service no está respondiendo"
fi

# Verificar Publication Service
if curl -s http://localhost:8082/actuator/health > /dev/null; then
    echo "✅ Publication Service está funcionando en http://localhost:8082"
else
    echo "❌ Publication Service no está respondiendo"
fi

# Verificar Camunda
if curl -s http://localhost:8080 > /dev/null; then
    echo "✅ Camunda está funcionando en http://localhost:8080"
else
    echo "❌ Camunda no está respondiendo"
fi

# Verificar Frontend
if curl -s http://localhost:3000 > /dev/null; then
    echo "✅ Frontend está funcionando en http://localhost:3000"
else
    echo "❌ Frontend no está respondiendo"
fi

echo ""
echo "🎉 ¡Despliegue completado!"
echo ""
echo "📋 URLs de acceso:"
echo "   Frontend: http://localhost:3000"
echo "   Auth Service: http://localhost:8081"
echo "   Publication Service: http://localhost:8082"
echo "   Eureka Dashboard: http://localhost:8761"
echo "   Camunda Cockpit: http://localhost:8080"
echo "   RabbitMQ Management: http://localhost:15672"
echo ""
echo "🔧 Para detener los servicios:"
echo "   docker-compose down"
echo ""
echo "🔧 Para ver logs:"
echo "   docker-compose logs -f [servicio]" 