# Antigravity Core

Framework profesional para estandarizar proyectos usando Antigravity. Este repositorio actúa como un núcleo (core) y sistema operativo contextual que puedes inyectar en cualquier proyecto para dotarlo de workflows, estándares y memoria inteligente.

## Objetivos

- Mantener consistencia entre proyectos.
- Reducir improvisación.
- Mejorar calidad técnica.
- Estandarizar workflows.
- Reutilizar capacidades.

## Estructura Modular

La arquitectura está diseñada en 3 niveles de prioridad para evitar el "context overflow" de la IA:

### 1-system/ (Conocimiento Core)
Contiene el `INDEX.mdc` maestro y las `rules` absolutas. Este es el cerebro del sistema y debe cargarse siempre.

### 2-knowledge/ (Conocimiento Estático)
Contiene `workflows` (procesos paso a paso), `standards` (plantillas y checklists) y `capabilities` (habilidades). Se cargan dinámicamente según la tarea.

### 3-workspace/ (Estado Dinámico)
Contiene `memory` y `artifacts`. Es el lugar donde la IA escribe sus conclusiones, logs y entregables. En este repositorio base debe estar vacío.

## Cómo Implementar en Futuros Proyectos

Para usar `antigravity-core` en un nuevo proyecto, sigue estos pasos de "sincronización manual inteligente":

### Paso 1: Descarga e Inyección
1. Clona o descarga el contenido de este repositorio.
2. Copia las carpetas `1-system`, `2-knowledge` y `3-workspace` en la raíz de tu nuevo proyecto (preferiblemente dentro de una carpeta oculta `.antigravity/` si quieres mantener tu directorio raíz limpio).

### Paso 2: Limpieza de Workspace
Asegúrate de que las carpetas dentro de `3-workspace/memory` y `3-workspace/artifacts` estén completamente vacías. Ese es el lienzo en blanco para la IA en el nuevo proyecto.

### Paso 3: Inicialización del Agente
En tu primer prompt o sesión con la IA en el nuevo proyecto, indícale la siguiente instrucción:
> "Por favor, lee el archivo `1-system/INDEX.mdc` para entender tus capacidades y restricciones antes de empezar a trabajar."

### Paso 4: Adaptación Local
Si el proyecto requiere reglas muy específicas (ej. un framework extraño), puedes crear un archivo `.mdc` adicional en `1-system/rules/` de ese proyecto en particular, sin ensuciar tu repositorio core maestro.

## Filosofía

- Simplicidad.
- Escalabilidad.
- Mantenibilidad.
- Reutilización.
- Arquitectura racional.