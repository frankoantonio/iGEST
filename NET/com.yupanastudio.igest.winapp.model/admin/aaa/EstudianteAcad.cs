namespace com.yupanastudio.igest.winapp
{
    public class EstudianteAcad : Persona
    {
        public long idEstAcad { get; set; }
        public string codEstudiante { get; set; }
        public bool activo { get; set; }
        public string correoAcad { get; set; }
        public double[] deudaX { get; set; }
        public LugarNac obLugNacX { get; set; }

    }//end class

}
