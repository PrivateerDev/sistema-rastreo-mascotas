import { useEffect, useState } from "react";

export default function Home() {
  const [status, setStatus] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    async function fetchData() {
      try {
        // 🔍 Verificación profunda de `NEXT_PUBLIC_API_URL`
        console.log("Tipo de `NEXT_PUBLIC_API_URL`:", typeof process.env.NEXT_PUBLIC_API_URL);
        console.log("Valor de `NEXT_PUBLIC_API_URL`:", process.env.NEXT_PUBLIC_API_URL);

        if (!process.env.NEXT_PUBLIC_API_URL) {
          throw new Error("NEXT_PUBLIC_API_URL no está definida en el entorno.");
        }

        if (process.env.NEXT_PUBLIC_API_URL === "undefined") {
          throw new Error("NEXT_PUBLIC_API_URL tiene un valor incorrecto: 'undefined'.");
        }

        if (process.env.NEXT_PUBLIC_API_URL.trim() === "") {
          throw new Error("NEXT_PUBLIC_API_URL está vacía.");
        }

        // Construcción de la URL con fallback
        const baseUrl = process.env.NEXT_PUBLIC_API_URL || "http://localhost:8080";
        const apiUrl = baseUrl + "/actuator/health";
        console.log("URL generada para la petición:", apiUrl);

        // Hacer la petición al backend
        const response = await fetch(apiUrl);

        if (!response.ok) {
          throw new Error(`Error en la API: ${response.status} ${response.statusText}`);
        }

        const data = await response.json();
        console.log("Respuesta del backend:", data);

        setStatus(data.status);
      } catch (err) {
        console.error("Error al obtener estado del backend:", err);
        setError(err.message);
      }
    }

    fetchData();
  }, []);

  return (
    <div style={{ textAlign: "center", padding: "20px", fontFamily: "Arial, sans-serif" }}>
      <h1>Sistema de Rastreo</h1>
      {error ? (
        <p style={{ color: "red", fontWeight: "bold" }}>{error}</p>
      ) : (
        <p>Estado del backend: {status || "Cargando..."}</p>
      )}
    </div>
  );
}