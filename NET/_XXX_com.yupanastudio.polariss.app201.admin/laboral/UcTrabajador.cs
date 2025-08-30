using System;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Http;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
{
    public partial class UcTrabajador : UcMaster
    {
        private CRUD operCrud;
        private Trabajador obTrab;

        public UcTrabajador()
        {
            InitializeComponent();
        }

        private async void UcTrabajador_Load(object sender, EventArgs e)
        {
            cmbDocIdent.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_TI_DOC_IDENT" && x.idTipo != 41 && x.idTipo != 50).OrderBy(y => y.orden).ToList();  //41=RUC; 50=NO_DOMICILIADO
            cmbTratamiento.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_TITULO").OrderBy(y => y.orden).ThenBy(z => z.nomTipo).ToList();
            cmbSexo.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_SEXO").OrderBy(y => y.orden).ToList();
            cmbEstCivil.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_TI_EST_CIV").OrderBy(y => y.orden).ToList();
            cmbSitEdu.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_TI_SIT_EDUC").OrderBy(y => y.orden).ToList();
            cmbJorLab.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_JORNLAB").OrderBy(y => y.orden).ToList();
            cmbCatTrab.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_CATTRAB").OrderBy(y => y.orden).ToList();

            limpiar();
            habilitarCtrl(false);

            if (!(obTrab == null || obTrab.idTrabajador == -1))
            {
                obTrab = await TrabajadorBridge.getTrabajadorByID(obTrab.obPerX.idPersona);
                mostrarTrabajador(obTrab);
                btnEdit.Enabled = true;
            }
        }

        private async void btnFind_Click(object sender, EventArgs e)
        {
            FrmPersonaFind frm = new FrmPersonaFind(10, true, true, true, this.obOpcion.soloLectura);
            //FrmPersonaFind frm = new FrmPersonaFind(10, true, true, true);
            frm.ShowDialog();
            if (frm.operOK)
            {
                limpiar();
                operCrud = frm.dbOperPublic;

                if (operCrud == CRUD.SELECT)
                {
                    habilitarCtrl(false);
                    habilitarBtnCtrl(true);
                }
                else
                {
                    habilitarCtrl(true);
                    habilitarBtnCtrl(false);
                    lblSubtitle.Text = (operCrud == CRUD.EDIT ? "[MODIFICAR TRABAJADOR]" : "[AGREGAR NUEVO TRABAJADOR]");
                }

                if (frm.obPersonaSel != null)
                {
                    Cursor.Current = Cursors.WaitCursor;
                    obTrab = await TrabajadorBridge.getTrabajadorByID(frm.obPersonaSel.idPersona);
                    mostrarTrabajador(obTrab);
                    Cursor.Current = Cursors.Default;
                }
                else
                {
                    obTrab = new Trabajador()
                    {
                        idTrabajador = -1,
                        idInstEst = -1,
                        obPerX = new Persona() { idPersona = -1, idDireccionX = -1, validado = false }
                    };
                    imgFoto.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.usuario;
                }
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            operCrud = CRUD.EDIT;
            lblSubtitle.Text = "[MODIFICAR TRABAJADOR]";
            habilitarCtrl(true);
            habilitarBtnCtrl(false);

            habilitarDatoOk(obTrab);
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            guardar();
        }

        private async void btnCancel_Click(object sender, EventArgs e)
        {
            operCrud = CRUD.SELECT;
            lblSubtitle.Text = "Registro de trabajadores";

            limpiar();
            habilitarCtrl(false);
            habilitarBtnCtrl(true);
            btnEdit.Enabled = false;

            if (!(obTrab == null || obTrab.idTrabajador == -1))
            {
                obTrab = await TrabajadorBridge.getTrabajadorByID(obTrab.obPerX.idPersona);
                mostrarTrabajador(obTrab);
                btnEdit.Enabled = true;
            }
        }

        private void btnNac_Click(object sender, EventArgs e)
        {
            CRUD op = ((obTrab?.obLugNacX) != null ? CRUD.EDIT : CRUD.NEW);
            FrmLugNac frm = new FrmLugNac(obTrab?.obLugNacX, op, false);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obTrab.obLugNacX = frm.obLgNc;
                txtNac.Text = obTrab.obLugNacX.fullLugNacX;
            }
        }

        private void btnDireccion_Click(object sender, EventArgs e)
        {
            CRUD op = ((obTrab?.obDirX) != null ? CRUD.EDIT : CRUD.NEW);
            FrmDireccion frm = new FrmDireccion(obTrab?.obDirX, op, false);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obTrab.obDirX = frm.obDirNew;
                txtDir.Text = obTrab.obDirX.fullDirX;
                //   obTrab.obDirX
            }
        }


        private void btnDirDel_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == Utils.msgQ("Está seguro de quitar la dirección?\nGuarde los cambios.", Estado.YESNO))
            {
                obTrab.obDirX = null;
                obTrab.obPerX.idDireccionX = -1;
                txtDir.Text = "";
            }
        }

        private void btnInstEgr_Click(object sender, EventArgs e)
        {
            FrmInstEstudios frm = new FrmInstEstudios(false, null, false);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obTrab.idInstEst = frm.xObInstEst.idInstEst;
                txtInsEgr.Text = frm.xObInstEst.fullInstEstX;
            }
        }

        private void btnInsEgrDel_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == Utils.msgQ("Está seguro de quitar la institución de estudio?\nGuarde los cambios.", Estado.YESNO))
            {
                obTrab.idInstEst = -1;
                txtInsEgr.Text = "";
            }
        }

        private async void cmbCatTrab_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbCatTrab.SelectedItem != null)
            {
                cmbClaseTrab.DataSource = await TrabClaseBridge.getTrabClaseByEmp(Vars.obEmpresa.idEmpresa, (int)cmbCatTrab.SelectedValue);
                cmbClaseTrab.SelectedItem = null;
                if (!(obTrab == null || obTrab.idTrabajador == -1))
                    cmbClaseTrab.SelectedValue = obTrab.idClaseTrab;
            }
        }

        //
        // Métodos
        //
        private void limpiar()
        {
            cmbDocIdent.SelectedItem = null;
            txtDocIdent.Text = "";
            cmbTratamiento.SelectedItem = null;
            txtNombres.Text = "";
            txtPaterno.Text = "";
            txtMaterno.Text = "";
            cmbSexo.SelectedItem = null;
            cmbEstCivil.SelectedItem = null;
            txtNac.Text = "";
            txtDir.Text = "";
            txtFijo.Text = "";
            txtCelular.Text = "";
            txtCorreoPer.Text = "";
            txtCorreoLab.Text = "";
            cmbSitEdu.SelectedItem = null;
            txtInsEgr.Text = "";
            txtProfesion.Text = "";
            txtOcupacion.Text = "";
            chbActivo.Checked = false;
            rbtPlanilla.Checked = false;
            rbtRecibo.Checked = false;
            cmbJorLab.SelectedItem = null;
            cmbCatTrab.SelectedItem = null;
            cmbClaseTrab.SelectedItem = null;
            txtRUC.Text = "";
            txtObs.Text = "";
        }

        private void habilitarCtrl(bool b)
        {
            cmbDocIdent.Enabled = b;
            txtDocIdent.Enabled = b;
            cmbTratamiento.Enabled = b;
            txtNombres.Enabled = b;
            txtPaterno.Enabled = b;
            txtMaterno.Enabled = b;
            cmbSexo.Enabled = b;
            cmbEstCivil.Enabled = b;
            btnNac.Enabled = b;
            btnDir.Enabled = b;
            btnDirDel.Enabled = b;
            txtFijo.Enabled = b;
            txtCelular.Enabled = b;
            txtCorreoPer.Enabled = b;
            txtCorreoLab.Enabled = b;
            cmbSitEdu.Enabled = b;
            btnInsEgr.Enabled = b;
            btnInsEgrDel.Enabled = b;
            txtProfesion.Enabled = b;
            txtOcupacion.Enabled = b;
            chbActivo.Enabled = b;
            rbtPlanilla.Enabled = b;
            rbtRecibo.Enabled = b;
            cmbJorLab.Enabled = b;
            cmbCatTrab.Enabled = b;
            cmbClaseTrab.Enabled = b;
            txtRUC.Enabled = b;
            txtObs.Enabled = b;
        }

        private void habilitarBtnCtrl(bool b)
        {
            btnFind.Enabled = b;
            btnEdit.Enabled = b;
            btnOk.Enabled = !b;
            btnCancel.Enabled = !b;
        }

        private async void mostrarTrabajador(Trabajador obTrab)
        {
            if (obTrab != null)
            {
                if (obTrab.obPerX != null)
                {
                    cmbDocIdent.SelectedValue = obTrab.obPerX.idTipoDocIdent;
                    txtDocIdent.Text = obTrab.obPerX.numDocIdent;
                    txtNombres.Text = obTrab.obPerX.nombres;
                    txtPaterno.Text = obTrab.obPerX.paterno;
                    txtMaterno.Text = obTrab.obPerX.materno;
                    cmbSexo.SelectedValue = obTrab.obPerX.idTipoSexoX;
                    txtFijo.Text = obTrab.obPerX.fijo;
                    txtCelular.Text = obTrab.obPerX.movil;
                    txtCorreoPer.Text = obTrab.obPerX.correo;
                    txtRUC.Text = obTrab.obPerX.numRucPerNat;
                }

                if (obTrab.obLugNacX != null)
                    txtNac.Text = obTrab.obLugNacX.fullLugNacX;
                if (obTrab.obDirX != null)
                    txtDir.Text = obTrab.obDirX.fullDirX;

                if (obTrab.idTrabajador != -1)
                {
                    cmbTratamiento.SelectedValue = obTrab.idTipoTitulo;
                    cmbEstCivil.SelectedValue = obTrab.idTipoEstCivil;
                    txtCorreoLab.Text = obTrab.correoLab;
                    cmbSitEdu.SelectedValue = obTrab.idTipoSitEdu;
                    txtProfesion.Text = obTrab.profesion;
                    txtOcupacion.Text = obTrab.ocupacion;
                    chbActivo.Checked = obTrab.activo;
                    rbtPlanilla.Checked = (obTrab.idTipoVincLab == 650);    // 650=planilla_remuneracion
                    rbtRecibo.Checked = (obTrab.idTipoVincLab == 651);      // 651=recibo_honorarios
                    cmbJorLab.SelectedValue = obTrab.idTipoJornLab;
                    cmbCatTrab.SelectedValue = obTrab.idTipoCatTrab;
                    txtObs.Text = obTrab.observacion;
                    //cmbClaseTrab.SelectedValue = obTrab.idClaseTrab;      // acá no funciona, se pasó al método "cmbCatTrab_SelectedIndexChanged"

                    //if (obTrab.idInstEst != -1)
                    //    txtInsEgr.Text = (await InstitucionEstudioBridge.getInstEstudioByID(obTrab.idInstEst)).fullInstEstX;

                    // cargar imagen de usuario
                    try
                    {
                        HttpClient client = new HttpClient();
                        using (var stream = await client.GetStreamAsync(Vars.dicVarGB["UrlFotoTrab"] + obTrab.obPerX.numDocIdent + ".jpg"))
                        {
                            imgFoto.Image = Bitmap.FromStream(stream);
                        }
                    }
                    catch (Exception)
                    {
                        imgFoto.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.usuario;
                    }
                }
                else
                {
                    Utils.msg("Falta completar sus datos del trabajador.\nActualícelo!", Estado.WARNING);
                    imgFoto.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.usuario;
                }
            }
            else
            {
                imgFoto.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.usuario;
            }
            habilitarDatoOk(obTrab);
        }

        private void habilitarDatoOk(Trabajador obTrab)
        {
            // si datos validados, deshabilitar
            if (obTrab?.obPerX.validado == true)
            {
                cmbDocIdent.Enabled = false;
                txtDocIdent.Enabled = false;
                txtNombres.Enabled = false;
                txtPaterno.Enabled = false;
                txtMaterno.Enabled = false;
                if (txtRUC.Text != "")
                {
                    txtRUC.Enabled = false;
                }
            }
        }

        private bool validarCtrl()
        {


            return true;
        }

        private async void guardar()
        {
            if (!validarCtrl())
                return;

            obTrab.idTipoTitulo = (int)cmbTratamiento.SelectedValue;
            obTrab.idTipoEstCivil = (int)cmbEstCivil.SelectedValue;
            obTrab.idTipoSitEdu = (int)cmbSitEdu.SelectedValue;
            obTrab.idInstEst = obTrab?.idInstEst ?? -1;
            obTrab.correoLab = txtCorreoLab.Text;
            obTrab.profesion = txtProfesion.Text;
            obTrab.ocupacion = txtOcupacion.Text;
            obTrab.activo = chbActivo.Checked;
            obTrab.idTipoVincLab = rbtPlanilla.Checked ? 650 : 651; // 650=planilla_remuneracion  ;  651=recibo_honorario
            obTrab.idTipoJornLab = (int)cmbJorLab.SelectedValue;
            obTrab.idTipoCatTrab = (int)cmbCatTrab.SelectedValue;
            obTrab.idClaseTrab = (int)cmbClaseTrab.SelectedValue;
            obTrab.observacion = txtObs.Text;

            obTrab.obPerX.idTipoPersona = 10;                       // siempre persona
            obTrab.obPerX.idTipoSexoX = (int)cmbSexo.SelectedValue;
            obTrab.obPerX.idTipoDocIdent = (int)cmbDocIdent.SelectedValue;
            obTrab.obPerX.numDocIdent = txtDocIdent.Text;
            obTrab.obPerX.numRucPerNat = txtRUC.Text;
            obTrab.obPerX.paterno = txtPaterno.Text;
            obTrab.obPerX.materno = txtMaterno.Text;
            obTrab.obPerX.nombres = txtNombres.Text;
            obTrab.obPerX.sigla = "";                               // en blanco
            obTrab.obPerX.fijo = txtFijo.Text;
            obTrab.obPerX.movil = txtCelular.Text;
            obTrab.obPerX.correo = txtCorreoPer.Text;
            obTrab.obPerX.idEmpresa = Vars.obEmpresa.idEmpresa;

            try
            {
                btnOk.Enabled = false;
                Cursor.Current = Cursors.WaitCursor;

                await TrabajadorBridge.upsert(obTrab);

                btnOk.Enabled = true;
                Cursor.Current = Cursors.Default;

                //txtFind.Text = ob.nombre;
                //habilitarCtrl(false);
                //lblOper.Text = "[SELECCIÓN]";
                //lblOper.Image = null;

                //busqueda();
                //yaBusco = false;

                operCrud = CRUD.SELECT;
                lblSubtitle.Text = "Registro de trabajadores";

                habilitarCtrl(false);
                habilitarBtnCtrl(true);
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
            }
        }

    }//end class

}
