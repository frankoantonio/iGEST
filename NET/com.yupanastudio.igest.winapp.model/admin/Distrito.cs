using System.Linq;

namespace com.yupanastudio.igest.winapp
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
                    Vars.lsDistritos.FirstOrDefault(x => x.idDistrito == idDistrito).nomDistrito + ", " +
                    Vars.lsProvincias.FirstOrDefault(x => x.idProvincia == idDistrito.Substring(0, 4)).nomProvincia + ", " +
                    Vars.lsDepartamentos.FirstOrDefault(x => x.idDepartamento == idDistrito.Substring(0, 2)).nomDepartamento
                    ;
            }
        }

        public string fullNameX_DepProDis
        {
            get
            {
                return
                    Vars.lsDepartamentos.Where(x => x.idDepartamento == idDistrito.Substring(0, 2)).FirstOrDefault().nomDepartamento + ", " +
                    Vars.lsProvincias.Where(x => x.idProvincia == idDistrito.Substring(0, 4)).FirstOrDefault().nomProvincia + ", " +
                    Vars.lsDistritos.Where(x => x.idDistrito == idDistrito).FirstOrDefault().nomDistrito
                    ;
            }
        }

    }//end class

}
