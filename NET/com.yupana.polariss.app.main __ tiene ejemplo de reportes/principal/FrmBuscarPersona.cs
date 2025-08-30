using com.yupana.polariss.app.main.comercial;
using com.yupanastudio.polariss.app.principal;
using com.yupanastudio.polariss.app.template;
using com.yupanastudio.polariss.model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace com.yupana.polariss.app.main.principal
{
    public enum TipoBusquedaPersona
    {
        PERSONAS_VENTA,
        TRABAJADORES,
        TRABAJADORES_ACTIVO,
        TRABAJADORES_INACTIVO,
        PROVEEDORES,
        ALUMNOS_COLEGIO,
        ALUMNOS_ACADEMIA
    }

    public partial class FrmBuscarPersona : FrmMaster
    {
        private bool selSimple;
        private TipoBusquedaPersona tipBusq;
        private int ixFind = 2;
        private bool buscado = false;
        private List<Persona> lsPerFind = new List<Persona>();  // encontrados en el servidor
        public List<Persona> lsPerSel = new List<Persona>();    // seleccionados

        public FrmBuscarPersona(bool selSimple, TipoBusquedaPersona tipBusq)
        {
            InitializeComponent();
            this.selSimple = selSimple;
            this.tipBusq = tipBusq;
            dgvPersonas.AutoGenerateColumns = false;
            mostrarBusqueda(false);
            txtFind.Select();
        }

        private void RbtBusqueda_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtDocIdent.Checked)
                ixFind = 1;
            else if (rbtApeNoms.Checked)
                ixFind = 2;
            txtFind.Focus();
            txtFind.Text = "";
            lsPerFind = new List<Persona>();
            mostrarBusqueda(false);
        }

        private void TxtFind_TextChanged(object sender, EventArgs e)
        {
            if (rbtApeNoms.Checked && txtFind.Text.Trim().Length < Vars.minCar)
                txtFind.StateCommon.Content.Color1 = System.Drawing.Color.Red;
            else if (rbtDocIdent.Checked && !(txtFind.Text.Trim().Length == 8 || txtFind.Text.Trim().Length == 11))
                txtFind.StateCommon.Content.Color1 = System.Drawing.Color.Red;
            else
                txtFind.StateCommon.Content.Color1 = System.Drawing.Color.Blue;
        }

        private void TxtFind_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Down && dgvPersonas.Rows.Count > 0)
            {
                dgvPersonas.Select();
                dgvPersonas.CurrentCell = dgvPersonas.Rows[0].Cells["dgvPersonas_selX"];
            }
            else if (e.KeyCode == Keys.Enter)
                busqueda();
        }

        private void TxtFind_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (ixFind == 1) // sólo ingresar enteros cuando se busca por número de documento
            {
                if (Char.IsDigit(e.KeyChar))
                    e.Handled = false;
                else if (Char.IsControl(e.KeyChar))
                    e.Handled = false;
                else
                    e.Handled = true;
            }
        }

        private void BtnFind_Click(object sender, EventArgs e)
        {
            busqueda();
        }

        private void DgvPersonas_CurrentCellDirtyStateChanged(object sender, EventArgs e)
        {
            if (dgvPersonas.IsCurrentCellDirty)
                dgvPersonas.CommitEdit(DataGridViewDataErrorContexts.Commit);
        }

        private void DgvPersonas_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvPersonas.CurrentRow != null && lsPerFind.Count > 0)
            {
                Persona obPerAux = lsPerFind[dgvPersonas.CurrentRow.Index];
                if (obPerAux.selX)
                    lsPerSel.Add(obPerAux);
                else
                    lsPerSel.Remove(obPerAux);
                lblCantPersona.Text = "Encontrados: " + lsPerFind.Count + "   |   Seleccionados: " + lsPerSel.Count;
            }
        }

        private void DgvPersonas_KeyDown(object sender, KeyEventArgs e)
        {
            if (dgvPersonas.Rows.Count > 0 && dgvPersonas.CurrentRow.Index == 0 && e.KeyCode == Keys.Up)
            {
                txtFind.Focus();
                txtFind.SelectAll();
            }
        }

        private void LnkSel_LinkClicked(object sender, EventArgs e)
        {
            lsPerFind = (from rw in lsPerSel select rw).ToList();   // se crea otra instancia, sino se estaba pasando  por refeencia
            mostrarBusqueda(false);
        }

        private void BtnAdd_Click(object sender, EventArgs e)
        {
            if (!buscado)
            {
                Utils.msg("Antes de registrar una nueva persona, primero búsquelo.", Estado.WARNING);
                txtFind.Focus();
                return;
            }

            //////////new FrmCliente(null).ShowDialog();

            buscado = false;
            busqueda();
        }

        private void BtnEdit_Click(object sender, EventArgs e)
        {
            if (dgvPersonas.CurrentRow == null)
            {
                Utils.msg("Se requiere un registro seleccionado.", Estado.WARNING);
                txtFind.Select();
                return;
            }

            ////////new FrmCliente(lsPerFind[dgvPersonas.CurrentRow.Index]).ShowDialog();

            //buscado = false;
            busqueda();
        }

        private void BtnOk_Click(object sender, EventArgs e)
        {
            seleccionarPersona();
        }

        //
        // metodos
        //
        private bool validarBusqueda()
        {
            string find = Regex.Replace(txtFind.Text, "\\s+", " ").Trim();
            txtFind.Text = find;

            if (rbtDocIdent.Checked && !(find.Length == 8 || find.Length == 11))
            {
                Utils.msg("Ingrese 8 dígitos para DNI, 11 dígitos para RUC", Estado.WARNING);
                txtFind.Focus();
                return false;
            }
            else if (rbtApeNoms.Checked && find.Length < Vars.minCar)
            {
                Utils.msg("Se requiere mínimo " + Vars.minCar + " caracteres.", Estado.WARNING);
                txtFind.Focus();
                return false;
            }
            return true;
        }

        private void busqueda()
        {
            if (!validarBusqueda())
                return;

            switch (tipBusq)
            {
                //case TipoBusquedaPersona.PERSONAS_VENTA: lsPerFind = new PersonaBO().lstPersonaByFind(Vars.obEmpresa.idEmpresa, ixFind, txtFind.Text); break;
                ////case 2: lsPerFind = new List<Persona>(); break;
                ////case 3: lsPerFind = new List<Persona>(); break;
                ////case 4: lsPerFind = new List<Persona>(); break;
                ////case 5: lsPerFind = new List<Persona>(); break;
                //default:
                //    lsPerFind = new List<Persona>(); break;
            }
            buscado = true;
            mostrarBusqueda(true);
        }

        private void mostrarBusqueda(bool verificaSiExiste)
        {
            if (verificaSiExiste)
            {
                foreach (var item in lsPerFind)
                    if (lsPerSel.Find(ob => ob.idPersona == item.idPersona) != null && lsPerSel.Find(ob => ob.idPersona == item.idPersona).selX)
                        item.selX = true;
            }

            dgvPersonas.DataSource = lsPerFind;
            lblCantPersona.Text = "Encontrados: " + lsPerFind.Count + "   |   Seleccionados: " + lsPerSel.Count;

            if (dgvPersonas.Rows.Count > 0)
            {
                //txtFind.Text = "";
                dgvPersonas.Select();
                dgvPersonas.CurrentCell = dgvPersonas.Rows[0].Cells["dgvPersonas_selX"];
            }
            else
            {
                txtFind.Select();
                txtFind.SelectAll();
            }
        }

        private void seleccionarPersona()
        {
            if (lsPerSel.Count < 1)
            {
                Utils.msg("Seleccione al menos un registro.", Estado.WARNING);
                return;
            }

            if (selSimple && lsPerSel.Count > 1)
            {
                Utils.msg("Se requiere solo un registro seleccionado.", Estado.WARNING);
                return;
            }

            if (tipBusq == TipoBusquedaPersona.PERSONAS_VENTA && lsPerSel[0].idTiPersona == "101PER" && lsPerSel[0].perConRuc.Length == 11)
            {
                if (DialogResult.Yes == Utils.msgQ("Desea que se le emita \"FACTURA\" o \"Boleta de Venta\"?\n\nPara emitir FACTURA, presione SI.", Estado.YESNO))
                {
                    //lsPerSel[0].paterno = "";
                    //lsPerSel[0].materno = "";
                    //lsPerSel[0].nombres = lsPerSel[0].apeNomsX;
                    lsPerSel[0].idTiDocIdent = "104RUC";
                    lsPerSel[0].docIdent = lsPerSel[0].perConRuc;
                }
            }

            this.Dispose();
        }

    }//end class

}
