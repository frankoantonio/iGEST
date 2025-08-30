using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class ArticuloBridge
    {
        public static async Task<List<Articulo>> getArticuloByCategoria(int idNegocio, long idCategoria)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/com/articulo/by_categoria/{idNegocio}/{idCategoria}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Articulo>>();
        }

        public static async Task<List<Articulo>> getArticuloByFind(int idNegocio, String find)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/com/articulo/by_find/{idNegocio}/{find}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Articulo>>();
        }

        public static async Task<List<String>> getSubcategoria(int idEmpresa)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/com/articulo/subcategoria/{idEmpresa}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<String>>();
        }

        public static async Task<List<String>> getNomArticulo(int idEmpresa)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/com/articulo/nom_articulo/{idEmpresa}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<String>>();
        }

        public static async Task<List<String>> getMarca(int idEmpresa)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/com/articulo/marca/{idEmpresa}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<String>>();
        }

        public static async Task<List<String>> getModelo(int idEmpresa)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/com/articulo/modelo/{idEmpresa}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<String>>();
        }

        public static async Task<Articulo> upsert(Articulo obArticulo)
        {
            HttpResponseMessage response = await Vars.client.PutAsJsonAsync(Vars.urlServerApp + "/com/articulo", obArticulo);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<Articulo>();
        }

    }//end class

}
