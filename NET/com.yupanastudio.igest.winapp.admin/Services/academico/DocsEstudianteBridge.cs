using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class DocsEstudianteBridge
    {
        public static async Task<List<DocsEstudiante>> getDocsEstByID(long idEstudiante, int idNegocio)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/acd/docs_estudiante/{idEstudiante}/{idNegocio}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<DocsEstudiante>>();
        }

        public static async Task<List<DocsEstudiante>> upsertRecibir(List<DocsEstudiante> lsDocsEst)
        {
            HttpResponseMessage response = await Vars.httpClient.PutAsJsonAsync(Vars.urlServerApp + "/acd/docs_estudiante/recibir", lsDocsEst);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<DocsEstudiante>>();
        }

        public static async Task<List<DocsEstudiante>> upsertActualizar(List<DocsEstudiante> lsDocsEst)
        {
            HttpResponseMessage response = await Vars.httpClient.PutAsJsonAsync(Vars.urlServerApp + "/acd/docs_estudiante/actualizar", lsDocsEst);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<DocsEstudiante>>();
        }

        public static async Task<List<DocsEstudiante>> upsertDevolver(List<DocsEstudiante> lsDocsEst)
        {
            HttpResponseMessage response = await Vars.httpClient.PutAsJsonAsync(Vars.urlServerApp + "/acd/docs_estudiante/devolver", lsDocsEst);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<DocsEstudiante>>();
        }

    }//end class

}
