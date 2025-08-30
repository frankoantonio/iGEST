using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class BeneficioBridge
    {        
        public static async Task<List<Beneficio>> getBeneficioByNeg(int idNegocio)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/com/beneficio/{idNegocio}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Beneficio>>();
        }

        //public static async Task<long> upsert(Beneficio obBeneficio)
        //{
        //    HttpResponseMessage response = await Vars.httpClient.PutAsJsonAsync(Vars.urlServerApp + "/com/Beneficio", obBeneficio);

        //    if (response.StatusCode == HttpStatusCode.InternalServerError)
        //        throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
        //    else
        //        response.EnsureSuccessStatusCode();

        //    return await response.Content.ReadAsAsync<long>();
        //}

    }//end class

}
