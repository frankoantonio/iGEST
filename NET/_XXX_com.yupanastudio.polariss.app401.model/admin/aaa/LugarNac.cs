using System;
using System.Linq;

namespace com.yupanastudio.polariss.app
{
    public class LugarNac
    {
        public long idPersona { get; set; }
        public int idPais { get; set; }
        public string idDist { get; set; }
        public string nomLugar { get; set; }
        public DateTime feNac { get; set; }
        public String edadX { get; set; }

        public string fullLugNacX
        {
            get
            {
                return
                feNac.ToString("dddd dd/MMM/yyyy") + (nomLugar != "" ? " [" + nomLugar + "]; " : "; ") + Vars.lsDists.Where(x => x.idDistrito == idDist).FirstOrDefault().fullNameX_DisProDep + "; " + edadX;
            }
        }

    }//end class

}
