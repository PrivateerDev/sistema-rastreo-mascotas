-- Script SQL para seguridad 
 
-- Crear roles espec¡ficos 
CREATE ROLE rastreo_app_read; 
CREATE ROLE rastreo_app_write; 
CREATE ROLE rastreo_app_admin; 
 
-- Asignar permisos 
GRANT USAGE ON SCHEMA app TO rastreo_app_read; 
GRANT SELECT ON ALL TABLES IN SCHEMA app TO rastreo_app_read; 
 
GRANT rastreo_app_read TO rastreo_app_write; 
GRANT INSERT, UPDATE ON ALL TABLES IN SCHEMA app TO rastreo_app_write; 
 
GRANT rastreo_app_write TO rastreo_app_admin; 
GRANT DELETE ON ALL TABLES IN SCHEMA app TO rastreo_app_admin; 
GRANT ALL PRIVILEGES ON SCHEMA app TO rastreo_app_admin; 
 
-- Crear usuario de aplicaci¢n 
CREATE USER app_user WITH PASSWORD 'segura123'; 
GRANT rastreo_app_write TO app_user; 
