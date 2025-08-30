using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class NegocioSedeSistemaBridge
    {
        public static async Task<List<NegocioSedeSistema>> getNegocioSedeSistemaByNegSede(int idNegSede)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/gen/negociosedesistema/{idNegSede}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsAsync<List<NegocioSedeSistema>>();
        }

        public static async Task<List<NegocioSedeSistema>> save(int idNegSede, List<NegocioSedeSistema> lsNegSedeSis)
        {
            HttpResponseMessage response = await Vars.httpClient.PostAsJsonAsync(Vars.urlServerApp + $"/gen/negociosedesistema/{idNegSede}", lsNegSedeSis);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsAsync<List<NegocioSedeSistema>>();
        }

    }//end class

}
