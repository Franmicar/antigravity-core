param (
    [Parameter(Mandatory=$true, HelpMessage="La ruta absoluta o relativa del proyecto destino")]
    [string]$TargetFolder
)

# Validar destino
if (-not (Test-Path $TargetFolder)) {
    Write-Host "La ruta destino no existe. Creando..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Force -Path $TargetFolder | Out-Null
}

$AntigravityTarget = Join-Path $TargetFolder ".antigravity"

# Crear estructura base
Write-Host "Inicializando Antigravity Core en: $AntigravityTarget" -ForegroundColor Cyan
New-Item -ItemType Directory -Force -Path $AntigravityTarget | Out-Null

# Copiar System y Knowledge
Write-Host "Copiando módulos 1-system y 2-knowledge..."
Copy-Item -Path "1-system" -Destination $AntigravityTarget -Recurse -Force
Copy-Item -Path "2-knowledge" -Destination $AntigravityTarget -Recurse -Force

# Crear Workspace local
Write-Host "Generando 3-workspace local en blanco..."
$Workspace = Join-Path $AntigravityTarget "3-workspace"
New-Item -ItemType Directory -Force -Path "$Workspace\memory" | Out-Null
$Artifacts = Join-Path $Workspace "artifacts"
New-Item -ItemType Directory -Force -Path "$Artifacts\plans" | Out-Null
New-Item -ItemType Directory -Force -Path "$Artifacts\reports" | Out-Null
New-Item -ItemType Directory -Force -Path "$Artifacts\sessions" | Out-Null

Write-Host "¡Antigravity Core instalado con éxito en tu proyecto!" -ForegroundColor Green
Write-Host "Asegúrate de copiar el contenido de bootstrap.md en tu primer prompt con la IA." -ForegroundColor Yellow
