using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class PersonaBridge
    {
        // NOI ESTA EN EL API REST, REVISAR
        public static async Task<Persona> getPersonaByID(long idPersona)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/adm/persona/{idPersona}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<Persona>();
        }

        public static async Task<List<Persona>> getPersonaByDocIdent(int idEmpresa, string numDoc, int idTipoPersona)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/admin/persona/by_doc_ident/{idEmpresa}/{numDoc}/{idTipoPersona}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Persona>>();
        }

        public static async Task<List<Persona>> getPersonaByApeNomRzSoc(int idEmpresa, string nomApeRzSoc, int idTipoPersona)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/admin/persona/by_nom_ape_rz_soc/{idEmpresa}/{nomApeRzSoc}/{idTipoPersona}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Persona>>();
        }


        //  REVISAR REVISAR REVISAR REVISAR
        public static async Task<List<Persona>> getPersonaFamsAll(long idGrpFam, long idPersona)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/gen/persona/fams_all/{idGrpFam}/{idPersona}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Persona>>();
        }


        //  REVISAR REVISAR REVISAR REVISAR
        public static async Task<List<Persona>> getPersonaByGrpFam(long idGrpFam)
        {
            HttpResponseMessage response = await Vars.client.GetAsync(Vars.urlServerApp + $"/gen/persona/by_grp_fam/{idGrpFam}");

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<List<Persona>>();
        }


        public static async Task<Persona> upsert(Persona obPersona)
        {
            HttpResponseMessage response = await Vars.client.PutAsJsonAsync(Vars.urlServerApp + "/adm/persona", obPersona);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
                throw new System.Exception(response.Headers.GetValues("MyMsgERROR").FirstOrDefault());
            else
                response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsAsync<Persona>();
        }

    }//end class

}
