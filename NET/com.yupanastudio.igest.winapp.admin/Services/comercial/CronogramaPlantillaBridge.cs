using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class CronogramaPlantillaBridge
    {
        public static async Task<List<CronogramaPlantilla>> getCronogramaPlantillaByIDCampania(long idCampania)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/com/cronograma_plantilla/{idCampania}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<CronogramaPlantilla>>();
        }

        public static async Task<Boolean> upsert(List<CronogramaPlantilla> lsCronograma)
        {
            HttpResponseMessage response = await Vars.httpClient.PutAsJsonAsync(Vars.urlServerApp + "/com/cronograma_plantilla", lsCronograma);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<Boolean>();
        }

    }//end class

}
