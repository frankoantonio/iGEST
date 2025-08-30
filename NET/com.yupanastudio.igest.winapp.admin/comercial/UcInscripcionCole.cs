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
    public partial class UcInscripcionCole : UcMaster
    {
        private EstudianteCole obEstCol;
        private GrupoFamiliar obGrpFam;
        private LugarNac obLgNac;
        private Direccion obDireccion;
        private List<Familiar> lsFams;
        private List<DocsEstudiante> lsDocsEst;
        private List<Inscripcion> lsInsc;
        private bool lecturaAux;

        public UcInscripcionCole()
        {
            InitializeComponent();

            dgvMatricula.AutoGenerateColumns = false;

            dgvMat_idTipoEstado.ValueMember = "idTipo";
            dgvMat_idTipoEstado.DisplayMember = "nomTipo";
            dgvMat_idTipoEstado.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_EST_MATR").ToList();
        }

        private void UcEstudianteCole_Load(object sender, EventArgs e)
        {
            cmbDocIdent.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_TI_DOC_IDENT" && x.idTipo != 41 && x.idTipo != 50).OrderBy(y => y.orden).ToList();  //41=RUC; 50=NO_DOMICILIADO
            cmbSexo.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_SEXO").OrderBy(y => y.orden).ToList();
            cmbLengua1.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_LENGUA").OrderBy(y => y.orden).ThenBy(z => z.nomTipo).ToList();
            cmbLengua2.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_LENGUA").OrderBy(y => y.orden).ThenBy(z => z.nomTipo).ToList();
            cmbReligion.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_RELIGION").OrderBy(y => y.orden).ToList();
            cmbVivTipo.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_VIVIENDA").OrderBy(y => y.orden).ToList();
            cmbVivMate.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_VIV_MATERIAL").OrderBy(y => y.orden).ToList();
            cmbVivCond.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_VIV_CONDICION").OrderBy(y => y.orden).ToList();
            cmbFamIng.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_FAM_INGRESOS").OrderBy(y => y.orden).ToList();
            cmbFamSeg.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_FAM_SEGURO").OrderBy(y => y.orden).ToList();
            cmbFamVeh.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_FAM_VEHICULO").OrderBy(y => y.orden).ToList();

            lecturaAux = Boolean.Parse(this.obOpcion.soloLectura.ToString());

            obEstCol = (Vars.obPerSel == null ? null : Task.Run(() => EstudianteColeBridge.getEstudianteColeByID(Vars.obPerSel.idPersona)).Result);
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
                obEstCol = (frm.obPersonaSel == null ? null : Task.Run(() => EstudianteColeBridge.getEstudianteColeByID(frm.obPersonaSel.idPersona)).Result);
                Vars.obPerSel = frm.obPersonaSel;

                if (frm.dbOperPublic == CRUD.SELECT)
                    forSelect();
                else if (frm.dbOperPublic == CRUD.EDIT)
                    forEdit(true);
                else if (frm.dbOperPublic == CRUD.NEW)
                    forNew();

                imgFoto.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.usuario;

                if (obEstCol != null && obEstCol.idEstCol == -1)
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
            obEstCol = (obEstCol != null ? Task.Run(() => EstudianteColeBridge.getEstudianteColeByID(obEstCol.idPersona)).Result : null);
            forSelect();
        }

        private async void imgFoto_DoubleClick(object sender, EventArgs e)
        {
            if (obEstCol != null && obEstCol.idEstCol != -1)
            {
                imgFoto.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
                imgFoto.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.load;
                try
                {
                    using (var stream = await new HttpClient().GetStreamAsync(Vars.dicVarGB["UrlFotoEst"] + obEstCol.numDocIdent + ".jpg"))
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
                if (obEstCol != null && obEstCol.numDocIdent.Substring(0, 2).Equals("SD") == true)
                    txtDocIdent.Text = obEstCol.numDocIdent;
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

            FrmDireccionFind frm = new FrmDireccionFind(obDireccion, obEstCol == null ? new EstudianteCole() { idPersona = -1, idGrpFam = obGrpFam.idGrpFam } : obEstCol, true, this.obOpcion.soloLectura);
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

            FrmFamsEst frm = new FrmFamsEst(obEstCol, obGrpFam, lsFams, this.obOpcion.soloLectura);
            frm.ShowDialog();
            lsFams = frm.xLsFams;
            setFams(lsFams);
        }

        private void lnkDocs_LinkClicked(object sender, EventArgs e)
        {
            if (!validarAux())
                return;

            FrmDocsEst frm = new FrmDocsEst(obEstCol.idPersona, lsDocsEst, false, this.obOpcion.soloLectura);
            frm.ShowDialog();
            lsDocsEst = frm.xLsDocsEst;
            setDocs(lsDocsEst);
        }

        private void btnNewInsc_Click(object sender, EventArgs e)
        {
            if (!validarAux())
                return;

            if (obEstCol.activo == false)
            {
                Utils.msg("El estudiante no está activo.", Estado.WARNING);
                return;
            }

            if (bool.Parse(Vars.dicVarGB["ReqFamiliar"]) && lsFams.Where(x => x.apoderado).Count() != 1)
            {
                Utils.msg("Se requiere indiques quien es el apoderado.", Estado.WARNING);
                return;
            }

            Informe obInfAux = Task.Run(() => InformeBridge.getInformeByPersonaActivo(obEstCol.idPersona, Vars.obEmpresa.idEmpresa)).Result;
            FrmInscripcion frm = new FrmInscripcion(lsInsc, null, obInfAux, obEstCol.idPersona, CRUD.NEW, this.obOpcion.soloLectura);
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

            FrmInscripcion frm = new FrmInscripcion(lsInsc, lsInsc[dgvMatricula.CurrentRow.Index], null, obEstCol.idPersona, CRUD.EDIT, this.obOpcion.soloLectura);
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
            btnEdit.Enabled = obEstCol != null;
            btnOk.Enabled = false;
            btnCancel.Enabled = false;

            if (obEstCol != null) estudianteActivo(obEstCol.activo);

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

            habilitarCtrl(obEstCol.activo);
            btnFind.Enabled = !obEstCol.activo;
            btnEdit.Enabled = !obEstCol.activo;
            btnOk.Enabled = obEstCol.activo;
            btnCancel.Enabled = obEstCol.activo;

            if (obEstCol != null) estudianteActivo(obEstCol.activo);

            btnCancel.Focus();

            if (obEstCol.idTipoDocIdent == 51) txtDocIdent.Enabled = false;
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

            if (obEstCol != null)
            {
                cmbDocIdent.SelectedValue = obEstCol.idTipoDocIdent;
                txtDocIdent.Text = obEstCol.numDocIdent;
                txtPaterno.Text = obEstCol.paterno;
                txtMaterno.Text = obEstCol.materno;
                txtNombres.Text = obEstCol.nombres;
                cmbSexo.SelectedValue = obEstCol.idTipoSexoX;
                obGrpFam = Task.Run(() => GrupoFamiliarBridge.getGrpFamByID(obEstCol.idGrpFam)).Result;
                txtGrpFam.Text = obGrpFam?.fullGrpFamX;
                obLgNac = obEstCol.obLugNacX;
                txtNac.Text = obLgNac?.fullLugNacX;
                obDireccion = Task.Run(() => DireccionBridge.getDireccionByID(obEstCol.idDireccionX)).Result;
                txtDir.Text = obDireccion?.fullDirX;
                txtFijo.Text = obEstCol.fijo;
                txtCelular.Text = obEstCol.movil;
                txtCorreoPer.Text = obEstCol.correo;

                if (obEstCol.idEstCol != -1)
                {
                    txtCodEst.Text = obEstCol.codEstudiante;
                    txtCorreoCole.Text = obEstCol.correoCole;
                    cmbLengua1.SelectedValue = obEstCol.idTipoLengua1;
                    cmbLengua2.SelectedValue = obEstCol.idTipoLengua2;
                    cmbReligion.SelectedValue = obEstCol.idTipoReligion;
                    nudHnosLug.Value = obEstCol.hnosLugar;
                    nudHnosTot.Value = obEstCol.hnosTotal;
                    cmbVivTipo.SelectedValue = obEstCol.idTipoViv;
                    cmbVivMate.SelectedValue = obEstCol.idTipoVivMat;
                    cmbVivCond.SelectedValue = obEstCol.idTipoVivCon;
                    cmbFamIng.SelectedValue = obEstCol.idTipoFamIng;
                    cmbFamSeg.SelectedValue = obEstCol.idTipoFamSeg;
                    cmbFamVeh.SelectedValue = obEstCol.idTipoFamVeh;
                }

                lblDataOK.Visible = obEstCol.validado;
            }
        }

        private void mostrarDatosImportantes()
        {
            if (obEstCol != null)
            {
                // familiares
                lsFams = obGrpFam == null ? new List<Familiar>() : Task.Run(() => FamiliarBridge.getFamiliaresByEst_GrpFam(obGrpFam.idGrpFam, obEstCol.idPersona)).Result;
                setFams(lsFams);

                // documentacion
                lsDocsEst = Task.Run(() => DocsEstudianteBridge.getDocsEstByID(obEstCol.idPersona, Vars.obEmpresa.idEmpresa)).Result;
                setDocs(lsDocsEst);

                // deudas 
                lblDeudaVencAlu.Text = obEstCol.deudaX[0].ToString("C2");
                lblDeudaVencGrp.Text = obEstCol.deudaX[1].ToString("C2");
                lblDeudaPendAlu.Text = obEstCol.deudaX[2].ToString("C2");
                lblDeudaPendGrp.Text = obEstCol.deudaX[3].ToString("C2");

                if (obEstCol.deudaX[1] > 0)
                    lblVencIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.inactivo;
                else
                    lblVencIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.check;

                if (obEstCol.deudaX[3] > 0)
                    lblPendIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_warning;
                else
                    lblPendIco.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.check;

                // inscripciones
                lsInsc = (Task.Run(() => InscripcionBridge.getInscripcionByEst(obEstCol.idPersona, Vars.obEmpresa.idEmpresa)).Result).OrderByDescending(x => x.feInsc).ToList();
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
            cmbLengua1.SelectedItem = null;
            cmbLengua2.SelectedItem = null;
            cmbReligion.SelectedItem = null;
            nudHnosLug.Value = 0;
            nudHnosTot.Value = 0;
            cmbVivTipo.SelectedItem = null;
            cmbVivMate.SelectedItem = null;
            cmbVivCond.SelectedItem = null;
            cmbFamIng.SelectedItem = null;
            cmbFamSeg.SelectedItem = null;
            cmbFamVeh.SelectedItem = null;

            lblDataOK.Visible = false;
            lblInactivo.Visible = false;
        }

        private void habilitarCtrl(bool b)
        {
            cmbDocIdent.Enabled = b;
            txtDocIdent.Enabled = b;
            txtCodEst.Enabled = b;
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
            cmbLengua1.Enabled = b;
            cmbLengua2.Enabled = b;
            cmbReligion.Enabled = b;
            nudHnosLug.Enabled = b;
            nudHnosTot.Enabled = b;
            cmbVivTipo.Enabled = b;
            cmbVivMate.Enabled = b;
            cmbVivCond.Enabled = b;
            cmbFamIng.Enabled = b;
            cmbFamSeg.Enabled = b;
            cmbFamVeh.Enabled = b;

            lnkFams.Enabled = !b;
            lnkDocs.Enabled = !b;
            btnNewInsc.Enabled = !b;
            btnEditInsc.Enabled = !b;

            if (obEstCol != null && obEstCol.validado) // == true
            {
                cmbDocIdent.Enabled = false;
                txtDocIdent.Enabled = false;
                txtNombres.Enabled = false;
                txtPaterno.Enabled = false;
                txtMaterno.Enabled = false;
                cmbSexo.Enabled = false;
                if (obEstCol.codEstudiante?.Length == 8 || obEstCol.codEstudiante?.Length == 14) txtCodEst.Enabled = false;
                if (obGrpFam != null) btnGrpFam.Enabled = false;
                if (obLgNac != null) btnNac.Enabled = false;
            }
        }

        private bool validarAux()
        {
            if (obEstCol == null)
            {
                Utils.msg("Se requiere un estudiante.", Estado.WARNING);
                return false;
            }

            if (obEstCol.idEstCol == -1)
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
            else if (obEstCol != null && (int)cmbDocIdent.SelectedValue == 51 && obEstCol.idTipoDocIdent != 51)
            {
                Utils.msg("Ésta persona ya tenía registrado un documento, no puedes seleccionar esta opción.", Estado.WARNING);
                cmbDocIdent.Focus();
                return false;
            }

            txtCodEst.Text = Utils.allTrim_InjectCode(txtCodEst.Text);
            if (txtCodEst.Text != "")
            {
                if (!(txtCodEst.Text.Length == 8 || txtCodEst.Text.Length == 14))
                {
                    Utils.msg("Ingresa un código de estudiante válido.", Estado.WARNING);
                    txtCodEst.Focus(); txtCodEst.SelectAll();
                    return false;
                }
                if ((int)cmbDocIdent.SelectedValue == 40 && txtCodEst.Text.Length == 8 && txtCodEst.Text != txtDocIdent.Text) //40=DNI
                {
                    Utils.msg("El código de estudiante no está igual que el DNI.", Estado.WARNING);
                    txtCodEst.Focus(); txtCodEst.SelectAll();
                    return false;
                }
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

            if (cmbLengua1.SelectedItem == null)
            {
                Utils.msg("Selecciona el idioma materno.", Estado.WARNING);
                cmbLengua1.Focus();
                return false;
            }
            if ((int)cmbLengua1.SelectedValue == 198 || (int)cmbLengua1.SelectedValue == 197)   //198=ninguno; 197=sin_indicar
            {
                Utils.msg("Selecciona un idioma válido.", Estado.WARNING);
                cmbLengua1.Focus();
                return false;
            }
            if (cmbLengua2.SelectedItem == null)
            {
                Utils.msg("Indica si habla otro idioma.", Estado.WARNING);
                cmbLengua2.Focus();
                return false;
            }
            if ((int)cmbLengua1.SelectedValue == (int)cmbLengua2.SelectedValue)
            {
                Utils.msg("El idioma materno y segundo idioma no pueden ser iguales.", Estado.WARNING);
                cmbLengua2.Focus();
                return false;
            }

            if (cmbReligion.SelectedItem == null)
            {
                Utils.msg("Indica la religión que profesa.", Estado.WARNING);
                cmbReligion.Focus();
                return false;
            }

            if ((int)nudHnosLug.Value <= 0)
            {
                Utils.msg("El valor no puede ser cero.", Estado.WARNING);
                nudHnosLug.Focus();
                return false;
            }
            if ((int)nudHnosTot.Value <= 0)
            {
                Utils.msg("El valor no puede ser cero.", Estado.WARNING);
                nudHnosTot.Focus();
                return false;
            }
            if ((int)nudHnosLug.Value > (int)nudHnosTot.Value)
            {
                Utils.msg("El lugar de hermano no puede ser mayor al total de hermanos.", Estado.WARNING);
                return false;
            }

            if (cmbVivTipo.SelectedItem == null)
            {
                Utils.msg("Indica el tipo de la vivienda.", Estado.WARNING);
                cmbVivTipo.Focus();
                return false;
            }
            if (cmbVivMate.SelectedItem == null)
            {
                Utils.msg("Indica el material de la vivienda.", Estado.WARNING);
                cmbVivMate.Focus();
                return false;
            }
            if (cmbVivCond.SelectedItem == null)
            {
                Utils.msg("Indica la condición de la vivienda.", Estado.WARNING);
                cmbVivCond.Focus();
                return false;
            }
            if (cmbFamIng.SelectedItem == null)
            {
                Utils.msg("Indica el rango del ingreso mensual familiar.", Estado.WARNING);
                cmbFamIng.Focus();
                return false;
            }
            if (cmbFamSeg.SelectedItem == null)
            {
                Utils.msg("Indica el tipo de seguro de salud.", Estado.WARNING);
                cmbFamSeg.Focus();
                return false;
            }
            if (cmbFamVeh.SelectedItem == null)
            {
                Utils.msg("Indica con que medio de transporte se moviliza.", Estado.WARNING);
                cmbFamVeh.Focus();
                return false;
            }

            return true;
        }

        private void guardar()
        {
            if (!validarCtrl())
                return;

            if (obEstCol == null)
            {
                obEstCol = new EstudianteCole();
                obEstCol.idEstCol = -1;
                obEstCol.activo = true;
                obEstCol.codEstudiante = "";
                obEstCol.correoCole = "";

                obEstCol.idPersona = -1;
                obEstCol.idTipoPersona = 10;    // siempre persona
                obEstCol.numRucPerNat = "";
                obEstCol.sigla = "";
                obEstCol.idTipoEstCivX = 30;     // soltero
                obEstCol.validado = false;
                obEstCol.idEmpresa = Vars.obEmpresa.idEmpresa;
                obEstCol.idTipoSitEducX = 81;    // sin indicar
                obEstCol.idInstEst = -1;
            }

            obEstCol.codEstudiante = txtCodEst.Text;
            obEstCol.idTipoLengua1 = (int)cmbLengua1.SelectedValue;
            obEstCol.idTipoLengua2 = (int)cmbLengua2.SelectedValue;
            obEstCol.idTipoReligion = (int)cmbReligion.SelectedValue;
            obEstCol.hnosLugar = (int)nudHnosLug.Value;
            obEstCol.hnosTotal = (int)nudHnosTot.Value;
            obEstCol.idTipoViv = (int)cmbVivTipo.SelectedValue;
            obEstCol.idTipoVivMat = (int)cmbVivMate.SelectedValue;
            obEstCol.idTipoVivCon = (int)cmbVivCond.SelectedValue;
            obEstCol.idTipoFamIng = (int)cmbFamIng.SelectedValue;
            obEstCol.idTipoFamSeg = (int)cmbFamSeg.SelectedValue;
            obEstCol.idTipoFamVeh = (int)cmbFamVeh.SelectedValue;

            obEstCol.idTipoSexoX = (int)cmbSexo.SelectedValue;
            obEstCol.idTipoDocIdent = (int)cmbDocIdent.SelectedValue;
            obEstCol.numDocIdent = txtDocIdent.Text;
            obEstCol.paterno = txtPaterno.Text;
            obEstCol.materno = txtMaterno.Text;
            obEstCol.nombres = txtNombres.Text;
            obEstCol.fijo = txtFijo.Text;
            obEstCol.movil = txtCelular.Text;
            obEstCol.correo = txtCorreoPer.Text;

            obEstCol.idDireccionX = (obDireccion == null ? -1 : obDireccion.idDireccion);
            obEstCol.idGrpFam = (obGrpFam == null ? -1 : obGrpFam.idGrpFam);
            obEstCol.obLugNacX = obLgNac;

            try
            {
                btnOk.Enabled = false;
                obEstCol = Task.Run(() => EstudianteColeBridge.upsert(obEstCol)).Result;
                forSelect();
                Vars.obPerSel = (Persona)obEstCol;
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
