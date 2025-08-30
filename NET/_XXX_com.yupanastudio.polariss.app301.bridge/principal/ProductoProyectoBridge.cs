using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class ProductoProyectoBridge
    {
        public static async Task<List<ProductoProyecto>> getProdProyByNegocio(int idNegocio)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/com/producto_proyecto/{idNegocio}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<ProductoProyecto>>();
        }

    }//end class

}
