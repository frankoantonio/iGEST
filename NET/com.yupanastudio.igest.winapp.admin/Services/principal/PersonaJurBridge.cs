using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class PersonaJurBridge
    {
        public static async Task<PersonaJur> getPersonaJurByID(long idPerJur)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/gen/persona_jur/{idPerJur}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<PersonaJur>();
        }

        public static async Task<PersonaJur> upsert(PersonaJur obPerJur)
        {
            HttpResponseMessage response = await Vars.httpClient.PutAsJsonAsync(Vars.urlServerApp + "/gen/persona_jur", obPerJur);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<PersonaJur>();
        }

    }//end class

}
