set TIMESTAMP=%2025%-%05%-%03%-%23%h%35%m 
pg_dump -U postgres -F c -b -v -f "backups/rastreo_mascotas_%%TIMESTAMP%%.backup" rastreo_mascotas 
