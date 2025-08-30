using Newtonsoft.Json;
using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using static com.yupanastudio.igest.winapp.Utils;

namespace com.yupanastudio.igest.winapp
{
    public class UsuarioService
    {
        //public static async Task<string> getJWT(ClientInfo obClientInfo)
        //{
        //    var json = JsonConvert.SerializeObject(obClientInfo);
        //    var content = new StringContent(json, Encoding.UTF8, "application/json");

        //    using (var response = await Vars.httpClient.PostAsync($"{Vars.urlServerApp}/auth/validar", content))
        //    {
        //        if (response.StatusCode == HttpStatusCode.InternalServerError)
        //        {
        //            string errorMessage = response.Headers.Contains("MyMsgERROR")
        //                ? response.Headers.GetValues("MyMsgERROR").FirstOrDefault()
        //                : "Error interno del servidor";
        //            throw new Exception(errorMessage);
        //        }

        //        response.EnsureSuccessStatusCode();

        //        var result = await response.Content.ReadAsStringAsync();

        //        return JObject.Parse(result)["mitoken"]?.ToString();
        //    }
        //}



        public static async Task<RptaLogin> getLoginX(ClientInfo obClientInfo)
        {
            var json = JsonConvert.SerializeObject(obClientInfo);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            using (var response = await Vars.httpClient.PostAsync($"{Vars.urlServerApp}/auth/validar", content))
            {
                if (response.StatusCode == HttpStatusCode.InternalServerError)
                {
                    string errorMessage = response.Headers.Contains("MyMsgERROR")
                        ? response.Headers.GetValues("MyMsgERROR").FirstOrDefault()
                        : "Error interno del servidor";
                    throw new Exception(errorMessage);
                }

                response.EnsureSuccessStatusCode();

                var jsonResponseString = await response.Content.ReadAsStringAsync();
                RptaLogin authData = JsonConvert.DeserializeObject<RptaLogin>(jsonResponseString);
                return authData;
            }
        }

        public static async Task<Empresa> getEmpresa()
        {
            return await Service.GetAsync<Empresa>("https://localhost/admin/perfilAdmin/empresa/1004");
            //List<Empresa> empresas = await Service.GetAsync<List<Empresa>>("https://localhost/gen/empresa/all_with_child");
        }

        public async Task<LoginX> setObjects(int idEmpresa, string usu, string pwd)
        {
            return await Service.GetAsync<LoginX>($"{Vars.urlServerApp}/admin/{idEmpresa}/{usu}");
        }

    }//end class


    public class RptaLogin
    {
        public string token { get; set; }
        public LoginX obLoginX { get; set; }

    }//end class

}
