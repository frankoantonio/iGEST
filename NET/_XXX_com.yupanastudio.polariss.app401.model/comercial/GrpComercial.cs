using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class GrpComercial
    {
        public int idGrpCom { get; set; }
        public int idNegocioLocal { get; set; }
        public string idTiGrpCom { get; set; }
        public string nomGrpCom { get; set; }
        public bool activo { get; set; }
        public int idSupervisor { get; set; }
        public string pvIdAlmacenes { get; set; }
        public int pvIdPrecioGrp { get; set; }
        public string seIdComp { get; set; }
        public int seNuComp { get; set; }
        public bool activoUsuX { get; set; }

    }//end class

}
