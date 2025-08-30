using System;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmEmpresaGrupo : FrmMaster
    {
        Tipo obEmpGrp;

        public FrmEmpresaGrupo(Tipo obEmpGrp, CRUD operCRUD, bool readOnly) : base(operCRUD, readOnly)
        {
            this.obEmpGrp = obEmpGrp;
            InitializeComponent();
        }

        private void FrmEmpresa_Load(object sender, EventArgs e)
        {
            if (operCRUD == CRUD.EDIT)
            {
                nudIdGrp.Value = obEmpGrp.idTipo;
                txtCodGrp.Text = obEmpGrp.nomCorto;
                txtNomGrp.Text = obEmpGrp.nomTipo;
            }
            else if (operCRUD == CRUD.NEW)
            {
                nudIdGrp.Value = 9999;
                obEmpGrp = new Tipo() { idTipo = -1 };
            }
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            guardar();
        }

        //
        // Métodos
        //
        private bool validarCtrls()
        {
            if (txtCodGrp.Text.Trim().Length < 6)
            {
                Utils.msg("Se requiere seis caracteres.", Estado.WARNING);
                txtCodGrp.Focus();
                return false;
            }
            else if (txtNomGrp.Text.Trim().Length < Vars.minCar)
            {
                Utils.msg("Se requiere al menos " + Vars.minCar + " caracteres.", Estado.WARNING);
                txtNomGrp.Focus();
                return false;
            }
            return true;
        }

        private async void guardar()
        {
            if (!validarCtrls())
                return;

            obEmpGrp.nomCorto = txtCodGrp.Text.Trim();
            obEmpGrp.nomTipo = txtNomGrp.Text.Trim();
            obEmpGrp.codOficial = "";
            obEmpGrp.grupo = "TIP.GRP";
            obEmpGrp.orden = 1;
            obEmpGrp.activo = true;
            obEmpGrp.idRols = "";

            try
            {
                btnOk.Enabled = false;

                //if (operCRUD == CRUD.NEW)
                //    await EmpresaGrupoBridge.insert(obEmpGrp);
                //else
                //    await EmpresaGrupoBridge.update(obEmpGrp);

                this.operOK = true;
                Utils.msg("La operación se ejecutó correctamente.", Estado.SUCCESS);
                this.Dispose();
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
                btnOk.Enabled = true;
            }
        }

    }//end class

}
