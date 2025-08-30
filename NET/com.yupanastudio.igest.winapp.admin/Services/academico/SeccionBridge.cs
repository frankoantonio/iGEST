using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class SeccionBridge
    {
        public static async Task<List<Seccion>> getSeccionByCampGdoTrn(long idCampania, int idGrado, int idTipoTurno)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/acd/seccion/{idCampania}/{idGrado}/{idTipoTurno}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Seccion>>();
        }

        //public static async Task<bool> upsert(Seccion obSeccion)
        //{
        //    HttpResponseMessage response = await Vars.httpClient.PostAsJsonAsync(Vars.urlServerApp + "/acd/seccion", obSeccion);

        //    if (response.StatusCode == HttpStatusCode.InternalServerError)
        //        throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
        //    else
        //        response.EnsureSuccessStatusCode();

        //    return await response.Content.ReadAsAsync<bool>();
        //}

    }//end class

}
