using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class LoginXBridge
    {
        public async Task<LoginX> validarUsuario(int idEmpresa, string usu, string pwd)
        {
            var byteArray = Encoding.UTF8.GetBytes(usu + ":" + pwd);

            Vars.client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", Convert.ToBase64String(byteArray));
            Vars.client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/admin/autenticar/{idEmpresa}/{usu}");

            if (response.StatusCode == HttpStatusCode.Unauthorized)
                throw new System.Exception("Los datos ingresados no se corresponde con un usuario, o está inactivo.");
            else if (response.StatusCode == HttpStatusCode.Forbidden)
                throw new System.Exception("Falta asignar autorizaciones al usuario.");
            else if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<LoginX>();
        }

    }//end class

}
