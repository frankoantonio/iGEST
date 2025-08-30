using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class UcArticulos : UcMaster
    {
        private List<Categoria> lsCategoria;
        private List<Articulo> lsArticulos;

        public UcArticulos()
        {
            InitializeComponent();
            dgvArticulos.AutoGenerateColumns = false;
            dgvArt_idAfectacion.ValueMember = "idAfectacion";
            dgvArt_idAfectacion.DisplayMember = "nomAfectacion";
            dgvArt_idCategoria.ValueMember = "idCategoria";
            dgvArt_idCategoria.DisplayMember = "nomCategoria";
        }

        private void UcArticulos_Load(object sender, EventArgs e)
        {
            lsCategoria = Task.Run(() => CategoriaBridge.getCategoriaByNegocio(Vars.obEmpresa.idEmpresa)).Result.OrderBy(x => x.nomCategoria).ToList();
            dgvArt_idAfectacion.DataSource = Task.Run(() => AfectacionBridge.getAfectacion()).Result;
            dgvArt_idCategoria.DataSource = lsCategoria;
            cmbCategoria.DataSource = lsCategoria;
        }

        private void cmbCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtFind.Text = "";

            long idCategoria = (long)cmbCategoria.SelectedValue;
            if (cmbCategoria.SelectedItem != null)
                lsArticulos = Task.Run(() => ArticuloBridge.getArticuloByCategoria(Vars.obEmpresa.idEmpresa, idCategoria)).Result.OrderBy(x => x.nomArticulo).ToList();
            else
                lsArticulos = new List<Articulo>();
            dgvArticulos.DataSource = lsArticulos;
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
            if (dgvArticulos.Rows.Count > 0 && (e.KeyCode == Keys.Down))
            {
                dgvArticulos.Focus();
                dgvArticulos.CurrentCell = dgvArticulos.Rows[0].Cells[1];
            }
        }

        private void dgvArticulos_KeyDown(object sender, KeyEventArgs e)
        {
            if (dgvArticulos.Rows.Count > 0 && dgvArticulos.CurrentRow.Index == 0 && e.KeyCode == Keys.Up)
                txtFind.Focus();
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            busqueda();
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            FrmArticulo frm = new FrmArticulo(lsCategoria, null, CRUD.NEW, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                if (cmbCategoria.SelectedItem == null || (long)cmbCategoria.SelectedValue != frm.xObArticulo.idCategoria)
                    cmbCategoria.SelectedValue = frm.xObArticulo.idCategoria;
                else
                {
                    dgvArticulos.DataSource = new List<Categoria>();
                    lsArticulos.Add(frm.xObArticulo);
                    lsArticulos = lsArticulos.OrderBy(x => x.nomArticulo).ToList();
                    dgvArticulos.DataSource = lsArticulos;
                }

                for (int i = 0; i < lsArticulos.Count; i++)
                    if (lsArticulos[i].idArticulo == frm.xObArticulo.idArticulo)
                    {
                        dgvArticulos.Select();
                        dgvArticulos.CurrentCell = dgvArticulos.Rows[i].Cells["dgvArt_tipo"];
                        return;
                    }

                dgvArticulos.Refresh();
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (!validarCtrl())
                return;

            FrmArticulo frm = new FrmArticulo(lsCategoria, lsArticulos[dgvArticulos.CurrentRow.Index], CRUD.EDIT, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                if (cmbCategoria.SelectedItem == null || (long)cmbCategoria.SelectedValue != frm.xObArticulo.idCategoria)
                {
                    cmbCategoria.SelectedValue = frm.xObArticulo.idCategoria;
                    for (int i = 0; i < lsArticulos.Count; i++)
                        if (lsArticulos[i].idArticulo == frm.xObArticulo.idArticulo)
                        {
                            dgvArticulos.Select();
                            dgvArticulos.CurrentCell = dgvArticulos.Rows[i].Cells["dgvArt_tipo"];
                            return;
                        }
                }
                else
                    lsArticulos[dgvArticulos.CurrentRow.Index] = frm.xObArticulo;

                dgvArticulos.Refresh();
            }
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
                txtFind.Focus();
                return false;
            }
            return true;
        }

        private bool validarCtrl()
        {
            if (dgvArticulos.CurrentRow == null || lsArticulos.Count < 1)
            {
                Utils.msg("Se requiere un registro seleccionado.", Estado.WARNING);
                return false;
            }
            return true;
        }

        private void busqueda()
        {
            if (!validarBusqueda())
                return;

            this.cmbCategoria.SelectedIndexChanged -= new System.EventHandler(this.cmbCategoria_SelectedIndexChanged);
            cmbCategoria.SelectedItem = null;
            this.cmbCategoria.SelectedIndexChanged += new System.EventHandler(this.cmbCategoria_SelectedIndexChanged);

            lsArticulos = Task.Run(() => ArticuloBridge.getArticuloByFind(Vars.obEmpresa.idEmpresa, txtFind.Text)).Result.OrderBy(x => x.nomArticulo).ToList();
            dgvArticulos.DataSource = lsArticulos;

            if (lsArticulos.Count > 0)
            {
                dgvArticulos.Focus();
                dgvArticulos.CurrentCell = dgvArticulos.Rows[0].Cells[1];
            }
            else
            {
                txtFind.Focus();
                Utils.msg("No se encontró resultados, realiza otra búsqueda.", Estado.WARNING);
            }
        }

    }//end class

}
