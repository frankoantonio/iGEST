using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmPersonaFind : FrmMaster
    {
        private List<Persona> lsPerFind;        // búsqueda en el servidor        
        private bool yaBusco = false;           // true; para indicar si ya realizó la búsqueda

        public Persona obPersonaSel = null;     // devuelve seleccionado
        private int xTipoPerReg;
        private bool xReqInfClieProv;
        private Dictionary<int, string> titles1 = new Dictionary<int, string> {
                { Vars.dicTipos["TI_PERSONA.NATURAL"], "Apellidos y Nombres" }, { Vars.dicTipos["TI_PERSONA.JURIDICA"], "Razón Social" },
                { Vars.dicTipos["TI_PERSONA.GRUPO"], "Nombre de Grupo" }, { Vars.dicTipos["TI_PERSONA.NAT/JUR"], "Apellidos y Nombres / Razón Social" } };
        private bool xCrudInParent = true;      // true; se agrega/edita en formulario que le llamó

        private int xTipoPersona = 0;           // 10 = solo_persona; 11 = solo_empresa; 0 = persona_o_empresa 
        
        private bool xReqInfContacto;           // true; exige_datos_contacto
        private bool xDataCliente;              // true; muestra controles para ruc de persona y nombre comercial

        public CRUD dbOperPublic;               // Sí xCrudInParent = true; devuelve_operación_que_seleccionó

        /// <summary>
        /// Búsqueda de personas o empresas de acuerdo a los siguientes parámetros <br/>
        /// int xTipoPersona : 10 = solo_persona; 11 = solo_empresa; 0 = persona_o_empresa  <br/>
        /// bool xCrudInParent : true; se_agrega_o_ edita_en_formulario_que_llamó <br/>
        /// bool xReqInfContacto : true; exige_datos_contacto <br/>
        /// bool xDataCliente : true; muestra controles para ruc de persona y nombre comercial <br/>
        /// bool xReadOnly : true; formulario de solo soloLectura <br/>
        /// </summary>        
        public FrmPersonaFind(int xTipoPersona, bool xCrudInParent, bool xReqInfContacto, bool xDataCliente, bool xLectura) : base(CRUD.SELECT, xLectura)
        //public FrmPersonaFind(int xTipoPersona, bool xCrudInParent, bool xReqInfContacto, bool xDataCliente) : base(CRUD.SELECT, false)
        {
            InitializeComponent();

            this.xTipoPersona = xTipoPersona;
            this.xCrudInParent = xCrudInParent;
            this.xReqInfContacto = xReqInfContacto;
            this.xDataCliente = xDataCliente;

            lblTitle.Text = (xTipoPersona == 10 ? "BÚSQUEDA DE TI_PERSONAS" : (xTipoPersona == 11 ? "BÚSQUEDA DE EMPRESAS" : "BÚSQUEDA DE TI_PERSONAS O EMPRESAS"));
            rbtRazSoc.Text = (xTipoPersona == 10 ? "Apellidos y Nombres" : (xTipoPersona == 11 ? "Razón Social" : "Apellidos y Nombres / Razón Social"));

            this.toolTip.SetToolTip(this.btnNew, "Agregar nueva " + (xTipoPersona == 10 ? "\"Persona\"." : (xTipoPersona == 11 ? "\"Empresa\"." : "\"Persona o Empresa\".")));
            this.toolTip.SetToolTip(this.btnEdit, "Modificar " + (xTipoPersona == 10 ? "\"Persona\"." : (xTipoPersona == 11 ? "\"Empresa\"." : "\"Persona o Empresa\".")));
            this.toolTip.SetToolTip(this.btnOk, "Seleccionar " + (xTipoPersona == 10 ? "\"Persona\"." : (xTipoPersona == 11 ? "\"Empresa\"." : "\"Persona o Empresa\".")));

            dgvPersona.AutoGenerateColumns = false;

            dgvPersona_idTipoPersona.ValueMember = "idTipo";
            dgvPersona_idTipoPersona.DisplayMember = "nomCorto";
            dgvPersona_idTipoPersona.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_PERSONA").ToList();

            //rbtDocIdent.Checked = (Vars.dicVarGB["FindPersona"] == "NDOC");

            if (Vars.dicVarGB["FindPersona"] == "NDOC")
                rbtDocIdent.Checked = true;
            else
                rbtRazSoc.Checked = true;

            //if (xLectura)
            //{
            //    this.setLectura();
            //    btnOk.Enabled = true;
            //}

            this.setPermisos();

        }



        public FrmPersonaFind(int xTipoPerReg, bool xCrudInParent, bool xEnablebCrud) : base(CRUD.SELECT)
        {
            InitializeComponent();

            this.xTipoPerReg = xTipoPerReg;
            this.xCrudInParent = xCrudInParent;
            btnNew.Enabled = xEnablebCrud;
            btnEdit.Enabled = xEnablebCrud;
            


            var titles = new Dictionary<int, string> {
                { Vars.dicTipos["TI_PERSONA.NATURAL"], "BÚSQUEDA DE PERSONAS" }, { Vars.dicTipos["TI_PERSONA.JURIDICA"], "BÚSQUEDA DE EMPRESAS" },
                { Vars.dicTipos["TI_PERSONA.GRUPO"], "BÚSQUEDA DE GRUPOS" }, { Vars.dicTipos["TI_PERSONA.NAT/JUR"], "BÚSQUEDA DE PERSONAS O EMPRESAS" } };
            lblTitle.Text = titles.ContainsKey(xTipoPerReg) ? titles[xTipoPerReg] : "BÚSQUEDA DE PERSONAS / EMPRESAS / GRUPOS";

            rbtRazSoc.Text = titles1.ContainsKey(xTipoPerReg) ? titles1[xTipoPerReg] : "Apellidos y Nombres / Razón Social / Nombre del Grupo";
            dgvPersona_apeNomsX.HeaderText = rbtRazSoc.Text.ToUpper();

            dgvPersona.AutoGenerateColumns = false;

            dgvPersona_idTipoPersona.ValueMember = "idTipo";
            dgvPersona_idTipoPersona.DisplayMember = "nomCorto";
            dgvPersona_idTipoPersona.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_PERSONA").ToList();

            if (Vars.dicVarGB["FindPersona"] == "NOMS")
                rbtRazSoc.Checked = true;
            else
                rbtDocIdent.Checked = true;

            this.setPermisos();
        }

        private void FrmPersonaFind_Load(object sender, EventArgs e)
        {
            txtContenido.Select();
        }

        private void rbtDocIdent_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtDocIdent.Checked)
                selRbt("N° Documento de Identidad");
        }

        private void rbtRazSoc_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtRazSoc.Checked)
                selRbt(titles1.ContainsKey(xTipoPerReg) ? titles1[xTipoPerReg] : "Apellidos y Nombres / Razón Social / Nombre de Grupo");
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
                rbtDocIdent.Focus();
        }

        private void dgvPersona_KeyDown(object sender, KeyEventArgs e)
        {
            if (dgvPersona.Rows.Count > 0 && dgvPersona.CurrentRow.Index == 0 && e.KeyCode == Keys.Up)
                txtContenido.Focus();
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            busqueda();
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            // VERIFICAR SI VA AGREGAR UN CLIENTE_PROVEDOR, UN TRABAJADOR, UN FAMILIAR_eST_COL, ESTUDIANTE_COEL, ESTUDIANTE_ACAD 

            // puede agregar solo si la variable global "ReqUsuIsPerson" (requiere que el usuario este registrado previamente como persona)

            //if (bool.Parse(Vars.dicVarGB["ReqUsuIsTRAB"]) ) // && buscar que se a trabajador
            //     return;
            //if (bool.Parse(Vars.dicVarGB["ReqUsuIsFAM"]))   // &&  buscar que sea familiar del estudiante del colegio EN LOTe
            //    return;
            //if (bool.Parse(Vars.dicVarGB["ReqUsuIsALU"]))   // && buscar que sea alumno del colegio o academia segun tipo de empresa      EN LOTe
            //    return;

            //if ReqUsuIsPerson=true return
            //else registra persona


            if (!yaBusco)
            {
                string msg = (xTipoPersona == 10 ? "\"Persona\"." : (xTipoPersona == 11 ? "\"Empresa\"." : "\"Persona o Empresa\"."));
                Utils.msg("Primero busca la " + msg + " para asegurarte que no está registrado.", Estado.WARNING);
                txtContenido.Focus();
                return;
            }

            newEditReg(CRUD.NEW, null);
            yaBusco = false;
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (!validarCtrls())
                return;

            newEditReg(CRUD.EDIT, lsPerFind[dgvPersona.CurrentRow.Index]);
            yaBusco = false;
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            if (!validarCtrls())
                return;

            obPersonaSel = lsPerFind[dgvPersona.CurrentRow.Index];
            dbOperPublic = CRUD.SELECT;
            this.operOK = true;
            this.Dispose();
        }

        //
        // Métodos
        //  
        private void selRbt(string lblRbt)
        {            
            dgvPersona.DataSource = lsPerFind = new List<Persona>();
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

            Persona obAux = lsPerFind[dgvPersona.CurrentRow.Index];
            if (xTipoPersona == 10 && obAux.idTipoPersona == 11)
            {
                Utils.msg("Se espera selecciones una persona.", Estado.WARNING);
                dgvPersona.Focus();
                return false;
            }
            else if (xTipoPersona == 11 && obAux.idTipoPersona == 10)
            {
                Utils.msg("Se espera selecciones una empresa.", Estado.WARNING);
                dgvPersona.Focus();
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

            if (rbtDocIdent.Checked)
                lsPerFind = Task.Run(() => PersonaBridge.getPersonaByDocIdent(Vars.obEmpresa.idEmpresa, txtContenido.Text.Trim(), xTipoPerReg)).Result;
            else
                lsPerFind = Task.Run(() => PersonaBridge.getPersonaByApeNomRzSoc(Vars.obEmpresa.idEmpresa, txtContenido.Text.Trim(), xTipoPerReg)).Result.OrderBy(x => x.apeNomsX).ToList();
            dgvPersona.DataSource = lsPerFind;      // Order By en LINQ no ordena como se espera

            if (lsPerFind.Count > 0)
            {
                dgvPersona.Focus();
                dgvPersona.CurrentCell = dgvPersona.Rows[0].Cells[1];
            }
            else
            {
                txtContenido.Focus();
                Utils.msg("No se encontró resultados, puedes agregar un nuevo registro", Estado.WARNING);
            }

            yaBusco = true;
        }

        private void newEditReg(CRUD operacion, Persona obPerAux)
        {
            if (this.xCrudInParent)
            {
                dbOperPublic = operacion;
                obPersonaSel = obPerAux;
                this.operOK = true;
                this.Dispose();
            }
            else
            {
                this.Enabled = false;

                if (xTipoPersona == 10)
                    obPerAux = frmPersona(obPerAux, operacion);
                else if (xTipoPersona == 11)
                    obPerAux = frmEmpresa(obPerAux, operacion);
                else
                {
                    //if (operacion == CRUD.NEW)
                    //{
                    //    FrmClienteTipo frm = new FrmClienteTipo();
                    //    frm.ShowDialog();
                    //    if (frm.tipoPer == 10)
                    //        obPerAux = frmPersona(obPerAux, operacion);
                    //    else if (frm.tipoPer == 11)
                    //        obPerAux = frmEmpresa(obPerAux, operacion);
                    //}
                    //else if (operacion == CRUD.EDIT)
                    //{
                    //    if (obPerAux.idTipoPersona == 10)
                    //        obPerAux = frmPersona(obPerAux, operacion);
                    //    else if (obPerAux.idTipoPersona == 11)
                    //        obPerAux = frmEmpresa(obPerAux, operacion);
                    //}
                }

                this.Enabled = true;

                if (obPerAux != null)
                {
                    rbtRazSoc.Checked = true;
                    txtContenido.Text = obPerAux.nombres + " " + obPerAux.paterno + " " + obPerAux.materno;
                    lsPerFind = new List<Persona>();
                    lsPerFind.Add(obPerAux);
                    dgvPersona.DataSource = lsPerFind;
                    yaBusco = false;
                }
            }
        }

        private Persona frmPersona(Persona obPerAux, CRUD operDB)
        {
            //FrmClientePerNat frm = new FrmClientePerNat(obPerAux, xReqInfContacto, xDataCliente, operDB, this.xLectura);
            //frm.ShowDialog();
            //if (frm.isOperOK)
            //    return frm.xObPersona;
            return null;
        }

        private Persona frmEmpresa(Persona obPerAux, CRUD operDB)
        {
            //FrmClientePerJur frm = new FrmClientePerJur(obPerAux, operDB, this.xLectura);
            //frm.ShowDialog();
            //if (frm.isOperOK)
            //    return frm.xObPerJur;
            return null;
        }

    }//end class

}
