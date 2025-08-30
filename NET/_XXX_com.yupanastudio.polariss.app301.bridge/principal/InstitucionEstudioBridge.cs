using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class InstitucionEstudioBridge
    {
        public static async Task<List<InstitucionEstudio>> getInstEstudioByNoms(string find)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/gen/institucion_estudio/by_noms/{find}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<InstitucionEstudio>>();
        }

        public static async Task<InstitucionEstudio> getInstEstudioByID(long idInstEst)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/gen/institucion_estudio/{idInstEst}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<InstitucionEstudio>();
        }

        public static async Task<InstitucionEstudio> upsert(InstitucionEstudio obInstEstudio)
        {
            HttpResponseMessage response = await Vars.client.PutAsJsonAsync(Vars.urlServerApp + "/gen/institucion_estudio", obInstEstudio);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<InstitucionEstudio>();
        }

    }//end class

}
