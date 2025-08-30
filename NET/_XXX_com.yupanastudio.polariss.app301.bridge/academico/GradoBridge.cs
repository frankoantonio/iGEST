using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class GradoBridge
    {
        public static async Task<List<Grado>> getGradoByNivEdu(int idNivEdu)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/acd/grado/{idNivEdu}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Grado>>();
        }

        public static async Task<bool> upsert(Grado obGrado)
        {
            HttpResponseMessage response = await Vars.client.PutAsJsonAsync(Vars.urlServerApp + "/acd/grado", obGrado);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<bool>();
        }

    }//end class

}
