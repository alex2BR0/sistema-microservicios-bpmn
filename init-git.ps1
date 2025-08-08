Write-Host "🚀 Inicializando repositorio Git..." -ForegroundColor Green

# Verificar que Git esté instalado
try {
    git --version | Out-Null
    Write-Host "✅ Git está instalado" -ForegroundColor Green
} catch {
    Write-Host "❌ Git no está instalado. Por favor, instala Git primero." -ForegroundColor Red
    exit 1
}

# Inicializar repositorio Git
if (-not (Test-Path ".git")) {
    Write-Host "📁 Inicializando repositorio Git..." -ForegroundColor Yellow
    git init
    Write-Host "✅ Repositorio Git inicializado" -ForegroundColor Green
} else {
    Write-Host "✅ Repositorio Git ya existe" -ForegroundColor Green
}

# Agregar todos los archivos
Write-Host "📦 Agregando archivos al repositorio..." -ForegroundColor Yellow
git add .

# Hacer commit inicial
Write-Host "💾 Realizando commit inicial..." -ForegroundColor Yellow
git commit -m "Initial commit: Sistema de Microservicios con BPMN

- Auth Service (Spring Boot)
- Publication Service (Spring Boot)
- Eureka Service Discovery
- Frontend React
- Modelo BPMN (Camunda)
- Docker Compose configuration
- Documentación completa"

Write-Host "✅ Commit inicial realizado" -ForegroundColor Green

Write-Host ""
Write-Host "🎉 ¡Repositorio Git inicializado exitosamente!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Próximos pasos:" -ForegroundColor Cyan
Write-Host "1. Crear un repositorio en GitHub/GitLab" -ForegroundColor White
Write-Host "2. Agregar el remote origin:" -ForegroundColor White
Write-Host "   git remote add origin https://github.com/tu-usuario/nombre-del-repositorio.git" -ForegroundColor Gray
Write-Host "3. Subir al repositorio:" -ForegroundColor White
Write-Host "   git push -u origin main" -ForegroundColor Gray
Write-Host ""
Write-Host "🔧 Comandos útiles:" -ForegroundColor Cyan
Write-Host "   git status - Ver estado del repositorio" -ForegroundColor Gray
Write-Host "   git log --oneline - Ver historial de commits" -ForegroundColor Gray
Write-Host "   git branch - Ver ramas" -ForegroundColor Gray 