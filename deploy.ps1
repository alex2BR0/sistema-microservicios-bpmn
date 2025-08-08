Write-Host "🚀 Iniciando despliegue del sistema de microservicios..." -ForegroundColor Green

# Verificar que Docker esté instalado
try {
    docker --version | Out-Null
    Write-Host "✅ Docker está instalado" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker no está instalado. Por favor, instala Docker Desktop primero." -ForegroundColor Red
    exit 1
}

# Verificar que Docker Compose esté instalado
try {
    docker-compose --version | Out-Null
    Write-Host "✅ Docker Compose está instalado" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker Compose no está instalado. Por favor, instala Docker Compose primero." -ForegroundColor Red
    exit 1
}

Write-Host "✅ Docker y Docker Compose están instalados" -ForegroundColor Green

# Construir los servicios Java
Write-Host "🔨 Construyendo servicios Java..." -ForegroundColor Yellow

# Eureka Service
Write-Host "📦 Construyendo Eureka Service..." -ForegroundColor Cyan
Set-Location eureka-service
./mvnw clean package -DskipTests
Set-Location ..

# Auth Service
Write-Host "📦 Construyendo Auth Service..." -ForegroundColor Cyan
Set-Location auth-service
./mvnw clean package -DskipTests
Set-Location ..

# Publication Service
Write-Host "📦 Construyendo Publication Service..." -ForegroundColor Cyan
Set-Location publication-service
./mvnw clean package -DskipTests
Set-Location ..

Write-Host "✅ Servicios Java construidos" -ForegroundColor Green

# Construir el frontend
Write-Host "🔨 Construyendo Frontend..." -ForegroundColor Yellow
Set-Location frontend-publicaciones
npm install
npm run build
Set-Location ..

Write-Host "✅ Frontend construido" -ForegroundColor Green

# Desplegar con Docker Compose
Write-Host "🐳 Desplegando con Docker Compose..." -ForegroundColor Yellow
docker-compose up -d

Write-Host "⏳ Esperando a que los servicios estén listos..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

# Verificar el estado de los servicios
Write-Host "🔍 Verificando estado de los servicios..." -ForegroundColor Yellow

# Verificar Eureka
try {
    Invoke-WebRequest -Uri "http://localhost:8761" -UseBasicParsing | Out-Null
    Write-Host "✅ Eureka Service está funcionando en http://localhost:8761" -ForegroundColor Green
} catch {
    Write-Host "❌ Eureka Service no está respondiendo" -ForegroundColor Red
}

# Verificar Auth Service
try {
    Invoke-WebRequest -Uri "http://localhost:8081/actuator/health" -UseBasicParsing | Out-Null
    Write-Host "✅ Auth Service está funcionando en http://localhost:8081" -ForegroundColor Green
} catch {
    Write-Host "❌ Auth Service no está respondiendo" -ForegroundColor Red
}

# Verificar Publication Service
try {
    Invoke-WebRequest -Uri "http://localhost:8082/actuator/health" -UseBasicParsing | Out-Null
    Write-Host "✅ Publication Service está funcionando en http://localhost:8082" -ForegroundColor Green
} catch {
    Write-Host "❌ Publication Service no está respondiendo" -ForegroundColor Red
}

# Verificar Camunda
try {
    Invoke-WebRequest -Uri "http://localhost:8080" -UseBasicParsing | Out-Null
    Write-Host "✅ Camunda está funcionando en http://localhost:8080" -ForegroundColor Green
} catch {
    Write-Host "❌ Camunda no está respondiendo" -ForegroundColor Red
}

# Verificar Frontend
try {
    Invoke-WebRequest -Uri "http://localhost:3000" -UseBasicParsing | Out-Null
    Write-Host "✅ Frontend está funcionando en http://localhost:3000" -ForegroundColor Green
} catch {
    Write-Host "❌ Frontend no está respondiendo" -ForegroundColor Red
}

Write-Host ""
Write-Host "🎉 ¡Despliegue completado!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 URLs de acceso:" -ForegroundColor Cyan
Write-Host "   Frontend: http://localhost:3000" -ForegroundColor White
Write-Host "   Auth Service: http://localhost:8081" -ForegroundColor White
Write-Host "   Publication Service: http://localhost:8082" -ForegroundColor White
Write-Host "   Eureka Dashboard: http://localhost:8761" -ForegroundColor White
Write-Host "   Camunda Cockpit: http://localhost:8080" -ForegroundColor White
Write-Host "   RabbitMQ Management: http://localhost:15672" -ForegroundColor White
Write-Host ""
Write-Host "🔧 Para detener los servicios:" -ForegroundColor Cyan
Write-Host "   docker-compose down" -ForegroundColor Gray
Write-Host ""
Write-Host "🔧 Para ver logs:" -ForegroundColor Cyan
Write-Host "   docker-compose logs -f [servicio]" -ForegroundColor Gray 