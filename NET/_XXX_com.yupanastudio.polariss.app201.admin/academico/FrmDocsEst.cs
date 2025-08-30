using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmDocsEst : FrmMaster
    {
        public List<DocsEstudiante> xLsDocsEst;
        private long xIdEstudiante;
        private String tipoOperacion = "";

        public FrmDocsEst(long xIdEstudiante, List<DocsEstudiante> xLsDocsEst, bool xDevolver, bool xLectura) : base(CRUD.NONE, xLectura)
        {
            InitializeComponent();

            this.xIdEstudiante = xIdEstudiante;
            this.xLsDocsEst = xLsDocsEst.OrderByDescending(x => x.obligadoX).ThenBy(y => y.nomDocX).ToList();

            btnDevuelve.Visible = xDevolver;

            if (xLectura) this.setLectura();
        }

        private void FrmDocsEst_Load(object sender, EventArgs e)
        {
            dgvDocs_selX.Visible = false;
            dgvDocs.AutoGenerateColumns = false;
            dgvDocs.DataSource = xLsDocsEst;
        }

        private void btnRecibe_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < xLsDocsEst.Count; i++)
            {
                if (xLsDocsEst[i].recibeUsu == "" || xLsDocsEst[i].devuelveUsu != "")
                    dgvDocs.Rows[i].Cells["dgvDocs_selX"].ReadOnly = false;
                else
                    dgvDocs.Rows[i].Cells["dgvDocs_selX"].ReadOnly = true;
            }
            operar("RECIBIR", true);
        }

        private void btnActualiza_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < xLsDocsEst.Count; i++)
            {
                if (xLsDocsEst[i].recibeUsu != "" && xLsDocsEst[i].devuelveUsu == "")
                    dgvDocs.Rows[i].Cells["dgvDocs_selX"].ReadOnly = false;
                else
                    dgvDocs.Rows[i].Cells["dgvDocs_selX"].ReadOnly = true;
            }
            operar("ACTUALIZAR", true);
        }

        private void btnDevuelve_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < xLsDocsEst.Count; i++)
            {
                if ((xLsDocsEst[i].recibeUsu != "" || xLsDocsEst[i].actualizaUsu != "") && xLsDocsEst[i].devuelveUsu == "")
                    dgvDocs.Rows[i].Cells["dgvDocs_selX"].ReadOnly = false;
                else
                    dgvDocs.Rows[i].Cells["dgvDocs_selX"].ReadOnly = true;
            }
            operar("DEVOLVER", true);
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            guardar();
        }

        private void btnCancela_Click(object sender, EventArgs e)
        {
            if (btnRecibe.Enabled == false && this.xLectura != true)
            {
                foreach (var item in xLsDocsEst)
                    item.selX = false;
                operar("", false);
                lblTitle.Text = "DOCUMENTOS EXIGIDOS";
            }
            else
            {
                this.Dispose();
            }
        }

        //
        // Métodos
        //
        private bool validarCtrls()
        {
            if (xLsDocsEst.Where(x => x.selX).Count() < 1)
            {
                Utils.msg("Se requiere al menos un documento seleccionado.", Estado.WARNING);
                dgvDocs.Focus();
                return false;
            }
            return true;
        }

        private void operar(String tipOper, bool b)
        {
            tipoOperacion = tipOper;
            lblTitle.Text = "DOCUMENTOS EXIGIDOS - " + tipoOperacion;

            dgvDocs_selX.Visible = b;
            btnRecibe.Enabled = !b;
            btnActualiza.Enabled = !b;
            btnDevuelve.Enabled = !b;

            if (dgvDocs_selX.Visible)
            {
                btnCancela.Text = "&Cancelar";
                this.toolTip.SetToolTip(this.btnCancela, "Cancelar la operación.");
            }
            else
            {
                btnCancela.Text = "&Cerrar";
                this.toolTip.SetToolTip(this.btnCancela, "Cerrar formulario.");
            }

            dgvDocs.Refresh();
        }

        private void guardar()
        {
            if (!validarCtrls())
                return;

            if (Utils.msgQ("Estas seguro de guardar los cambios?.", Estado.YESNO) == DialogResult.No)
                return;

            List<DocsEstudiante> lsDocsSel = xLsDocsEst.Where(x => x.selX == true).ToList();
            String nomUsu = Vars.obUsuario.nomUsu.Substring(11, Vars.obUsuario.nomUsu.Length - 11).ToUpper();
            foreach (var item in lsDocsSel)
                if (tipoOperacion == "RECIBIR")
                    item.recibeUsu = nomUsu;
                else if (tipoOperacion == "ACTUALIZAR")
                    item.actualizaUsu = nomUsu;
                else if (tipoOperacion == "DEVOLVER")
                    item.devuelveUsu = nomUsu;

            try
            {
                btnOk.Enabled = false;

                if (tipoOperacion == "RECIBIR")
                    xLsDocsEst = Task.Run(() => DocsEstudianteBridge.upsertRecibir(lsDocsSel)).Result;
                else if (tipoOperacion == "ACTUALIZAR")
                    xLsDocsEst = Task.Run(() => DocsEstudianteBridge.upsertActualizar(lsDocsSel)).Result;
                else if (tipoOperacion == "DEVOLVER")
                    xLsDocsEst = Task.Run(() => DocsEstudianteBridge.upsertDevolver(lsDocsSel)).Result;

                xLsDocsEst = xLsDocsEst.OrderByDescending(x => x.obligadoX).ThenBy(y => y.nomDocX).ToList();
                dgvDocs.DataSource = xLsDocsEst;

                operar("", false);
                lblTitle.Text = "DOCUMENTOS EXIGIDOS";
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
            }

            btnOk.Enabled = true;
        }

    }//end class

}
