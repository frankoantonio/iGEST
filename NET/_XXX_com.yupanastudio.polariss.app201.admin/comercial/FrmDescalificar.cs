using System;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmDescalificar : FrmMaster
    {
        private Informe xObInforme;
        private Atencion xObAtencion;
        private Descalifica xObDescalifica;
        private InstitucionEstudio obInstEst;

        public FrmDescalificar(Informe xObInforme, Atencion xObAtencion, Descalifica xObDescalifica, CRUD operCRUD, bool readOnly) : base(operCRUD, readOnly)
        {
            InitializeComponent();
            this.xObInforme = xObInforme;
            this.xObAtencion = xObAtencion;
            this.xObDescalifica = xObDescalifica;
            cmbMotivo.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_DESCALIFICA").OrderBy(y => y.orden).ThenBy(Z => Z.nomTipo).ToList();
            cmbTipoAtencion.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_ATENCION").OrderBy(y => y.orden).ThenBy(Z => Z.nomTipo).ToList();
        }

        private void FrmDescalificar_Load(object sender, EventArgs e)
        {
            if (xOperCRUD == CRUD.EDIT)
            {
                cmbMotivo.SelectedValue = xObDescalifica.idTipoDescalifica;
                cmbTipoAtencion.SelectedValue = xObDescalifica.idTipoAtencion;
                obInstEst = Task.Run(() => InstitucionEstudioBridge.getInstEstudioByID(xObDescalifica.idInstEst)).Result;
                txtInsEdu.Text = obInstEst?.fullInstEstX;
                txtPorque.Text = xObDescalifica.porqueInstEst;
                txtObs.Text = xObDescalifica.obs;
                if (xObDescalifica.llamarProx)
                    rbtYes.Checked = true;
                else
                    rbtNo.Checked = true;
                // deshabilitar controles
                cmbMotivo.Enabled = false;
                cmbTipoAtencion.Enabled = false;
                btnInsEdu.Enabled = false;
                txtPorque.Enabled = false;
                txtObs.Enabled = false;
                rbtYes.Enabled = false;
                rbtNo.Enabled = false;
                btnOk.Enabled = false;
            }
            else if (xOperCRUD == CRUD.NEW)
            {
                cmbMotivo.SelectedItem = null;
                cmbTipoAtencion.SelectedItem = null;
            }
        }

        private void cmbMotivo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbMotivo.SelectedItem != null && (int)cmbMotivo.SelectedValue == 2077) //2077=ELIGIÓ OTRA INSTITUCIÓN
            {
                btnInsEdu.Enabled = true;
                txtPorque.Enabled = true;
            }
            else
            {
                btnInsEdu.Enabled = false;
                txtPorque.Enabled = false;
                obInstEst = null;
                txtInsEdu.Text = "";
                txtPorque.Text = "";
            }
        }

        private void btnInsEdu_Click(object sender, EventArgs e)
        {
            this.Enabled = false;

            bool onlySchool = true; // este formulario es para informes del colegio y academia, entonces solo trabajar con colegios
            FrmInstEstudios frm = new FrmInstEstudios(onlySchool, obInstEst, this.xLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obInstEst = frm.xObInstEst;
                txtInsEdu.Text = obInstEst.fullInstEstX;
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
            if (cmbMotivo.SelectedItem == null)
            {
                Utils.msg("Selecciona el motivo de descalificación.", Estado.WARNING);
                cmbMotivo.Focus();
                return false;
            }
            if (cmbTipoAtencion.SelectedItem == null)
            {
                Utils.msg("Indica como te contactaste con el cliente.", Estado.WARNING);
                cmbTipoAtencion.Focus();
                return false;
            }
            if ((int)cmbTipoAtencion.SelectedValue == 2031)                     //2031	INTRANET
            {
                Utils.msg("Selecciona otra opción.", Estado.WARNING);
                cmbTipoAtencion.Focus();
                return false;
            }
            if ((int)cmbMotivo.SelectedValue == 2077 && obInstEst == null)      //2077	ELIGIÓ OTRA INSTITUCIÓN
            {
                Utils.msg("Indica que institución eligió.", Estado.WARNING);
                btnInsEdu.Focus();
                return false;
            }
            txtPorque.Text = Utils.allTrim_InjectCode(txtPorque.Text);
            if ((int)cmbMotivo.SelectedValue == 2077 && txtPorque.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Menciona porque eligió otra institución.", Estado.WARNING);
                txtPorque.Focus();
                return false;
            }
            if (rbtNo.Checked == false && rbtYes.Checked == false)
            {
                Utils.msg("Indica si va desear ser contactado próximamente.", Estado.WARNING);
                return false;
            }
            txtObs.Text = Utils.allTrim_InjectCode(txtObs.Text);
            if (txtObs.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Escribe alguna observación o comentario.", Estado.WARNING);
                txtObs.Focus();
                return false;
            }
            return true;
        }

        private void guardar()
        {
            if (!validarCtrls())
                return;

            if (Utils.msgQ("Estas seguro de finalizar este \"Informe\"?\nNo se podrá modificar los cambios.", Estado.YESNO) == DialogResult.No)
            {
                return;
            }

            // INFORME
            xObInforme.idTipoEstado = 2043;             //2043	DESCALIFICADO
            xObInforme.cerrado = true;

            // ATENCION
            if (xObAtencion == null)
            {
                xObAtencion = new Atencion();
                xObAtencion.idAtencion = -1;
                xObAtencion.idNegocio = Vars.obEmpresa.idEmpresa;
                xObAtencion.idInforme = xObInforme.idInforme;
                xObAtencion.fecha = new DateTime(1, 1, 1);
                xObAtencion.idVendedor = Vars.obUsuario.idUsuario;
                xObAtencion.vendedor = Vars.obUsuario.nomUsu.Substring(11, Vars.obUsuario.nomUsu.Length - 11).ToUpper();
                xObAtencion.idTipoGdoInteres = 2064;    //2064	<SIN INDICAR>
                xObAtencion.proxFecha = "";
                xObAtencion.proxHora = "";
            }
            xObAtencion.idTipoAtencion = (int)cmbTipoAtencion.SelectedValue;
            xObAtencion.obs = txtObs.Text;

            // DESCALIFICACION
            if (xOperCRUD == CRUD.NEW)
            {
                xObDescalifica = new Descalifica() { idDescalifica = -1, idInforme = xObInforme.idInforme, idAtencion = -1 };
            }
            xObDescalifica.idTipoDescalifica = (int)cmbMotivo.SelectedValue;
            xObDescalifica.idTipoAtencion = (int)cmbTipoAtencion.SelectedValue;
            xObDescalifica.idInstEst = obInstEst == null ? -1 : obInstEst.idInstEst;
            xObDescalifica.porqueInstEst = txtPorque.Text;
            xObDescalifica.obs = txtObs.Text;
            xObDescalifica.llamarProx = rbtYes.Checked;

            xObInforme.obAtencionX = xObAtencion;
            xObInforme.obDescalificaX = xObDescalifica;

            try
            {
                btnOk.Enabled = false;
                Task.Run(() => InformeBridge.upsert(xObInforme));
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