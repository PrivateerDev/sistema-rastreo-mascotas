@echo off 
setlocal 
 
:: Configurar variables 
set BACKUP_DIR=..\backups 
set TIMESTAMP=2025-05-04_ 0h09m 
set ENCRYPTED_EXTENSION=.enc 
 
:: Crear directorio de respaldo si no existe 
if not exist %BACKUP_DIR% mkdir %BACKUP_DIR% 
 
:: Respaldar base de datos 
echo Realizando respaldo de la base de datos... 
pg_dump -U postgres -F c -b -v -f "%BACKUP_DIR%\db_%TIMESTAMP%.backup" rastreo_mascotas 
 
:: Comprimir c¢digo fuente 
echo Comprimiendo c¢digo fuente... 
tar -czf "%BACKUP_DIR%\code_%TIMESTAMP%.tar.gz" ..\frontend ..\backend 
 
:: Cifrar respaldos (requiere OpenSSL instalado) 
echo Cifrando respaldos... 
openssl enc -aes-256-cbc -salt -in "%BACKUP_DIR%\db_%TIMESTAMP%.backup" -out "%BACKUP_DIR%\db_%TIMESTAMP%.backup%ENCRYPTED_EXTENSION%" -k "%BACKUP_PASS%" 
openssl enc -aes-256-cbc -salt -in "%BACKUP_DIR%\code_%TIMESTAMP%.tar.gz" -out "%BACKUP_DIR%\code_%TIMESTAMP%.tar.gz%ENCRYPTED_EXTENSION%" -k "%BACKUP_PASS%" 
 
:: Eliminar archivos sin cifrar 
del "%BACKUP_DIR%\db_%TIMESTAMP%.backup" 
del "%BACKUP_DIR%\code_%TIMESTAMP%.tar.gz" 
 
echo Respaldo completado y cifrado en %BACKUP_DIR% 
endlocal 
