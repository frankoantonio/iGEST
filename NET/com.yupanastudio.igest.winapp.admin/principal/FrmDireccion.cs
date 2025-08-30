using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Linq;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmDireccion : FrmMaster
    {
        private Direccion obDirOriginal = null;
        public Direccion obDirNew;

        public FrmDireccion(Direccion xObDir, CRUD xOperCRUD, bool xReadOnly) : base(xOperCRUD, xReadOnly)
        {
            InitializeComponent();

            if (xObDir != null)
            {
                this.obDirOriginal = new Direccion(xObDir);
                this.obDirNew = new Direccion(xObDir);
            }
            else
                this.obDirNew = new Direccion() { idDireccion = -1, latitud = "", longitud = "", idDistrito = "" };
        }

        private void FrmDireccion_Load(object sender, EventArgs e)
        {
            cmbTipVia.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_VIA").OrderBy(y => y.orden).ThenBy(z => z.nomTipo).ToList();
            cmbTipZona.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_ZONA").OrderBy(y => y.orden).ThenBy(z => z.nomTipo).ToList();
            cmbPais.DataSource = Vars.lsPaises.Where(x => x.idPais == 9589).ToList();

            if (xOperCRUD == CRUD.EDIT)
            {
                cmbTipVia.SelectedValue = obDirNew.idTipoVia;
                txtNomVia.Text = obDirNew.nomVia;
                cmbTipZona.SelectedValue = obDirNew.idTipoZona;
                txtNomZona.Text = obDirNew.nomZona;
                txtRef.Text = obDirNew.referencia;
                cmbPais.SelectedValue = obDirNew.idPais;
                cmbDpto.SelectedValue = obDirNew.idDistrito.Substring(0, 2);
                cmbProv.SelectedValue = obDirNew.idDistrito.Substring(0, 4);
                cmbDist.SelectedValue = obDirNew.idDistrito;
            }
            else if (xOperCRUD == CRUD.NEW)
            {
                cmbDpto.SelectedItem = null;
                cmbTipVia.SelectedItem = null;
                cmbTipZona.SelectedValue = 132; // 132 = sin indicar
                cmbDist.SelectedItem = null;
            }
            showLatLgt();
        }

        private void cmbTipVia_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtTipVia.Text = (cmbTipVia.SelectedItem != null ? ((Tipo)cmbTipVia.SelectedItem).nomCorto : txtTipVia.Text = "");
        }

        private void cmbTipZona_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTipZona.SelectedItem != null)
            {
                Tipo obT = (Tipo)cmbTipZona.SelectedItem;
                txtTipZona.Text = obT.nomCorto;
                txtNomZona.Enabled = !(obT.idTipo == 132);
                if (obT.idTipo == 132) txtNomZona.Text = "";
            }
            else
            {
                txtNomZona.Text = "";
                txtNomZona.Enabled = false;
            }
        }

        private void cmbPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbPais.SelectedItem != null)
                cmbDpto.DataSource = Vars.lsDepartamentos.Where(x => x.idPais == ((Pais)cmbPais.SelectedItem).idPais).OrderBy(y => y.nomDepartamento).ToList();
        }

        private void cmbDep_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbDpto.SelectedItem != null)
                cmbProv.DataSource = Vars.lsProvincias.Where(x => x.idDepartamento == ((Departamento)cmbDpto.SelectedItem).idDepartamento).OrderBy(y => y.idProvincia).ToList();
            else
            {
                cmbProv.DataSource = new List<Provincia>();
                cmbDist.DataSource = new List<Distrito>();
            }
        }

        private void cmbProv_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbProv.SelectedItem != null)
                cmbDist.DataSource = Vars.lsDistritos.Where(x => x.idProvincia == ((Provincia)cmbProv.SelectedItem).idProvincia).OrderBy(y => y.idDistrito).ToList();
        }

        private void cmbDist_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbDist.SelectedItem != null)
            {
                Distrito obDist = (Distrito)cmbDist.SelectedItem;
                if (xOperCRUD == CRUD.EDIT && obDirOriginal.idDistrito == obDist.idDistrito)
                {
                    obDirNew.latitud = obDirOriginal.latitud;
                    obDirNew.longitud = obDirOriginal.longitud;
                }
                else
                {
                    obDirNew.latitud = "";
                    obDirNew.longitud = "";
                }
            }
            showLatLgt();
            btnMap.Enabled = !(cmbDist.SelectedItem == null || cmbDist.SelectedValue.ToString() == "950101");
        }

        private void btnMap_Click(object sender, EventArgs e)
        {
            if (cmbDist.SelectedItem == null)
            {
                Utils.msg("Primero selecciona \"Departamento, Provincia, Distrito\".", Estado.WARNING);
                cmbDpto.Focus();
                return;
            }

            this.Enabled = false;

            Distrito obDist1 = (Distrito)cmbDist.SelectedItem;
            FrmDireccionMap frm;

            if (obDirNew.latitud != "" || obDirNew.longitud != "")
                frm = new FrmDireccionMap(obDirNew.latitud, obDirNew.longitud, 17, this.xLectura);
            else if (obDist1.latitud != "" || obDist1.longitud != "")
                frm = new FrmDireccionMap(obDist1.latitud, obDist1.longitud, 13, this.xLectura);
            else
            {
                Distrito obDist2 = Vars.lsDistritos.Where(x => x.idDistrito == obDist1.idDistrito.Substring(0, 2) + "0101").FirstOrDefault();
                frm = new FrmDireccionMap(obDist2.latitud, obDist2.longitud, 10, this.xLectura);
            }

            frm.ShowDialog();

            if (frm.operOK)
            {
                obDirNew.latitud = frm.xLat;
                obDirNew.longitud = frm.xLgt;
                showLatLgt();
            }

            this.Enabled = true;
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            guardar();
        }

        //
        // Métodos
        //
        private bool validarCtrls()
        {
            if (cmbTipVia.SelectedItem == null)
            {
                Utils.msg("Selecciona el tipo de vía.", Estado.WARNING);
                cmbTipVia.Focus();
                return false;
            }
            txtNomVia.Text = Utils.allTrim_InjectCode(txtNomVia.Text);
            if (txtNomVia.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Se requiere al menos " + Vars.dicVarGB["MinCarInput"] + " caracteres.", Estado.WARNING);
                txtNomVia.Focus();
                return false;
            }
            txtNomZona.Text = Utils.allTrim_InjectCode(txtNomZona.Text);
            if (cmbTipZona.SelectedItem != null && (int)cmbTipZona.SelectedValue != 132 && txtNomZona.Text.Trim().Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Se requiere al menos " + Vars.dicVarGB["MinCarInput"] + " caracteres.", Estado.WARNING);
                txtNomZona.Focus();
                return false;
            }
            if (cmbDist.SelectedItem == null)
            {
                Utils.msg("Selecciona \"Departamento, Provincia, Distrito\".", Estado.WARNING);
                cmbDpto.Focus();
                return false;
            }
            if (txtMap.Text.Trim() == "")
            {
                obDirNew.latitud = "";
                obDirNew.longitud = "";
            }
            return true;
        }

        private async void guardar()
        {
            if (!validarCtrls())
                return;

            obDirNew.idTipoVia = (int)cmbTipVia.SelectedValue;
            obDirNew.nomTipoVia = txtTipVia.Text;
            obDirNew.nomVia = txtNomVia.Text;
            obDirNew.idTipoZona = (int)cmbTipZona.SelectedValue;
            obDirNew.nomTipoZona = txtTipZona.Text;
            obDirNew.nomZona = txtNomZona.Text;
            obDirNew.referencia = Utils.allTrim_InjectCode(txtRef.Text);
            obDirNew.idPais = (int)cmbPais.SelectedValue;
            obDirNew.idDistrito = cmbDist.SelectedValue.ToString();
            obDirNew.idEmpresa = Vars.obEmpresa.idEmpresa;

            try
            {
                btnOk.Enabled = false;
                obDirNew = await DireccionBridge.upsert(obDirNew);
                operOK = true;
                Utils.msg("Los datos se guardaron correctamente.", Estado.SUCCESS);
                this.Dispose();
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
            }
            btnOk.Enabled = true;
        }

        private void showLatLgt()
        {
            if (obDirNew.latitud != "" && obDirNew.longitud != "")
                txtMap.Text = obDirNew.latitud + ";" + obDirNew.longitud;
            else
                txtMap.Text = "";
        }

    }//end class

}
