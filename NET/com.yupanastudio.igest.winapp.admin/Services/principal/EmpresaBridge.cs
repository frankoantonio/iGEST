using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class EmpresaBridge
    {
        public static async Task<List<Empresa>> getEmpresaAllWithChild()
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + "/gen/empresa/all_with_child");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Empresa>>();
        }

        public static async Task<List<Empresa>> getEmpresaAllWithoutChild()
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + "/gen/empresa/all_without_child");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Empresa>>();
        }        

    }//end class

}
