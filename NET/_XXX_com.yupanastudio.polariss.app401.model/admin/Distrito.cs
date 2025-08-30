using System.Linq;

namespace com.yupanastudio.polariss.app
{
    public class Distrito
    {
        public string idDistrito { get; set; }
        public string idProvincia { get; set; }
        public string nomDistrito { get; set; }
        public string latitud { get; set; }
        public string longitud { get; set; }

        public string fullNameX_DisProDep
        {
            get
            {
                return
                    Vars.lsDists.FirstOrDefault(x => x.idDistrito == idDistrito).nomDistrito + ", " +
                    Vars.lsProvs.FirstOrDefault(x => x.idProvincia == idDistrito.Substring(0, 4)).nomProvincia + ", " +
                    Vars.lsDptos.FirstOrDefault(x => x.idDepartamento == idDistrito.Substring(0, 2)).nomDepartamento
                    ;
            }
        }

        public string fullNameX_DepProDis
        {
            get
            {
                return
                    Vars.lsDptos.Where(x => x.idDepartamento == idDistrito.Substring(0, 2)).FirstOrDefault().nomDepartamento + ", " +
                    Vars.lsProvs.Where(x => x.idProvincia == idDistrito.Substring(0, 4)).FirstOrDefault().nomProvincia + ", " +
                    Vars.lsDists.Where(x => x.idDistrito == idDistrito).FirstOrDefault().nomDistrito
                    ;
            }
        }

    }//end class

}
