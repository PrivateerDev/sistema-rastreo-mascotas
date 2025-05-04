// Configuraci¢n de seguridad para el frontend 
export const securityConfig = { 
  csp: { 
    directives: { 
      defaultSrc: ["'self'"], 
      scriptSrc: ["'self'"], 
      styleSrc: ["'self'", "'unsafe-inline'"], 
      imgSrc: ["'self'", "data:", "blob:"], 
      connectSrc: ["'self'", "https://api.rastreomascotas.com"], 
    }, 
  }, 
  auth: { 
    tokenExpiryMinutes: 60, 
    refreshTokenExpiryDays: 7, 
    passwordMinLength: 8, 
    passwordRequiresSpecialChar: true, 
    passwordRequiresNumber: true, 
    passwordRequiresUppercase: true, 
    maxLoginAttempts: 5, 
    lockoutDurationMinutes: 15, 
  }, 
}; 
