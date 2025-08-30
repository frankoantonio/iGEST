using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class TrabajadorBridge
    {
        public static async Task<Trabajador> getTrabajadorByID(long idTrabajador)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/admin/trabajador/{idTrabajador}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<Trabajador>();
        }

        public static async Task<bool> upsert(Trabajador obTrab)
        {
            HttpResponseMessage response = await Vars.httpClient.PutAsJsonAsync(Vars.urlServerApp + "/lab/trabajador", obTrab);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<bool>();
        }

        //public static async Task<Trabajador> insert(Trabajador obTrab)
        //{
        //    HttpResponseMessage response = await Vars.httpClient.PostAsJsonAsync(Vars.urlServerApp + "/lab/trabajador", obTrab);

        //    if (response.StatusCode == HttpStatusCode.InternalServerError)
        //        throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
        //    else
        //        response.EnsureSuccessStatusCode();

        //    return await response.Content.ReadAsAsync<Trabajador>();
        //}

        //public static async Task<Trabajador> update(Trabajador obTrab)
        //{
        //    HttpResponseMessage response = await Vars.httpClient.PutAsJsonAsync(Vars.urlServerApp + "/lab/trabajador", obTrab);

        //    if (response.StatusCode == HttpStatusCode.InternalServerError)
        //        throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
        //    else
        //        response.EnsureSuccessStatusCode();

        //    return await response.Content.ReadAsAsync<Trabajador>();
        //}

    }//end class

}
