using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Windows.Forms.Design;

namespace com.yupanastudio.igest.winapp
{
    public class EmpresaService
    {
        public static async Task<Empresa> getEmpresa()
        {
            return await Service.GetAsync<Empresa>("https://localhost/admin/perfilAdmin/empresa/1004");
            //List<Empresa> empresas = await Service.GetAsync<List<Empresa>>("https://localhost/gen/empresa/all_with_child");
        }


        /*
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
        */

    }//end class

}
