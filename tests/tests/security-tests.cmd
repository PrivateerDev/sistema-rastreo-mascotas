@echo off 
echo === Iniciando pruebas de seguridad === 
 
echo --- Probando inyecci¢n SQL (simulada) --- 
 
echo Ejecutando curl para probar endpoint de autenticaci¢n con intento de inyecci¢n... 
curl -X POST -H "Content-Type: application/json" -d "{\"username\":\"test' OR 1=1 --\",\"password\":\"test\"}" http://localhost:8080/api/login 
 
echo --- Probando fuerza bruta en login (simulada) --- 
for %%i in (password1 password2 password3 password4) do curl -X POST -H "Content-Type: application/json" -d "{\"username\":\"test\",\"password\":\"%%i\"}" http://localhost:8080/api/login 
 
echo --- Probando encabezados de seguridad --- 
curl -I http://localhost:8080/ 
 
echo === Pruebas de seguridad completadas === 
