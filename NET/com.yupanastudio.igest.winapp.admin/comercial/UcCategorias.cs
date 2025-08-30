using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public partial class UcCategorias : UcMaster
    {
        private List<Categoria> lsCategoria;

        public UcCategorias()
        {
            InitializeComponent();
            dgvCategoria.AutoGenerateColumns = false;
        }

        private void UcCategoria_Load(object sender, EventArgs e)
        {
            lsCategoria = Task.Run(() => CategoriaBridge.getCategoriaByNegocio(Vars.obEmpresa.idEmpresa)).Result.OrderBy(x => x.orden).ToList();
            dgvCategoria.DataSource = lsCategoria;
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            FrmCategoria frm = new FrmCategoria(null, CRUD.NEW, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                dgvCategoria.DataSource = new List<Categoria>();
                lsCategoria.Add(frm.xObCategoria);
                lsCategoria = lsCategoria.OrderBy(x => x.orden).ToList();
                dgvCategoria.DataSource = lsCategoria;

                for (int i = 0; i < lsCategoria.Count; i++)
                    if (lsCategoria[i].idCategoria == frm.xObCategoria.idCategoria)
                    {
                        dgvCategoria.Select();
                        dgvCategoria.CurrentCell = dgvCategoria.Rows[i].Cells["dgvCat_orden"];
                        return;
                    }

                dgvCategoria.Refresh();
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (!validarCtrl())
                return;

            int orden = lsCategoria[dgvCategoria.CurrentRow.Index].orden;
            FrmCategoria frm = new FrmCategoria(lsCategoria[dgvCategoria.CurrentRow.Index], CRUD.EDIT, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                if (orden != frm.xObCategoria.orden)
                {
                    lsCategoria = lsCategoria.OrderBy(x => x.orden).ToList();
                    dgvCategoria.DataSource = lsCategoria;

                    for (int i = 0; i < lsCategoria.Count; i++)
                        if (lsCategoria[i].idCategoria == frm.xObCategoria.idCategoria)
                        {
                            dgvCategoria.Select();
                            dgvCategoria.CurrentCell = dgvCategoria.Rows[i].Cells["dgvCat_orden"];
                            return;
                        }
                }
                else
                    lsCategoria[dgvCategoria.CurrentRow.Index] = frm.xObCategoria;

                dgvCategoria.Refresh();
            }
        }

        //
        // Métodos
        //
        private bool validarCtrl()
        {
            if (dgvCategoria.CurrentRow == null || lsCategoria.Count < 1)
            {
                Utils.msg("Se requiere un registro seleccionado.", Estado.WARNING);
                return false;
            }

            return true;
        }

    }//end class

}
