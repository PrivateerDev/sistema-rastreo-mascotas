@echo off 
echo Iniciando entorno de desarrollo... 
start cmd /k "cd ../backend/scripts && init-db.cmd" 
timeout /t 5 
start cmd /k "cd ../frontend && npm run dev" 
