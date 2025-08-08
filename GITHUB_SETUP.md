# Configuración del Repositorio en GitHub

Esta guía te ayudará a configurar y subir tu proyecto al repositorio de GitHub.

## 🚀 Pasos para Subir a GitHub

### 1. Crear el Repositorio en GitHub

1. Ve a [GitHub](https://github.com) y inicia sesión
2. Haz clic en el botón "New" o "New repository"
3. Completa la información:
   - **Repository name**: `sistema-microservicios-bpmn` (o el nombre que prefieras)
   - **Description**: `Sistema de microservicios con Spring Boot, React y Camunda BPMN`
   - **Visibility**: Public o Private (según tu preferencia)
   - **NO** marques "Add a README file" (ya tenemos uno)
   - **NO** marques "Add .gitignore" (ya tenemos uno)
4. Haz clic en "Create repository"

### 2. Inicializar el Repositorio Local

Ejecuta el script de inicialización:

```powershell
# En Windows (PowerShell)
.\init-git.ps1

# En Linux/Mac
./init-git.sh
```

### 3. Conectar con GitHub

```bash
# Agregar el remote origin (reemplaza con tu URL)
git remote add origin https://github.com/tu-usuario/sistema-microservicios-bpmn.git

# Verificar que se agregó correctamente
git remote -v
```

### 4. Subir al Repositorio

```bash
# Subir la rama principal
git push -u origin main

# Si tu rama principal se llama "master" en lugar de "main"
git push -u origin master
```

## 📋 Estructura del Repositorio

Una vez subido, tu repositorio tendrá esta estructura:

```
sistema-microservicios-bpmn/
├── README.md                    # Documentación principal
├── LICENSE                      # Licencia MIT
├── .gitignore                   # Archivos a ignorar
├── docker-compose.yml           # Configuración Docker
├── deploy.ps1                   # Script de despliegue (Windows)
├── deploy.sh                    # Script de despliegue (Linux/Mac)
├── init-git.ps1                 # Script de inicialización Git (Windows)
├── init-git.sh                  # Script de inicialización Git (Linux/Mac)
├── GITHUB_SETUP.md             # Esta guía
├── bpmn-models/                # Modelos BPMN
│   ├── README.md               # Documentación de modelos BPMN
│   └── publication-process.bpmn # Modelo de proceso de publicación
├── auth-service/               # Microservicio de autenticación
├── publication-service/        # Microservicio de publicaciones
├── eureka-service/            # Servicio de descubrimiento
└── frontend-publicaciones/    # Frontend React
```

## 🎯 Configuración Adicional

### GitHub Pages (Opcional)

Si quieres crear una página web para tu proyecto:

1. Ve a Settings > Pages
2. En "Source", selecciona "Deploy from a branch"
3. Selecciona la rama "main" y la carpeta "/ (root)"
4. Haz clic en "Save"

### GitHub Actions (Opcional)

Puedes crear workflows automáticos para CI/CD. Crea el archivo `.github/workflows/ci.yml`:

```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - name: Set up JDK 17
      uses: actions/setup-java@v2
      with:
        java-version: '17'
        distribution: 'adopt'
    
    - name: Build Auth Service
      run: |
        cd auth-service
        ./mvnw clean package -DskipTests
    
    - name: Build Publication Service
      run: |
        cd publication-service
        ./mvnw clean package -DskipTests
    
    - name: Build Eureka Service
      run: |
        cd eureka-service
        ./mvnw clean package -DskipTests
    
    - name: Set up Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '16'
    
    - name: Build Frontend
      run: |
        cd frontend-publicaciones
        npm install
        npm run build
```

## 🔧 Comandos Útiles

### Git Básico

```bash
# Ver estado del repositorio
git status

# Ver historial de commits
git log --oneline

# Ver ramas
git branch

# Crear nueva rama
git checkout -b feature/nueva-funcionalidad

# Cambiar de rama
git checkout main

# Ver diferencias
git diff
```

### Actualizaciones

```bash
# Agregar cambios
git add .

# Hacer commit
git commit -m "Descripción de los cambios"

# Subir cambios
git push origin main

# Actualizar repositorio local
git pull origin main
```

## 📝 Badges para el README

Puedes agregar estos badges a tu README.md:

```markdown
# Sistema de Microservicios con BPMN

[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://openjdk.java.net/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.x-green.svg)](https://spring.io/projects/spring-boot)
[![React](https://img.shields.io/badge/React-18-blue.svg)](https://reactjs.org/)
[![Docker](https://img.shields.io/badge/Docker-20.x-blue.svg)](https://www.docker.com/)
[![Camunda](https://img.shields.io/badge/Camunda-7.x-orange.svg)](https://camunda.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

[Resto del README...]
```

## 🚨 Solución de Problemas

### Error: "fatal: remote origin already exists"

```bash
# Remover el remote existente
git remote remove origin

# Agregar el nuevo remote
git remote add origin https://github.com/tu-usuario/sistema-microservicios-bpmn.git
```

### Error: "Permission denied"

```bash
# Configurar credenciales de GitHub
git config --global user.name "Tu Nombre"
git config --global user.email "tu-email@example.com"

# O usar GitHub CLI
gh auth login
```

### Error: "Large files"

Si tienes archivos grandes que no se pueden subir:

```bash
# Ver archivos grandes
git rev-list --objects --all | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | sed -n 's/^blob //p' | sort --numeric-sort --key=2 | tail -10

# Agregar al .gitignore y remover del tracking
git rm --cached archivo-grande.jar
```

## 🎉 ¡Listo!

Una vez completados estos pasos, tu proyecto estará disponible en GitHub con:

- ✅ Código fuente completo
- ✅ Modelo BPMN (Camunda)
- ✅ README.md detallado
- ✅ Instrucciones de despliegue
- ✅ Diagrama de arquitectura
- ✅ Scripts de automatización
- ✅ Documentación completa

¡Tu repositorio está listo para ser compartido y colaborado! 