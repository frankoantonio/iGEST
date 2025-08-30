using System.Collections.Generic;
using System.Drawing;

namespace com.yupanastudio.igest.winapp
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
        public bool activo { get; set; }
        public int idTipoEmpresa { get; set; }
        public string dominio { get; set; }
        public string dominioMail { get; set; }
        public List<Sede> lsSedes { get; set; }
        public List<EmpresaSistema> lsEmpresaSistemas { get; set; }

        //public bool premium { get; set; }

        public bool soloLectura { get; set; } // QUEE OBTENGA EL VALOR DE lsEmpresasSISTEMAS


        public Image imgLogoX { get; set; }
        public Image imgBanner1X { get; set; }
        public Image imgBanner2X { get; set; }
        public Image imgFondoX { get; set; }
        //public override string ToString()
        //{
        //    return $"ID: {idEmpresa}, Grupo: {grupoEmp}, Nombre: {nomEmpresa}, Comercial: {nomComercial}, Dirección: {direccion}, Teléfonos: {telefonos}, RUC: {ruc}, Premium: {premium}, Activo: {activo}, Solo Lectura: {soloLectura}, Tipo Empresa: {idTipoEmpresa}, Dominio: {dominio}, Dominio Mail: {dominioMail}";
        //}



    }//end class

}
