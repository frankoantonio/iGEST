using System.Drawing;

namespace com.yupanastudio.polariss.app
{
    public class Empresa
    {
        public int idEmpresa { get; set; }
        public string grupoEmp { get; set; }
        public string nomEmpresa { get; set; }
        public string nomComercial { get; set; }
        public string direccion { get; set; }
        public string telefonos { get; set; }
        public string ruc { get; set; }
        public string sunatUsu { get; set; }
        public string sunatPwd { get; set; }
        public bool premium { get; set; }
        public bool activo { get; set; }
        public bool soloLectura { get; set; }
        public int idTipoEmpresa { get; set; }
        public string dominio { get; set; }
        public string dominioMail { get; set; }

        //public List<EmpresaSistema> lsEmpSisX { get; set; }
        //public List<Sede> lsSedeX { get; set; }
        //public List<Negocio> lsNegocioX { get; set; }

        public Image imgLogoX { get; set; }
        public Image imgBannerX { get; set; }
        public Image imgFondoX { get; set; }

    }//end class

}
