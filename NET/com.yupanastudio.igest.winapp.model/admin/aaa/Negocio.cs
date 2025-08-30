using System.Collections.Generic;
using System.Drawing;

namespace com.yupanastudio.igest.winapp
{
    public class Negocio
    {
        public int idNegocio { get; set; }
        public int idTipoNegocio { get; set; }
        public string nomNegocio { get; set; }
        public bool activo { get; set; }
        public int idEmpresa { get; set; }
        public string dominio { get; set; }
        public string dominioCorreo { get; set; }
        public string lema { get; set; }
        public long idInstEst { get; set; }
        public Image imgLogoX { get; set; }
        public Image imgBannerX { get; set; }
        public Image imgFondoX { get; set; }
        public List<Sistema> lsSistemaX { get; set; }
        public List<Sede> lsSedeX { get; set; }

    }// end class

}
