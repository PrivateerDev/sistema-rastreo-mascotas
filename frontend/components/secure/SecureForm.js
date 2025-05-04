// Componente de formulario seguro con validaci¢n 
import React, { useState } from 'react'; 
import { validateFormData, UserCredentialsSchema, sanitizeInput } from '../../utils/security'; 
const SecureForm = ({ onSubmit, fields, buttonText = 'Enviar' }) =
  const [formData, setFormData] = useState({}); 
  const [errors, setErrors] = useState({}); 
  const handleChange = (e) =
    const { name, value } = e.target; 
    const sanitizedValue = sanitizeInput(value); 
    setFormData(prev = ...prev, [name]: sanitizedValue })); 
  }; 
  const handleSubmit = (e) =
    e.preventDefault(); 
    const result = validateFormData(formData, UserCredentialsSchema); 
    if (result.success) { 
      setErrors({}); 
      onSubmit(result.data); 
    } else { 
      const errorMap = {}; 
      result.errors.forEach(err =
        const field = err.path[0]; 
        errorMap[field] = err.message; 
      }); 
      setErrors(errorMap); 
    } 
  }; 
  return ( 
      {fields.map(field =
      ))} 
  ); 
}; 
export default SecureForm; 
