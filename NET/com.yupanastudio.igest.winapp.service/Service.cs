using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class Service
    {

        public static async Task<T> GetAsync<T>(string url)
        {
            if (!isTokenValid())
            {
                Vars.tokenSession = "";
                Vars.httpClient.DefaultRequestHeaders.Authorization = null;
                throw new Exception("Tu sesión ha expirado, cierre el sistema e ingrese nuevamente.");
            }

            var response = await Vars.httpClient.GetAsync(url);

            if (!response.IsSuccessStatusCode)
            {
                if (response.StatusCode == HttpStatusCode.InternalServerError && response.Headers.Contains("MyMsgERROR"))
                {
                    var errorMsg = response.Headers.GetValues("MyMsgERROR").FirstOrDefault();
                    throw new Exception(errorMsg);
                }
                response.EnsureSuccessStatusCode();
            }

            var json = await response.Content.ReadAsStringAsync();
            return JsonConvert.DeserializeObject<T>(json);
        }


        //public static async Task<T> PostAsync<T>(string url, object data)
        //{
        //    var response = await Vars.httpClient.PostAsJsonAsync(url, data);
        //    if (!response.IsSuccessStatusCode)
        //    {
        //        if (response.StatusCode == HttpStatusCode.InternalServerError &&
        //            response.Headers.Contains("MyMsgERROR"))
        //        {
        //            var errorMsg = response.Headers.GetValues("MyMsgERROR").FirstOrDefault();
        //            throw new Exception(errorMsg);
        //        }
        //        response.EnsureSuccessStatusCode();
        //    }
        //    var json = await response.Content.ReadAsStringAsync();
        //    return JsonConvert.DeserializeObject<T>(json);
        //}

        public static async Task<TResponse> PostAsync<TRequest, TResponse>(string url, TRequest data)
        {
            var json = JsonConvert.SerializeObject(data);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await Vars.httpClient.PostAsync(url, content);

            if (!response.IsSuccessStatusCode)
            {
                if (response.StatusCode == HttpStatusCode.InternalServerError &&
                    response.Headers.Contains("MyMsgERROR"))
                {
                    var errorMsg = response.Headers.GetValues("MyMsgERROR").FirstOrDefault();
                    throw new Exception(errorMsg);
                }

                response.EnsureSuccessStatusCode();
            }

            var resultJson = await response.Content.ReadAsStringAsync();
            return JsonConvert.DeserializeObject<TResponse>(resultJson);
        }

        //usarlo
        /*
        var login = new LoginRequest
        {
            idEmpresa = 1004,
            grpEmp = "SJBCORP",
            nomUsu = "1004.fbarzola",
            pwdUsu = "Valores@123",
            idTipoUsuario = 95060
        };

        TokenResponse token = await MiService.PostAsync<LoginRequest, TokenResponse>("https://localhost/auth/validar", login);

        //

        var filtro = new FiltroEmpresa { Nombre = "X" };
        List<Empresa> empresas = await MiService.PostAsync<FiltroEmpresa, List<Empresa>>("https://localhost/gen/empresa/buscar", filtro);
        
        */

        public static bool isTokenValid()
        {
            if (string.IsNullOrEmpty(Vars.tokenSession))
                return false;

            try
            {
                string[] parts = Vars.tokenSession.Split('.');
                if (parts.Length != 3)
                    return false;

                string payload = parts[1];

                // Añadir padding si es necesario
                switch (payload.Length % 4)
                {
                    case 2: payload += "=="; break;
                    case 3: payload += "="; break;
                }

                var jsonBytes = Convert.FromBase64String(payload);
                string json = Encoding.UTF8.GetString(jsonBytes);

                var payloadData = JsonConvert.DeserializeObject<Dictionary<string, object>>(json);

                if (payloadData.ContainsKey("exp"))
                {
                    var exp = Convert.ToInt64(payloadData["exp"]);
                    var expiryDate = DateTimeOffset.FromUnixTimeSeconds(exp).UtcDateTime;
                    return DateTime.UtcNow < expiryDate;
                }

                return false;
            }
            catch
            {
                return false;
            }
        }

    }//end class

}
