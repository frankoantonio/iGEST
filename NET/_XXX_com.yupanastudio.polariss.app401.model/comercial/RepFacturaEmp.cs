using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class RepFacturaEmp
    {

    }//end class

    public class RepFacturaHead
    {

    }//end class

    public class RepFacturaDet
    {
        public long idVentaDet { get; set; }
        public long idVentaDetadd { get; set; }
        public int cantidad { get; set; }
        public string unMed { get; set; }
        public string nomArticulo { get; set; }
        public string descripción { get; set; }
        public decimal preUnit { get; set; }
        public decimal importe { get; set; }
        public decimal dscto { get; set; }
        public decimal neto { get; set; }
        public decimal igv { get; set; }
        public decimal total { get; set; }
        public int idAfectacion { get; set; }
        public string claveCol01 { get; set; }
        public string valCol01 { get; set; }
        public string claveCol02 { get; set; }
        public string valCol02 { get; set; }

    }//end class

}
