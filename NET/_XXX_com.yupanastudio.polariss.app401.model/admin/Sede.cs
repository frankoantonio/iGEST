namespace com.yupanastudio.polariss.app
{
    public class Sede
    {
        public int idSede { get; set; }
        public int idPadre { get; set; }
        public int idEmpresa { get; set; }
        public int nivel { get; set; }
        public int idTipoSede { get; set; }
        public string nomSede { get; set; }
        public string dirSede { get; set; }
        public string idDistrito { get; set; }
        public bool activo { get; set; }
        public bool sunatOficial { get; set; }
        public string sunatCod { get; set; }
        public string facEleRuta { get; set; }
        public string facEleToken { get; set; }
        public string latitud { get; set; }
        public string longitud { get; set; }
        public int orden { get; set; }

    }//end class

}
