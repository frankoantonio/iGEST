using System;
using System.Collections.Generic;
using System.Linq;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmLugNac : FrmMaster
    {
        private DateTime feOriginal;
        private string edadOriginal = "";
        public LugarNac obLgNc;

        public FrmLugNac(LugarNac obLgNc, CRUD operCRUD, bool readOnly) : base(operCRUD, readOnly)
        {
            InitializeComponent();
            this.obLgNc = obLgNc;
        }

        private void FrmLugNac_Load(object sender, EventArgs e)
        {
            cmbPais.DataSource = Vars.lsPaises;

            if (xOperCRUD == CRUD.EDIT)
            {
                Distrito obDist = Vars.lsDists.Where(x => x.idDistrito == obLgNc.idDist).FirstOrDefault();
                cmbPais.SelectedValue = obLgNc.idPais;
                cmbDpto.SelectedValue = obDist.idDistrito.Substring(0, 2);
                cmbProv.SelectedValue = obDist.idDistrito.Substring(0, 4);
                cmbDist.SelectedValue = obDist.idDistrito;
                txtLugNac.Text = obLgNc.nomLugar;
                dtpFeNac.Value = obLgNc.feNac;
                txtEdad.Text = obLgNc.edadX;
                feOriginal = obLgNc.feNac;
                edadOriginal = obLgNc.edadX;
            }
            else if (xOperCRUD == CRUD.NEW)
            {
                cmbPais.SelectedItem = null;
                txtEdad.Text = "?";
            }
        }

        private void cmbPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbDpto.DataSource = new List<Departamento>();
            cmbProv.DataSource = new List<Provincia>();
            cmbDist.DataSource = new List<Distrito>();

            if (cmbPais.SelectedItem != null)
                cmbDpto.DataSource = Vars.lsDptos.Where(x => x.idPais == ((Pais)cmbPais.SelectedItem).idPais).ToList();
        }

        private void cmbDep_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbDpto.SelectedItem != null)
                cmbProv.DataSource = Vars.lsProvs.Where(x => x.idDepartamento == ((Departamento)cmbDpto.SelectedItem).idDepartamento).ToList();
        }

        private void cmbProv_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbProv.SelectedItem != null)
                cmbDist.DataSource = Vars.lsDists.Where(x => x.idProvincia == ((Provincia)cmbProv.SelectedItem).idProvincia).ToList();
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            establecer();
        }

        //
        // Métodos
        //
        private bool validarCtrls()
        {
            if (dtpFeNac.Value == DateTime.Parse("1900-01-01"))
            {
                Utils.msg("Ingresa una fecha correcta.", Estado.WARNING);
                dtpFeNac.Focus();
                return false;
            }
            if (cmbDist.SelectedItem == null)
            {
                Utils.msg("Selecciona \"País, Departamento, Provincia, Distrito\".", Estado.WARNING);
                cmbDist.Focus();
                return false;
            }
            return true;
        }

        private void establecer()
        {
            if (!validarCtrls())
                return;

            if (xOperCRUD == CRUD.NEW)
                obLgNc = new LugarNac() { idPersona = -1 };
            obLgNc.idPais = (int)cmbPais.SelectedValue;
            obLgNc.idDist = (string)cmbDist.SelectedValue;
            obLgNc.nomLugar = Utils.allTrim_InjectCode(txtLugNac.Text);
            obLgNc.feNac = dtpFeNac.Value;
            obLgNc.edadX = txtEdad.Text;

            operOK = true;
            this.Dispose();
        }

        private void dtpFeNac_Leave(object sender, EventArgs e)
        {
            if (xOperCRUD == CRUD.EDIT)
            {
                if (dtpFeNac.Value == feOriginal)
                    txtEdad.Text = edadOriginal;
                else
                    txtEdad.Text = "?";
            }
        }

    }//end class

}
