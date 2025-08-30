using com.yupana.polariss.app.main.principal;
using com.yupanastudio.polariss.app.principal;
using com.yupanastudio.polariss.app.template;
using com.yupanastudio.polariss.model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace com.yupana.polariss.app.main.comercial
{
    public partial class FrmSetUsuario : FrmMaster
    {
        private string idTiDocIdent;

        public FrmSetUsuario(string idTiDocIdent)
        {
            this.idTiDocIdent = idTiDocIdent;
            InitializeComponent();
            //if (Vars.lsLocalUsu == null)
            //    Vars.lsLocalUsu = new LocalBO().lstLocalByUsuNeg(Vars.obUsuario.idUsuario, Vars.obNegocio.idNegocio);
            //cmbLocal.DataSource = Vars.lsLocalUsu;
        }

        private void FrmSetUsuario_Load(object sender, EventArgs e)
        {
            cmbLocal.SelectedItem = Vars.obLocalUsu;
            cmbPtVta.SelectedItem = Vars.obPtVta;
            cmbSerie.SelectedItem = Vars.obSerie;
            cmbCaja.SelectedItem = Vars.obCaja;
        }

        private void CmbLocal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbLocal.SelectedItem != null)
            {
                Local ob = (Local)cmbLocal.SelectedItem;

                cmbPtVta.DataSource = ob.lsPtoVtaX;
                cmbCaja.DataSource = ob.lsCajaX;

                List<Serie> lsSerAux = ob.lsSerieX.Where(x => x.idComp == "01" || x.idComp == "03").ToList();
                if (this.idTiDocIdent == "104RUC")                                          //RUC
                    cmbSerie.DataSource = lsSerAux.Where(x => x.idComp == "01").ToList();
                else if (this.idTiDocIdent == "104DNI" || this.idTiDocIdent == "104SIN")    //DNI o NINGUNO
                    cmbSerie.DataSource = lsSerAux.Where(x => x.idComp == "03").ToList();
                else
                    cmbSerie.DataSource = lsSerAux;
            }
            else
            {
                cmbPtVta.DataSource = new List<PuntoVenta>();
                cmbSerie.DataSource = new List<Serie>();
                cmbCaja.DataSource = new List<Caja>();
            }
        }

        private void BtnOk_Click(object sender, EventArgs e)
        {
            if (cmbLocal.SelectedItem == null)// || cmbPtVta.SelectedItem == null || cmbCaja.SelectedItem == null || cmbSerie.SelectedItem == null)
            {
                Utils.msg("Seleccione local.", Estado.WARNING);
                cmbLocal.Focus();
                return;
            }

            Vars.obLocalUsu = (Local)cmbLocal.SelectedItem ?? null;
            Vars.obPtVta = (PuntoVenta)cmbPtVta.SelectedItem ?? null;
            Vars.obCaja = (Caja)cmbCaja.SelectedItem ?? null;
            Vars.obSerie = (Serie)cmbSerie.SelectedItem ?? null;
            this.Dispose();
        }

    }//end class

}
