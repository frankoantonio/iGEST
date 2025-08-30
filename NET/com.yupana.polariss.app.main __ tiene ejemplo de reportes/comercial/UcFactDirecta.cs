using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using com.yupana.polariss.app.main.principal;
using com.yupanastudio.polariss.model;

namespace com.yupana.polariss.app.main.comercial
{
    public partial class UcFactDirecta : UserControl
    {
        public UcFactDirecta()
        {
            InitializeComponent();
        }

        private void UcFactDirecta_Load(object sender, EventArgs e)
        {
            mostrarCliente();
            mostrarAreaFuncUsu(true);
        }

        private void ChbCliVar_CheckedChanged(object sender, EventArgs e)
        {
            if (chbCliVar.Checked)
                Vars.obPerCliente = Vars.obPerVarios;
            else
                Vars.obPerCliente = null;
            mostrarCliente();
        }

        private void BtnFindCli_Click(object sender, EventArgs e)
        {
            //FrmBuscarPersona frm = new FrmBuscarPersona(true, TipoBusquedaPersona.PERSONAS_VENTA);
            //DialogResult dlg = frm.ShowDialog();

            //if (frm.lsPerSel.Count > 0)
            //{
            //    Vars.obPerCliente = frm.lsPerSel[0];
            //    Vars.obPerCliente.obDirX = new DireccionBO().getDireccionByID(Vars.obPerCliente.idDireccion);
            //}

            //mostrarCliente();
        }

        private void BtnSetUsu_Click(object sender, EventArgs e)
        {
            mostrarAreaFuncUsu(false);
        }

        private void BtnAddArt_Click(object sender, EventArgs e)
        {
            if (Vars.obPtVta == null)
            {
                Utils.msg("No tiene asignado punto de venta", Estado.SUCCESS);
                return;
            }
            new FrmBuscarArticulo().ShowDialog();
        }




        //
        //
        //
        public void mostrarCliente()
        {
            if (Vars.obPerCliente != null)
            {
                lblDocIdent.Text = Vars.obPerCliente.idTiDocIdent.Substring(3, 3) + ": " + Vars.obPerCliente.docIdent;
                lblNoms.Text = Vars.obPerCliente.apeNomsX;
                if (Vars.obPerCliente.obDirX != null)
                    lblDireccion.Text = Vars.obPerCliente.obDirX.fullDirX;
                this.chbCliVar.CheckedChanged -= new System.EventHandler(this.ChbCliVar_CheckedChanged);
                chbCliVar.Checked = (Vars.obPerCliente.idPersona == 0);
                this.chbCliVar.CheckedChanged += new System.EventHandler(this.ChbCliVar_CheckedChanged);
                mostrarAreaFuncUsu(false);
            }
            else
            //limpiarCliente();
            {
                lblDocIdent.Text = "";
                lblNoms.Text = "";
                lblDireccion.Text = "";
            }
        }

        private void mostrarAreaFuncUsu(bool carga)
        {
            if (!carga)
            {
                if (Vars.obPerCliente != null && (Vars.obSerie == null
                    || Vars.obSerie.idComp == "01" && Vars.obPerCliente.idTiDocIdent == "104DNI"
                    || Vars.obSerie.idComp == "01" && Vars.obPerCliente.idTiDocIdent == "104SIN"
                    || Vars.obSerie.idComp == "03" && Vars.obPerCliente.idTiDocIdent == "104RUC"))
                {
                    new FrmSetUsuario(Vars.obPerCliente.idTiDocIdent).ShowDialog();
                }

                if (Vars.obPerCliente == null)
                {
                    new FrmSetUsuario("").ShowDialog();
                }
            }


            lblLocal.Text = (Vars.obLocalUsu != null ? Vars.obLocalUsu.nomLocal : "");
            lblPtVta.Text = (Vars.obPtVta != null ? Vars.obPtVta.nomAreaFunc : "");
            lblCaja.Text = (Vars.obCaja != null ? Vars.obCaja.nomAreaFunc : "");


            if (Vars.obSerie != null)
            {
                lblSerie.Text = (Vars.obSerie != null ? Vars.obSerie.nomAreaFunc : "");
                lblTiComp.Text = Vars.obSerie.nomCompX + (Vars.obSerie.elect ? " ELECTRÓNICA" : "");
                string auxNumSer = "00000000" + Vars.obSerie.nuComp;
                lblSerNum.Text = Vars.obSerie.nomAreaFunc + "-" + auxNumSer.Substring(auxNumSer.Length - 7, 7);
                lblFeEmite.Text = Vars.obUsuario.feOperacion.ToString("dd/MMMM/yyyy").ToUpper();
                lblFeVenc.Text = lblFeEmite.Text;
            }
            else
            {
                lblSerie.Text = "";
                lblSerNum.Text = "";
                lblTiComp.Text = "";
                lblFeEmite.Text = "";
                lblFeVenc.Text = "";
            }
        }


        private void KryptonButton3_Click(object sender, EventArgs e)
        {
            //List<RepFacturaDet> ob = new RepFacturaDetBO().lstRepFacturaDetByIdVta(1);
            //new FrmReporte().ShowDialog();
        }

    }//end class

}
