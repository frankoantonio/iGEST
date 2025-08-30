using System;

namespace com.yupanastudio.igest.winapp
{
    public class Atencion
    {
        public long idAtencion { get; set; }
        public int idNegocio { get; set; }
        public long idInforme { get; set; }
        public DateTime fecha { get; set; }
        public int idTipoAtencion { get; set; }
        public int idTipoGdoInteres { get; set; }
        public string proxFecha { get; set; }
        public string proxHora { get; set; }
        public string obs { get; set; }
        public long idVendedor { get; set; }
        public string vendedor { get; set; }

    }//end class

}
