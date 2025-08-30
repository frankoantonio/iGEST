using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class DireccionBridge
    {
        public static async Task<Direccion> getDireccionByID(long idDireccion)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/gen/direccion/{idDireccion}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<Direccion>();
        }

        public static async Task<List<Direccion>> getDireccionByNoms(int idEmpresa, string nomVia)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/gen/direccion/by_noms/{idEmpresa}/{nomVia}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Direccion>>();
        }

        public static async Task<List<Direccion>> getDireccionByFamsAll(long idPersona, long idGrpFam)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/gen/direccion/by_fams_all/{idPersona}/{idGrpFam}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Direccion>>();
        }

        public static async Task<Direccion> upsert(Direccion obDir)
        {
            HttpResponseMessage response = await Vars.httpClient.PutAsJsonAsync(Vars.urlServerApp + "/gen/direccion", obDir);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<Direccion>();
        }

    }//end class

}
