@echo off 
echo === Iniciando auditor¡a de seguridad === 
 
echo --- Verificando dependencias vulnerables en Frontend --- 
cd ../frontend 
call npm audit --json 
 
echo --- Verificando dependencias vulnerables en Backend --- 
cd ../backend 
call mvn org.owasp:dependency-check-maven:check 
 
echo --- Ejecutando an lisis de c¢digo est tico --- 
call npx eslint --ext .js,.jsx ../frontend/src 
 
echo === Auditor¡a completada === 
