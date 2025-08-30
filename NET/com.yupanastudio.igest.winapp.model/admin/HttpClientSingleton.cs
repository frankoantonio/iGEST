using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public static class HttpClientSingleton
    {
        // Token global (para manejarlo a través de toda la aplicación)
        public static string tokenSession = "";

        // HttpClient global y reutilizable
        private static readonly HttpClient _httpClient;

        // Tiempo de expiración del token (esto se lo asignamos desde la respuesta del servidor)
        private static DateTime? tokenExpirationTime = null;

        // Constructor estático para inicializar HttpClient una sola vez
        static HttpClientSingleton()
        {
            _httpClient = new HttpClient();
        }

        // Método para obtener el HttpClient con el token actualizado
        public static async Task<HttpClient> GetClientAsync()
        {
            // Si el token ha caducado o está por caducar, renueva el token
            if (string.IsNullOrEmpty(tokenSession) || HasTokenExpired())
            {
                await RefreshTokenAsync();
            }

            // Establecer el encabezado Authorization con el token actualizado
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", tokenSession);

            return _httpClient;
        }

        // Método opcional para actualizar el token global cuando se recibe uno nuevo
        public static void UpdateToken(string newToken, DateTime expirationTime)
        {
            tokenSession = newToken;
            tokenExpirationTime = expirationTime;
        }

        // Verifica si el token ha expirado
        private static bool HasTokenExpired()
        {
            return tokenExpirationTime == null || DateTime.UtcNow >= tokenExpirationTime;
        }

        // Método para solicitar un nuevo token cuando el actual ha expirado
        private static async Task RefreshTokenAsync()
        {
            // Aquí iría la lógica para obtener un nuevo token
            // Ejemplo: hacer una solicitud al endpoint de autenticación
            var response = await _httpClient.PostAsync("https://localhost/auth/refresh-token", null);

            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();

                // Supongamos que la respuesta contiene el nuevo token y la fecha de expiración
                var newToken = "nuevo_token_aqui"; // Obtener del JSON (ejemplo)
                var expirationDate = DateTime.UtcNow.AddHours(1); // Ajusta según el tiempo de expiración del token

                // Aquí debería ir el código que extrae el token y la expiración de la respuesta real
                // Asume que el servidor devuelve algo como:
                // {"mitoken": "nuevo_token", "exp": "fecha_expiracion"}
                // Puedes parsear ese JSON con `Newtonsoft.Json` o `System.Text.Json` para obtener los valores

                UpdateToken(newToken, expirationDate);
            }
            else
            {
                throw new Exception("Error al renovar el token.");
            }
        }

    }// end class

}
