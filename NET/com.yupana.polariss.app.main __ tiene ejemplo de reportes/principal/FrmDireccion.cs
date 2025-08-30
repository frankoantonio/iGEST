using com.yupanastudio.polariss.app.principal;
using com.yupanastudio.polariss.app.template;
using com.yupanastudio.polariss.model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace com.yupana.polariss.app.main.principal
{
    public partial class FrmDireccion : FrmMaster
    {
        public Direccion obDir;

        public FrmDireccion(Direccion obDir)
        {
            InitializeComponent();
            this.obDir = obDir;
            lblTitle.Text = (obDir == null ? "Registrar Dirección" : "Modificar dirección");

            //cmbPais.DataSource = new PaisBO().lstPaisAll();
            //cmbVia.DataSource = Vars.lsTipos.Where(x => x.grupo == "107TIPOVIA").ToList();
            //cmbZona.DataSource = Vars.lsTipos.Where(x => x.grupo == "108TIPZONA").ToList();
        }

        private void FrmDireccion_Load(object sender, EventArgs e)
        {
            cmbDpto.SelectedIndex = -1;

            cmbProv.DataSource = new List<Provincia>();
            cmbDist.DataSource = new List<Distrito>();

            cmbVia.SelectedIndex = -1;
            cmbZona.SelectedIndex = -1;

            if (obDir != null)
                mostrarDireccion();
        }

        private void CmbPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (cmbPais.SelectedItem != null)
                //cmbDpto.DataSource = new DepartamentoBO().lstDptosByIdPais(((Pais)cmbPais.SelectedItem).idPais);
        }

        private void CmbDpto_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (cmbDpto.SelectedItem != null)
                //cmbProv.DataSource = new ProvinciaBO().lstProvsByIdDpto(((Departamento)cmbDpto.SelectedItem).idDpto);
        }

        private void CmbProv_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (cmbProv.SelectedItem != null)
                //cmbDist.DataSource = new DistritoBO().lstDistByIdProv(((Provincia)cmbProv.SelectedItem).idProv);
        }

        private void BtnOk_Click(object sender, EventArgs e)
        {
            establecerDireccion();
        }

        //
        // metodos
        //
        private bool validarCtrls()
        {
            if (cmbDist.SelectedItem == null)
            {
                cmbPais.Focus();
                Utils.msg("Seleccione ubicación geográfica correcta.", Estado.WARNING);
                return false;
            }
            if (cmbVia.SelectedItem == null)
            {
                cmbVia.Focus();
                Utils.msg("Seleccione el tipo de vía.", Estado.WARNING);
                return false;
            }
            if (txtVia.Text.Trim().Length < Vars.minCar)
            {
                txtVia.Focus(); txtVia.SelectAll();
                Utils.msg("Escriba dirección correcta.", Estado.WARNING);
                return false;
            }
            if (cmbZona.SelectedItem == null)
            {
                cmbZona.Focus();
                Utils.msg("Seleccione el tipo de zona.", Estado.WARNING);
                return false;
            }
            return true;
        }

        private void mostrarDireccion()
        {
            cmbPais.SelectedValue = obDir.idPais;
            cmbDpto.SelectedValue = obDir.idDist.Substring(0, 2);
            cmbProv.SelectedValue = obDir.idDist.Substring(0, 4);
            cmbDist.SelectedValue = obDir.idDist;
            cmbVia.SelectedValue = obDir.idTiVia;
            txtVia.Text = obDir.nomVia;
            cmbZona.SelectedValue = obDir.idTiZona;
            txtZona.Text = obDir.nomZona;
            txtRef.Text = obDir.referencia;
        }

        private void establecerDireccion()
        {
            if (!validarCtrls())
                return;

            if (obDir == null)
                obDir = new Direccion() { idDireccion = -1 };

            obDir.idTiVia = (string)cmbVia.SelectedValue;
            obDir.nomTiVia = ((Tipo)cmbVia.SelectedItem).nomTipo;
            obDir.nomVia = txtVia.Text;
            obDir.idTiZona = (string)cmbZona.SelectedValue;
            obDir.nomTiZona = ((Tipo)cmbZona.SelectedItem).nomTipo;
            obDir.nomZona = txtZona.Text;
            obDir.referencia = txtRef.Text;
            obDir.latitud = "";
            obDir.longitud = "";
            obDir.idDist = (string)cmbDist.SelectedValue;
            obDir.idPais = (int)cmbPais.SelectedValue;
            obDir.idEmpresa = Vars.obEmpresa.idEmpresa;
            obDir.validado = false;

            obDir.fullDirX = obDir.nomTiVia + " " + obDir.nomVia + (obDir.nomZona == "" ? "" : ", " + obDir.nomTiZona + " " + obDir.nomZona + ". ") + obDir.referencia;

            this.Dispose();
        }

    }//end class

}
