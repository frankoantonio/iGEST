using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class ProductoSunatBridge
    {
        public static async Task<ProductoSunat> getProductoSunatByID(long idProdSunat)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/com/producto_sunat/{idProdSunat}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<ProductoSunat>();
        }

        // el resultado se limita a los cincuenta primeros registros
        public static async Task<List<ProductoSunat>> getProductoSunatByFind(string find)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/com/producto_sunat/by_find/{find}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<ProductoSunat>>();
        }

        public static async Task<List<ProductoSunat>> getProductoSunatByNivel(int nivel, string codPadre)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/com/producto_sunat/by_nivel/{nivel}/{codPadre}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<ProductoSunat>>();
        }

    }//end class

}
