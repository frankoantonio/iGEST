using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class EmpresaGrupoBridge
    {
        public static async Task<List<EmpresaGrupo>> getEmpresaAll()
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + "/gen/empresa_grupo");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsAsync<List<EmpresaGrupo>>();
        }

        public static async Task<EmpresaGrupo> insert(EmpresaGrupo obEmp)
        {
            HttpResponseMessage response = await Vars.client.PostAsJsonAsync(Vars.urlServerApp + "/gen/empresa_grupo", obEmp);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsAsync<EmpresaGrupo>();
        }

        public static async Task<EmpresaGrupo> update(EmpresaGrupo obEmp)
        {
            HttpResponseMessage response = await Vars.client.PutAsJsonAsync(Vars.urlServerApp + "/gen/empresa_grupo", obEmp);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsAsync<EmpresaGrupo>();
        }

    }//end class

}
