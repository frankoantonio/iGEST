namespace com.yupanastudio.polariss.app
{
    public class InstitucionEstudio
    {
        public long idInstEst { get; set; }
        public int idTipoInst { get; set; }
        public string sigla { get; set; }
        public string nombre { get; set; }
        public string ciudad { get; set; }
        public int countUsoX { get; set; }
        public string fullInstEstX
        {
            get
            {
                return nombre + (ciudad == "" ? "" : ", " + ciudad) + (sigla == "" ? "" : " [" + sigla + "]");
            }
        }

    }//end class

}
