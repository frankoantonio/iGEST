using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class TrabClaseBridge
    {
        public static async Task<List<TrabClase>> getTrabClaseByEmp(int idEmpresa, int idTipoCatTrab)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/lab/trab_clase/{idEmpresa}/{idTipoCatTrab}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<TrabClase>>();
        }

    }//end class

}
