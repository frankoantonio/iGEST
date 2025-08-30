namespace com.yupanastudio.polariss.app
{
    public class Familiar
    {
        public long idFamEst { get; set; }
        public long idFamiliar { get; set; }
        public long idEstudiante { get; set; }
        public int idTipoPariente { get; set; }
        public bool fallecido { get; set; }
        public bool apoderado { get; set; }
        public bool viveConEst { get; set; }
        public string ocupacion { get; set; }
        public string centroLab { get; set; }
        public string centroLabDet { get; set; }
        public LugarNac obLugNacX { get; set; }
        public Persona obPerX { get; set; }
        public string apeNomsX { get; set; }    // vacío, excepto al usar método de 'FamiliarBridge' : getFamiliaresByEst_GrpFam(long idGrpFam, long idEst)

    }//end class

}
