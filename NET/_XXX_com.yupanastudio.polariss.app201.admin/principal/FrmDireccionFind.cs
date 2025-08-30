using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmDireccionFind : FrmMaster
    {
        private List<Direccion> lsDir;
        private bool yaBusco = false;           // true; indica que realizó la búsqueda
        public Direccion xObDir = null;         // objeto que llega y también el que se va seleccionar
        public Persona xObPersona = null;       // para determinar los familiares de esta persona, siempre mandar un valor no nulo

        public FrmDireccionFind(Direccion xObDir, Persona xObPersona, bool xShowDirsFams, bool xLectura) : base(CRUD.SELECT, xLectura)
        {
            InitializeComponent();

            this.xObDir = xObDir;
            this.xObPersona = xObPersona;

            dgvDir.AutoGenerateColumns = false;

            if (xShowDirsFams)
            {
                rbtGrpFam.Checked = xShowDirsFams;
                rbtGrpFam.Visible = xShowDirsFams;
            }
            else if (xObDir != null)
            {
                txtFind.Text = xObDir.nomVia;
                dgvDir.DataSource = lsDir = new List<Direccion>() { xObDir };
            }
        }

        private void rbtVia_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtVia.Checked)
            {
                dgvDir.DataSource = lsDir = new List<Direccion>();
                txtFind.Select();
                txtFind.Enabled = rbtVia.Checked;
                btnFind.Enabled = rbtVia.Checked;
            }
        }

        private void rbtGrpFam_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtGrpFam.Checked)
            {
                txtFind.Text = "";
                busqueda();
                yaBusco = false;
                txtFind.Enabled = rbtVia.Checked;
                btnFind.Enabled = rbtVia.Checked;
            }
        }

        private void txtFind_Enter(object sender, EventArgs e)
        {
            txtFind.SelectAll();
        }

        private void txtFind_KeyPress(object sender, System.Windows.Forms.KeyPressEventArgs e)
        {
            if (e.KeyChar == Convert.ToChar(Keys.Enter))
                busqueda();
        }

        private void txtFind_KeyDown(object sender, System.Windows.Forms.KeyEventArgs e)
        {
            if (dgvDir.Rows.Count > 0 && (e.KeyCode == Keys.Down))
            {
                dgvDir.Focus();
                dgvDir.CurrentCell = dgvDir.Rows[0].Cells[1];
            }
            else if ((e.KeyCode == Keys.Up))
            {
                rbtVia.Focus();
            }
        }

        private void dgvDir_KeyDown(object sender, KeyEventArgs e)
        {
            if (dgvDir.Rows.Count > 0 && dgvDir.CurrentRow.Index == 0 && e.KeyCode == Keys.Up)
            {
                if (rbtVia.Checked)
                    txtFind.Focus();
                else
                    rbtGrpFam.Focus();
            }
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            busqueda();
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            if (!yaBusco)
            {
                Utils.msg("Antes de crear un nuevo registro, primero búscalo.", Estado.WARNING);
                rbtVia.Checked = true;
                txtFind.Select();
                return;
            }

            this.Enabled = false;

            FrmDireccion frm = new FrmDireccion(null, CRUD.NEW, this.xLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                rbtVia.Checked = true;
                txtFind.Text = frm.obDirNew.nomVia;
                dgvDir.DataSource = lsDir = new List<Direccion>() { frm.obDirNew };
            }

            this.Enabled = true;
            yaBusco = false;
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (dgvDir.CurrentRow != null)
            {
                this.Enabled = false;

                if ((int)dgvDir.CurrentRow.Cells["dgvDir_countUsoX"].Value > 1)
                    Utils.msg("El registro seleccionado está siendo utilizado por varias personas, no se podrá modificar.", Estado.WARNING);

                bool rO = this.xLectura;
                if (!this.xLectura)
                    rO = (int)dgvDir.CurrentRow.Cells["dgvDir_countUsoX"].Value > 1;

                FrmDireccion frm = new FrmDireccion(lsDir[dgvDir.CurrentRow.Index], CRUD.EDIT, rO);
                frm.ShowDialog();
                if (frm.operOK)
                {
                    rbtVia.Checked = true;
                    txtFind.Text = frm.obDirNew.nomVia;
                    dgvDir.DataSource = lsDir = new List<Direccion>() { frm.obDirNew };
                }

                this.Enabled = true;
                yaBusco = false;
            }
            else
            {
                Utils.msg("Se requiere un registro seleccionado.", Estado.WARNING);
            }
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            seleccionar();
        }

        //
        // Métodos
        //
        private void seleccionar()
        {
            if (dgvDir.CurrentRow == null)
            {
                Utils.msg("Se requiere un registro seleccionado.", Estado.WARNING);
                txtFind.Focus();
                return;
            }

            xObDir = lsDir[dgvDir.CurrentRow.Index];
            operOK = true;
            this.Dispose();
        }

        private bool validarBusqueda()
        {
            txtFind.Text = Utils.allTrim_InjectCode(txtFind.Text);

            if (rbtVia.Checked && txtFind.Text.Length < int.Parse(Vars.dicVarGB["MinCarFind"]))
            {
                Utils.msg("Se requiere como mínimo " + Vars.dicVarGB["MinCarFind"] + " caracteres.", Estado.WARNING);
                txtFind.Select();
                return false;
            }

            return true;
        }

        private void busqueda()
        {
            if (!validarBusqueda())
                return;

            if (rbtVia.Checked)
                lsDir = Task.Run(() => DireccionBridge.getDireccionByNoms(Vars.obEmpresa.idEmpresa, txtFind.Text)).Result;
            else
                lsDir = Task.Run(() => DireccionBridge.getDireccionByFamsAll(xObPersona.idPersona, xObPersona.idGrpFam)).Result;

            dgvDir.DataSource = lsDir;
            if (lsDir.Count > 0)
            {
                dgvDir.Focus();
                dgvDir.CurrentCell = dgvDir.Rows[0].Cells[1];
            }
            else
            {
                if (rbtVia.Checked)
                    Utils.msg("No se encontró resultados.\nPuedes crear una nueva dirección.", Estado.WARNING);
                if (rbtVia.Checked) txtFind.Select();
            }
            yaBusco = true;
        }

    }//end class

}
