namespace com.yupanastudio.igest.winapp
{
    public class Persona
    {
        public long idPersona { get; set; }
        public int idEmpresa { get; set; }
        public int idTipoPersona { get; set; }
        public int idTipoDocIdent { get; set; }
        public string numDocIdent { get; set; }
        public string paterno { get; set; }
        public string materno { get; set; }
        public string nombres { get; set; }
        public string numRucPerNat { get; set; }
        public string sigla { get; set; }
        public bool validado { get; set; }
        public string nomApesX { get { return (idTipoPersona.Equals(Vars.dicTipos["TI_PERSONA.NATURAL"]) ? nombres + ", " + paterno + " " + materno : nombres + (sigla == "" ? "" : " [" + sigla + "]")); } }
        public string apeNomsX { get { return (idTipoPersona.Equals(Vars.dicTipos["TI_PERSONA.NATURAL"]) ? paterno + " " + materno + ", " + nombres : nombres + (sigla == "" ? "" : " [" + sigla + "]")); } }

        /// <summary>
        /// ///////////////////////quitar todo lo que sigue
        /// </summary>
        /// 
        public int idTipoSexoX { get; set; }
        public string fijo { get; set; }
        public string movil { get; set; }
        public string correo { get; set; }
        public long idDireccionX { get; set; }
        public int idTipoEstCivX { get; set; }
        public long idGrpFam { get; set; }
        public int idTipoSitEducX { get; set; }
        public long idInstEst { get; set; }

    }//end class

}
