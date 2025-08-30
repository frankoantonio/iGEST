using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmInstEstudios : FrmMaster
    {
        private List<InstitucionEstudio> lsInstEst;     // lista de instituciones
        private bool yaBusco = false;                   // true; indica que realizó la búsqueda
        private CRUD operInterna;                       // indica si va registrar o modificar una institución
        private bool xOnlySchool = false;               // indica si solo se va seleccionar/operar colegios/escuelas
        public InstitucionEstudio xObInstEst = null;    // objeto que se recibe/selecciona

        public FrmInstEstudios(bool xOnlySchool, InstitucionEstudio xObInstEst, bool xReadOnly) : base(CRUD.SELECT, xReadOnly)
        {
            InitializeComponent();

            this.xOnlySchool = xOnlySchool;
            this.xObInstEst = xObInstEst;

            if (xReadOnly) this.setLectura();          // deshabilita botones con tag "btnOK"

            dgvInst.AutoGenerateColumns = false;

            dgvInst_idTipoInst.ValueMember = "idTipo";
            dgvInst_idTipoInst.DisplayMember = "nomTipo";
            dgvInst_idTipoInst.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_INST_ESTUDIO").OrderBy(y => y.orden).ToList();

            cmbTipoInst.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_INST_ESTUDIO").OrderBy(y => y.orden).ToList();
            cmbTipoInst.SelectedItem = null;

            setLsOneItem();

            txtFind.Select();
        }

        private void txtFind_KeyDown(object sender, System.Windows.Forms.KeyEventArgs e)
        {
            if (dgvInst.Rows.Count > 0 && (e.KeyCode == Keys.Down))
            {
                dgvInst.Focus();
                dgvInst.CurrentCell = dgvInst.Rows[0].Cells[1];
            }
        }

        private void txtFind_KeyPress(object sender, System.Windows.Forms.KeyPressEventArgs e)
        {
            if (e.KeyChar == Convert.ToChar(Keys.Enter))
                busqueda();
        }

        private void txtFind_Enter(object sender, EventArgs e)
        {
            txtFind.SelectAll();
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            busqueda();
        }

        private void dgvInst_KeyDown(object sender, KeyEventArgs e)
        {
            if (dgvInst.Rows.Count > 0 && dgvInst.CurrentRow.Index == 0 && e.KeyCode == Keys.Up)
                txtFind.Focus();
        }

        private void dgvInst_SelectionChanged(object sender, EventArgs e)
        {
            if (dgvInst.CurrentRow != null && lsInstEst.Count > 0)
            {
                //cuando una lista de varios elementos pasa a una lista con menos elementos
                int ix = (dgvInst.CurrentRow.Index > lsInstEst.Count - 1 ? 0 : dgvInst.CurrentRow.Index);
                xObInstEst = lsInstEst[ix];
                cmbTipoInst.SelectedValue = xObInstEst.idTipoInst;
                txtSigla.Text = xObInstEst.sigla;
                txtNombre.Text = xObInstEst.nombre;
                txtCiudad.Text = xObInstEst.ciudad;
            }
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            if (!yaBusco)
            {
                Utils.msg("Antes de crear un nuevo registro, primero búscalo.", Estado.WARNING);
                txtFind.Focus();
                return;
            }

            habilitarCtrl(true);
            limpiarCtrls();

            if (xOnlySchool)
            {
                cmbTipoInst.SelectedValue = 150;   //150 = COLEGIO o ESCUELA
                txtSigla.Focus();
            }
            else
                cmbTipoInst.Focus();

            lblOper.Text = "";
            lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_add;
            operInterna = CRUD.NEW;
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (dgvInst.CurrentRow == null)
            {
                Utils.msg("Se requiere un registro seleccionado.", Estado.WARNING);
                return;
            }
            if (xOnlySchool && (int)dgvInst.CurrentRow.Cells["dgvInst_idTipoInst"].Value != 150)
            {
                Utils.msg("Solo puedes modificar un \"Colegio/Escuela\".", Estado.WARNING);
                txtFind.Focus();
                return;
            }
            if (dgvInst.CurrentRow != null)
            {
                if ((int)dgvInst.CurrentRow.Cells["dgvInst_countUsoX"].Value >= int.Parse(Vars.dicVarGB["EditObjectSi"]))
                {
                    Utils.msg("El registro seleccionado está siendo utilizado por varias personas, no se podrá modificar.", Estado.WARNING);
                    return;
                }
                habilitarCtrl(true);
                if (xOnlySchool)
                    txtSigla.Focus();
                else
                    cmbTipoInst.Focus();
                lblOper.Text = "";
                lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
                operInterna = CRUD.EDIT;
                return;
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (!validarCtrls())
                return;

            if (operInterna == CRUD.NEW)
                xObInstEst = new InstitucionEstudio() { idInstEst = -1 };
            xObInstEst.idTipoInst = (int)cmbTipoInst.SelectedValue;
            xObInstEst.sigla = txtSigla.Text;
            xObInstEst.nombre = txtNombre.Text;
            xObInstEst.ciudad = txtCiudad.Text;

            try
            {
                btnSave.Enabled = false;

                xObInstEst = Task.Run(() => InstitucionEstudioBridge.upsert(xObInstEst)).Result;

                habilitarCtrl(false);
                lblOper.Text = "[SELECCIÓN]";
                lblOper.Image = null;

                setLsOneItem();
                yaBusco = false;
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
            }
            btnSave.Enabled = true;
        }

        private void btnCancelOper_Click(object sender, EventArgs e)
        {
            habilitarCtrl(false);
            lblOper.Text = "[SELECCIÓN]";
            lblOper.Image = null;
            limpiarCtrls();
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            seleccionar();
        }

        //
        // Métodos
        //
        private bool validarCtrls()
        {
            if (cmbTipoInst.SelectedItem == null)
            {
                Utils.msg("Selecciona el tipo de institución.", Estado.WARNING);
                cmbTipoInst.Focus();
                return false;
            }

            txtSigla.Text = Utils.allTrim_InjectCode(txtSigla.Text);

            txtNombre.Text = Utils.allTrim_InjectCode(txtNombre.Text);
            if (txtNombre.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Se requiere al menos " + Vars.dicVarGB["MinCarInput"] + " caracteres.", Estado.WARNING);
                txtNombre.Focus();
                return false;
            }

            txtCiudad.Text = Utils.allTrim_InjectCode(txtCiudad.Text);

            return true;
        }

        private bool validarBusqueda()
        {
            txtFind.Text = Utils.allTrim_InjectCode(txtFind.Text);

            if (txtFind.Text.Length < int.Parse(Vars.dicVarGB["MinCarFind"]))
            {
                Utils.msg("Se requiere como mínimo " + Vars.dicVarGB["MinCarFind"] + " caracteres.", Estado.WARNING);
                limpiarCtrls();
                return false;
            }

            return true;
        }

        private void busqueda()
        {
            if (!validarBusqueda())
                return;

            limpiarCtrls();

            lsInstEst = Task.Run(() => InstitucionEstudioBridge.getInstEstudioByNoms(txtFind.Text)).Result;
            dgvInst.DataSource = lsInstEst;

            if (lsInstEst.Count > 0)
            {
                dgvInst.Focus();
                dgvInst.CurrentCell = dgvInst.Rows[0].Cells[1];
            }
            else
            {
                if (lsInstEst.Count < 1)
                {
                    Utils.msg("No se encontró resultados.\nPuedes crear una nueva institución de estudio.", Estado.WARNING);
                }
            }
            yaBusco = true;
        }

        private void limpiarCtrls()
        {
            dgvInst.DataSource = lsInstEst = new List<InstitucionEstudio>();
            cmbTipoInst.SelectedItem = null;
            txtSigla.Text = "";
            txtNombre.Text = "";
            txtCiudad.Text = "";
            txtFind.Focus();
            yaBusco = false;
        }

        private void habilitarCtrl(bool b)
        {
            txtFind.Enabled = !b;
            btnFind.Enabled = !b;
            btnNew.Visible = !b;
            btnEdit.Visible = !b;
            btnSave.Visible = b;
            btnCancelOper.Visible = b;
            dgvInst.Enabled = !b;
            if (!xOnlySchool) cmbTipoInst.Enabled = b;
            txtSigla.Enabled = b;
            txtNombre.Enabled = b;
            txtCiudad.Enabled = b;
            btnOk.Enabled = !b;
            btnCancel.Enabled = !b;
        }

        private void seleccionar()
        {
            if (dgvInst.CurrentRow == null)
            {
                Utils.msg("Se requiere un registro seleccionado.", Estado.WARNING);
                txtFind.Focus();
                return;
            }
            if (xOnlySchool && (int)dgvInst.CurrentRow.Cells["dgvInst_idTipoInst"].Value != 150)
            {
                Utils.msg("Se espera selecciones un \"Colegio/Escuela\".", Estado.WARNING);
                txtFind.Focus();
                return;
            }
            xObInstEst = lsInstEst[dgvInst.CurrentRow.Index];
            operOK = true;
            this.Dispose();
        }

        private void setLsOneItem()
        {
            if (xObInstEst != null && xObInstEst.idInstEst != -1)
            {
                lsInstEst = new List<InstitucionEstudio>() { xObInstEst };
                txtFind.Text = xObInstEst.nombre;
                dgvInst.DataSource = lsInstEst;
            }
        }

    }//end class

}
