
using System;

namespace com.yupanastudio.polariss.app
{
    public class Informe
    {
        public long idInforme { get; set; }
        public int idNegocio { get; set; }
        public long idPersona { get; set; }
        public long idFamiliar { get; set; }
        public long idCampania { get; set; }
        public int idProdProy { get; set; }
        public int idGrado { get; set; }
        public int idCarrProf { get; set; }
        public long idVendedor { get; set; }
        public DateTime feIni { get; set; }
        public DateTime feFin { get; set; }
        public int idTipoEstado { get; set; }
        public long idInstEst { get; set; }
        public bool cerrado { get; set; }
        public string nomGrado { get; set; }
        public string vendedor { get; set; }
        public int idTipoGdoInteres { get; set; }
        public string nomCampaniaX { get; set; }
        public string nomSedeX { get; set; }
        public int idTipoModEstX { get; set; }
        public string nomPersonaX { get; set; }
        public Atencion obAtencionX { get; set; }
        public Descalifica obDescalificaX { get; set; }

    }//end class

}
