using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class InscripcionBridge
    {
        public static async Task<List<Inscripcion>> getInscripcionByEst(long idEstudiante, int idNegocio)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/com/inscripcion/by_estudiante/{idEstudiante}/{idNegocio}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Inscripcion>>();
        }

        public static async Task<Inscripcion> upsert(Inscripcion obInsc)
        {
            HttpResponseMessage response = await Vars.client.PutAsJsonAsync(Vars.urlServerApp + "/com/inscripcion", obInsc);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<Inscripcion>();
        }

    }//end class

}
