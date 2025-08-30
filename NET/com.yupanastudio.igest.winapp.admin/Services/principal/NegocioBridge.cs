using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class NegocioBridge
    {
        public static async Task<List<Negocio>> getNegocioByEmp(int idEmpresa)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/gen/negocio/{idEmpresa}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsAsync<List<Negocio>>();
        }       

    }//end class

}
