using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class CarreraProfBridge
    {
        public static async Task<List<CarreraProf>> getCarreraProfAll()
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/acd/carrera_prof");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<CarreraProf>>();
        }

        public static async Task<bool> upsert(CarreraProf obCarreraProf)
        {
            HttpResponseMessage response = await Vars.httpClient.PostAsJsonAsync(Vars.urlServerApp + "/acd/CarreraProf", obCarreraProf);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<bool>();
        }

    }//end class

}
