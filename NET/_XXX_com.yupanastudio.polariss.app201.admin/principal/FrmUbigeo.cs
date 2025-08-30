using System;
using System.Collections.Generic;
using System.Linq;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmUbigeo : FrmMaster
    {
        public Distrito obDist;

        public FrmUbigeo(Distrito obDist, CRUD operCRUD, bool readOnly) : base(operCRUD, readOnly)
        {
            InitializeComponent();
            this.obDist = obDist;
        }

        private void FrmUbigeo_Load(object sender, EventArgs e)
        {
            cmbPais.DataSource = Vars.lsPaises;

            if (obDist != null)
            {
                string idDist = obDist.idDistrito;
                cmbPais.SelectedItem = Vars.lsPaises.Where(y => y.idPais == Vars.lsDptos.Where(x => x.idDepartamento == idDist.Substring(0, 2)).First().idPais).First();
                cmbDpto.SelectedValue = idDist.Substring(0, 2);
                cmbProv.SelectedValue = idDist.Substring(0, 4);
                cmbDist.SelectedValue = idDist;
            }
        }

        private void cmbPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbDpto.DataSource = new List<Departamento>();
            cmbProv.DataSource = new List<Provincia>();
            cmbDist.DataSource = new List<Distrito>();

            if (cmbPais.SelectedItem != null)
                cmbDpto.DataSource = Vars.lsDptos.Where(x => x.idPais == ((Pais)cmbPais.SelectedItem).idPais).OrderBy(y => y.nomDepartamento).ToList();
        }

        private void cmbDpto_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbDpto.SelectedItem != null)
                cmbProv.DataSource = Vars.lsProvs.Where(x => x.idDepartamento == ((Departamento)cmbDpto.SelectedItem).idDepartamento).OrderBy(y => y.idProvincia).ToList();
        }

        private void cmbProv_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbProv.SelectedItem != null)
                cmbDist.DataSource = Vars.lsDists.Where(x => x.idProvincia == ((Provincia)cmbProv.SelectedItem).idProvincia).OrderBy(y => y.idDistrito).ToList(); ;
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            seleccionar();
        }

        //
        // Métodos
        //
        private bool validarCtrls()
        {
            if (cmbDist.SelectedItem == null)
            {
                Utils.msg("Seleccione un distrito.", Estado.WARNING);
                cmbDist.Focus();
                return false;
            }
            return true;
        }

        private void seleccionar()
        {
            if (!validarCtrls())
                return;

            try
            {
                obDist = (Distrito)cmbDist.SelectedItem;
                operOK = true;
                this.Dispose();
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
            }
        }

    }//end class

}
