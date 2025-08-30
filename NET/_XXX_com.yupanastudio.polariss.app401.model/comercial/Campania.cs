
using System;

namespace com.yupanastudio.polariss.app
{
    public class Campania
    {
        public long idCampania { get; set; }
        public int idNegocio { get; set; }
        public int idSede { get; set; }
        public int anio { get; set; }
        public int frecuencia { get; set; }
        public int idProdProy { get; set; }
        public DateTime feIni { get; set; }
        public DateTime feFin { get; set; }
        public string nomCampania { get; set; }
        public bool activo { get; set; }
        public int idTipoModEst { get; set; }
        public string codSede { get; set; }
        public int idTipoTurno { get; set; }
        public int idTipoInscripcion { get; set; }
        public bool matrSinPago { get; set; }
        public DateTime feIniClas { get; set; }
        public DateTime feFinClas { get; set; }
        public int idTipoPeriodo { get; set; }
        public bool redefinir { get; set; }
        public int ordenX { get; set; }

    }//end class

}
