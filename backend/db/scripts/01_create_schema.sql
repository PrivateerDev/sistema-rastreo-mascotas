-- Script SQL para crear esquema y tablas 
CREATE SCHEMA IF NOT EXISTS app; 
 
-- Tabla de usuarios con hash seguro para contrase¤as 
CREATE TABLE app.users ( 
  id UUID PRIMARY KEY, 
  email VARCHAR(255) UNIQUE NOT NULL, 
  password_hash VARCHAR(255) NOT NULL, 
  first_name VARCHAR(100) NOT NULL, 
  last_name VARCHAR(100) NOT NULL, 
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
  last_login TIMESTAMP WITH TIME ZONE, 
  account_non_expired BOOLEAN DEFAULT TRUE, 
  account_non_locked BOOLEAN DEFAULT TRUE, 
  failed_login_attempts INT DEFAULT 0, 
  role VARCHAR(50) NOT NULL DEFAULT 'USER' 
); 
