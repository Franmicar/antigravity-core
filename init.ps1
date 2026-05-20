param (
    [Parameter(Mandatory=$true, HelpMessage="La ruta absoluta o relativa del proyecto destino")]
    [string]$TargetFolder
)

# Validar destino
if (-not (Test-Path $TargetFolder)) {
    Write-Host "La ruta destino no existe. Creando..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Force -Path $TargetFolder | Out-Null
}

# La carpeta oculta .antigravity actúa como contenedor en el proyecto destino
$AntigravityTarget = Join-Path $TargetFolder ".antigravity"

Write-Host "Inicializando Antigravity Core en: $AntigravityTarget" -ForegroundColor Cyan
New-Item -ItemType Directory -Force -Path $AntigravityTarget | Out-Null

# Obtener la ruta de origen del script para poder ejecutarlo desde cualquier directorio
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if ([string]::IsNullOrEmpty($ScriptDir)) { $ScriptDir = "." }

# Copiar módulos Core: system, knowledge, skills
Write-Host "Copiando módulos del sistema (system, knowledge, skills)..." -ForegroundColor Yellow
Copy-Item -Path (Join-Path $ScriptDir "system") -Destination $AntigravityTarget -Recurse -Force
Copy-Item -Path (Join-Path $ScriptDir "knowledge") -Destination $AntigravityTarget -Recurse -Force
Copy-Item -Path (Join-Path $ScriptDir "skills") -Destination $AntigravityTarget -Recurse -Force

# Generar Workspace local dinámico en blanco
Write-Host "Generando workspace local de sesión..." -ForegroundColor Yellow
$Workspace = Join-Path $AntigravityTarget "workspace"
$Memory = Join-Path $Workspace "memory"
$Artifacts = Join-Path $Workspace "artifacts"

# Crear carpetas de memoria y entregables
New-Item -ItemType Directory -Force -Path $Memory | Out-Null
New-Item -ItemType Directory -Force -Path "$Artifacts\plans" | Out-Null
New-Item -ItemType Directory -Force -Path "$Artifacts\reports" | Out-Null
New-Item -ItemType Directory -Force -Path "$Artifacts\sessions" | Out-Null
New-Item -ItemType Directory -Force -Path "$Artifacts\proposals" | Out-Null

# Inicializar archivos de log y estado
$LearningLogPath = Join-Path $Memory "learning_log.jsonl"
if (-not (Test-Path $LearningLogPath)) {
    New-Item -ItemType File -Path $LearningLogPath -Force | Out-Null
}

$ActiveContextPath = Join-Path $Memory "active_context.json"
if (-not (Test-Path $ActiveContextPath)) {
    Set-Content -Path $ActiveContextPath -Value "{}" -Force
}

# Inicializar placeholder de reglas locales para el proyecto
$LocalRulesPath = Join-Path $AntigravityTarget "system\rules\local-rules.md"
Write-Host "Instalación completada con éxito." -ForegroundColor Green
Write-Host "Asegúrate de copiar el contenido de bootstrap.md en tu primer mensaje con la IA." -ForegroundColor Yellow
Write-Host "Puedes personalizar las especificaciones locales del proyecto en: $LocalRulesPath" -ForegroundColor Cyan
