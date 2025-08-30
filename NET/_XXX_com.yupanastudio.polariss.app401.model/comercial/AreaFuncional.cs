using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{

    public class AreaFuncional
    {
        public int idAreaFunc { get; set; }
        public int idNegocioLocal { get; set; }
        public string idTiArFun { get; set; }
        public string nomAreaFunc { get; set; }
        public bool activo { get; set; }
        public int idSupervisor { get; set; }
        public bool activoUsu { get; set; }
    }


    public class PuntoVenta : AreaFuncional
    {
        public int idPtoVta { get; set; }
        public string idAlmacenes { get; set; }
        public int idPrecioGrp { get; set; }
    }

    public class Serie : AreaFuncional
    {
        public int idSerie { get; set; }
        public string idComp { get; set; }
        public int nuComp { get; set; }
        public bool elect { get; set; }
        public string nomCompX { get; set; }
    }

    public class Caja : AreaFuncional
    {
        //lo mismo
    }

    public class Almacen : AreaFuncional
    {
        //lo mismo
    }

}
