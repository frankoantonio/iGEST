using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class EmpresaSistemaBridge
    {
        public static async Task<List<EmpresaSistema>> upsert(List<EmpresaSistema> ls)
        {
            HttpResponseMessage response = await Vars.client.PutAsJsonAsync(Vars.urlServerApp + "/gen/empresa_sistema", ls);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<EmpresaSistema>>();
        }

    }//end class

}
