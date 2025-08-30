namespace com.yupanastudio.igest.winapp
{
    public class GrupoFamiliar
    {
        public long idGrpFam { get; set; }
        public string nomGrpFam { get; set; }
        public string procedencia { get; set; }
        public string codigo { get; set; }
        public int idEmpresa { get; set; }
        public bool cerrado { get; set; }
        public string fullGrpFamX
        {
            get
            {
                return nomGrpFam + (procedencia == "" ? "" : " [" + procedencia + " - " + codigo + "]");
            }
        }

    }//end class

}
