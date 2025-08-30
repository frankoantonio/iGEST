using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmInscripcion : FrmMaster
    {
        private InstitucionEstudio obInstEst;
        private Persona obPerFamiliar;
        private List<Campania> lsCampanias;
        private Campania obCampSel = null;
        private Tipo obTurnoSel = null;
        private List<Inscripcion> xLsInscrDescending;
        public Inscripcion xObInsc;
        private Informe xObInforme;
        private long xIdAlumno;

        public FrmInscripcion(List<Inscripcion> xLsInscrDescending, Inscripcion xObInsc, Informe xObInforme, long xIdAlumno, CRUD xOperCRUD, bool xReadOnly) : base(xOperCRUD, xReadOnly)
        {
            InitializeComponent();

            this.xLsInscrDescending = xLsInscrDescending;
            this.xObInsc = xObInsc;
            this.xObInforme = xObInforme;
            this.xIdAlumno = xIdAlumno;

            lsCampanias = Vars.lsCampaniaNegAct;
            if (xObInsc != null && xObInsc.cerrado) // Al inactivar una campaña se cierra sus inscripciones. Sí la inscripción esta cerrada, recuperar la campaña que le corresponde
                lsCampanias = new List<Campania>() { Task.Run(() => CampaniaBridge.getCampaniaByID(xObInsc.idCampania)).Result };

            List<Sede> lsSede = (from obCampania in lsCampanias
                                 join obSede in Vars.lsSedeByPer on obCampania.idSede equals obSede.idSede
                                 select obSede).Distinct().OrderBy(y => y.nomSede).ToList();
            cmbSede.DataSource = lsSede;
            cmbTurno.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_TURNO").OrderBy(y => y.orden).ToList();
            cmbTipoBenef.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_DESCUENTOS" && x.idTipo != 2183).OrderBy(y => y.orden).ToList();  //2183 = BONIFICACIONES/REGALOS
            cmbCondIng.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_INGRESO").ToList();
            cmbSitIng.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_EVAL_ING").OrderBy(y => y.orden).ToList();
            cmbPubli.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_PUBLICIDAD").OrderBy(y => y.orden).ThenBy(z => z.nomTipo).ToList();

            if (Vars.obEmpresa.idTipoEmpresa == 2)      // 2 = colegio
            {
                lblProfesion.Visible = false;
                cmbProfesion.Visible = false;
            }
            else if (Vars.obEmpresa.idTipoEmpresa == 3) // 3 = academia
            {
                lblGrado.Text = "Área / Ciclo";
                lblSitIng.Visible = false;
                cmbSitIng.Visible = false;
            }
        }

        private void FrmInscripcion_Load(object sender, EventArgs e)
        {
            if (xOperCRUD == CRUD.EDIT || (xOperCRUD == CRUD.NEW && xObInforme != null && xObInforme.idTipoEstado <= 2041)) // 2040 = INICIADO ; 2041 = EN PROCESO
            {
                if (xOperCRUD == CRUD.EDIT && xObInsc != null)
                {
                    cmbSede.SelectedValue = lsCampanias.Where(x => x.idCampania == xObInsc.idCampania).First().idSede;
                    cmbAnio.SelectedItem = lsCampanias.Where(x => x.idCampania == xObInsc.idCampania).First().anio;
                    cmbModEst.SelectedValue = xObInsc.idTipoModEstX;
                    cmbCampania.SelectedValue = xObInsc.idCampania;
                    cmbGrado.SelectedValue = xObInsc.idGrado;
                    cmbProfesion.SelectedValue = xObInsc.idCarrProf;
                    cmbTurno.SelectedValue = lsCampanias.Where(x => x.idCampania == xObInsc.idCampania).First().idTipoTurno;
                    cmbSeccion.SelectedValue = xObInsc.idSeccion;
                    obInstEst = Task.Run(() => InstitucionEstudioBridge.getInstEstudioByID(xObInsc.idInstEst)).Result;
                    txtInsProc.Text = obInstEst?.fullInstEstX;
                    obPerFamiliar = Task.Run(() => PersonaBridge.getPersonaByID(xObInsc.idFamiliar)).Result;
                    txtFam.Text = obPerFamiliar?.apeNomsX;
                    cmbTipoBenef.SelectedValue = xObInsc.idTipoDscto;
                    cmbBenef.SelectedValue = xObInsc.idBeneficio;
                    cmbCondIng.SelectedValue = xObInsc.idTipoIngreso;
                    cmbSitIng.SelectedValue = xObInsc.idTipoEvalIng;
                    cmbPubli.SelectedValue = xObInsc.idTipoPublicidad;
                    txtObs.Text = xObInsc.obs;
                    if (xObInsc.cerrado && true)
                    {
                        cmbSede.Enabled = false; cmbAnio.Enabled = false; cmbModEst.Enabled = false; cmbCampania.Enabled = false;
                        cmbGrado.Enabled = false; cmbProfesion.Enabled = false; cmbSeccion.Enabled = false; btnInsProc.Enabled = false;
                        btnFam.Enabled = false; cmbTipoBenef.Enabled = false; cmbBenef.Enabled = false; cmbCondIng.Enabled = false;
                        cmbSitIng.Enabled = false; cmbPubli.Enabled = false; txtObs.Enabled = false; btnOk.Enabled = false; lblDataOK.Visible = true;
                    }
                }

                if (xOperCRUD == CRUD.NEW)  // poner los valores del informe
                {
                    cmbSede.SelectedValue = lsCampanias.Where(x => x.idCampania == xObInforme.idCampania).First().idSede;
                    cmbAnio.SelectedItem = lsCampanias.Where(x => x.idCampania == xObInforme.idCampania).First().anio;
                    cmbModEst.SelectedValue = xObInforme.idTipoModEstX;
                    cmbCampania.SelectedValue = xObInforme.idCampania;
                    cmbGrado.SelectedValue = xObInforme.idGrado;
                    cmbProfesion.SelectedValue = xObInforme.idCarrProf;
                    cmbTurno.SelectedValue = lsCampanias.Where(x => x.idCampania == xObInforme.idCampania).First().idTipoTurno;
                    obInstEst = Task.Run(() => InstitucionEstudioBridge.getInstEstudioByID(xObInforme.idInstEst)).Result;
                    txtInsProc.Text = obInstEst?.fullInstEstX;
                    obPerFamiliar = Task.Run(() => PersonaBridge.getPersonaByID(xObInforme.idFamiliar)).Result;
                    txtFam.Text = obPerFamiliar?.apeNomsX;
                }
            }
            else if (xOperCRUD == CRUD.NEW)
            {
                if (cmbSede.Items.Count > 1 && xOperCRUD == CRUD.NEW)
                    cmbSede.SelectedItem = null;

                cmbTurno.SelectedItem = null;
                cmbTipoBenef.SelectedItem = null;
                cmbBenef.SelectedItem = null;
                cmbCondIng.SelectedItem = null;
                cmbSitIng.SelectedItem = null;
                cmbPubli.SelectedItem = null;
            }
        }

        private void cmbSede_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbAnio.DataSource = new List<int>();
            cmbModEst.DataSource = new List<Tipo>();
            cmbCampania.DataSource = new List<Campania>();
            cmbGrado.DataSource = new List<Grado>();
            cmbProfesion.DataSource = new List<CarreraProf>();
            cmbBenef.DataSource = new List<Beneficio>();
            cmbTipoBenef.SelectedItem = null;

            if (cmbSede.SelectedItem != null)
            {
                int idSede = (int)cmbSede.SelectedValue;
                cmbAnio.DataSource = (from x in lsCampanias where x.idSede == idSede orderby x.anio select x.anio).Distinct().ToList();
                if (cmbAnio.Items.Count > 1)
                    cmbAnio.SelectedItem = null;
            }
        }

        private void cmbAnio_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbModEst.DataSource = new List<Tipo>();
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
                if (cmbModEst.Items.Count > 1)
                    cmbModEst.SelectedItem = null;
            }
        }

        private void cmbModEst_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbCampania.DataSource = new List<Campania>();

            if (cmbModEst.SelectedItem != null)
            {
                int idSede = (int)cmbSede.SelectedValue;
                int idModEst = (int)cmbModEst.SelectedValue;
                int anio = (int)cmbAnio.SelectedValue;
                cmbCampania.DataSource = lsCampanias.Where(x => x.idSede == idSede && x.idTipoModEst == idModEst && x.anio == anio).OrderBy(a => a.feIni).ThenBy(b => b.nomCampania).ToList();
                if (cmbCampania.Items.Count > 1)
                    cmbCampania.SelectedItem = null;
            }
        }

        private void cmbCampania_SelectedIndexChanged(object sender, EventArgs e)
        {
            obCampSel = null;
            cmbGrado.DataSource = new List<Grado>();
            cmbBenef.DataSource = new List<Beneficio>();
            cmbTipoBenef.SelectedItem = null;
            cmbCondIng.SelectedItem = null;
            cmbSitIng.SelectedItem = null;
            cmbPubli.SelectedItem = null;

            if (cmbCampania.SelectedItem != null)
            {
                obCampSel = (Campania)cmbCampania.SelectedItem;
                cmbGrado.DataSource = Task.Run(() => GradoBridge.getGradoByNivEdu(obCampSel.idProdProy)).Result;
                if (cmbGrado.Items.Count > 1)
                    cmbGrado.SelectedItem = null;
                if (xObInsc == null || xObInsc.cerrado == false)
                    set_Cond_Sit_Ingreso();
            }

            // INST. ESTUDIO - PUBLICIDAD
            if (cmbCondIng.SelectedItem != null && (int)cmbCondIng.SelectedValue == 2151)   // 2151 = RATIFICADO
            {
                //////////////if (obInstEst == null)
                //////////////{
                //////////////    obInstEst = Task.Run(() => InstitucionEstudioBridge.getInstEstudioByID(Vars.obEmpresa.idInstEst)).Result;
                //////////////    txtInsProc.Text = obInstEst?.fullInstEstX;
                //////////////    btnInsProc.Enabled = false;
                //////////////}
                //////////////cmbPubli.SelectedValue = 2146;                                              // 2146 = YA ES CLIENTE
                //////////////cmbPubli.Enabled = false;
            }
            else
            {
                obInstEst = null;
                txtInsProc.Text = "";
                btnInsProc.Enabled = true;
                cmbPubli.SelectedItem = null;
                cmbPubli.Enabled = true;
            }
        }

        private void cmbTurno_SelectedIndexChanged(object sender, EventArgs e)
        {
            obTurnoSel = cmbTurno.SelectedItem != null ? (Tipo)cmbTurno.SelectedItem : null;
        }

        private void cmbGrado_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbSeccion.DataSource = new List<Seccion>();
            cmbProfesion.DataSource = new List<CarreraProf>();
            cmbTurno.SelectedItem = null;

            if (cmbGrado.SelectedItem != null)
            {
                Grado obGrado = ((Grado)cmbGrado.SelectedItem);

                cmbProfesion.DataSource = (Task.Run(() => CarreraProfBridge.getCarreraProfAll()).Result).Where(x => x.idAreaProf == obGrado.idAreaProf).OrderBy(y => y.orden).ToList();
                if (cmbProfesion.Items.Count > 1)
                    cmbProfesion.SelectedItem = null;

                cmbTurno.SelectedValue = obCampSel.idTipoTurno;

                if (cmbGrado.SelectedItem != null && obTurnoSel != null)
                {
                    List<Seccion> lsSec = Task.Run(() => SeccionBridge.getSeccionByCampGdoTrn(obCampSel.idCampania, obGrado.idGrado, obTurnoSel.idTipo)).Result;
                    cmbSeccion.DataSource = lsSec;
                    if (cmbSeccion.Items.Count > 1)
                        cmbSeccion.SelectedItem = null;
                }
            }
        }

        private void btnInsProc_Click(object sender, EventArgs e)
        {
            this.Enabled = false;
            bool onlySchool = true; // este formulario es para informes del colegio y academia, entonces solo se trabaja con colegios
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
            FrmFamiliarFind frm = new FrmFamiliarFind(obPersona, false, false, true, this.xLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obPerFamiliar = frm.obFamSel.obPerX;
                txtFam.Text = obPerFamiliar.nomApesX;
            }
            this.Enabled = true;
        }

        private void cmbTipoBenef_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Beneficio> lsbenAux = new List<Beneficio>();

            if (cmbTipoBenef.SelectedItem != null)
            {
                if (this.xOperCRUD == CRUD.NEW)
                    lsbenAux = Vars.lsBeneficios.Where(x => x.idTipoBeneficio == (int)cmbTipoBenef.SelectedValue && x.total == false && x.activo).ToList();
                else
                    lsbenAux = Vars.lsBeneficios.Where(x => x.idTipoBeneficio == (int)cmbTipoBenef.SelectedValue && x.total == false).ToList();
            }
            cmbBenef.DataSource = lsbenAux.OrderBy(x => x.orden).ToList();
            if (cmbBenef.Items.Count > 1)
                cmbBenef.SelectedItem = null;
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            guardar();
        }

        //
        // Métodos
        //
        private void set_Cond_Sit_Ingreso()
        {
            List<Inscripcion> lsMatriculas = new List<Inscripcion>();

            // CONDICIÓN DE INGRESO
            if (Vars.obEmpresa.idTipoEmpresa == 2 && obCampSel.idTipoInscripcion == 2210) // 2 = COLEGIO ; 2210 = EDUCACIÓN_REGULAR
            {
                lsMatriculas = xLsInscrDescending.Where(x => x.idTipoInscripcion == 2210 && x.idTipoEstado == 2044).OrderByDescending(y => y.feMatr).ToList(); // 2044 = MATRICULADO

                if (lsMatriculas.Count > 0)
                {
                    Campania obCamp_UltimaMatr = Task.Run(() => CampaniaBridge.getCampaniaByID(lsMatriculas.First().idCampania)).Result;
                    int anioInscAct = obCampSel.anio;
                    int ultimoAnioMat = obCamp_UltimaMatr.anio;
                    if (ultimoAnioMat + 1 >= anioInscAct)           // El valor mayor nunca se daría en un escenario normal, pero por sí acaso
                        cmbCondIng.SelectedValue = 2151;            // 2151 = RATIFICADO
                    else
                        cmbCondIng.SelectedValue = 2152;            // 2152 = REINGRESANTE
                }
                else
                    cmbCondIng.SelectedValue = 2150;                // 2150 = NUEVO
            }
            else if (Vars.obEmpresa.idTipoEmpresa == 3 || (Vars.obEmpresa.idTipoEmpresa == 2 && obCampSel.idTipoInscripcion != 2210)) // 3 = ACADEMIA
            {
                if (xLsInscrDescending.Where(x => x.idTipoEstado == 2044).ToList().Count > 0)
                    cmbCondIng.SelectedValue = 2153;                // 2153 = ANTIGUO
                else
                    cmbCondIng.SelectedValue = 2150;
            }

            // SITUACIÓN DE INGRESO
            if (Vars.obEmpresa.idTipoEmpresa == 2)
            {
                Inscripcion obUltMatr = lsMatriculas.Count < 1 ? null : lsMatriculas.First();
                if (obUltMatr != null && cmbCondIng.SelectedItem != null && (int)cmbCondIng.SelectedValue == 2151 && (obUltMatr.idTipoEvalFin == 2191 || obUltMatr.idTipoEvalFin == 2192)) // 2151 = RATIFICADO 
                {
                    if (obUltMatr.idTipoEvalFin == 2191) cmbSitIng.SelectedValue = 2171;    // 2191	= APROBADO    ; 2171 = PROMOVIDO
                    if (obUltMatr.idTipoEvalFin == 2192) cmbSitIng.SelectedValue = 2172;    // 2192	= DESAPROBADO ; 2172 = REPITENTE
                    cmbSitIng.Enabled = false;
                }
                else
                {
                    cmbSitIng.SelectedItem = null;
                    cmbSitIng.Enabled = true;
                }
            }
            else if (Vars.obEmpresa.idTipoEmpresa == 3)
            {
                cmbSitIng.SelectedValue = 2179; //2179 = SIN_INDICAR
            }
        }

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
                Utils.msg("Selecciona una carrera profesional.", Estado.WARNING);
                cmbProfesion.Focus();
                return false;
            }
            if (cmbSeccion.SelectedItem == null)
            {
                Utils.msg("Selecciona una sección.", Estado.WARNING);
                cmbSeccion.Focus();
                return false;
            }
            if (bool.Parse(Vars.dicVarGB["ReqFamiliar"]) && obPerFamiliar == null)
            {
                Utils.msg("Se requiere un familiar o responsable del estudiante.", Estado.WARNING);
                btnFam.Focus();
                return false;
            }
            if (cmbTipoBenef.SelectedItem == null)
            {
                Utils.msg("Indica si tiene algún tipo de beneficio.", Estado.WARNING);
                cmbTipoBenef.Focus();
                return false;
            }
            if (cmbBenef.SelectedItem == null)
            {
                Utils.msg("Selecciona algún beneficio.", Estado.WARNING);
                cmbBenef.Focus();
                return false;
            }
            if (cmbSitIng.SelectedItem == null)
            {
                Utils.msg("Selecciona la situación de ingreso.", Estado.WARNING);
                cmbSitIng.Focus();
                return false;
            }
            if (cmbPubli.SelectedItem == null)
            {
                Utils.msg("Selecciona por qué medio publicitario se entero de la empresa.", Estado.WARNING);
                cmbPubli.Focus();
                return false;
            }
            txtObs.Text = Utils.allTrim_InjectCode(txtObs.Text);

            // validaciones de negocio
            if (xLsInscrDescending.Count > 0)
            {
                if (xOperCRUD == CRUD.NEW && xLsInscrDescending.Where(x => x.cerrado == false && x.idCampania == (long)cmbCampania.SelectedValue).Count() > 0)
                {
                    Utils.msg("El estudiante ya está registrado en esta campaña.", Estado.WARNING);
                    return false;
                }

                if (xOperCRUD == CRUD.EDIT && xLsInscrDescending.Where(x => x.cerrado == false && x.idInscripcion != xObInsc.idInscripcion && x.idCampania == (long)cmbCampania.SelectedValue).Count() > 0)
                {
                    Utils.msg("El estudiante ya tiene una inscripción/matrícula para está campaña.", Estado.WARNING);
                    return false;
                }
            }

            if (Vars.obEmpresa.idTipoEmpresa == 2 && obCampSel.idTipoInscripcion == 2210)       // 2210	= EDUCACIÓN_REGULAR
            {
                if (xOperCRUD == CRUD.NEW && xLsInscrDescending.Where(x => x.idTipoInscripcion == 2210 && x.nomNivEduX.Contains(cmbAnio.SelectedValue.ToString())).Count() > 0)
                {
                    Utils.msg("El estudiante ya tiene una inscripción para este año escolar.", Estado.WARNING);
                    return false;
                }

                // sólo educación regular y matriculados
                List<Inscripcion> lsMatriculas = xLsInscrDescending.Where(x => x.idTipoInscripcion == 2210 && x.idTipoEstado == 2044).OrderByDescending(y => y.feMatr).ToList(); // 2044 = MATRICULADO
                if (lsMatriculas.Count > 0)
                {
                    Inscripcion obUltimaMatr = xObInsc != null ? lsMatriculas.Where(x => x.idInscripcion != xObInsc.idInscripcion).OrderByDescending(y => y.feMatr).First() : lsMatriculas.First();

                    if ((int)cmbCondIng.SelectedValue == 2151 && (int)cmbSitIng.SelectedValue == 2171)  //2151 = RATIFICADO ; 2171 = PROMOVIDO
                    {
                        if (!(obUltimaMatr.idGrado + 1 == (int)cmbGrado.SelectedValue))
                        {
                            Utils.msg("El estudiante está promovido, selecciona el grado siguiente.", Estado.WARNING);
                            return false;
                        }
                    }
                    else
                    {
                        if (!((int)cmbGrado.SelectedValue >= obUltimaMatr.idGrado))
                        {
                            Utils.msg("Solo se puede matricular en un grado mayor o igual al último registrado.", Estado.WARNING);
                            return false;
                        }
                    }
                }
            }

            return true;
        }

        private void guardar()
        {
            if (!validarCtrls())
                return;

            if (xOperCRUD == CRUD.NEW)
            {
                this.xObInsc = new Inscripcion()
                {
                    idInscripcion = -1,
                    idNegocio = Vars.obEmpresa.idEmpresa,
                    feInsc = new DateTime(1, 1, 1),
                    idVendedor = Vars.obUsuario.idUsuario,
                    vendedor = Vars.obUsuario.nomUsu.Substring(11, Vars.obUsuario.nomUsu.Length - 11).ToUpper(),
                    idTipoEstado = 2042,                // 2042	= INSCRITO
                    idTipoEvalFin = 2190,               // 2190	= SIN EVALUAR
                    idInforme = (xObInforme == null ? -1 : xObInforme.idInforme),
                    codMatricula = "",                  // para la academia, enviar vacio
                    feMatr = new DateTime(1, 1, 1),
                    cerrado = false
                };
            }

            xObInsc.idEstudiante = xIdAlumno;
            xObInsc.idFamiliar = obPerFamiliar == null ? -1 : obPerFamiliar.idPersona;
            xObInsc.idCampania = obCampSel.idCampania;
            xObInsc.idProdProy = obCampSel.idProdProy;
            xObInsc.idGrado = (int)cmbGrado.SelectedValue;
            xObInsc.idCarrProf = cmbProfesion.SelectedItem != null ? (int)cmbProfesion.SelectedValue : -1;
            xObInsc.idAreaProf = cmbProfesion.SelectedItem != null ? ((CarreraProf)cmbProfesion.SelectedItem).idAreaProf : -1;
            xObInsc.idInstEst = obInstEst == null ? -1 : obInstEst.idInstEst;
            xObInsc.idSeccion = (long)cmbSeccion.SelectedValue;
            xObInsc.idTipoPublicidad = (int)cmbPubli.SelectedValue;
            xObInsc.idTipoDscto = (int)cmbTipoBenef.SelectedValue;
            xObInsc.idBeneficio = (long)cmbBenef.SelectedValue;
            xObInsc.idTipoIngreso = (int)cmbCondIng.SelectedValue;
            xObInsc.idTipoEvalIng = (int)cmbSitIng.SelectedValue;
            xObInsc.obs = txtObs.Text;
            xObInsc.idTipoInscripcion = obCampSel.idTipoInscripcion;

            try
            {
                btnOk.Enabled = false;
                xObInsc = Task.Run(() => InscripcionBridge.upsert(xObInsc)).Result;
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
