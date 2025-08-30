using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmInforme : FrmMaster
    {
        private InstitucionEstudio obInstEst;
        private Persona obPerFamiliar;
        private List<Campania> lsCampanias;
        public int idSede;                      // sí modifica, tener registro de la nueva sede
        public Informe xObInforme;
        private Atencion xObAtencion;
        private long xIdAlumno;

        public FrmInforme(Informe xObInforme, Atencion xObAtencion, long xIdAlumno, CRUD xOperCRUD, bool xReadOnly) : base(xOperCRUD, xReadOnly)
        {
            InitializeComponent();

            this.xObInforme = xObInforme;
            this.xObAtencion = xObAtencion;     // primera atención
            this.xIdAlumno = xIdAlumno;
            lsCampanias = Vars.lsCampaniaNegAct;

            if (xOperCRUD == CRUD.EDIT)
            {
                if (!this.xObInforme.cerrado && this.xObAtencion.idTipoAtencion == 2031)  // 2031=intranet
                {
                    cmbSede.Enabled = false;
                    cmbAnio.Enabled = false;
                    cmbModEst.Enabled = false;
                    cmbCampania.Enabled = false;
                    cmbGrado.Enabled = false;
                    cmbProfesion.Enabled = false;
                    cmbTipoAtencion.Enabled = false;
                    txtObs.Enabled = false;
                    cmbGdoInteres.Enabled = false;
                    txtProxFecha.Enabled = false;
                    txtProxHora.Enabled = false;
                    lblMsg.Visible = true;
                }
            }
            else
            {
                this.xObInforme = new Informe()
                {
                    idInforme = -1,
                    idNegocio = Vars.obEmpresa.idEmpresa,
                    idVendedor = Vars.obUsuario.idUsuario,
                    vendedor = Vars.obUsuario.nomUsu.Substring(11, Vars.obUsuario.nomUsu.Length - 11).ToUpper(),
                    feIni = new DateTime(1, 1, 1),
                    feFin = new DateTime(1, 1, 1),
                    idTipoEstado = 2040,                // 2040=INICIADO
                    cerrado = false
                };
                this.xObAtencion = new Atencion() { idAtencion = -1, idNegocio = Vars.obEmpresa.idEmpresa, fecha = new DateTime(1, 1, 1) };
            }

            List<Sede> lsSede = (from obCampania in lsCampanias
                                 join obSede in Vars.lsSedeByPer on obCampania.idSede equals obSede.idSede
                                 select obSede).Distinct().OrderBy(y => y.nomSede).ToList();
            cmbSede.DataSource = lsSede;

            cmbTipoAtencion.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_ATENCION").OrderBy(y => y.orden).ThenBy(z => z.nomTipo).ToList();
            cmbGdoInteres.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_GDO_INTERES").OrderBy(y => y.orden).ToList();

            if (Vars.obEmpresa.idTipoEmpresa == 2)      // 2=colegio
            {
                lblProfesion.Visible = false;
                cmbProfesion.Visible = false;
            }
            else if (Vars.obEmpresa.idTipoEmpresa == 3) // 3=academia
            {
                lblGrado.Text = "Área / Ciclo";
            }
        }

        private void FrmInforme_Load(object sender, EventArgs e)
        {
            if (xOperCRUD == CRUD.NEW)
            {
                if (cmbSede.Items.Count > 1 && xOperCRUD == CRUD.NEW)
                    cmbSede.SelectedItem = null;
                cmbTipoAtencion.SelectedItem = null;
                cmbGdoInteres.SelectedItem = null;
            }
            else if (xOperCRUD == CRUD.EDIT)
            {
                if (cmbSede.SelectedItem != null)
                    cmbSede.SelectedValue = lsCampanias.Where(x => x.idCampania == xObInforme.idCampania).First().idSede;
                if (cmbAnio.SelectedItem != null)
                    cmbAnio.SelectedItem = lsCampanias.Where(x => x.idCampania == xObInforme.idCampania).First().anio;
                if (cmbModEst.SelectedItem != null)
                    cmbModEst.SelectedValue = xObInforme.idTipoModEstX;
                if (cmbCampania.SelectedItem != null)
                    cmbCampania.SelectedValue = xObInforme.idCampania;
                if (cmbGrado.SelectedItem != null)
                    cmbGrado.SelectedValue = xObInforme.idGrado;
                if (cmbProfesion.SelectedItem != null && lsCampanias?.Count > 0)
                    cmbProfesion.SelectedValue = xObInforme.idCarrProf;

                obInstEst = Task.Run(() => InstitucionEstudioBridge.getInstEstudioByID(xObInforme.idInstEst)).Result;
                txtInsProc.Text = obInstEst?.fullInstEstX;
                obPerFamiliar = Task.Run(() => PersonaBridge.getPersonaByID(xObInforme.idFamiliar)).Result;
                txtFam.Text = obPerFamiliar?.apeNomsX;
                dtpAtencion.Value = xObAtencion.fecha;
                cmbTipoAtencion.SelectedValue = xObAtencion.idTipoAtencion;
                txtObs.Text = xObAtencion.obs;
                cmbGdoInteres.SelectedValue = xObAtencion.idTipoGdoInteres;
                txtProxFecha.Text = xObAtencion.proxFecha;
                txtProxHora.Text = xObAtencion.proxHora;
            }
        }

        private void cmbSede_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbAnio.DataSource = new List<int>();
            cmbModEst.DataSource = new List<Tipo>();
            cmbCampania.DataSource = new List<Campania>();
            cmbGrado.DataSource = new List<Grado>();
            cmbProfesion.DataSource = new List<CarreraProf>();

            if (cmbSede.SelectedItem != null)
            {
                int idSede = (int)cmbSede.SelectedValue;
                cmbAnio.DataSource = (from x in lsCampanias where x.idSede == idSede orderby x.anio select x.anio).Distinct().ToList();
                if (cmbAnio.Items.Count > 1 && xOperCRUD == CRUD.NEW)
                    cmbAnio.SelectedItem = null;
            }
        }

        private void cmbAnio_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbCampania.DataSource = new List<Campania>();

            if (cmbSede.SelectedItem != null && cmbAnio.SelectedItem != null)
            {
                int idSede = (int)cmbSede.SelectedValue;
                int anio = (int)cmbAnio.SelectedValue;

                List<Tipo> lsTipo = (from obCampania in lsCampanias.Where(a => a.anio == anio && a.idSede == idSede)
                                     join obTipo in Vars.lsTipos.Where(x => x.grupo == "TI_MOD_ESTUDIO") on obCampania.idTipoModEst equals obTipo.idTipo
                                     orderby obTipo.orden
                                     select obTipo).Distinct().ToList();
                cmbModEst.DataSource = lsTipo;
                if (cmbModEst.Items.Count > 1 && xOperCRUD == CRUD.NEW)
                    cmbModEst.SelectedItem = null;
            }
            else
            {
                cmbModEst.DataSource = new List<Tipo>();
            }
        }

        private void cmbModEst_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbModEst.SelectedItem != null)
            {
                int idSede = (int)cmbSede.SelectedValue;
                int idModEst = (int)cmbModEst.SelectedValue;
                int anio = (int)cmbAnio.SelectedValue;
                cmbCampania.DataSource = lsCampanias.Where(x => x.idSede == idSede && x.idTipoModEst == idModEst && x.anio == anio).OrderBy(a => a.feIni).ToList();
                if (cmbCampania.Items.Count > 1 && xOperCRUD == CRUD.NEW)
                    cmbCampania.SelectedItem = null;
            }
            else
            {
                cmbCampania.DataSource = new List<Campania>();
            }
        }

        private void cmbCampania_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbCampania.SelectedItem != null)
            {
                int ca = ((Campania)cmbCampania.SelectedItem).idProdProy;
                cmbGrado.DataSource = Task.Run(() => GradoBridge.getGradoByNivEdu(ca)).Result;
                if (cmbGrado.Items.Count > 1 && xOperCRUD == CRUD.NEW)
                    cmbGrado.SelectedItem = null;
            }
            else
            {
                cmbGrado.DataSource = new List<Grado>();
            }
        }

        private void cmbGrado_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbGrado.SelectedItem != null)
            {
                Grado obGrado = ((Grado)cmbGrado.SelectedItem);
                cmbProfesion.DataSource = (Task.Run(() => CarreraProfBridge.getCarreraProfAll()).Result).Where(x => x.idAreaProf == obGrado.idAreaProf).OrderBy(y => y.orden).ToList();
                if (cmbProfesion.Items.Count > 1 && xOperCRUD == CRUD.NEW)
                    cmbProfesion.SelectedItem = null;
            }
            else
            {
                cmbProfesion.DataSource = new List<CarreraProf>();
            }
        }

        private void btnInsProc_Click(object sender, EventArgs e)
        {
            this.Enabled = false;

            bool onlySchool = true; // este formulario es para informes del colegio y academia, entonces solo trabajar con colegios
            FrmInstEstudios frm = new FrmInstEstudios(onlySchool, obInstEst, this.xLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obInstEst = frm.xObInstEst;
                txtInsProc.Text = obInstEst.fullInstEstX;
            }

            this.Enabled = true;
        }

        private void btnFam_Click(object sender, EventArgs e)
        {
            this.Enabled = false;
            Persona obPersona = Task.Run(() => PersonaBridge.getPersonaByID(xIdAlumno)).Result;

            FrmFamiliarFind frm = new FrmFamiliarFind(obPersona, true, true, false, this.xLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obPerFamiliar = frm.obFamSel.obPerX;
                txtFam.Text = obPerFamiliar.nomApesX;
            }

            this.Enabled = true;
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
            if (cmbAnio.SelectedItem == null)
            {
                Utils.msg("Selecciona el año.", Estado.WARNING);
                cmbAnio.Focus();
                return false;
            }
            if (cmbModEst.SelectedItem == null)
            {
                Utils.msg("Selecciona la modalidad de estudio.", Estado.WARNING);
                cmbModEst.Focus();
                return false;
            }
            if (cmbCampania.SelectedItem == null)
            {
                Utils.msg("Selecciona una campaña.", Estado.WARNING);
                cmbCampania.Focus();
                return false;
            }
            if (cmbGrado.SelectedItem == null)
            {
                Utils.msg("Selecciona un grado/ciclo.", Estado.WARNING);
                cmbGrado.Focus();
                return false;
            }
            if (Vars.obEmpresa.idTipoEmpresa == 3 && cmbProfesion.SelectedItem == null) // 3 = ACADEMIA
            {
                Utils.msg("Selecciona la carrera profesional.", Estado.WARNING);
                cmbProfesion.Focus();
                return false;
            }
            if (bool.Parse(Vars.dicVarGB["ReqFamiliar"]) && obPerFamiliar == null)
            {
                Utils.msg("Se requiere un familiar o responsable del estudiante.", Estado.WARNING);
                btnFam.Focus();
                return false;
            }
            if (cmbTipoAtencion.SelectedItem == null)
            {
                Utils.msg("Indica como se contactó con el cliente.", Estado.WARNING);
                cmbTipoAtencion.Focus();
                return false;
            }
            if ((int)cmbTipoAtencion.SelectedValue == 2031) //2031=intranet
            {
                Utils.msg("Selecciona otra opción.", Estado.WARNING);
                cmbTipoAtencion.Focus();
                return false;
            }
            txtObs.Text = Utils.allTrim_InjectCode(txtObs.Text);
            if (txtObs.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Escribe alguna observación o comentario.", Estado.WARNING);
                txtObs.Focus();
                return false;
            }
            if (cmbGdoInteres.SelectedItem == null)
            {
                Utils.msg("Indica el grado de interés del cliente.", Estado.WARNING);
                cmbGdoInteres.Focus();
                return false;
            }
            return true;
        }

        private void guardar()
        {
            if (!validarCtrls())
                return;

            xObInforme.idPersona = xIdAlumno;
            xObInforme.idFamiliar = obPerFamiliar == null ? -1 : obPerFamiliar.idPersona;
            xObInforme.idCampania = (long)cmbCampania.SelectedValue;
            xObInforme.idProdProy = ((Campania)cmbCampania.SelectedItem).idProdProy;
            xObInforme.idGrado = (int)cmbGrado.SelectedValue;
            xObInforme.idCarrProf = cmbProfesion.SelectedItem != null ? (int)cmbProfesion.SelectedValue : -1;
            xObInforme.idInstEst = obInstEst == null ? -1 : obInstEst.idInstEst;
            xObInforme.nomGrado = ((Grado)cmbGrado.SelectedItem).nomGrado;
            if (xObInforme.idVendedor == -1)
            {
                xObInforme.idVendedor = Vars.obUsuario.idUsuario;
                xObInforme.vendedor = Vars.obUsuario.nomUsu.Substring(11, Vars.obUsuario.nomUsu.Length - 11).ToUpper();
            }
            xObInforme.idTipoGdoInteres = (int)cmbGdoInteres.SelectedValue;

            xObAtencion.idTipoAtencion = (int)cmbTipoAtencion.SelectedValue;
            xObAtencion.idTipoGdoInteres = (int)cmbGdoInteres.SelectedValue;
            xObAtencion.proxFecha = txtProxFecha.Text;
            xObAtencion.proxHora = txtProxHora.Text;
            xObAtencion.obs = Utils.allTrim_InjectCode(txtObs.Text);
            xObAtencion.idVendedor = xObInforme.idVendedor;
            xObAtencion.vendedor = xObInforme.vendedor;

            xObInforme.obAtencionX = xObAtencion;

            try
            {
                btnOk.Enabled = false;
                long idInforme = Task.Run(() => InformeBridge.upsert(xObInforme)).Result;
                xObInforme = Task.Run(() => InformeBridge.getInformeByID(idInforme)).Result;
                idSede = (int)cmbSede.SelectedValue;    //para ver si cambió de sede
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
