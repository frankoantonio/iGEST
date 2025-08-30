using com.yupanastudio.igest.winapp;
using Krypton.Toolkit;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmCampania : FrmMaster
    {

        public Campania xObCampania;

        public FrmCampania(Campania xObCampania, CRUD xOperCRUD, bool xLectura) : base(xOperCRUD, xLectura)
        {
            InitializeComponent();

            this.xObCampania = xObCampania;

            cmbSede.DataSource = Vars.lsSedeByEmp;
            cmbUndProd.DataSource = Vars.lsProdProyByNeg;
            cmbPeriodicidad.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_PERIODICIDAD").OrderBy(y => y.orden).ToList();
            cmbModalidad.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_MOD_ESTUDIO").OrderBy(y => y.orden).ToList();
            cmbTurno.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_TURNO").OrderBy(y => y.orden).ToList();

            if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.ACADEMIA"])
                cmbTipoIns.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_INSCR_ACA").OrderBy(y => y.orden).ToList();
            else
                cmbTipoIns.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_INSCR_COL").OrderBy(y => y.orden).ToList();

            if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.COLEGIO"] || Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.ACADEMIA"])
            {
                //habilitarCtrl(true);
                picCampania.Visible = false;
            }
            else
            {
                //habilitarCtrl(false);
            }
        }

        private void FrmCampania_Load(object sender, EventArgs e)
        {
            if (xOperCRUD == CRUD.EDIT && xObCampania != null)
            {
                cmbSede.SelectedValue = xObCampania.idSede;
                cmbUndProd.SelectedValue = xObCampania.idProdProy;
                nudAnio.Value = xObCampania.anio;
                nudFrecuencia.Value = xObCampania.frecuencia;
                txtNombre.Text = xObCampania.nomCampania;
                dtpIni.Value = xObCampania.feIni;
                dtpFin.Value = xObCampania.feFin;
                cmbPeriodicidad.SelectedValue = xObCampania.idTipoPeriodo;
                chbRedefinir.Checked = xObCampania.redefinir;
                cmbModalidad.SelectedValue = xObCampania.idTipoModEst;
                cmbTurno.SelectedValue = xObCampania.idTipoTurno;
                cmbTipoIns.SelectedValue = xObCampania.idTipoInscripcion;
                dtpIniClas.Value = xObCampania.feIniClas > new DateTime(1, 1, 1) ? xObCampania.feIniClas : dtpIniClas.MinDate;
                dtpFinClas.Value = xObCampania.feFinClas > new DateTime(1, 1, 1) ? xObCampania.feFinClas : dtpFinClas.MinDate;
                chbAutoMatricula.Checked = xObCampania.matrSinPago;
                chbActivo.Checked = xObCampania.activo;
            }
            else if (xOperCRUD == CRUD.NEW)
            {
                cmbSede.SelectedItem = null;
                cmbUndProd.SelectedItem = null;
                nudAnio.Value = DateTime.Now.Year;
                dtpIni.Value = new DateTime(Vars.feServer.Year, 1, 1);
                dtpFin.Value = new DateTime(Vars.feServer.Year, 1, 1);
                cmbPeriodicidad.SelectedItem = null;

                //cmbModalidad.SelectedItem = null;
                //cmbTurno.SelectedItem = null;
                //cmbTipoIns.SelectedItem = null;
                //dtpIniClas.Value = new DateTime(Vars.feServer.Year, 1, 1);
                //dtpFinClas.Value = new DateTime(Vars.feServer.Year, 1, 1);
                //habilitarCtrl(true);

                chbActivo.Checked = true;

                xObCampania = new Campania()
                {
                    idCampania = -1,
                    idNegocio = Vars.obEmpresa.idEmpresa,
                    activo = true,
                    idTipoModEst = -1,
                    idTipoTurno = -1,
                    idTipoInscripcion = -1,
                    feIniClas = new DateTime(1, 1, 1),
                    feFinClas = new DateTime(1, 1, 1),
                    matrSinPago = false
                };
            }

            this.cmbSede.SelectedIndexChanged += new System.EventHandler(this.cmbSede_SelectedIndexChanged);
            this.cmbUndProd.SelectedIndexChanged += new System.EventHandler(this.cmbUndProd_SelectedIndexChanged);
            this.nudAnio.ValueChanged += new System.EventHandler(this.nudAnio_ValueChanged);
            this.nudFrecuencia.ValueChanged += new System.EventHandler(this.nudFrecuencia_ValueChanged);
        }

        private void habilitarCtrl(bool b)
        {
            cmbModalidad.Enabled = b;
            cmbTurno.Enabled = b;
            cmbTipoIns.Enabled = b;
            dtpIniClas.Enabled = b;
            dtpFinClas.Enabled = b;
            chbAutoMatricula.Enabled = b;

            cmbModalidad.SelectedItem = null;
            cmbTurno.SelectedItem = null;
            cmbTipoIns.SelectedItem = null;
            dtpIniClas.Value = new DateTime(Vars.feServer.Year, 1, 1);
            dtpFinClas.Value = new DateTime(Vars.feServer.Year, 1, 1);
            chbAutoMatricula.Checked = false;
        }

        private void nudAnio_Enter(object sender, EventArgs e)
        {
            if (sender.GetType() == typeof(KryptonTextBox))
                ((KryptonTextBox)sender).SelectAll();
            else if (sender.GetType() == typeof(KryptonNumericUpDown))
                ((KryptonNumericUpDown)sender).Select(0, nudAnio.Text.Length);
        }

        private void cmbSede_SelectedIndexChanged(object sender, EventArgs e)
        {
            setNomCampania();
        }

        private void cmbUndProd_SelectedIndexChanged(object sender, EventArgs e)
        {

            setNomCampania();
            //if (((ProductoProyecto)cmbUndProd.SelectedItem).tipo == "PROYECTO")
            //{
            //    habilitarCtrl(false);
            //}

            bool b = !(((ProductoProyecto)cmbUndProd.SelectedItem).tipo == "PROYECTO");

            cmbPeriodicidad.Enabled = b;
            cmbPeriodicidad.SelectedItem = null;
            chbRedefinir.Enabled = b;
            chbRedefinir.Checked = b;
            habilitarCtrl(b);
        }

        private void nudAnio_ValueChanged(object sender, EventArgs e)
        {
            setNomCampania();
        }

        private void nudFrecuencia_ValueChanged(object sender, EventArgs e)
        {
            setNomCampania();
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
            if (cmbSede.SelectedItem == null)
            {
                Utils.msg("Selecciona una sede.", Estado.WARNING);
                cmbSede.Focus();
                return false;
            }
            if (cmbUndProd.SelectedItem == null)
            {
                Utils.msg("Selecciona una unidad de producción.", Estado.WARNING);
                cmbUndProd.Focus();
                return false;
            }
            if (nudAnio.Value < Vars.feServer.Year || nudAnio.Value >= Vars.feServer.Year + 2)
            {
                Utils.msg("Escribe un año correcto. Sólo puede ser el año actual o el siguiente año.", Estado.WARNING);
                nudAnio.Focus();
                return false;
            }
            txtNombre.Text = Utils.allTrim_InjectCode(txtNombre.Text);
            if (txtNombre.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Escribe correctamente el nombre de la campaña.", Estado.WARNING);
                txtNombre.Focus();
                return false;
            }
            if (nudAnio.Value - dtpIni.Value.Year > 1 || dtpIni.Value.Year - nudAnio.Value > 1)
            {
                Utils.msg("Máximo un año de diferencia, respecto al año de campaña.", Estado.WARNING);
                dtpIni.Focus();
                return false;
            }
            if (dtpFin.Value <= dtpIni.Value)
            {
                Utils.msg("Fecha de finalización incorrecta.", Estado.WARNING);
                dtpFin.Focus();
                return false;
            }
            if (cmbPeriodicidad.SelectedItem == null)
            {
                Utils.msg("Selecciona la periodicidad en que se harán los pagos.", Estado.WARNING);
                cmbPeriodicidad.Focus();
                return false;
            }

            if ((Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.COLEGIO"] ||
                Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.ACADEMIA"]) &&
                ((ProductoProyecto)cmbUndProd.SelectedItem).tipo == "PRODUCTO")
            {
                if (cmbModalidad.SelectedItem == null)
                {
                    Utils.msg("Selecciona la modalidad de estudios.", Estado.WARNING);
                    cmbModalidad.Focus();
                    return false;
                }
                if (cmbTurno.SelectedItem == null)
                {
                    Utils.msg("Selecciona un turno.", Estado.WARNING);
                    cmbTurno.Focus();
                    return false;
                }
                if (cmbTipoIns.SelectedItem == null)
                {
                    Utils.msg("Selecciona el tipo de inscripción.", Estado.WARNING);
                    cmbTipoIns.Focus();
                    return false;
                }
                if (nudAnio.Value - dtpIniClas.Value.Year > 1 || dtpIniClas.Value.Year - nudAnio.Value > 1)
                {
                    Utils.msg("Máximo un año de diferencia, respecto al año de campaña.", Estado.WARNING);
                    dtpIniClas.Focus();
                    return false;
                }

                if (dtpFinClas.Value <= dtpIniClas.Value)
                {
                    Utils.msg("Revisa la fecha de finalización de clases.", Estado.WARNING);
                    dtpFinClas.Focus();
                    return false;
                }
            }

            return true;
        }

        private void setNomCampania()
        {
            if (cmbSede.SelectedItem != null)
                txtNombre.Text = ((Sede)cmbSede.SelectedItem).nomSede;

            if (cmbSede.SelectedItem != null && cmbUndProd.SelectedItem != null)
            {
                txtNombre.Text = ((Sede)cmbSede.SelectedItem).nomSede + " " + ((ProductoProyecto)cmbUndProd.SelectedItem).nomProdProy;
                txtNombre.Text = ((Sede)cmbSede.SelectedItem).nomSede + " " + ((ProductoProyecto)cmbUndProd.SelectedItem).nomProdProy + " " + nudAnio.Value.ToString();
                txtNombre.Text = ((Sede)cmbSede.SelectedItem).nomSede + " " + ((ProductoProyecto)cmbUndProd.SelectedItem).nomProdProy + " " + nudAnio.Value.ToString() + " - " + nudFrecuencia.Value.ToString();
            }
        }

        private void guardar()
        {
            if (!validarCtrls())
                return;

            xObCampania.idSede = (int)cmbSede.SelectedValue;
            xObCampania.idProdProy = (int)cmbUndProd.SelectedValue;
            xObCampania.anio = (int)nudAnio.Value;
            xObCampania.frecuencia = (int)nudFrecuencia.Value;
            xObCampania.nomCampania = txtNombre.Text;
            xObCampania.feIni = dtpIni.Value;
            xObCampania.feFin = dtpFin.Value;
            xObCampania.idTipoPeriodo = (int)cmbPeriodicidad.SelectedValue;
            xObCampania.codSede = ((Sede)cmbSede.SelectedItem).nomSede;
            xObCampania.redefinir = chbRedefinir.Checked;

            if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.COLEGIO"] || Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.ACADEMIA"])
            {
                xObCampania.idTipoModEst = (int)cmbModalidad.SelectedValue;
                xObCampania.idTipoTurno = (int)cmbTurno.SelectedValue;
                xObCampania.idTipoInscripcion = (int)cmbTipoIns.SelectedValue;
                xObCampania.feIniClas = dtpIniClas.Value;
                xObCampania.feFinClas = dtpFinClas.Value;
                xObCampania.matrSinPago = chbAutoMatricula.Checked;
            }

            try
            {
                btnOk.Enabled = false;
                xObCampania = Task.Run(() => CampaniaBridge.upsert(xObCampania)).Result;
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