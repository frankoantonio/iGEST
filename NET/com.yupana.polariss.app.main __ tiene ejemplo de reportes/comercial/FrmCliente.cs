using com.yupana.polariss.app.main.principal;
using com.yupanastudio.polariss.app.principal;
using com.yupanastudio.polariss.app.template;
using com.yupanastudio.polariss.model;
using System;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace com.yupana.polariss.app.main.comercial
{
    public partial class FrmCliente : FrmMaster
    {
        public Persona obCli;

        public FrmCliente(Persona obCliente)
        {
            InitializeComponent();
            this.obCli = obCliente;
            lblTitle.Text = (obCliente == null ? "Registrar nuevo cliente" : "Modificar datos del cliente");

            cmbTiDocIdent.DataSource = Vars.lsTipos.Where(x => x.grupo == "104TIDOCID").ToList();
            cmbTiGenero.DataSource = Vars.lsTipos.Where(x => x.grupo == "102TGENERO").ToList();
            cmbTiPersona.DataSource = Vars.lsTipos.Where(x => x.grupo == "101PERSONA").ToList();
        }

        private void FrmCliente_Load(object sender, EventArgs e)
        {
            //if (obCli != null)
            //{
            //    obCli.obDirX = new DireccionBO().getDireccionByID(obCli.idDireccion);
            //    mostrarPersona();
            //}
            //else
            //{
            //    cmbTiPersona.SelectedItem = null;
            //    cmbTiDocIdent.SelectedItem = null;
            //    cmbTiGenero.SelectedItem = null;
            //}
        }

        private void CmbTiPersona_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTiPersona.SelectedItem != null)
            {
                if ((string)cmbTiPersona.SelectedValue == "101EMP")
                {
                    cmbTiGenero.SelectedValue = "102SIN";
                    cmbTiGenero.Enabled = false;

                    cmbTiDocIdent.SelectedValue = "104RUC";

                    txtNumDoc.MaxLength = 11;

                    txtPaterno.Text = "";
                    txtPaterno.Visible = false;
                    lblPaterno.Visible = false;

                    txtMaterno.Text = "";
                    txtMaterno.Visible = false;
                    lblMaterno.Visible = false;

                    lblNomRazSoc.Text = "Razón Social";

                    txtRUC.Text = "";
                    txtRUC.Visible = false;
                    lblRUC.Visible = false;
                }
                else
                {
                    cmbTiGenero.SelectedIndex = -1;
                    cmbTiGenero.Enabled = true;

                    cmbTiDocIdent.SelectedValue = "104DNI";

                    txtNumDoc.MaxLength = 8;

                    txtPaterno.Text = "";
                    txtPaterno.Visible = true;
                    lblPaterno.Visible = true;

                    txtMaterno.Text = "";
                    txtMaterno.Visible = true;
                    lblMaterno.Visible = true;

                    lblNomRazSoc.Text = "Nombres";

                    txtRUC.Text = "";
                    txtRUC.Visible = true;
                    lblRUC.Visible = true;
                }
            }
        }

        private void BtnDireccion_Click(object sender, EventArgs e)
        {
            //if (obCli == null)
            //    obCli = new Persona() { idPersona = -1 };
            //FrmDireccion frm = new FrmDireccion(obCli.obDirX);
            //DialogResult dlg = frm.ShowDialog();
            //obCli.obDirX = frm.obDir;
            //mostrarDireccion();
        }

        private void BtnOk_Click(object sender, EventArgs e)
        {
            guardarPersona();
        }

        //
        // metodos
        //
        private bool validarCtrls()
        {
            if (cmbTiPersona.SelectedItem == null)
            {
                cmbTiPersona.Focus();
                Utils.msg("Seleccione el tipo de persona.", Estado.WARNING);
                return false;
            }
            if (cmbTiGenero.SelectedItem == null)
            {
                cmbTiGenero.Focus();
                Utils.msg("Seleccione el género.", Estado.WARNING);
                return false;
            }
            if ((string)cmbTiDocIdent.SelectedValue == "104DNI" && txtNumDoc.Text.Trim().Length != 8)
            {
                txtNumDoc.Focus(); txtNumDoc.SelectAll();
                Utils.msg("Escriba un número de DNI correcto.", Estado.WARNING);
                return false;
            }
            if ((string)cmbTiDocIdent.SelectedValue == "104RUC" && txtNumDoc.Text.Trim().Length != 11)
            {
                txtNumDoc.Focus(); txtNumDoc.SelectAll();
                Utils.msg("Escriba un número de RUC correcto.", Estado.WARNING);
                return false;
            }
            if ((string)cmbTiPersona.SelectedValue == "101PER" && txtPaterno.Text.Trim().Length < Vars.minCar)
            {
                txtPaterno.Focus(); txtPaterno.SelectAll();
                Utils.msg("Escriba apellido paterno correcto.", Estado.WARNING);
                return false;
            }
            if ((string)cmbTiPersona.SelectedValue == "101PER" && txtMaterno.Text.Trim().Length < Vars.minCar)
            {
                txtMaterno.Focus(); txtMaterno.SelectAll();
                Utils.msg("Escriba apellido materno correcto.", Estado.WARNING);
                return false;
            }
            if (txtNombres.Text.Trim().Length < Vars.minCar)
            {
                txtNombres.Focus(); txtNombres.SelectAll();
                Utils.msg("Escriba un nombre correcto.", Estado.WARNING);
                return false;
            }
            return true;
        }

        private void mostrarPersona()
        {
            cmbTiPersona.SelectedValue = obCli.idTiPersona;
            cmbTiGenero.SelectedValue = obCli.idTiGenero;
            cmbTiDocIdent.SelectedValue = obCli.idTiDocIdent;
            txtNumDoc.Text = obCli.docIdent;
            txtPaterno.Text = obCli.paterno;
            txtMaterno.Text = obCli.materno;
            txtNombres.Text = obCli.nombres;
            txtSigla.Text = obCli.sigla;
            txtFijo.Text = obCli.fijo;
            txtMovil.Text = obCli.movil;
            txtCorreo.Text = obCli.correo;
            txtRUC.Text = obCli.perConRuc;
            txtObs.Text = obCli.observacion;
            chbVal.Visible = obCli.validado;
            chbVal.Checked = obCli.validado;

            if (obCli.validado)
            {
                cmbTiPersona.Enabled = false;
                cmbTiGenero.Enabled = false;
                cmbTiDocIdent.Enabled = false;
                txtNumDoc.Enabled = false;
                txtPaterno.Enabled = false;
                txtMaterno.Enabled = false;
                txtNombres.Enabled = false;
                txtSigla.Focus();
            }

            mostrarDireccion();
        }

        private void mostrarDireccion()
        {
            //if (obCli.obDirX != null)
            //{
            //    Distrito obDist = new DistritoBO().getDistById(obCli.obDirX.idDist);
            //    txtDireccion.Text = obCli.obDirX.fullDirX + " - " + obDist.fullNameX;
            //}
        }

        private void guardarPersona()
        {
            if (!validarCtrls())
                return;

            if (obCli == null)
                obCli = new Persona() { idPersona = -1 };

            obCli.idTiPersona = (string)cmbTiPersona.SelectedValue;
            obCli.idTiGenero = (string)cmbTiGenero.SelectedValue;
            obCli.idTiDocIdent = (string)cmbTiDocIdent.SelectedValue;
            obCli.docIdent = txtNumDoc.Text;
            obCli.paterno = txtPaterno.Text;
            obCli.materno = txtMaterno.Text;
            obCli.nombres = txtNombres.Text;
            obCli.sigla = txtSigla.Text;
            obCli.fijo = txtFijo.Text;
            obCli.movil = txtMovil.Text;
            obCli.correo = txtCorreo.Text;
            obCli.validado = chbVal.Checked;
            obCli.idEmpresa = Vars.obEmpresa.idEmpresa;
            obCli.perConRuc = txtRUC.Text;
            obCli.observacion = txtObs.Text;
            //obCli.idDireccion;    se actualiza al operar

            try
            {
                //new PersonaBO().savePersonaConDireccion(obCli);
                //Utils.msg("Los datos se guardaron correctamente.", Estado.SUCCESS);
                this.Dispose();
            }
            catch (Exception ex)
            {
                Utils.msg("ERROR\n" + ex.ToString(), Estado.ERROR);
            }
        }

    }//end class

}
