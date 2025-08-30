using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmFamiliarFind : FrmMaster
    {
        private List<Persona> lsFamsFind;           // búsqueda en el servidor
        private bool yaBusco = false;               // true; para indicar si ya realizó la búsqueda       
        private Persona xObPersona;                 // persona del que se buscará sus familiares        
        private bool xEditEnabled;                  // para (des)habilitar la opción de editar familiar 
        private bool xSetGrpFam;                    // true; para agregar al grupo familiar del estudiante 
        public Familiar obFamSel = null;            // devuelve familiar seleccionado 

        public FrmFamiliarFind(Persona xObPersona, bool xNewEnabled, bool xEditEnabled, bool xSetGrpFam, bool xReadOnly) : base(CRUD.SELECT, xReadOnly)
        {
            InitializeComponent();
            this.xObPersona = xObPersona;
            this.xEditEnabled = xEditEnabled;
            this.xSetGrpFam = xSetGrpFam;
            btnNew.Enabled = xNewEnabled;           // para (des)habilitar la opción de crear familiar 
            btnEdit.Enabled = xEditEnabled;
            dgvPersona.AutoGenerateColumns = false;
            rbtFams.Checked = true;
            rbtNoms.Enabled = !(!xNewEnabled && !xEditEnabled);
        }

        private void rbtFams_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtFams.Checked)
            {
                lsFamsFind = Task.Run(() => PersonaBridge.getPersonaFamsAll(xObPersona.idGrpFam, xObPersona.idPersona)).Result.OrderBy(x => x.apeNomsX).ToList();
                changeRbt();
            }
        }

        private void rbtNoms_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtNoms.Checked)
            {
                lsFamsFind = new List<Persona>();
                changeRbt();
            }
        }

        private void txtContenido_Enter(object sender, EventArgs e)
        {
            txtContenido.SelectAll();
        }

        private void txtContenido_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == Convert.ToChar(Keys.Enter))
                busqueda();
        }

        private void txtContenido_KeyDown(object sender, KeyEventArgs e)
        {
            if (dgvPersona.Rows.Count > 0 && (e.KeyCode == Keys.Down))
            {
                dgvPersona.Focus();
                dgvPersona.CurrentCell = dgvPersona.Rows[0].Cells[1];
            }
            else if ((e.KeyCode == Keys.Up))
            {
                rbtNoms.Focus();
            }
        }

        private void dgvPersona_KeyDown(object sender, KeyEventArgs e)
        {
            if (dgvPersona.Rows.Count > 0 && dgvPersona.CurrentRow.Index == 0 && e.KeyCode == Keys.Up)
            {
                if (rbtNoms.Checked)
                    txtContenido.Focus();
                else
                    rbtFams.Focus();
            }
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            busqueda();
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            if (!yaBusco)
            {
                Utils.msg("Primero busca la persona por sus apellidos y/o nombres para asegurarte que no está registrado.", Estado.WARNING);
                if (rbtFams.Checked)
                    rbtNoms.Checked = true;
                else
                {
                    txtContenido.Text = "";
                    txtContenido.Select();
                }
                return;
            }

            newEditReg(CRUD.NEW, -1);
            yaBusco = false;
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (!validarCtrls())
                return;

            newEditReg(CRUD.EDIT, lsFamsFind[dgvPersona.CurrentRow.Index].idPersona);
            yaBusco = false;
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            if (!validarCtrls())
                return;

            Persona obFamAux = lsFamsFind[dgvPersona.CurrentRow.Index];
            obFamSel = Task.Run(() => FamiliarBridge.getFamiliarByID(obFamAux.idPersona, xObPersona.idPersona)).Result;


            if (obFamSel.idFamiliar == -1)
            {
                Utils.msg("Primero completa los datos del familiar.", Estado.WARNING);
                newEditReg(CRUD.EDIT, obFamAux.idPersona);
                yaBusco = false;
                return;
            }

            if (obFamSel.idFamEst == -1)
            {
                Utils.msg("Indica el vínculo familiar.", Estado.WARNING);
                newEditReg(CRUD.EDIT, obFamAux.idPersona);
                yaBusco = false;
                return;
            }

            this.operOK = true;
            this.Dispose();
        }

        //
        // Métodos
        //
        private void changeRbt()
        {
            txtContenido.Enabled = rbtNoms.Checked;
            btnFind.Enabled = rbtNoms.Checked;
            dgvPersona.DataSource = lsFamsFind;
            txtContenido.Text = "";
            txtContenido.Focus();
            yaBusco = false;
        }

        private bool validarCtrls()
        {
            if (dgvPersona.CurrentRow == null)
            {
                Utils.msg("Se requiere un registro seleccionado.", Estado.WARNING);
                txtContenido.Focus();
                return false;
            }

            if (lsFamsFind[dgvPersona.CurrentRow.Index].idPersona == xObPersona.idPersona)
            {
                Utils.msg("Se requiere un familiar, estas seleccionando al estudiante.", Estado.WARNING);
                return false;
            }

            return true;
        }

        private bool validarBusqueda()
        {
            txtContenido.Text = Utils.allTrim_InjectCode(txtContenido.Text);

            if (txtContenido.Text.Length < int.Parse(Vars.dicVarGB["MinCarFind"]))
            {
                Utils.msg("Se requiere como mínimo " + Vars.dicVarGB["MinCarFind"] + " caracteres.", Estado.WARNING);
                txtContenido.Focus();
                return false;
            }

            return true;
        }

        private void busqueda()
        {
            if (!validarBusqueda())
                return;

            lsFamsFind = (Task.Run(() => PersonaBridge.getPersonaByApeNomRzSoc(Vars.obEmpresa.idEmpresa, txtContenido.Text.Trim(), 10)).Result).OrderBy(x => x.apeNomsX).ToList(); // 10 = TI_PERSONA NATURAL
            dgvPersona.DataSource = lsFamsFind;

            if (lsFamsFind.Count > 0)
            {
                dgvPersona.Focus();
                dgvPersona.CurrentCell = dgvPersona.Rows[0].Cells[1];
            }
            else
            {
                txtContenido.Focus();
                Utils.msg("No se encontró resultados, puedes crear un nuevo \"Familiar\".", Estado.WARNING);
            }

            yaBusco = true;
        }

        private void newEditReg(CRUD operacion, long idFamiliar)
        {
            this.Enabled = false;
            try
            {
                FrmFamiliar frm = new FrmFamiliar(idFamiliar, xObPersona, xSetGrpFam, operacion, this.xLectura);
                frm.ShowDialog();
                if (frm.operOK)
                {
                    if (!xEditEnabled)   // sí está deshabilitado, se selecciona el objeto Familiar y se cierra el formulario
                    {
                        operOK = true;
                        obFamSel = frm.xObFamiliar;
                        this.Dispose();
                    }

                    rbtNoms.Checked = true;
                    txtContenido.Text = frm.xObFamiliar.obPerX.paterno + " " + frm.xObFamiliar.obPerX.materno + " " + frm.xObFamiliar.obPerX.nombres;
                    lsFamsFind = new List<Persona>() { frm.xObFamiliar.obPerX };
                    dgvPersona.DataSource = lsFamsFind;
                    yaBusco = false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            this.Enabled = true;
        }

    }//end class

}
