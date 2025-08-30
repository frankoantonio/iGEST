using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class UcEmpresas : UcMaster
    {
        private List<Empresa> lsEmp;                    // lista de empresas
        private List<EmpresaSistema> lsSisOrig;         // lista original de sistemas de una empresa, antes de editar

        public UcEmpresas()
        {
            InitializeComponent();

            dgvEmpresas.AutoGenerateColumns = false;

            dgvEmp_idTipoNeg.ValueMember = "idTipo";
            dgvEmp_idTipoNeg.DisplayMember = "nomTipo";
            dgvEmp_idTipoGrp.ValueMember = "idTipo";
            dgvEmp_idTipoGrp.DisplayMember = "nomTipo";
        }

        private async void UcEmpresas_Load(object sender, EventArgs e)
        {
            dgvEmp_idTipoNeg.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_NEGOCIO").OrderBy(y => y.nomTipo).ToList();
            dgvEmp_idTipoGrp.DataSource = Vars.lsTipos.Where(x => x.grupo == "TIGRUPOEMP").OrderBy(y => y.nomTipo).ToList();

            ////lsEmp = await EmpresaService.getEmpresaAllWithChild();
            dgvEmpresas.DataSource = lsEmp; // si se utiliza ".OrderBy(x => x.idEmpresa).ToList()" se ordena la lista, pero las listas hijos no actualizan su índice
        }

        private void dgvEmpresas_SelectionChanged(object sender, EventArgs e)
        {
            if (dgvEmpresas.CurrentRow != null)
                showEmpresaDet(dgvEmpresas.CurrentRow.Index);
        }

        private void btnNewEmp_Click(object sender, EventArgs e)
        {
            if (dgvEmpresas.CurrentRow == null)
                return;
            operNewEditEmpresa(CRUD.NEW);
        }

        private void btnEditEmp_Click(object sender, EventArgs e)
        {
            if (dgvEmpresas.CurrentRow == null)
                return;
            operNewEditEmpresa(CRUD.EDIT);
        }

        private void btnNewSede_Click(object sender, EventArgs e)
        {
            if (dgvEmpresas.CurrentRow == null)
                return;
            operNewEditSede(CRUD.NEW);
        }

        private void btnEditSede_Click(object sender, EventArgs e)
        {
            if (dgvSedes.CurrentRow == null)
                return;
            operNewEditSede(CRUD.EDIT);
        }

        //
        // Métodos
        //
        private async void operNewEditEmpresa(CRUD operEmp)
        {
            //Empresa obEmp = (operEmp == CRUD.NEW ? null : lsEmp[dgvEmpresas.CurrentRow.Index]);
            //int numRow = (operEmp == CRUD.EDIT ? dgvEmpresas.CurrentRow.Index : -1);

            //FrmEmpresa frm = new FrmEmpresa(obEmp, operEmp, this.obOpcion.soloLectura);
            //frm.ShowDialog();

            //if (frm.isOperOK)
            //{
            //    lsEmp = (await EmpresaService.getEmpresaAllWithChild()).OrderBy(x => x.idEmpresa).ToList();
            //    dgvEmpresas.DataSource = lsEmp;

            //    if (operEmp == CRUD.NEW)
            //        numRow = lsEmp.Count - 1;
            //    if (lsEmp.Count > 0)
            //        dgvEmpresas.CurrentCell = dgvEmpresas.Rows[numRow].Cells[0];

            //    showEmpresaDet(numRow);
            //}
        }

        private void showEmpresaDet(int indexRow)
        {
            //dgvSedes.DataSource = lsEmp[indexRow].lsSedeX;
            //dgvSis.DataSource = lsEmp[indexRow].lsEmpSisX;

            lblNeg.Text = lsEmp[indexRow].nomComercial;
            lblSede.Text = lsEmp[indexRow].nomComercial;
        }

        private async void operNewEditSede(CRUD operSede)
        {
            Empresa obEmp = lsEmp[dgvEmpresas.CurrentRow.Index];

            //Sede obSede = (operSede == CRUD.NEW ? new Sede() { idSede = -1, idEmpresa = obEmp.idEmpresa } : obEmp.lsSedeX[dgvSedes.CurrentRow.Index]);
            //int numRow = (operSede == CRUD.EDIT ? dgvSedes.CurrentRow.Index : -1);

            //FrmSede frm = new FrmSede(obSede, operSede, obOpcion.soloLectura);
            //frm.ShowDialog();

            //if (frm.isOperOK)
            //{
            //    List<Sede> lsSede = await SedeBridge.getSedeByEmpresa(obEmp.idEmpresa);
            //    lsEmp[dgvEmpresas.CurrentRow.Index].lsSedeX = lsSede;
            //    dgvSedes.DataSource = lsEmp[dgvEmpresas.CurrentRow.Index].lsSedeX;

            //    if (operSede == CRUD.NEW)
            //        numRow = lsSede.Count - 1;
            //    if (lsSede.Count > 0)
            //        dgvSedes.CurrentCell = dgvSedes.Rows[numRow].Cells["dgvSed_nomSede"];
            //}
        }

        private void btnEditSis_Click(object sender, EventArgs e)
        {
            //lsSisOrig = new List<EmpresaSistema>();
            //foreach (EmpresaSistema item in lsEmp[dgvEmpresas.CurrentRow.Index].lsEmpSisX)
            //    lsSisOrig.Add(new EmpresaSistema() { idEmpSis = item.idEmpSis, idEmpresa = item.idEmpresa, idSistema = item.idSistema, activo = item.activo, nomSisX = item.nomSisX });

            //deshabilitar(true);
        }

        private async void btnOkSis_Click(object sender, EventArgs e)
        {
            if (DialogResult.No == Utils.msgQ("Realmente desea guardar los cambios?", Estado.YESNO))
                return;

            try
            {
                //lsEmp[dgvEmpresas.CurrentRow.Index].lsEmpSisX = await EmpresaSistemaBridge.upsert(lsEmp[dgvEmpresas.CurrentRow.Index].lsEmpSisX);
                //dgvSis.DataSource = lsEmp[dgvEmpresas.CurrentRow.Index].lsEmpSisX;
                //Utils.msg("La operación se ejecutó correctamente.", Estado.SUCCESS);
                //deshabilitar(false);
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
            }
        }

        private void btnCancelSis_Click(object sender, EventArgs e)
        {
            //lsEmp[dgvEmpresas.CurrentRow.Index].lsEmpSisX = lsSisOrig;
            //dgvSis.DataSource = lsEmp[dgvEmpresas.CurrentRow.Index].lsEmpSisX;

            deshabilitar(false);
        }

        private void deshabilitar(bool b)
        {
            btnNewEmp.Enabled = !b;
            btnEditEmp.Enabled = !b;
            dgvEmpresas.Enabled = !b;

            btnEditSis.Enabled = !b;
            dgvSis.Columns["dgvSis_activo"].ReadOnly = !b;
            btnOkSis.Enabled = b;
            btnCancelSis.Enabled = b;

            btnNewSede.Enabled = !b;
            btnEditSede.Enabled = !b;
            dgvSedes.Enabled = !b;

            dgvSis.Focus();
            dgvSis.CurrentCell = dgvSis.Rows[0].Cells["dgvSis_activo"];
        }

    }//end class

}
