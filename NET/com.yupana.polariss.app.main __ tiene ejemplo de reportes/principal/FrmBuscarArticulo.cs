using com.yupana.polariss.app.main.comercial;
using com.yupanastudio.polariss.app.template;
using com.yupanastudio.polariss.model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app.principal
{
    public partial class FrmBuscarArticulo : FrmMaster
    {
        private bool buscado = false;
        private List<Articulo> lsArtFind = new List<Articulo>();  // encontrados en el servidor
        public List<Articulo> lsArtSel = new List<Articulo>();    // seleccionados

        public FrmBuscarArticulo()
        {
            InitializeComponent();
            dgvArticulos.AutoGenerateColumns = false;
            mostrarBusqueda(false);
            txtFind.Select();
        }



        private void TxtFind_TextChanged(object sender, EventArgs e)
        {
            if (txtFind.Text.Trim().Length < yupanastudio.polariss.app.principal.Vars.minCar)
                txtFind.StateCommon.Content.Color1 = System.Drawing.Color.Red;
            else
                txtFind.StateCommon.Content.Color1 = System.Drawing.Color.Blue;
        }

        private void TxtFind_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Down && dgvArticulos.Rows.Count > 0)
            {
                dgvArticulos.Select();
                dgvArticulos.CurrentCell = dgvArticulos.Rows[0].Cells["dgvArticulos_selX"];
            }
            else if (e.KeyCode == Keys.Enter)
                busqueda();
        }

        private void TxtFind_KeyPress(object sender, KeyPressEventArgs e)
        {
            //if (ixFind == 1) // sólo ingresar enteros cuando se busca por número de documento
            //{
            //    if (Char.IsDigit(e.KeyChar))
            //        e.Handled = false;
            //    else if (Char.IsControl(e.KeyChar))
            //        e.Handled = false;
            //    else
            //        e.Handled = true;
            //}
        }

        private void BtnFind_Click(object sender, EventArgs e)
        {
            busqueda();
        }

        private void DgvArticulos_CurrentCellDirtyStateChanged(object sender, EventArgs e)
        {
            if (dgvArticulos.IsCurrentCellDirty)
                dgvArticulos.CommitEdit(DataGridViewDataErrorContexts.Commit);
        }

        private void DgvArticulos_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvArticulos.CurrentRow != null && lsArtFind.Count > 0)
            {
                Articulo obPerAux = lsArtFind[dgvArticulos.CurrentRow.Index];
                if (obPerAux.selX)
                    lsArtSel.Add(obPerAux);
                else
                    lsArtSel.Remove(obPerAux);
                lblCantArticulo.Text = "Encontrados: " + lsArtFind.Count + "   |   Seleccionados: " + lsArtSel.Count;
            }
        }

        private void DgvArticulos_KeyDown(object sender, KeyEventArgs e)
        {
            if (dgvArticulos.Rows.Count > 0 && dgvArticulos.CurrentRow.Index == 0 && e.KeyCode == Keys.Up)
            {
                txtFind.Focus();
                txtFind.SelectAll();
            }
        }

        private void LnkSel_LinkClicked(object sender, EventArgs e)
        {
            lsArtFind = (from rw in lsArtSel select rw).ToList();   // se crea otra instancia, sino se estaba pasando  por refeencia
            mostrarBusqueda(false);
        }

        private void BtnAdd_Click(object sender, EventArgs e)
        {
            if (!buscado)
            {
                Utils.msg("Antes de registrar una nueva Articulo, primero búsquelo.", Estado.WARNING);
                txtFind.Focus();
                return;
            }

            //new FrmCliente(null).ShowDialog();

            buscado = false;
        }

        private void BtnEdit_Click(object sender, EventArgs e)
        {
            if (dgvArticulos.CurrentRow == null)
            {
                Utils.msg("Se requiere un registro seleccionado.", Estado.WARNING);
                txtFind.Select();
                return;
            }

            //new FrmCliente(lsPerFind[dgvArticulos.CurrentRow.Index]).ShowDialog();

            //buscado = false;
        }

        private void BtnOk_Click(object sender, EventArgs e)
        {
            seleccionarArticulo();
        }

        //
        // metodos
        //
        private bool validarBusqueda()
        {
            string find = Regex.Replace(txtFind.Text, "\\s+", " ").Trim();
            txtFind.Text = find;

            if (find.Length < Vars.minCar)
            {
                Utils.msg("Se requiere mínimo " + Vars.minCar + " caracteres.", Estado.WARNING);
                txtFind.Focus();
                return false;
            }
            return true;
        }

        private void busqueda()
        {
            //if (!validarBusqueda())
            //    return;

            //lsArtFind = new ArticuloBO().lstArticuloVtaByNoms(Vars.obNegocio.idNegocio, txtFind.Text, Vars.obPtVta.idPrecioGrp, Vars.obPtVta.idAlmacenes);

            //mostrarBusqueda(true);
        }

        private void mostrarBusqueda(bool verificaSiExiste)
        {
            if (verificaSiExiste)
            {
                foreach (var item in lsArtFind)
                    if (lsArtSel.Find(ob => ob.idArticulo == item.idArticulo) != null && lsArtSel.Find(ob => ob.idArticulo == item.idArticulo).selX)
                        item.selX = true;
            }

            dgvArticulos.DataSource = lsArtFind;
            lblCantArticulo.Text = "Encontrados: " + lsArtFind.Count + "   |   Seleccionados: " + lsArtSel.Count;

            if (dgvArticulos.Rows.Count > 0)
            {
                //txtFind.Text = "";
                dgvArticulos.Select();
                dgvArticulos.CurrentCell = dgvArticulos.Rows[0].Cells["dgvArticulos_selX"];
            }
            else
            {
                txtFind.Select();
                txtFind.SelectAll();
                dgvAlmArt.DataSource = new List<AlmacenArticulo>();
            }
        }

        private void seleccionarArticulo()
        {
            if (lsArtSel.Count < 1)
            {
                Utils.msg("Seleccione al menos un registro.", Estado.WARNING);
                return;
            }

            this.Dispose();
        }

        private void DgvArticulos_SelectionChanged(object sender, EventArgs e)
        {
            if (dgvArticulos.CurrentRow != null)
            {
                try
                {
                    dgvAlmArt.DataSource = lsArtFind[dgvArticulos.CurrentRow.Index].lsAlmacenArtX;
                }
                catch (Exception)
                {
                    dgvAlmArt.DataSource = new List<AlmacenArticulo>();
                }
            }
            else
                dgvAlmArt.DataSource = new List<AlmacenArticulo>();
        }

    }//end class

}
