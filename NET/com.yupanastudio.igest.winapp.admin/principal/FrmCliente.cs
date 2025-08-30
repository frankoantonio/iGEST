using com.yupanastudio.igest.winapp;
using Krypton.Toolkit;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmCliente : FrmMaster
    {
        private bool xDataCliente;
        private bool xReqInfContacto;
        public Persona xObPersona;

        public FrmCliente(Persona xObPersona, bool xReqInfContacto, bool xDataCliente, CRUD xOperCRUD, bool xReadOnly) : base(xOperCRUD, xReadOnly)
        {
            InitializeComponent();

            this.xObPersona = xObPersona != null ? Task.Run(() => PersonaBridge.getPersonaByID(xObPersona.idPersona)).Result : null;
            this.xReqInfContacto = xReqInfContacto;
            this.xDataCliente = xDataCliente;

            if (!xDataCliente)        // para rellenar el RUC de la persona natural y/o nombre comercial 
            {
                lblRucPerNat.Visible = false;
                lblSigla.Visible = false;
                txtRucPerNat.Visible = false;
                txtSigla.Visible = false;
                gbx1.Size = new System.Drawing.Size(700, 115);                
                this.Size = new System.Drawing.Size(720, 355);
            }
        }

        private void FrmPersona_Load(object sender, EventArgs e)
        {
            cmbDocIdent.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_TI_DOC_IDENT" && x.idTipo != 41 && x.idTipo != 50).OrderBy(y => y.orden).ToList();  //41=RUC; 50=NO_DOMICILIADO
            
            cmbDocIdent.SelectedItem = null;
            

            if (xOperCRUD == CRUD.EDIT)
                mostrarPersona();
        }

        private void cmbDocIdent_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtDocIdent.Text = "";
            if (cmbDocIdent.SelectedItem != null && (int)cmbDocIdent.SelectedValue == 51)
            {
                if (xObPersona?.numDocIdent.Substring(0, 2).Equals("SD") == true)
                    txtDocIdent.Text = xObPersona?.numDocIdent;
                txtDocIdent.Enabled = false;
            }
            else
                txtDocIdent.Enabled = true;

            /// verifica SI TIENEN OTRO DOC
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            guardar();
        }

        //
        // Métodos
        //
        private void mostrarPersona()
        {
            if (xObPersona != null)
            {
                cmbDocIdent.SelectedValue = xObPersona.idTipoDocIdent;
                txtDocIdent.Text = xObPersona.numDocIdent;                
                txtNoms.Text = xObPersona.nombres;
                txtPat.Text = xObPersona.paterno;
                txtMat.Text = xObPersona.materno;
                txtRucPerNat.Text = xObPersona.numRucPerNat;
                txtSigla.Text = xObPersona.sigla;                
                txtRucPerNat.Text = xObPersona.numRucPerNat;
                txtSigla.Text = xObPersona.sigla;
            }

            if (xObPersona?.validado == true)
            {
                cmbDocIdent.Enabled = false;
                txtDocIdent.Enabled = false;
                txtNoms.Enabled = false;
                txtPat.Enabled = false;
                txtMat.Enabled = false;                
            }
            lblDataOK.Visible = xObPersona?.validado ?? false;
        }

        private bool validarCtrls()
        {
            if (cmbDocIdent.SelectedItem == null)
            {
                Utils.msg("Selecciona el tipo de documento de identidad.", Estado.WARNING);
                cmbDocIdent.Focus();
                return false;
            }

            txtDocIdent.Text = Utils.allTrim_InjectCode(txtDocIdent.Text);
            if ((int)cmbDocIdent.SelectedValue == 40 && !Utils.validarDNI(txtDocIdent.Text))    //40=DNI
            {
                Utils.msg("Ingresa un DNI válido.", Estado.WARNING);
                txtDocIdent.Focus(); txtDocIdent.SelectAll();
                return false;
            }
            else if ((int)cmbDocIdent.SelectedValue != 51 && txtDocIdent.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"])) //51=SIN_DOC
            {
                Utils.msg("Se requiere al menos " + Vars.dicVarGB["MinCarInput"] + " caracteres.", Estado.WARNING);
                txtDocIdent.Focus(); txtDocIdent.SelectAll();
                return false;
            }
            else if (xOperCRUD == CRUD.EDIT && (int)cmbDocIdent.SelectedValue == 51 && xObPersona.idTipoDocIdent != 51)
            {
                Utils.msg("Ésta persona ya tenía registrado un documento, no puedes seleccionar esta opción.", Estado.WARNING);
                cmbDocIdent.Focus();
                return false;
            }
            

            txtNoms.Text = Utils.allTrim_InjectCode(txtNoms.Text);
            if (!Utils.validarNoms(txtNoms.Text, false))
            {
                Utils.msg("Ingresa un nombre válido.", Estado.WARNING);
                txtNoms.Focus(); txtNoms.SelectAll();
                return false;
            }

            txtPat.Text = Utils.allTrim_InjectCode(txtPat.Text);
            if (!Utils.validarNoms(txtPat.Text, true))
            {
                Utils.msg("Ingresa un apellido paterno válido, o un guión (-) sí no lo tiene.", Estado.WARNING);
                txtPat.Focus(); txtPat.SelectAll();
                return false;
            }

            txtMat.Text = Utils.allTrim_InjectCode(txtMat.Text);
            if (!Utils.validarNoms(txtMat.Text, true))
            {
                Utils.msg("Ingresa un apellido materno válido, o un guión (-) sí no lo tiene", Estado.WARNING);
                txtMat.Focus(); txtMat.SelectAll();
                return false;
            }

            txtRucPerNat.Text = Utils.allTrim_InjectCode(txtRucPerNat.Text);
            if (xDataCliente && txtRucPerNat.Text != "" && !Utils.validarRuc(txtRucPerNat.Text))
            {
                Utils.msg("Ingresa un RUC válido.", Estado.WARNING);
                txtRucPerNat.Focus(); txtRucPerNat.SelectAll();
                return false;
            }

            if (xDataCliente && txtRucPerNat.Text != "" && txtRucPerNat.Text.Substring(2, 8).Equals(txtDocIdent.Text) == false)
            {
                Utils.msg("El RUC no coincide con el documento de identidad.", Estado.WARNING);
                txtRucPerNat.Focus(); txtRucPerNat.SelectAll();
                return false;
            }

            txtSigla.Text = Utils.allTrim_InjectCode(txtSigla.Text);
            if (xDataCliente && txtSigla.Text != "" && txtSigla.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Se requiere al menos " + Vars.dicVarGB["MinCarInput"] + " caracteres.", Estado.WARNING);
                txtSigla.Focus(); txtSigla.SelectAll();
                return false;
            }

            txtFijo.Text = Utils.allTrim_InjectCode(txtFijo.Text);
            if (txtFijo.Text != "" && txtFijo.Text.Length != 9)
            {
                Utils.msg("Ingresa un número de teléfono válido, incluido el código de ciudad. Ej. 064 123 456  ó  015 541 321.", Estado.WARNING);
                txtFijo.Focus(); txtFijo.SelectAll();
                return false;
            }

            txtCelular.Text = Utils.allTrim_InjectCode(txtCelular.Text);
            if (txtCelular.Text != "" && txtCelular.Text.Length != 9)
            {
                Utils.msg("Ingresa un número de celular válido.", Estado.WARNING);
                txtCelular.Focus(); txtCelular.SelectAll();
                return false;
            }

            txtCorreo.Text = Utils.allTrim_InjectCode(txtCorreo.Text);
            if (txtCorreo.Text != "" && !Utils.validarCorreo(txtCorreo.Text))
            {
                Utils.msg("Ingresa un correo electrónico válido.", Estado.WARNING);
                txtCorreo.Focus(); txtCorreo.SelectAll();
                return false;
            }

            if (txtFijo.Text == "" && txtCelular.Text == "" && txtCorreo.Text == "" && xReqInfContacto)
            {
                Utils.msg("Ingresa algún dato de contacto.", Estado.WARNING);
                txtFijo.Focus(); txtFijo.SelectAll();
                return false;
            }

            return true;
        }

        private async void guardar()
        {
            if (!validarCtrls())
                return;

            if (xObPersona == null)
            {
                xObPersona = new Persona();
                xObPersona.idPersona = -1;
                xObPersona.idTipoPersona = 10;    // siempre persona
                xObPersona.idDireccionX = -1;
                xObPersona.idTipoEstCivX = -1;
                xObPersona.validado = false;
                xObPersona.idEmpresa = Vars.obEmpresa.idEmpresa;
                xObPersona.idGrpFam = -1;
                xObPersona.idTipoSitEducX = -1;
                xObPersona.idInstEst = -1;
            }
                        
            xObPersona.idTipoDocIdent = (int)cmbDocIdent.SelectedValue;
            xObPersona.numDocIdent = txtDocIdent.Text;
            xObPersona.paterno = txtPat.Text;
            xObPersona.materno = txtMat.Text;
            xObPersona.nombres = txtNoms.Text;
            xObPersona.fijo = txtFijo.Text;
            xObPersona.movil = txtCelular.Text;
            xObPersona.correo = txtCorreo.Text;
            xObPersona.numRucPerNat = txtRucPerNat.Text;
            xObPersona.sigla = txtSigla.Text;

            try
            {
                btnOk.Enabled = false;
                btnCancel.Enabled = false;

                //if (xOperCRUD == CRUD.NEW)
                //    xObPersona = await PersonaBridge.insert(xObPersona);
                //else if (xOperCRUD == CRUD.EDIT)
                //    xObPersona = await PersonaBridge.update(xObPersona);

                //await PersonaBridge.upsert(xObPersona);
                xObPersona = Task.Run(()=> PersonaBridge.upsert(xObPersona)).Result;
                //Task.Run(() => PersonaBridge.upsert(xObPersona));

                Utils.msg("Los datos se guardaron correctamente.", Estado.SUCCESS);
                this.operOK = true;
                this.Dispose();
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
                btnOk.Enabled = true;
                btnCancel.Enabled = true;
            }
        }

        private void txtDocIdent_Enter(object sender, EventArgs e)
        {
            if (sender.GetType() == typeof(KryptonTextBox))
            {
                ((KryptonTextBox)sender).SelectAll();
            }
            else if (sender.GetType() == typeof(KryptonMaskedTextBox))
            {
                ((KryptonMaskedTextBox)sender).Select();
                ((KryptonMaskedTextBox)sender).SelectAll();
            }
        }

    }//end class

}
