namespace com.yupanastudio.igest.winapp
{
    public class Beneficio
    {
        public long idBeneficio { get; set; }
        public int idNegocio { get; set; }
        public int idTipoBeneficio { get; set; }
        public string nomBeneficio { get; set; }
        public bool activo { get; set; }
        public bool porcentual { get; set; }
        public int orden { get; set; }
        public bool modificable { get; set; }
        public bool total { get; set; }

    }//end class

}
