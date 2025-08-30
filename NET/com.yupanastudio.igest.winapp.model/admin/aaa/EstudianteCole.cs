namespace com.yupanastudio.igest.winapp
{
    public class EstudianteCole : Persona
    {
        public long idEstCol { get; set; }
        public string codEstudiante { get; set; }
        public int idTipoLengua1 { get; set; }
        public int idTipoLengua2 { get; set; }
        public int idTipoReligion { get; set; }
        public int hnosLugar { get; set; }
        public int hnosTotal { get; set; }
        public int idTipoViv { get; set; }
        public int idTipoVivMat { get; set; }
        public int idTipoVivCon { get; set; }
        public int idTipoFamIng { get; set; }
        public int idTipoFamSeg { get; set; }
        public int idTipoFamVeh { get; set; }
        public bool activo { get; set; }
        public string correoCole { get; set; }
        public double[] deudaX { get; set; }
        public LugarNac obLugNacX { get; set; }

    }//end class

}
