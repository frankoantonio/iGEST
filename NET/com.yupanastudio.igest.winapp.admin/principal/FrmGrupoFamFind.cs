using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmGrupoFamFind : FrmMaster
    {
        private List<GrupoFamiliar> lsGrpFam;       // lista de grupos familiares
        private bool yaBusco = false;               // true; indica que realizó la búsqueda
        public GrupoFamiliar xObGrpFam = null;      // objeto que se va seleccionar        

        public FrmGrupoFamFind(GrupoFamiliar xObGrpFam, bool xReadOnly) : base(CRUD.SELECT, xReadOnly)
        {
            InitializeComponent();

            this.xObGrpFam = xObGrpFam;

            dgvGrpFam.AutoGenerateColumns = false;

            if (xObGrpFam != null)
            {
                lsGrpFam = new List<GrupoFamiliar>() { xObGrpFam };
                txtFind.Text = xObGrpFam.nomGrpFam;
                dgvGrpFam.DataSource = lsGrpFam;
            }

            txtFind.Select();
        }

        private void txtFind_KeyDown(object sender, System.Windows.Forms.KeyEventArgs e)
        {
            if (dgvGrpFam.Rows.Count > 0 && (e.KeyCode == Keys.Down))
            {
                dgvGrpFam.Focus();
                dgvGrpFam.CurrentCell = dgvGrpFam.Rows[0].Cells[1];
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
            if (dgvGrpFam.Rows.Count > 0 && dgvGrpFam.CurrentRow.Index == 0 && e.KeyCode == Keys.Up)
                txtFind.Focus();
        }

        private void dgvGrpFam_SelectionChanged(object sender, EventArgs e)
        {
            lsbMembers.Items.Clear();
            if (dgvGrpFam.CurrentRow != null && lsGrpFam.Count > 0)
            {
                //cuando una lista de varios elementos pasa a una lista con menos elementos
                int ix = (dgvGrpFam.CurrentRow.Index > lsGrpFam.Count - 1 ? 0 : dgvGrpFam.CurrentRow.Index);
                List<Persona> lsPer = Task.Run(() => PersonaBridge.getPersonaByGrpFam(lsGrpFam[ix].idGrpFam)).Result.OrderBy(x => x.apeNomsX).ToList();
                foreach (var item in lsPer)
                    lsbMembers.Items.Add(item.apeNomsX);
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

            this.Enabled = false;

            FrmGrupoFam frm = new FrmGrupoFam(null, CRUD.NEW, this.xLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                xObGrpFam = frm.xObGrpFam;
                txtFind.Text = xObGrpFam.nomGrpFam;
                lsGrpFam = new List<GrupoFamiliar>() { xObGrpFam };
                dgvGrpFam.DataSource = lsGrpFam;
            }
            yaBusco = false;

            this.Enabled = true;
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (dgvGrpFam.CurrentRow != null)
            {
                if ((bool)dgvGrpFam.CurrentRow.Cells["dgvGrpFam_cerrado"].Value)
                {
                    Utils.msg("El grupo familiar tiene varios miembros, no se podrá modificar.", Estado.WARNING);
                    return;
                }

                this.Enabled = false;

                FrmGrupoFam frm = new FrmGrupoFam(lsGrpFam[dgvGrpFam.CurrentRow.Index], CRUD.EDIT, this.xLectura);
                frm.ShowDialog();
                if (frm.operOK)
                {
                    xObGrpFam = frm.xObGrpFam;
                    txtFind.Text = xObGrpFam.nomGrpFam;
                    lsGrpFam = new List<GrupoFamiliar>() { xObGrpFam };
                    dgvGrpFam.DataSource = lsGrpFam;
                }
                yaBusco = false;

                this.Enabled = true;
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
        private bool validarBusqueda()
        {
            txtFind.Text = Utils.allTrim_InjectCode(txtFind.Text);
            if (txtFind.Text.Length < int.Parse(Vars.dicVarGB["MinCarFind"]))
            {
                Utils.msg("Se requiere como mínimo " + Vars.dicVarGB["MinCarFind"] + " caracteres.", Estado.WARNING);
                return false;
            }
            return true;
        }

        private void busqueda()
        {
            if (!validarBusqueda())
                return;

            lsGrpFam = (Task.Run(() => GrupoFamiliarBridge.getGrpFamByNoms(Vars.obEmpresa.idEmpresa, txtFind.Text)).Result).OrderBy(x => x.nomGrpFam).ToList();

            dgvGrpFam.DataSource = lsGrpFam;
            if (lsGrpFam.Count > 0)
            {
                dgvGrpFam.Focus();
                dgvGrpFam.CurrentCell = dgvGrpFam.Rows[0].Cells[1];
            }
            else
            {
                if (lsGrpFam.Count < 1)
                {
                    Utils.msg("No se encontró resultados.\nPuedes crear un nuevo \"Grupo familiar\".", Estado.WARNING);
                }
            }
            yaBusco = true;
        }

        private void seleccionar()
        {
            if (dgvGrpFam.CurrentRow == null)
            {
                Utils.msg("Se requiere un registro seleccionado.", Estado.WARNING);
                txtFind.Focus();
                return;
            }

            xObGrpFam = lsGrpFam[dgvGrpFam.CurrentRow.Index];
            operOK = true;
            this.Dispose();
        }

    }//end class

}
