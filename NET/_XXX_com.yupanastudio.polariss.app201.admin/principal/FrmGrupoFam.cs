using System;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmGrupoFam : FrmMaster
    {
        public GrupoFamiliar xObGrpFam;

        public FrmGrupoFam(GrupoFamiliar xObGrpFam, CRUD xOperCRUD, bool xReadOnly) : base(xOperCRUD, xReadOnly)
        {
            InitializeComponent();
            this.xObGrpFam = xObGrpFam;
        }

        private void FrmGrpFam_Load(object sender, EventArgs e)
        {
            if (xOperCRUD == CRUD.NEW)
            {
                xObGrpFam = new GrupoFamiliar() { idGrpFam = -1, idEmpresa = Vars.obEmpresa.idEmpresa };
            }
            else if (xOperCRUD == CRUD.EDIT)
            {
                txtNomGrp.Text = xObGrpFam.nomGrpFam;
                txtProced.Text = xObGrpFam.procedencia;
                txtCodigo.Text = xObGrpFam.codigo;
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
            txtNomGrp.Text = Utils.allTrim_InjectCode(txtNomGrp.Text);
            if (txtNomGrp.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Escribe el nombre del grupo familiar. Usa el apellido paterno y materno.", Estado.WARNING);
                txtNomGrp.Focus();
                return false;
            }
            txtProced.Text = Utils.allTrim_InjectCode(txtProced.Text);
            if (txtProced.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Escribe la zona/distrito de procedencia, para diferenciarlo de otros grupos.", Estado.WARNING);
                txtProced.Focus();
                return false;
            }
            try
            {
                string[] cod = txtNomGrp.Text.Split(' ');
                txtCodigo.Text = cod[0].Substring(0, 3) + cod[1].Substring(0, 3) + "??";
            }
            catch (Exception)
            {
                Utils.msg("Se requiere mínimo tres letras por cada apellido.", Estado.WARNING);
                return false;
            }
            return true;
        }

        private void guardar()
        {
            if (!validarCtrls())
                return;

            xObGrpFam.nomGrpFam = txtNomGrp.Text;
            xObGrpFam.procedencia = txtProced.Text;
            if (xOperCRUD == CRUD.NEW || txtCodigo.Text.Substring(0, 6) != xObGrpFam.codigo.Substring(0, 6))
                xObGrpFam.codigo = txtCodigo.Text.Substring(0, 6);

            try
            {
                btnOk.Enabled = false;
                xObGrpFam = Task.Run(() => GrupoFamiliarBridge.upsert(xObGrpFam)).Result;
                operOK = true;
                Utils.msg("Los datos se guardaron correctamente.", Estado.SUCCESS);
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
