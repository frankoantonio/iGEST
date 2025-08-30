using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class AfectacionBridge
    {
        public static async Task<List<Afectacion>> getAfectacion()
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/com/afectacion/");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Afectacion>>();
        }

    }//end class

}
