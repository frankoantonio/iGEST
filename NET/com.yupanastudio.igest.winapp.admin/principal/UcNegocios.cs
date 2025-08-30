using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class UcNegocios : UcMaster
    {
        private Empresa obEmp;
        private Negocio obNeg;

        public UcNegocios()
        {
            InitializeComponent();
        }

        private async void UcNegocios_Load(object sender, EventArgs e)
        {
            //////List<Empresa> lsEmp = await EmpresaService.getEmpresaAllWithChild();
            //////cmbEmpresa.DataSource = lsEmp.OrderBy(x => x.nomComercial).ToList();
        }

        private async void cmbEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbEmpresa.SelectedItem != null)
            {
                obEmp = (Empresa)cmbEmpresa.SelectedItem;
                List<Negocio> lsNeg = await NegocioBridge.getNegocioByEmp(obEmp.idEmpresa);
                cmbNegocio.DataSource = lsNeg.OrderBy(x => x.nomNegocio).ToList();
                if (cmbNegocio.Items.Count < 1)
                {
                    lblSede.Text = "===Falta registrar Unidad de Negocio===";
                    dgvSedes.DataSource = await NegocioSedeBridge.getNegocioSedeByNeg(obEmp.idEmpresa, -1);
                }
            }
        }

        private async void cmbNegocio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbNegocio.SelectedItem != null)
            {
                obNeg = ((Negocio)cmbNegocio.SelectedItem);
                lblSede.Text = obNeg.nomNegocio;
                dgvSedes.DataSource = await NegocioSedeBridge.getNegocioSedeByNeg(obEmp.idEmpresa, obNeg.idNegocio);
                if (dgvSedes.Rows.Count < 1)
                {
                    dgvSis.DataSource = await NegocioSedeSistemaBridge.getNegocioSedeSistemaByNegSede(-1);
                    lblSistemas.Text = "===Falta registrar sedes===";
                }
            }
        }

        private async void dgvSedes_SelectionChanged(object sender, EventArgs e)
        {
            if (cmbNegocio.SelectedItem != null && dgvSedes.Rows.Count > 0 && dgvSedes.CurrentRow != null)
            {
                lblSistemas.Text = obNeg.nomNegocio + " - " + ((string)dgvSedes.CurrentRow.Cells[5].Value).ToUpper();
                dgvSis.DataSource = await NegocioSedeSistemaBridge.getNegocioSedeSistemaByNegSede((int)dgvSedes.CurrentRow.Cells[0].Value);
            }
            else
            {
                dgvSis.DataSource = await NegocioSedeSistemaBridge.getNegocioSedeSistemaByNegSede(-1);
                lblSistemas.Text = "===Falta registrar sedes===";
            }
        }

        private void btnEditSede_Click(object sender, EventArgs e)
        {
            if (dgvSedes.Rows.Count < 1)
            {
                Utils.msg("No hay sedes para habilitar.", Estado.WARNING);
                return;
            }
            else if (!obNeg.activo)
            {
                Utils.msg("La Unidad de Negocio no esta activo.\nPrimero habilítelo.", Estado.WARNING);
                return;
            }

            des_habilitarCtrl("SEDE", true);
            dgvSedes.Focus();
            dgvSedes.CurrentCell = dgvSedes.Rows[0].Cells["dgvSedes_activo"];
        }

        private void btnEditSis_Click(object sender, EventArgs e)
        {
            if (dgvSedes.Rows.Count < 1)
            {
                Utils.msg("Se requiere una sede seleccionada.", Estado.WARNING);
                return;
            }
            else if (!(bool)dgvSedes.CurrentRow.Cells["dgvSedes_activo"].Value)
            {
                Utils.msg("Primero habilite la sede.", Estado.WARNING);
                return;
            }
            else if (dgvSis.Rows.Count < 1)
            {
                Utils.msg("No hay sistemas para habilitar.", Estado.WARNING);
                return;
            }

            des_habilitarCtrl("SISTEMA", true);
            dgvSis.Focus();
            dgvSis.CurrentCell = dgvSis.Rows[0].Cells["dgvSis_activo"];
        }

        private async void btnOkSede_Click(object sender, EventArgs e)
        {
            try
            {
                btnOkSede.Enabled = false;
                if (DialogResult.Yes == Utils.msgQ("Realmente desea guardar los cambios?", Estado.YESNO))
                {
                    dgvSedes.DataSource = await NegocioSedeBridge.save(obEmp.idEmpresa, obNeg.idNegocio, dgvSedes.DataSource as List<NegocioSede>);
                    Utils.msg("La operación se ejecutó correctamente.", Estado.SUCCESS);
                    des_habilitarCtrl("SEDE", false);
                }
                else
                {
                    btnOkSede.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
                btnOkSede.Enabled = true;
            }
        }

        private async void btnOkSis_Click(object sender, EventArgs e)
        {
            try
            {
                btnOkSis.Enabled = false;
                if (DialogResult.Yes == Utils.msgQ("Realmente desea guardar los cambios?", Estado.YESNO))
                {
                    dgvSis.DataSource = await NegocioSedeSistemaBridge.save((int)dgvSedes.CurrentRow.Cells[0].Value, dgvSis.DataSource as List<NegocioSedeSistema>);
                    Utils.msg("La operación se ejecutó correctamente.", Estado.SUCCESS);
                    des_habilitarCtrl("SISTEMA", false);
                }
                else
                {
                    btnOkSis.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
                btnOkSis.Enabled = true;
            }
        }

        private async void btnCancelSede_Click(object sender, EventArgs e)
        {
            dgvSedes.DataSource = await NegocioSedeBridge.getNegocioSedeByNeg(obEmp.idEmpresa, obNeg.idNegocio);
            des_habilitarCtrl("SEDE", false);
        }

        private async void btnCancelSis_Click(object sender, EventArgs e)
        {
            dgvSis.DataSource = await NegocioSedeSistemaBridge.getNegocioSedeSistemaByNegSede((int)dgvSedes.CurrentRow.Cells[0].Value);
            des_habilitarCtrl("SISTEMA", false);
        }

        //
        // Métodos
        //
        private void des_habilitarCtrl(string grupo, bool b)
        {
            cmbEmpresa.Enabled = !b;
            cmbNegocio.Enabled = !b;

            if (grupo == "SEDE")
            {
                btnEditSede.Enabled = !b;
                btnOkSede.Enabled = b;
                btnCancelSede.Enabled = b;
                dgvSis.Enabled = !b;
                btnEditSis.Enabled = !b;

                dgvSedes.Columns["dgvSedes_activo"].ReadOnly = !b;
            }
            else if (grupo == "SISTEMA")
            {
                btnEditSis.Enabled = !b;
                btnOkSis.Enabled = b;
                btnCancelSis.Enabled = b;

                dgvSedes.Enabled = !b;
                btnEditSede.Enabled = !b;

                dgvSis.Columns["dgvSis_activo"].ReadOnly = !b;
            }
        }

    }//end class

}
