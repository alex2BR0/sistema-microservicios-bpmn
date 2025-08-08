#!/bin/bash

echo "🚀 Inicializando repositorio Git..."

# Verificar que Git esté instalado
if ! command -v git &> /dev/null; then
    echo "❌ Git no está instalado. Por favor, instala Git primero."
    exit 1
fi

echo "✅ Git está instalado"

# Inicializar repositorio Git
if [ ! -d ".git" ]; then
    echo "📁 Inicializando repositorio Git..."
    git init
    echo "✅ Repositorio Git inicializado"
else
    echo "✅ Repositorio Git ya existe"
fi

# Agregar todos los archivos
echo "📦 Agregando archivos al repositorio..."
git add .

# Hacer commit inicial
echo "💾 Realizando commit inicial..."
git commit -m "Initial commit: Sistema de Microservicios con BPMN

- Auth Service (Spring Boot)
- Publication Service (Spring Boot)
- Eureka Service Discovery
- Frontend React
- Modelo BPMN (Camunda)
- Docker Compose configuration
- Documentación completa"

echo "✅ Commit inicial realizado"

echo ""
echo "🎉 ¡Repositorio Git inicializado exitosamente!"
echo ""
echo "📋 Próximos pasos:"
echo "1. Crear un repositorio en GitHub/GitLab"
echo "2. Agregar el remote origin:"
echo "   git remote add origin https://github.com/tu-usuario/nombre-del-repositorio.git"
echo "3. Subir al repositorio:"
echo "   git push -u origin main"
echo ""
echo "🔧 Comandos útiles:"
echo "   git status - Ver estado del repositorio"
echo "   git log --oneline - Ver historial de commits"
echo "   git branch - Ver ramas" 