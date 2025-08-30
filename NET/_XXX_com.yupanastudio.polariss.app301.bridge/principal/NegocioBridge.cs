using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class NegocioBridge
    {
        public static async Task<List<Negocio>> getNegocioByEmp(int idEmpresa)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/gen/negocio/{idEmpresa}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsAsync<List<Negocio>>();
        }       

    }//end class

}
