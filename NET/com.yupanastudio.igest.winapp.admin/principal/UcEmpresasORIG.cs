using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
{
    public partial class UcEmpresasORIG : UcMaster
    {
        List<Empresa> lsEmp;
        List<Negocio> lsNeg;
        List<Sede> lsSede;

        public UcEmpresasORIG()
        {
            InitializeComponent();
            dgvNeg_idTipoNegocio.ValueMember = "idTipo";
            dgvNeg_idTipoNegocio.DisplayMember = "nomTipo";
        }

        private async void UcEmpresas_Load(object sender, EventArgs e)
        {
            dgvNeg_idTipoNegocio.DataSource = Vars.lsTipos.Where(x => x.grupo == "TIP.NEG").ToList();

            lsEmp = await EmpresaBridge.getEmpresaAll();
            dgvEmpresas.DataSource = lsEmp;
        }

        private void dgvEmpresas_SelectionChanged(object sender, EventArgs e)
        {
            if (dgvEmpresas.CurrentRow != null)
            {
                //dgvNegocios.DataSource = lsEmp[dgvEmpresas.CurrentRow.Index].lsNegocioX;
                //dgvSedes.DataSource = lsEmp[dgvEmpresas.CurrentRow.Index].lsSedeX;
                //lblNeg.Text = "UND.NEGOCIO: " + dgvEmpresas.CurrentRow.Cells[2].Value.ToString();
                //lblSede.Text = "SEDES: " + dgvEmpresas.CurrentRow.Cells[2].Value.ToString();
                showEmpresa(dgvEmpresas.CurrentRow.Index);
            }
        }

        private void btnNewEmp_Click(object sender, EventArgs e)
        {
            operNewEditEmpresa(CRUD.NEW);
        }

        private void btnEditEmp_Click(object sender, EventArgs e)
        {
            if (dgvEmpresas.CurrentRow == null)
                return;
            operNewEditEmpresa(CRUD.EDIT);
        }

        private void btnNewNeg_Click(object sender, EventArgs e)
        {
            if (dgvEmpresas.CurrentRow == null)
                return;
            operNewEditNegocio(CRUD.NEW);
        }

        private void btnEditNeg_Click(object sender, EventArgs e)
        {
            if (dgvNegocios.CurrentRow == null)
                return;
            operNewEditNegocio(CRUD.EDIT);
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
            Empresa obEmp = (operEmp == CRUD.NEW ? null : lsEmp[dgvEmpresas.CurrentRow.Index]);
            int numRow = (operEmp == CRUD.EDIT ? dgvEmpresas.CurrentRow.Index : -1);

            FrmEmpresa frm = new FrmEmpresa(obEmp, operEmp, obOpcion.lectura);
            frm.ShowDialog();

            if (frm.operOK)
            {
                lsEmp = await EmpresaBridge.getEmpresaAll();
                dgvEmpresas.DataSource = lsEmp;

                if (operEmp == CRUD.NEW)
                    numRow = lsEmp.Count - 1;
                if (lsEmp.Count > 0)
                    dgvEmpresas.CurrentCell = dgvEmpresas.Rows[numRow].Cells[0];

                //dgvNegocios.DataSource = lsEmp[numRow].lsNegocioX;
                //dgvSedes.DataSource = lsEmp[numRow].lsSedeX;
                showEmpresa(numRow);
            }
        }

        private void showEmpresa(int indexRow)
        {

            dgvNegocios.DataSource = lsEmp[indexRow].lsNegocioX;
            dgvSedes.DataSource = lsEmp[indexRow].lsSedeX;

            //

            //dgvNegocios.DataSource = lsEmp[dgvEmpresas.CurrentRow.Index].lsNegocioX;
            //dgvSedes.DataSource = lsEmp[dgvEmpresas.CurrentRow.Index].lsSedeX;
            lblNeg.Text = "Negocios " + dgvEmpresas.CurrentRow.Cells[2].Value.ToString();
            lblSede.Text = "Sedes " + dgvEmpresas.CurrentRow.Cells[2].Value.ToString();
        }

        private async void operNewEditNegocio(CRUD operNeg)
        {
            Empresa obEmp = lsEmp[dgvEmpresas.CurrentRow.Index];

            Negocio obNeg = (operNeg == CRUD.NEW ? new Negocio() { idNegocio = -1, idEmpresa = obEmp.idEmpresa } : obEmp.lsNegocioX[dgvNegocios.CurrentRow.Index]);
            int numRow = (operNeg == CRUD.EDIT ? dgvNegocios.CurrentRow.Index : -1);

            FrmNegocio frm = new FrmNegocio(obNeg, operNeg, obOpcion.lectura);
            frm.ShowDialog();

            if (frm.operOK)
            {
                List<Negocio> lsNeg = await NegocioBridge.getNegocioByEmp(obEmp.idEmpresa);
                lsEmp[dgvEmpresas.CurrentRow.Index].lsNegocioX = lsNeg;
                dgvNegocios.DataSource = lsEmp[dgvEmpresas.CurrentRow.Index].lsNegocioX;

                if (operNeg == CRUD.NEW)
                    numRow = lsNeg.Count - 1;
                if (lsNeg.Count > 0)
                    dgvNegocios.CurrentCell = dgvNegocios.Rows[numRow].Cells[0];
            }
        }

        private async void operNewEditSede(CRUD operSede)
        {
            Empresa obEmp = lsEmp[dgvEmpresas.CurrentRow.Index];

            Sede obSede = (operSede == CRUD.NEW ? new Sede() { idSede = -1, idEmpresa = obEmp.idEmpresa } : obEmp.lsSedeX[dgvSedes.CurrentRow.Index]);
            int numRow = (operSede == CRUD.EDIT ? dgvSedes.CurrentRow.Index : -1);

            FrmSede frm = new FrmSede(obSede, operSede, obOpcion.lectura);
            frm.ShowDialog();

            if (frm.operOK)
            {
                List<Sede> lsSede = await SedeBridge.getSedeByEmp(obEmp.idEmpresa);
                lsEmp[dgvEmpresas.CurrentRow.Index].lsSedeX = lsSede;
                dgvSedes.DataSource = lsEmp[dgvEmpresas.CurrentRow.Index].lsSedeX;

                if (operSede == CRUD.NEW)
                    numRow = lsSede.Count - 1;
                if (lsSede.Count > 0)
                    dgvSedes.CurrentCell = dgvSedes.Rows[numRow].Cells[0];
            }
        }


    }//end class

}
