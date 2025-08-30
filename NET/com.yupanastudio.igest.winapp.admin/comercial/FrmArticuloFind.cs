using com.yupanastudio.igest.winapp;
using Krypton.Toolkit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmArticuloFind : FrmMaster
    {
        private List<Categoria> lsCategoria;
        private List<Articulo> lsArticulosFind = new List<Articulo>();      // lista de articulos que llega del servidor
        public List<Articulo> lsArticulosSel = new List<Articulo>();        // lista de articulos seleccionados

        //soloLectura que pase
        public FrmArticuloFind(CRUD xOperCRUD, bool xLectura)
        {
            InitializeComponent();
            dgvArticulos.AutoGenerateColumns = false;
            dgvArt_idAfectacion.ValueMember = "idAfectacion";
            dgvArt_idAfectacion.DisplayMember = "nomAfectacion";
            dgvArt_idCategoria.ValueMember = "idCategoria";
            dgvArt_idCategoria.DisplayMember = "nomCategoria";
        }

        private void FrmArticuloFind_Load(object sender, EventArgs e)
        {
            lsCategoria = Task.Run(() => CategoriaBridge.getCategoriaByNegocio(Vars.obEmpresa.idEmpresa)).Result.OrderBy(x => x.nomCategoria).ToList();
            dgvArt_idAfectacion.DataSource = Task.Run(() => AfectacionBridge.getAfectacion()).Result;
            dgvArt_idCategoria.DataSource = lsCategoria;
            cmbCategoria.DataSource = lsCategoria;
        }

        private void cmbCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtFind.Text = "";
            long idCategoria = -1;
            if (cmbCategoria.SelectedItem != null)
            {
                idCategoria = (long)cmbCategoria.SelectedValue;
                findArticulos(idCategoria);
            }
        }

        private void txtFind_Enter(object sender, EventArgs e)
        {
            txtFind.SelectAll();
        }

        private void txtFind_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == Convert.ToChar(Keys.Enter))
                busqueda();
        }

        private void txtFind_KeyDown(object sender, KeyEventArgs e)
        {
            if (dgvArticulos.Rows.Count > 0 && (e.KeyCode == Keys.Down))
            {
                dgvArticulos.Focus();
                dgvArticulos.CurrentCell = dgvArticulos.Rows[0].Cells["dgvArt_selX"];
            }
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            busqueda();
        }

        private void dgvArticulos_KeyDown(object sender, KeyEventArgs e)
        {
            if (dgvArticulos.Rows.Count > 0 && dgvArticulos.CurrentRow.Index == 0 && e.KeyCode == Keys.Up)
                txtFind.Focus();
        }

        private void dgvArticulos_CurrentCellDirtyStateChanged(object sender, EventArgs e)
        {
            if (dgvArticulos.IsCurrentCellDirty)
                dgvArticulos.CommitEdit(DataGridViewDataErrorContexts.Commit);
        }

        private void dgvArticulos_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvArticulos.CurrentRow != null && lsArticulosFind.Count > 0)
            {
                // para que funcione correctamente, sobrescribir los métodos Equals() y GetHashCode() de la clase "Articulo", utilizando solo el atributo "idArticulo" 
                Articulo obArticulo = lsArticulosFind[dgvArticulos.CurrentRow.Index];
                if (obArticulo.selX)
                    lsArticulosSel.Add(obArticulo);
                else if (obArticulo.selX == false)
                    lsArticulosSel.Remove(obArticulo);

                dgvArticulos.Refresh();
                lnkShowSel.Text = "SELECCIONADOS: " + lsArticulosSel.Count;
            }
        }

        private void lnkShowSel_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            // lo que se muestra en el grid, siempre es lsArticulosFind
            lsArticulosFind = new List<Articulo>(lsArticulosSel.OrderBy(x => x.fullNameX));
            dgvArticulos.DataSource = lsArticulosFind;

            this.cmbCategoria.SelectedIndexChanged -= new System.EventHandler(this.cmbCategoria_SelectedIndexChanged);
            cmbCategoria.SelectedItem = null;
            this.cmbCategoria.SelectedIndexChanged += new System.EventHandler(this.cmbCategoria_SelectedIndexChanged);
            txtFind.Focus();
            txtFind.SelectAll();
        }

        private void lnkSelAll_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            foreach (var item in lsArticulosFind)
                if (!item.selX)
                {
                    item.selX = true;
                    lsArticulosSel.Add(item);
                }

            dgvArticulos.Refresh();
            lnkShowSel.Text = "SELECCIONADOS: " + lsArticulosSel.Count;
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            if (lsArticulosSel.Count < 1)
            {
                Utils.msg("Se requiere bienes/servicios seleccionado(s)", Estado.WARNING);
                return;
            }
            else
            {
                this.operOK = true;
                this.Dispose();
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

        private void busqueda()
        {
            if (!validarBusqueda())
                return;

            this.cmbCategoria.SelectedIndexChanged -= new System.EventHandler(this.cmbCategoria_SelectedIndexChanged);
            cmbCategoria.SelectedItem = null;
            this.cmbCategoria.SelectedIndexChanged += new System.EventHandler(this.cmbCategoria_SelectedIndexChanged);

            findArticulos(-1);

            if (lsArticulosFind.Count > 0)
            {
                dgvArticulos.Focus();
                dgvArticulos.CurrentCell = dgvArticulos.Rows[0].Cells["dgvArt_selX"];
            }
            else
            {
                txtFind.Focus();
                Utils.msg("No se encontró resultados, realiza otra búsqueda.", Estado.WARNING);
            }
        }

        public void findArticulos(long idCategoria)
        {
            try
            {
                if (cmbCategoria.SelectedItem != null && idCategoria != -1)
                    lsArticulosFind = Task.Run(() => ArticuloBridge.getArticuloByCategoria(Vars.obEmpresa.idEmpresa, idCategoria)).Result.OrderBy(x => x.fullNameX).ToList();
                else
                    lsArticulosFind = Task.Run(() => ArticuloBridge.getArticuloByFind(Vars.obEmpresa.idEmpresa, txtFind.Text)).Result.OrderBy(x => x.fullNameX).ToList();

                foreach (var item in lsArticulosFind)
                    foreach (var ob in lsArticulosSel)
                    {
                        if (item.idArticulo == ob.idArticulo && ob.selX)
                        {
                            item.selX = true;
                            break;
                        }
                    }

                dgvArticulos.DataSource = lsArticulosFind;
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
            }
        }

    }//end class

}