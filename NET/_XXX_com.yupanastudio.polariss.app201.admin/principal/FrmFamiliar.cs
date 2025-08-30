using Krypton.Toolkit;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmFamiliar : FrmMaster
    {
        private Direccion obDireccion = null;
        private InstitucionEstudio obInsEst = null;
        private LugarNac obLgNac = null;
        private bool xSetGrpFam;                    // true; para agregar al familiar, al grupo familiar del estudiante
        private Persona xObEstudiante;
        public Familiar xObFamiliar;

        public FrmFamiliar(long xIdFamiliar, Persona xObEstudiante, bool xSetGrpFam, CRUD xOperCRUD, bool xReadOnly) : base(xOperCRUD, xReadOnly)
        {
            InitializeComponent();
            this.xObFamiliar = xIdFamiliar > 0 ? Task.Run(() => FamiliarBridge.getFamiliarByID(xIdFamiliar, xObEstudiante.idPersona)).Result : null;
            this.xObEstudiante = xObEstudiante;
            this.xSetGrpFam = xSetGrpFam;
            this.lblTitle.Text = this.lblTitle.Text + "  " + xObEstudiante.nomApesX;
        }

        private void FrmFamiliar_Load(object sender, EventArgs e)
        {
            cmbDocIdent.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_TI_DOC_IDENT" && x.idTipo != 41 && x.idTipo != 50).OrderBy(y => y.orden).ToList();  //41=RUC; 50=NO_DOMICILIADO
            cmbParentesco.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_PARENTESCO").OrderBy(y => y.orden).ThenBy(z => z.nomTipo).ToList();
            cmbSexo.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_SEXO").OrderBy(y => y.orden).ToList();
            cmbEstCiv.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_TI_EST_CIV").OrderBy(y => y.orden).ToList();
            cmbSitEdu.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_TI_SIT_EDUC").OrderBy(y => y.orden).ToList();

            cmbDocIdent.SelectedItem = null;
            cmbParentesco.SelectedItem = null;
            cmbSexo.SelectedItem = null;
            cmbEstCiv.SelectedItem = null;
            cmbSitEdu.SelectedItem = null;

            if (xOperCRUD == CRUD.EDIT)
                mostrarFam();
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

        private void cmbDocIdent_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtDocIdent.Text = "";
            if (cmbDocIdent.SelectedItem != null && (int)cmbDocIdent.SelectedValue == 51)   //51 = SIN DOCUMENTO [VARIOS - OTROS]
            {
                if (xObFamiliar?.obPerX.numDocIdent.Substring(0, 2).Equals("SD") == true)
                    txtDocIdent.Text = xObFamiliar?.obPerX.numDocIdent;
                txtDocIdent.Enabled = false;
            }
            else
                txtDocIdent.Enabled = true;

            if (cmbDocIdent.SelectedItem != null && (int)cmbDocIdent.SelectedValue == 40)   // 40 = DOCUMENTO NACIONAL DE IDENTIDAD
                txtDocIdent.MaxLength = 8;
            else
                txtDocIdent.MaxLength = 20;
        }

        private void btnNac_Click(object sender, EventArgs e)
        {
            this.Enabled = false;

            FrmLugNac frm = new FrmLugNac(obLgNac, (obLgNac != null ? CRUD.EDIT : CRUD.NEW), xLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obLgNac = frm.obLgNc;
                txtNac.Text = obLgNac.fullLugNacX;
            }

            this.Enabled = true;
        }

        private void btnInsEst_Click(object sender, EventArgs e)
        {
            this.Enabled = false;

            FrmInstEstudios frm = new FrmInstEstudios(false, obInsEst, false);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obInsEst = frm.xObInstEst;
                txtInsEst.Text = obInsEst.fullInstEstX;
            }

            this.Enabled = true;
        }

        private void btnDir_Click(object sender, EventArgs e)
        {
            this.Enabled = false;

            bool showDirFams = true;    // para mostrar opción que muestra las direcciones de los familiares
            FrmDireccionFind frm = new FrmDireccionFind(obDireccion, xObEstudiante, showDirFams, xLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obDireccion = frm.xObDir;
                txtDir.Text = obDireccion.fullDirX;
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
        private void mostrarFam()
        {
            if (xObFamiliar != null)
            {
                cmbDocIdent.SelectedValue = xObFamiliar.obPerX.idTipoDocIdent;
                txtDocIdent.Text = xObFamiliar.obPerX.numDocIdent;
                txtNoms.Text = xObFamiliar.obPerX.nombres;
                txtPat.Text = xObFamiliar.obPerX.paterno;
                txtMat.Text = xObFamiliar.obPerX.materno;
                cmbSexo.SelectedValue = xObFamiliar.obPerX.idTipoSexoX;
                cmbEstCiv.SelectedValue = xObFamiliar.obPerX.idTipoEstCivX;
                if (xObFamiliar.obPerX.idDireccionX != -1)   // si tiene dirección
                {
                    obDireccion = Task.Run(() => DireccionBridge.getDireccionByID(xObFamiliar.obPerX.idDireccionX)).Result;
                    txtDir.Text = obDireccion?.fullDirX;
                }
                txtCorreo.Text = xObFamiliar.obPerX.correo;
                txtFijo.Text = xObFamiliar.obPerX.fijo;
                txtCelular.Text = xObFamiliar.obPerX.movil;
                cmbSitEdu.SelectedValue = xObFamiliar.obPerX.idTipoSitEducX;
                if (xObFamiliar.obPerX.idInstEst != -1)     // si tiene institución de estudio
                {
                    obInsEst = Task.Run(() => InstitucionEstudioBridge.getInstEstudioByID(xObFamiliar.obPerX.idInstEst)).Result;
                    txtInsEst.Text = obInsEst?.fullInstEstX;
                }
                obLgNac = xObFamiliar.obLugNacX;
                txtNac.Text = obLgNac?.fullLugNacX;

                if (xObFamiliar.idFamiliar != -1)           // si familiar tiene datos
                {
                    txtOcupacion.Text = xObFamiliar.ocupacion;
                    txtCenLab.Text = xObFamiliar.centroLab;
                    txtCenLabDet.Text = xObFamiliar.centroLabDet;
                }
                if (xObFamiliar.idFamEst != -1)             // si familiar_estudiante tiene datos
                {
                    cmbParentesco.SelectedValue = xObFamiliar.idTipoPariente;
                    chbFallecido.Checked = xObFamiliar.fallecido;
                    chbApoderado.Checked = xObFamiliar.apoderado;
                    chbViveConAlu.Checked = xObFamiliar.viveConEst;
                }
            }

            if (xObFamiliar?.obPerX.validado == true)
            {
                cmbDocIdent.Enabled = false;
                txtDocIdent.Enabled = false;
                txtNoms.Enabled = false;
                txtPat.Enabled = false;
                txtMat.Enabled = false;
                cmbSexo.Enabled = false;
                if (obLgNac != null) btnNac.Enabled = false;
            }
            lblDataOK.Visible = xObFamiliar?.obPerX.validado ?? false;
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
            else if (xOperCRUD == CRUD.EDIT && (int)cmbDocIdent.SelectedValue == 51 && xObFamiliar.obPerX.idTipoDocIdent != 51)
            {
                Utils.msg("Ésta persona ya tenía registrado un documento, no puedes seleccionar esta opción.", Estado.WARNING);
                cmbDocIdent.Focus();
                return false;
            }

            if (cmbParentesco.SelectedItem == null)
            {
                Utils.msg("Selecciona el parentesco del familiar con el estudiante.", Estado.WARNING);
                cmbParentesco.Focus();
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

            if ((txtPat.Text == "" && txtMat.Text == "") || (txtPat.Text == "-" && txtMat.Text == "-"))
            {
                Utils.msg("Al menos ingresa un apellido.", Estado.WARNING);
                txtPat.Focus(); txtPat.SelectAll();
                return false;
            }

            txtNoms.Text = Utils.allTrim_InjectCode(txtNoms.Text);
            if (!Utils.validarNoms(txtNoms.Text, false))
            {
                Utils.msg("Ingresa un nombre válido.", Estado.WARNING);
                txtNoms.Focus(); txtNoms.SelectAll();
                return false;
            }

            if (cmbSexo.SelectedItem == null)
            {
                Utils.msg("Selecciona un valor.", Estado.WARNING);
                cmbSexo.Focus();
                return false;
            }

            if (chbFallecido.Checked && chbApoderado.Checked)
            {
                Utils.msg("Sí el familiar falleció no puede ser apoderado/a.", Estado.WARNING);
                chbApoderado.Focus();
                return false;
            }

            if (chbFallecido.Checked && chbViveConAlu.Checked)
            {
                Utils.msg("Sí el familiar falleció desmarca \"Vive con el alumno\".", Estado.WARNING);
                chbViveConAlu.Focus();
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

            if (!chbFallecido.Checked && txtFijo.Text == "" && txtCelular.Text == "" && txtCorreo.Text == "" && bool.Parse(Vars.dicVarGB["ReqInfContFam"]))
            {
                Utils.msg("Ingresa algún dato de contacto.", Estado.WARNING);
                txtFijo.Focus(); txtFijo.SelectAll();
                return false;
            }

            txtOcupacion.Text = Utils.allTrim_InjectCode(txtOcupacion.Text);
            txtCenLab.Text = Utils.allTrim_InjectCode(txtCenLab.Text);
            txtCenLabDet.Text = Utils.allTrim_InjectCode(txtCenLabDet.Text);

            return true;
        }

        private void guardar()
        {
            if (!validarCtrls())
                return;

            if (this.xOperCRUD == CRUD.NEW)
            {
                xObFamiliar = new Familiar();
                xObFamiliar.idFamEst = -1;
                xObFamiliar.idFamiliar = -1;
                xObFamiliar.obPerX = new Persona();
                xObFamiliar.obPerX.idPersona = -1;
                xObFamiliar.obPerX.idTipoPersona = 10;    // siempre persona
                xObFamiliar.obPerX.numRucPerNat = "";
                xObFamiliar.obPerX.sigla = "";
                xObFamiliar.obPerX.validado = false;
                xObFamiliar.obPerX.idEmpresa = Vars.obEmpresa.idEmpresa;
                xObFamiliar.obPerX.idGrpFam = -1;
            }

            xObFamiliar.idEstudiante = xObEstudiante.idPersona;
            xObFamiliar.idTipoPariente = (int)cmbParentesco.SelectedValue;
            xObFamiliar.fallecido = chbFallecido.Checked;
            xObFamiliar.apoderado = chbApoderado.Checked;
            xObFamiliar.viveConEst = chbViveConAlu.Checked;
            xObFamiliar.ocupacion = Utils.allTrim_InjectCode(txtOcupacion.Text);
            xObFamiliar.centroLab = Utils.allTrim_InjectCode(txtCenLab.Text);
            xObFamiliar.centroLabDet = Utils.allTrim_InjectCode(txtCenLabDet.Text);
            xObFamiliar.obLugNacX = obLgNac;
            xObFamiliar.obPerX.idTipoSexoX = (int)cmbSexo.SelectedValue;
            xObFamiliar.obPerX.idTipoDocIdent = (int)cmbDocIdent.SelectedValue;
            xObFamiliar.obPerX.numDocIdent = txtDocIdent.Text;
            xObFamiliar.obPerX.paterno = txtPat.Text;
            xObFamiliar.obPerX.materno = txtMat.Text;
            xObFamiliar.obPerX.nombres = txtNoms.Text;
            xObFamiliar.obPerX.fijo = txtFijo.Text;
            xObFamiliar.obPerX.movil = txtCelular.Text;
            xObFamiliar.obPerX.correo = txtCorreo.Text;
            xObFamiliar.obPerX.idDireccionX = (obDireccion == null ? -1 : obDireccion.idDireccion);
            xObFamiliar.obPerX.idTipoEstCivX = (cmbEstCiv.SelectedItem == null ? 35 : (int)cmbEstCiv.SelectedValue);     //35 = <SIN INDICAR>
            xObFamiliar.obPerX.idTipoSitEducX = (cmbSitEdu.SelectedItem == null ? 81 : (int)cmbSitEdu.SelectedValue);    //81 = <SIN INDICAR>
            xObFamiliar.obPerX.idInstEst = (obInsEst == null ? -1 : obInsEst.idInstEst);

            long idGrpFamAux = xObFamiliar.obPerX.idGrpFam;
            if (xSetGrpFam && xObEstudiante.idGrpFam > 0 && idGrpFamAux != xObEstudiante.idGrpFam)
                xObFamiliar.obPerX.idGrpFam = xObEstudiante.idGrpFam;

            try
            {
                btnOk.Enabled = false;

                xObFamiliar = Task.Run(() => FamiliarBridge.upsert(xObFamiliar)).Result;

                if (xSetGrpFam && xObEstudiante.idGrpFam > 0 && idGrpFamAux != xObEstudiante.idGrpFam)
                    Utils.msg("El familiar se agregó al grupo del estudiante.\nLos datos se guardaron correctamente.", Estado.SUCCESS);
                else
                    Utils.msg("Los datos se guardaron correctamente.", Estado.SUCCESS);

                this.operOK = true;
                this.Dispose();
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
                btnOk.Enabled = true;
            }
        }

    }//end class

}
