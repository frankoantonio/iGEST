using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class NegocioSedeBridge
    {
        public static async Task<List<NegocioSede>> getNegocioSedeByNeg(int idEmpresa, int idNegocio)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/gen/negociosede/{idEmpresa}/{idNegocio}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsAsync<List<NegocioSede>>();
        }

        public static async Task<List<NegocioSede>> save(int idEmpresa, int idNegocio, List<NegocioSede> lsNegSede)
        {
            HttpResponseMessage response = await Vars.httpClient.PostAsJsonAsync(Vars.urlServerApp + $"/gen/negociosede/{idEmpresa}/{idNegocio}", lsNegSede);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsAsync<List<NegocioSede>>();
        }

    }//end class

}
