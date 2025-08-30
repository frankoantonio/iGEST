using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class GrupoFamiliarBridge
    {
        public static async Task<GrupoFamiliar> getGrpFamByID(long idGrpFam)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/gen/grupo_familiar/{idGrpFam}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<GrupoFamiliar>();
        }

        public static async Task<List<GrupoFamiliar>> getGrpFamByNoms(int idEmpresa, string find)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/gen/grupo_familiar/by_noms/{idEmpresa}/{find}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<GrupoFamiliar>>();
        }

        public static async Task<GrupoFamiliar> upsert(GrupoFamiliar obGrpFam)
        {
            HttpResponseMessage response = await Vars.httpClient.PutAsJsonAsync(Vars.urlServerApp + "/gen/grupo_familiar", obGrpFam);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<GrupoFamiliar>();
        }

    }//end class

}
