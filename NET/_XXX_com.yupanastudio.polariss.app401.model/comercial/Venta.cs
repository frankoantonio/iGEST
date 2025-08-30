using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public class Venta
    {
        public long idVenta { get; set; }
        public int idNegocio { get; set; }
        public int idLocal { get; set; }
        public string idComprobante { get; set; }
        public string serie { get; set; }
        public int numero { get; set; }
        public long idCliente { get; set; }
        public string idTiDocIdent { get; set; }
        public string numDocIdent { get; set; }
        public long idBeneficiario { get; set; }
        public long idInscripcion { get; set; }
        public decimal dsctoGb { get; set; }
        public decimal cargoGb { get; set; }
        public decimal importeGb { get; set; }
        public decimal descuentoGb { get; set; }
        public decimal netoGb { get; set; }
        public decimal exoneradoGb { get; set; }
        public decimal inafectoGb { get; set; }
        public decimal gravadoGb { get; set; }
        public decimal igvGb { get; set; }
        public decimal totalGb { get; set; }
        public decimal saldoGb { get; set; }
        public DateTime feEmite { get; set; }
        public DateTime feCancela { get; set; }
        public string estado { get; set; }
        public bool credito { get; set; }
        public string idMoneda { get; set; }
        public long idNotaCred { get; set; }
        public string obs { get; set; }
        public decimal tipoCambio { get; set; }
        public string monedaSimX { get; set; }
        public string monedaNomX { get; set; }
        public string valIgvX { get; set; }
        public string nomCompX { get; set; }
        public string impLetraX { get; set; }


    }//end class
}
