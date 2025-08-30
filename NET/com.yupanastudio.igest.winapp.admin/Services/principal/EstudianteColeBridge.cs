using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class EstudianteColeBridge
    {
        public static async Task<EstudianteCole> getEstudianteColeByID(long idEstCole)
        {
            HttpResponseMessage response = await Vars.httpClient.GetAsync(Vars.urlServerApp + $"/gen/estudiante_cole/{idEstCole}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<EstudianteCole>();
        }

        public static async Task<EstudianteCole> upsert(EstudianteCole obEstCol)
        {
            HttpResponseMessage response = await Vars.httpClient.PutAsJsonAsync(Vars.urlServerApp + "/gen/estudiante_cole", obEstCol);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<EstudianteCole>();
        }

    }//end class

}
