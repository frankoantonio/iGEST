using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class UcGbVars : UcMaster
    {
        List<VarGlobal> lsVars;

        public UcGbVars()
        {
            InitializeComponent();
        }

        private async void UcGbVars_Load(object sender, EventArgs e)
        {
            cmbVarGb.DataSource = Vars.lsVarGlobals.OrderBy(x => x.idSistema).ThenBy(y => y.nomVarGb).ToList();
            ////cmbEmpresa.DataSource = (await EmpresaService.getEmpresaAllWithoutChild()).OrderBy(x => x.nomComercial).ToList();
        }

        private void cmbEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            showVarsGb();
        }

        private void cmbVarGb_SelectedIndexChanged(object sender, EventArgs e)
        {
            showVarsGb();
        }

        private void rbtEmpresa_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtEmpresa.Checked)
            {
                cmbEmpresa.Enabled = true;
                cmbVarGb.Enabled = false;
            }
            else if (rbtVarGb.Checked)
            {
                cmbEmpresa.Enabled = false;
                cmbVarGb.Enabled = true;
            }
            showVarsGb();
        }

        private async void btnCopy_Click(object sender, EventArgs e)
        {
            try
            {
                if (DialogResult.Yes == Utils.msgQ("Realmente desea copiar las variables globales a las empresas que no lo tienen?\nActualice luego el valor de algunas variables.", Estado.YESNO))
                {
                    await GbVarBridge.insertByEmptyEmp();
                    Utils.msg("La operación se ejecutó correctamente.", Estado.SUCCESS);
                    showVarsGb();
                }
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (dgvGbVar.CurrentRow == null)
                return;

            deshabilitar(true);

            dgvGbVar.Columns["dgvGbVar_valor"].ReadOnly = false;
            dgvGbVar.Focus();
            dgvGbVar.CurrentCell = dgvGbVar.Rows[0].Cells["dgvGbVar_valor"];
        }

        private async void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (DialogResult.Yes == Utils.msgQ("Realmente desea modificar los valores de las variables?", Estado.YESNO))
                {
                    await GbVarBridge.updateByList(lsVars);
                    Utils.msg("La operación se ejecutó correctamente.", Estado.SUCCESS);
                }
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
            }

            deshabilitar(false);
            dgvGbVar.Columns["dgvGbVar_valor"].ReadOnly = true;
            showVarsGb();
        }


        private void btnCancel_Click(object sender, EventArgs e)
        {
            deshabilitar(false);
            dgvGbVar.Columns["dgvGbVar_valor"].ReadOnly = true;
            showVarsGb();
        }

        //
        // Métodos
        //
        private async void showVarsGb()
        {
            if (rbtEmpresa.Checked && cmbEmpresa.SelectedItem != null)
                lsVars = (await GbVarBridge.getGbVarByEmp(((Empresa)cmbEmpresa.SelectedItem).idEmpresa)).OrderBy(x => x.idSistema).ThenBy(y => y.nomVarGb).ToList();
            else if (rbtVarGb.Checked && cmbVarGb.SelectedItem != null)
                lsVars = (await GbVarBridge.getGbVarByNom(((VarGlobal)cmbVarGb.SelectedItem).nomVarGb)).OrderBy(x => x.idEmpresa).ToList();
            dgvGbVar.DataSource = lsVars;
        }

        private void deshabilitar(bool b)
        {
            rbtEmpresa.Enabled = !b;
            cmbEmpresa.Enabled = !b;
            rbtVarGb.Enabled = !b;
            cmbVarGb.Enabled = !b;

            btnCopy.Enabled = !b;
            btnEdit.Enabled = !b;
            btnSave.Enabled = b;
            btnCancel.Enabled = b;

            if (btnEdit.Enabled)
            {
                cmbEmpresa.Enabled = rbtEmpresa.Checked;
                cmbVarGb.Enabled = rbtVarGb.Checked;
            }
        }

    }//end class

}
