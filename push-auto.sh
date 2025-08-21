#!/bin/bash

# Script rápido para guardar cambios en GitHub desde Codespaces
set -e

# Agregar todos los archivos
git add .

# Usar mensaje automático con la fecha/hora
msg="Actualización desde Codespaces $(date '+%Y-%m-%d %H:%M:%S')"
echo "✏️ Commit: $msg"

git commit -m "$msg" || echo "⚠️ No había cambios para commitear."

# Actualizar la rama antes de enviar
git pull --rebase origin main

# Enviar cambios
git push origin main

echo "✅ Cambios subidos a GitHub automáticamente."