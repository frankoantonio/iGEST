using com.yupanastudio.igest.winapp;
using Krypton.Toolkit;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public partial class UcInscripcionAcad : UcMaster
    {
        private EstudianteAcad obEstAcad;
        private GrupoFamiliar obGrpFam;
        private LugarNac obLgNac;
        private Direccion obDireccion;
        private List<Familiar> lsFams;
        private List<DocsEstudiante> lsDocsEst;
        private List<Inscripcion> lsInsc;
        private bool lecturaAux;

        public UcInscripcionAcad()
        {
            InitializeComponent();

            dgvMatricula.AutoGenerateColumns = false;

            dgvMat_idTipoEstado.ValueMember = "idTipo";
            dgvMat_idTipoEstado.DisplayMember = "nomTipo";
            dgvMat_idTipoEstado.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_EST_MATR").ToList();
        }

        private void UcEstudianteAcad_Load(object sender, EventArgs e)
        {
            cmbDocIdent.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_TI_DOC_IDENT" && x.idTipo != 41 && x.idTipo != 50).OrderBy(y => y.orden).ToList();  //41=RUC; 50=NO_DOMICILIADO
            cmbSexo.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_SEXO").OrderBy(y => y.orden).ToList();

            lecturaAux = Boolean.Parse(this.obOpcion.soloLectura.ToString());

            obEstAcad = (Vars.obPerSel == null ? null : Task.Run(() => EstudianteAcadBridge.getEstudianteAcadByID(Vars.obPerSel.idPersona)).Result);
            forSelect();
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

        private void btnFind_Click(object sender, EventArgs e)
        {
            FrmPersonaFind frm = new FrmPersonaFind(10, true, bool.Parse(Vars.dicVarGB["ReqInfContEst"]), false, lecturaAux);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obEstAcad = (frm.obPersonaSel == null ? null : Task.Run(() => EstudianteAcadBridge.getEstudianteAcadByID(frm.obPersonaSel.idPersona)).Result);
                Vars.obPerSel = frm.obPersonaSel;

                if (frm.dbOperPublic == CRUD.SELECT)
                    forSelect();
                else if (frm.dbOperPublic == CRUD.EDIT)
                    forEdit(true);
                else if (frm.dbOperPublic == CRUD.NEW)
                    forNew();

                imgFoto.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.usuario;

                if (obEstAcad != null && obEstAcad.idEstAcad == -1)
                    Utils.msg("Falta completar datos del estudiante.\nActualízalo!", Estado.WARNING);
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            forEdit(false);
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            guardar();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            obEstAcad = (obEstAcad != null ? Task.Run(() => EstudianteAcadBridge.getEstudianteAcadByID(obEstAcad.idPersona)).Result : null);
            forSelect();
        }

        private async void imgFoto_DoubleClick(object sender, EventArgs e)
        {
            if (obEstAcad != null && obEstAcad.idEstAcad != -1)
            {
                imgFoto.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
                imgFoto.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.load;
                try
                {
                    using (var stream = await new HttpClient().GetStreamAsync(Vars.dicVarGB["UrlFotoEst"] + obEstAcad.numDocIdent + ".jpg"))
                    {
                        // el tamaño de la foto es de 800x10000 ó 160x200
                        imgFoto.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
                        imgFoto.Image = Bitmap.FromStream(stream);
                    }
                }
                catch (Exception)
                {
                    imgFoto.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
                    imgFoto.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.usuario;
                }
            }
        }

        private void cmbDocIdent_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtDocIdent.Text = "";
            if (cmbDocIdent.SelectedItem != null && (int)cmbDocIdent.SelectedValue == 51)
            {
                if (obEstAcad != null && obEstAcad.numDocIdent.Substring(0, 2).Equals("SD") == true)
                    txtDocIdent.Text = obEstAcad.numDocIdent;
                txtDocIdent.Enabled = false;
            }
            else
                txtDocIdent.Enabled = true;

            if (cmbDocIdent.SelectedItem != null && (int)cmbDocIdent.SelectedValue == 40) // 40	DOCUMENTO NACIONAL DE IDENTIDAD
                txtDocIdent.MaxLength = 8;
            else
                txtDocIdent.MaxLength = 20;
        }

        private void btnGrpFam_Click(object sender, EventArgs e)
        {
            FrmGrupoFamFind frm = new FrmGrupoFamFind(obGrpFam, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obGrpFam = frm.xObGrpFam;
                txtGrpFam.Text = obGrpFam.fullGrpFamX;
            }
        }

        private void btnNac_Click(object sender, EventArgs e)
        {
            FrmLugNac frm = new FrmLugNac(obLgNac, (obLgNac != null ? CRUD.EDIT : CRUD.NEW), this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obLgNac = frm.obLgNc;
                txtNac.Text = obLgNac.fullLugNacX;
            }
        }

        private void btnDireccion_Click(object sender, EventArgs e)
        {
            if (obGrpFam == null)
            {
                Utils.msg("Primero indica el grupo familiar del estudiante.", Estado.WARNING);
                btnGrpFam.Focus();
                return;
            }

            FrmDireccionFind frm = new FrmDireccionFind(obDireccion, obEstAcad == null ? new EstudianteAcad() { idPersona = -1, idGrpFam = obGrpFam.idGrpFam } : obEstAcad, true, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obDireccion = frm.xObDir;
                txtDir.Text = obDireccion.fullDirX;
            }
        }

        private void lnkFams_LinkClicked(object sender, EventArgs e)
        {
            if (!validarAux())
                return;

            FrmFamsEst frm = new FrmFamsEst(obEstAcad, obGrpFam, lsFams, this.obOpcion.soloLectura);
            frm.ShowDialog();
            lsFams = frm.xLsFams;
            setFams(lsFams);
        }

        private void lnkDocs_LinkClicked(object sender, EventArgs e)
        {
            if (!validarAux())
                return;

            FrmDocsEst frm = new FrmDocsEst(obEstAcad.idPersona, lsDocsEst, false, this.obOpcion.soloLectura);
            frm.ShowDialog();
            lsDocsEst = frm.xLsDocsEst;
            setDocs(lsDocsEst);
        }

        private void btnNewInsc_Click(object sender, EventArgs e)
        {
            if (!validarAux())
                return;

            if (obEstAcad.activo == false)
            {
                Utils.msg("El estudiante no está activo.", Estado.WARNING);
                return;
            }

            if (bool.Parse(Vars.dicVarGB["ReqFamiliar"]) && lsFams.Where(x => x.apoderado).Count() != 1)
            {
                Utils.msg("Se requiere indiques quien es el apoderado.", Estado.WARNING);
                return;
            }

            Informe obInfAux = Task.Run(() => InformeBridge.getInformeByPersonaActivo(obEstAcad.idPersona, Vars.obEmpresa.idEmpresa)).Result;
            FrmInscripcion frm = new FrmInscripcion(lsInsc, null, obInfAux, obEstAcad.idPersona, CRUD.NEW, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                lsInsc.Add(frm.xObInsc);
                lsInsc = lsInsc.OrderByDescending(x => x.feInsc).ToList();
                dgvMatricula.DataSource = lsInsc;
            }
        }

        private void btnEditInsc_Click(object sender, EventArgs e)
        {
            if (!validarAux())
                return;

            if (lsInsc.Count <= 0 || dgvMatricula.Rows.Count <= 0)
            {
                Utils.msg("Se requiere una inscripción/matrícula seleccionada.", Estado.WARNING);
                return;
            }

            FrmInscripcion frm = new FrmInscripcion(lsInsc, lsInsc[dgvMatricula.CurrentRow.Index], null, obEstAcad.idPersona, CRUD.EDIT, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                lsInsc[dgvMatricula.CurrentRow.Index] = frm.xObInsc;
                dgvMatricula.DataSource = lsInsc.OrderByDescending(x => x.feInsc).ToList();
            }
        }

        //
        // Métodos
        //
        private void forSelect()
        {
            lblSubtitle.Text = "Registro de estudiante e inscripciones";
            mostrarEstudiante();
            mostrarDatosImportantes();

            habilitarCtrl(false);
            btnFind.Enabled = true;
            btnEdit.Enabled = obEstAcad != null;
            btnOk.Enabled = false;
            btnCancel.Enabled = false;

            if (obEstAcad != null) estudianteActivo(obEstAcad.activo);

            btnFind.Focus();
        }

        private void forEdit(bool update)
        {
            lblSubtitle.Text = "[Modificar estudiante]";
            if (update)
            {
                mostrarEstudiante();
                mostrarDatosImportantes();
            }

            habilitarCtrl(obEstAcad.activo);
            btnFind.Enabled = !obEstAcad.activo;
            btnEdit.Enabled = !obEstAcad.activo;
            btnOk.Enabled = obEstAcad.activo;
            btnCancel.Enabled = obEstAcad.activo;

            if (obEstAcad != null) estudianteActivo(obEstAcad.activo);

            btnCancel.Focus();

            if (obEstAcad.idTipoDocIdent == 51) txtDocIdent.Enabled = false;
        }

        private void forNew()
        {
            lblSubtitle.Text = "[Crear nuevo estudiante]";
            mostrarEstudiante();
            mostrarDatosImportantes();

            habilitarCtrl(true);
            btnFind.Enabled = false;
            btnEdit.Enabled = false;
            btnOk.Enabled = true;
            btnCancel.Enabled = true;

            cmbDocIdent.Focus();
        }

        private void mostrarEstudiante()
        {
            limpiarCtrl();

            if (obEstAcad != null)
            {
                cmbDocIdent.SelectedValue = obEstAcad.idTipoDocIdent;
                txtDocIdent.Text = obEstAcad.numDocIdent;
                txtPaterno.Text = obEstAcad.paterno;
                txtMaterno.Text = obEstAcad.materno;
                txtNombres.Text = obEstAcad.nombres;
                cmbSexo.SelectedValue = obEstAcad.idTipoSexoX;
                obGrpFam = Task.Run(() => GrupoFamiliarBridge.getGrpFamByID(obEstAcad.idGrpFam)).Result;
                txtGrpFam.Text = obGrpFam?.fullGrpFamX;
                obLgNac = obEstAcad.obLugNacX;
                txtNac.Text = obLgNac?.fullLugNacX;
                obDireccion = Task.Run(() => DireccionBridge.getDireccionByID(obEstAcad.idDireccionX)).Result;
                txtDir.Text = obDireccion?.fullDirX;
                txtFijo.Text = obEstAcad.fijo;
                txtCelular.Text = obEstAcad.movil;
                txtCorreoPer.Text = obEstAcad.correo;

                if (obEstAcad.idEstAcad != -1)
                {
                    txtCodEst.Text = obEstAcad.codEstudiante;
                    txtCorreoCole.Text = obEstAcad.correoAcad;
                }

                lblDataOK.Visible = obEstAcad.validado;
            }
        }

        private void mostrarDatosImportantes()
        {
            if (obEstAcad != null)
            {
                // familiares
                lsFams = obGrpFam == null ? new List<Familiar>() : Task.Run(() => FamiliarBridge.getFamiliaresByEst_GrpFam(obGrpFam.idGrpFam, obEstAcad.idPersona)).Result;
                setFams(lsFams);

                // documentacion
                lsDocsEst = Task.Run(() => DocsEstudianteBridge.getDocsEstByID(obEstAcad.idPersona, Vars.obEmpresa.idEmpresa)).Result;
                setDocs(lsDocsEst);

                // deudas 
                lblDeudaVencAlu.Text = obEstAcad.deudaX[0].ToString("C2");
                lblDeudaVencGrp.Text = obEstAcad.deudaX[1].ToString("C2");
                lblDeudaPendAlu.Text = obEstAcad.deudaX[2].ToString("C2");
                lblDeudaPendGrp.Text = obEstAcad.deudaX[3].ToString("C2");

                if (obEstAcad.deudaX[1] > 0)
                    lblVencIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.inactivo;
                else
                    lblVencIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.check;

                if (obEstAcad.deudaX[3] > 0)
                    lblPendIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_warning;
                else
                    lblPendIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.check;

                // inscripciones
                lsInsc = (Task.Run(() => InscripcionBridge.getInscripcionByEst(obEstAcad.idPersona, Vars.obEmpresa.idEmpresa)).Result).OrderByDescending(x => x.feInsc).ToList();
                dgvMatricula.DataSource = lsInsc;
            }
            else
            {
                lblDocsIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.check;
                lblFamsIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.check;
                lblVencIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.check;
                lblPendIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.check;
                lblDeudaVencAlu.Text = "0.00";
                lblDeudaVencGrp.Text = "0.00";
                lblDeudaPendAlu.Text = "0.00";
                lblDeudaPendGrp.Text = "0.00";
                dgvMatricula.DataSource = lsInsc = new List<Inscripcion>();
            }
        }

        private void estudianteActivo(bool activo)
        {
            if (activo)
            {
                lblInactivo.Visible = false;
                this.obOpcion.soloLectura = lecturaAux;
            }
            else
            {
                btnEdit.Enabled = false;
                lblDataOK.Visible = false;
                lblInactivo.Visible = true;
                this.obOpcion.soloLectura = true;
            }
        }

        private void setFams(List<Familiar> ls)
        {
            if (ls == null || ls.Count == 0 || ls.Where(x => x.apoderado).Count() != 1)
                lblFamsIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.inactivo;
            else
                lblFamsIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.check;
        }

        private void setDocs(List<DocsEstudiante> ls)
        {
            if (ls == null || ls.Count == 0 || ls.Where(x => x.obligadoX && (x.recibeUsu == "" || (x.recibeUsu != "" && x.devuelveUsu != ""))).Count() > 0)
                lblDocsIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.inactivo;
            else
                lblDocsIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.check;
        }

        private void limpiarCtrl()
        {
            obGrpFam = null;
            obLgNac = null;
            obDireccion = null;

            cmbDocIdent.SelectedItem = null;
            txtDocIdent.Text = "";
            txtCodEst.Text = "";
            txtPaterno.Text = "";
            txtMaterno.Text = "";
            txtNombres.Text = "";
            cmbSexo.SelectedItem = null;
            txtGrpFam.Text = "";
            txtNac.Text = "";
            txtDir.Text = "";
            txtFijo.Text = "";
            txtCelular.Text = "";
            txtCorreoPer.Text = "";
            txtCorreoCole.Text = "";

            lblDataOK.Visible = false;
            lblInactivo.Visible = false;
        }

        private void habilitarCtrl(bool b)
        {
            cmbDocIdent.Enabled = b;
            txtDocIdent.Enabled = b;
            txtPaterno.Enabled = b;
            txtMaterno.Enabled = b;
            txtNombres.Enabled = b;
            cmbSexo.Enabled = b;
            btnGrpFam.Enabled = b;
            btnNac.Enabled = b;
            btnDir.Enabled = b;
            txtFijo.Enabled = b;
            txtCelular.Enabled = b;
            txtCorreoPer.Enabled = b;

            lnkFams.Enabled = !b;
            lnkDocs.Enabled = !b;
            btnNewInsc.Enabled = !b;
            btnEditInsc.Enabled = !b;

            if (obEstAcad != null && obEstAcad.validado) // == true
            {
                cmbDocIdent.Enabled = false;
                txtDocIdent.Enabled = false;
                txtNombres.Enabled = false;
                txtPaterno.Enabled = false;
                txtMaterno.Enabled = false;
                cmbSexo.Enabled = false;
                if (obGrpFam != null) btnGrpFam.Enabled = false;
                if (obLgNac != null) btnNac.Enabled = false;
            }
        }

        private bool validarAux()
        {
            if (obEstAcad == null)
            {
                Utils.msg("Se requiere un estudiante.", Estado.WARNING);
                return false;
            }

            if (obEstAcad.idEstAcad == -1)
            {
                Utils.msg("Primero completa los datos del estudiante.", Estado.WARNING);
                return false;
            }

            return true;
        }

        private bool validarCtrl()
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
            else if (obEstAcad != null && (int)cmbDocIdent.SelectedValue == 51 && obEstAcad.idTipoDocIdent != 51)
            {
                Utils.msg("Ésta persona ya tenía registrado un documento, no puedes seleccionar esta opción.", Estado.WARNING);
                cmbDocIdent.Focus();
                return false;
            }

            txtPaterno.Text = Utils.allTrim_InjectCode(txtPaterno.Text);
            if (!Utils.validarNoms(txtPaterno.Text, true))
            {
                Utils.msg("Ingresa un apellido paterno válido, o un guión (-) sí no lo tiene.", Estado.WARNING);
                txtPaterno.Focus(); txtPaterno.SelectAll();
                return false;
            }

            txtMaterno.Text = Utils.allTrim_InjectCode(txtMaterno.Text);
            if (!Utils.validarNoms(txtMaterno.Text, true))
            {
                Utils.msg("Ingresa un apellido materno válido, o un guión (-) sí no lo tiene", Estado.WARNING);
                txtMaterno.Focus(); txtMaterno.SelectAll();
                return false;
            }

            if ((txtPaterno.Text == "" && txtMaterno.Text == "") || (txtPaterno.Text == "-" && txtMaterno.Text == "-"))
            {
                Utils.msg("Al menos ingresa un apellido.", Estado.WARNING);
                txtPaterno.Focus(); txtPaterno.SelectAll();
                return false;
            }

            txtNombres.Text = Utils.allTrim_InjectCode(txtNombres.Text);
            if (!Utils.validarNoms(txtNombres.Text, false))
            {
                Utils.msg("Ingresa un nombre válido.", Estado.WARNING);
                txtNombres.Focus(); txtNombres.SelectAll();
                return false;
            }

            if (cmbSexo.SelectedItem == null)
            {
                Utils.msg("Selecciona un valor.", Estado.WARNING);
                cmbSexo.Focus();
                return false;
            }

            if (obGrpFam == null)
            {
                Utils.msg("Indica el grupo familiar al que pertenece.", Estado.WARNING);
                btnGrpFam.Focus();
                return false;
            }

            if (bool.Parse(Vars.dicVarGB["ReqLgNacEst"]) && obLgNac == null)
            {
                Utils.msg("Se requiere fecha y lugar de nacimiento.", Estado.WARNING);
                btnNac.Focus();
                return false;
            }

            if (bool.Parse(Vars.dicVarGB["ReqDirEst"]) && obDireccion == null)
            {
                Utils.msg("Se requiere dirección del estudiante.", Estado.WARNING);
                btnDir.Focus();
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

            txtCorreoPer.Text = Utils.allTrim_InjectCode(txtCorreoPer.Text);
            if (txtCorreoPer.Text != "" && !Utils.validarCorreo(txtCorreoPer.Text))
            {
                Utils.msg("Ingresa un correo electrónico válido.", Estado.WARNING);
                txtCorreoPer.Focus(); txtCorreoPer.SelectAll();
                return false;
            }

            if (bool.Parse(Vars.dicVarGB["ReqInfContEst"]) && txtFijo.Text == "" && txtCelular.Text == "" && txtCorreoPer.Text == "")
            {
                Utils.msg("Ingresa algún dato de contacto.", Estado.WARNING);
                txtFijo.Focus(); txtFijo.SelectAll();
                return false;
            }

            return true;
        }

        private void guardar()
        {
            if (!validarCtrl())
                return;

            if (obEstAcad == null)
            {
                obEstAcad = new EstudianteAcad();
                obEstAcad.idEstAcad = -1;
                obEstAcad.activo = true;
                obEstAcad.codEstudiante = "";
                obEstAcad.correoAcad = "";

                obEstAcad.idPersona = -1;
                obEstAcad.idTipoPersona = 10;    // siempre persona
                obEstAcad.numRucPerNat = "";
                obEstAcad.sigla = "";
                obEstAcad.idTipoEstCivX = 30;     // soltero
                obEstAcad.validado = false;
                obEstAcad.idEmpresa = Vars.obEmpresa.idEmpresa;
                obEstAcad.idTipoSitEducX = 81;    // sin indicar
                obEstAcad.idInstEst = -1;
            }

            obEstAcad.codEstudiante = txtCodEst.Text;

            obEstAcad.idTipoSexoX = (int)cmbSexo.SelectedValue;
            obEstAcad.idTipoDocIdent = (int)cmbDocIdent.SelectedValue;
            obEstAcad.numDocIdent = txtDocIdent.Text;
            obEstAcad.paterno = txtPaterno.Text;
            obEstAcad.materno = txtMaterno.Text;
            obEstAcad.nombres = txtNombres.Text;
            obEstAcad.fijo = txtFijo.Text;
            obEstAcad.movil = txtCelular.Text;
            obEstAcad.correo = txtCorreoPer.Text;

            obEstAcad.idDireccionX = (obDireccion == null ? -1 : obDireccion.idDireccion);
            obEstAcad.idGrpFam = (obGrpFam == null ? -1 : obGrpFam.idGrpFam);
            obEstAcad.obLugNacX = obLgNac;

            try
            {
                btnOk.Enabled = false;
                obEstAcad = Task.Run(() => EstudianteAcadBridge.upsert(obEstAcad)).Result;
                forSelect();
                Vars.obPerSel = (Persona)obEstAcad;
                Utils.msg("Los datos se guardaron correctamente.", Estado.SUCCESS);
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
                btnOk.Enabled = true;
            }
        }

    }//end class

}
