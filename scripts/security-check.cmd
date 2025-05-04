@echo off 
echo Ejecutando an lisis de seguridad... 
cd ../frontend 
npm audit 
cd ../backend 
mvn dependency-check:check 
