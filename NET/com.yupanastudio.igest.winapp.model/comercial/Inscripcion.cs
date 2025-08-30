using System;

namespace com.yupanastudio.igest.winapp
{
    public class Inscripcion
    {
        public long idInscripcion { get; set; }
        public int idNegocio { get; set; }
        public long idEstudiante { get; set; }
        public long idFamiliar { get; set; }
        public long idCampania { get; set; }
        public int idProdProy { get; set; }
        public int idGrado { get; set; }
        public int idCarrProf { get; set; }
        public int idAreaProf { get; set; }
        public DateTime feInsc { get; set; }
        public long idInstEst { get; set; }
        public long idVendedor { get; set; }
        public string vendedor { get; set; }
        public long idSeccion { get; set; }
        public int idTipoPublicidad { get; set; }
        public int idTipoEstado { get; set; }
        public int idTipoDscto { get; set; }
        public int idTipoIngreso { get; set; }
        public int idTipoEvalIng { get; set; }
        public int idTipoEvalFin { get; set; }
        public long idInforme { get; set; }
        public string codMatricula { get; set; }
        public long idBeneficio { get; set; }
        public string obs { get; set; }
        public DateTime feMatr { get; set; }
        public bool cerrado { get; set; }
        public int idTipoInscripcion { get; set; }
        public string nomSeccionX { get; set; }
        public string nomGradoX { get; set; }
        public string nomNivEduX { get; set; }
        public int idTipoModEstX { get; set; }

    }//end class

}
