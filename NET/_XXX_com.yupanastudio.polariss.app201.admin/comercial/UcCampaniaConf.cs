using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
{
    public partial class UcCampaniaConf : UcMaster
    {
        private List<Informe> lsInformes;
        private List<Atencion> lsAtenciones;
        private Informe obInforme;
        private Atencion obAtencion;
        private int ixDgvInforme;       // para el índice de los informes
        private int ixDgvAtencion;      // para el índice de las atenciones
        private Persona obPerEst;
        private Familiar obFam;
        private CRUD operAtCRUD;

        public UcCampaniaConf()
        {
            InitializeComponent();
        }

        private void UcInforme_Load(object sender, EventArgs e)
        {
            dgvInforme.AutoGenerateColumns = false;
            dgvAtencion.AutoGenerateColumns = false;

            // sedes del usuario actual que correspondan a las campañas activas
            List<Sede> lsSede = (from obCampania in Vars.lsCampaniaNegAct
                                 join obSede in Vars.lsSedeByPer on obCampania.idSede equals obSede.idSede
                                 select obSede).Distinct().OrderBy(y => y.nomSede).ToList();
            cmbSede.DataSource = lsSede;

            cmbTipoEstado.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_EST_MATR").OrderBy(y => y.orden).ToList();

            dgvInforme_idTipoModEstX.ValueMember = "idTipo";
            dgvInforme_idTipoModEstX.DisplayMember = "nomTipo";
            dgvInforme_idTipoModEstX.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_MOD_ESTUDIO").ToList();

            dgvInforme_idTipoEstado.ValueMember = "idTipo";
            dgvInforme_idTipoEstado.DisplayMember = "nomTipo";
            dgvInforme_idTipoEstado.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_EST_MATR").ToList();

            dgvAtencion_idTipoAtencion.ValueMember = "idTipo";
            dgvAtencion_idTipoAtencion.DisplayMember = "nomTipo";
            dgvAtencion_idTipoAtencion.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_ATENCION").ToList();

            if (Vars.obPerSel != null)
            {
                cmbSede.SelectedItem = null;
                cmbTipoEstado.SelectedItem = null;
                showInformes1();
                obPerEst = Vars.obPerSel;
                lblAlumno.Text = obPerEst.apeNomsX;
                lsInformes = Task.Run(() => InformeBridge.getInformeByPersona(Vars.obPerSel.idPersona, Vars.obEmpresa.idEmpresa)).Result.OrderBy(x => x.feIni).ToList();
                showInformes2();
            }
        }

        private void cmbSede_SelectedIndexChanged(object sender, EventArgs e)
        {
            showInformes1();
            showInformes2();
        }

        private void cmbTipoEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            showInformes1();
            showInformes2();
        }

        private void dgvInforme_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            showContacto();
        }

        private void dgvInforme_SelectionChanged(object sender, EventArgs e)
        {
            ixDgvInforme = dgvInforme.CurrentRow.Index;
            showAtenciones();
        }

        private void dgvAtencion_SelectionChanged(object sender, EventArgs e)
        {
            ixDgvAtencion = dgvAtencion.CurrentRow.Index;
            showAtencionDetalle();
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            bool dataCliente = false;   //desde este formulario, no se exige datos de cliente cuando es persona natural (10)
            FrmPersonaFind frm = new FrmPersonaFind(10, false, bool.Parse(Vars.dicVarGB["ReqInfContEst"]), dataCliente, this.obOpcion.soloLectura);
            //FrmPersonaFind frm = new FrmPersonaFind(10, false, bool.Parse(Vars.dicVarGB["ReqInfContEst"]), dataCliente);
            frm.ShowDialog();
            if (frm.operOK)
            {
                cmbSede.SelectedItem = null;
                cmbTipoEstado.SelectedItem = null;
                showInformes1();
                Vars.obPerSel = frm.obPersonaSel;
                obPerEst = Vars.obPerSel;
                lblAlumno.Text = obPerEst.apeNomsX;
                lsInformes = Task.Run(() => InformeBridge.getInformeByPersona(frm.obPersonaSel.idPersona, Vars.obEmpresa.idEmpresa)).Result.OrderBy(x => x.feIni).ToList();
                showInformes2();
            }
        }

        private void btnNewInforme_Click(object sender, EventArgs e)
        {
            if (obPerEst == null || cmbSede.SelectedItem != null || cmbTipoEstado.SelectedItem != null)
            {
                Utils.msg("Primero busca y selecciona un estudiante.", Estado.WARNING);
                return;
            }
            if (obInforme != null && lsInformes.Where(x => x.cerrado == false).Count() > 0)
            {
                Utils.msg("El estudiante todavía tiene informes que no finalizaron su proceso.", Estado.WARNING);
                return;
            }

            FrmInforme frm = new FrmInforme(null, null, obPerEst.idPersona, CRUD.NEW, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                lsInformes = new List<Informe>() { frm.xObInforme };
                showInformes2();
            }
        }

        private void btnEditInforme_Click(object sender, EventArgs e)
        {
            if (!validar_1())
                return;

            if (lsAtenciones.Count == 0 || obAtencion == null)
            {
                Utils.msg("Hay un problema, debería mostrarse al menos una \"Atención al Cliente\".", Estado.WARNING);
                return;
            }
            if (!(obInforme.idVendedor == -1) && obInforme.idVendedor != Vars.obUsuario.idUsuario)
            {
                Utils.msg("Otro ejecutivo de ventas tiene a cargo este \"Informe\". Puedes agregar una nueva \"Atención al Cliente\".", Estado.WARNING);
                return;
            }
            if (lsAtenciones.Count > 1)
            {
                Utils.msg("Este \"Informe\" ya tiene varias atenciones. Puedes agregar/modificar una \"Atención al Cliente\".", Estado.WARNING);
                return;
            }

            FrmInforme frm = new FrmInforme(obInforme, obAtencion, obInforme.idPersona, CRUD.EDIT, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                lsInformes[dgvInforme.CurrentRow.Index] = obInforme = frm.xObInforme;

                // sí cambió de sede, mostrar otra sede
                if (cmbSede.SelectedItem != null && cmbTipoEstado.SelectedItem != null)
                {
                    if ((int)cmbSede.SelectedValue != frm.idSede)
                    {
                        cmbSede.SelectedValue = frm.idSede;
                        lsInformes = new List<Informe>() { obInforme };
                    }
                }

                dgvInforme.DataSource = lsInformes;
                dgvInforme.Refresh();
                showAtenciones();
            }
            lblRwInf.Text = lsInformes.Count.ToString() + " registro(s)";
        }

        private void btnNewAt_Click(object sender, EventArgs e)
        {
            if (!validar_1()) return;
            if (!validar_2()) return;
            habilitarAtencion(true);
            limpiarAtencion();
            operAtCRUD = CRUD.NEW;
        }

        private void btnEditAt_Click(object sender, EventArgs e)
        {
            if (!validar_1()) return;
            if (!validar_2()) return;

            if (lsAtenciones.Count <= 0 || obAtencion == null)
            {
                Utils.msg("Hay un problema, no se registró ninguna \"Atención al Cliente\".", Estado.WARNING);
                return;
            }
            if (obAtencion.idTipoAtencion == 2031) // 2031=INTRANET
            {
                Utils.msg("Este registro se generó por la intranet. No se puede modificar.", Estado.WARNING);
                return;
            }
            if (obAtencion.idVendedor != Vars.obUsuario.idUsuario)
            {
                Utils.msg("Otro usuario [" + obAtencion.vendedor + "] registró esta \"Atención al Cliente\". No se puede modificar.", Estado.WARNING);
                return;
            }
            if (obAtencion != lsAtenciones[lsAtenciones.Count - 1])
            {
                Utils.msg("Solo puedes modificar el último registro.", Estado.WARNING);
                return;
            }
            if (obAtencion.fecha.Date != Vars.feOperacion.Date)
            {
                Utils.msg("Solo puedes modificar el mismo día que se registró.", Estado.WARNING);
                return;
            }

            habilitarAtencion(true);
            operAtCRUD = CRUD.EDIT;
        }

        private void btnSaveAt_Click(object sender, EventArgs e)
        {
            guardarAtencion();
        }

        private void btnCancelAt_Click(object sender, EventArgs e)
        {
            habilitarAtencion(false);
            ixDgvAtencion = dgvAtencion.CurrentRow.Index;
            showAtencionDetalle();
            operAtCRUD = CRUD.SELECT;
        }

        private void btnContacto_Click(object sender, EventArgs e)
        {
            showContacto();
        }

        private void btnDescalifica_Click(object sender, EventArgs e)
        {
            if (lsInformes == null || obInforme == null)
            {
                Utils.msg("Se requiere un \"Informe\" seleccionado.", Estado.WARNING);
                return;
            }
            if (obInforme.idTipoEstado == 2044 || obInforme.idTipoEstado == 2045 || obInforme.idTipoEstado == 2046 || obInforme.idTipoEstado == 2047 || obInforme.idTipoEstado == 2048) // MATRICULADO - ANULADO - RETIRADO - TRASLADADO - TRASLADO Y RESERVA
            {
                Utils.msg("Sólo para \"Informes\" con estado: INICIADO | EN PROCESO | INSCRITO.", Estado.WARNING);
                return;
            }

            Descalifica obDes = Task.Run(() => DescalificaBridge.getDescalificaByInforme(obInforme.idInforme)).Result;
            Atencion obAtx = obDes == null ? null : lsAtenciones.Where(x => x.idAtencion == obDes.idAtencion).First();

            FrmDescalificar frm = new FrmDescalificar(obInforme, obAtx, obDes, obDes == null ? CRUD.NEW : CRUD.EDIT, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obInforme = Task.Run(() => InformeBridge.getInformeByID(obInforme.idInforme)).Result;
                dgvInforme.Refresh();
                showAtenciones();
                habilitarAtencion(false);
            }
        }

        //
        // Métodos
        //
        private void limpiarAtencion()
        {
            obAtencion = null;
            dtpAtencion.Value = Vars.feOperacion;
            txtProxFecha.Text = "";
            txtProxHora.Text = "";
        }

        private void habilitarAtencion(bool b)
        {
            cmbSede.Enabled = !b;
            cmbTipoEstado.Enabled = !b;
            btnFind.Enabled = !b;
            btnNewInforme.Enabled = !b;
            btnEditInforme.Enabled = !b;
            dgvInforme.Enabled = !b;

            btnNewAt.Visible = !b;
            btnEditAt.Visible = !b;
            btnSaveAt.Visible = b;
            btnCancelAt.Visible = b;
            dgvAtencion.Enabled = !b;

            btnContacto.Enabled = !b;

            txtProxFecha.Enabled = b;
            txtProxHora.Enabled = b;

            btnPreMat.Enabled = !b;
            btnDescalifica.Enabled = !b;
        }

        private void showInformes1()
        {
            obPerEst = null;
            lblAlumno.Text = "";

            if (cmbSede.SelectedItem != null && cmbTipoEstado.SelectedItem != null)
            {
                Tipo obTipoEst = (Tipo)cmbTipoEstado.SelectedItem;
                Sede obSede = (Sede)cmbSede.SelectedItem;
                lsInformes = Task.Run(() => InformeBridge.getInformeBySedeEstado(obSede.idSede, obTipoEst.idTipo, Vars.obEmpresa.idEmpresa)).Result.OrderBy(x => x.feIni).ToList();
            }
            else
            {
                lsInformes = new List<Informe>();
            }
        }

        private void showInformes2()
        {
            dgvInforme.DataSource = lsInformes;
            lblRwInf.Text = lsInformes.Count.ToString() + " registro(s)";

            if (lsInformes.Count > 0)
            {
                ixDgvInforme = lsInformes.Count - 1;
                dgvInforme.CurrentCell = dgvInforme.Rows[ixDgvInforme].Cells["dgvInforme_nomSedeX"];
                foreach (DataGridViewRow row in dgvInforme.Rows)
                    if (row.Index == ixDgvInforme)
                        row.Selected = true;
                dgvInforme.Focus();
            }

        }

        private void showAtenciones()
        {
            if (dgvInforme.CurrentRow != null && lsInformes.Count > 0)
            {
                int ix = (dgvInforme.CurrentRow.Index > lsInformes.Count - 1 ? 0 : dgvInforme.CurrentRow.Index);
                obInforme = lsInformes[ix];
                lblAlumno.Text = obInforme.nomPersonaX;
                lsAtenciones = Task.Run(() => AtencionBridge.getAtencionByInforme(obInforme.idInforme)).Result.OrderBy(x => x.fecha).ToList();
            }
            else
            {
                obInforme = null;
                //lblAlumno.Text = "";
                lsAtenciones = new List<Atencion>();
            }

            dgvAtencion.DataSource = lsAtenciones;

            if (lsAtenciones.Count > 0)
            {
                ixDgvAtencion = lsAtenciones.Count - 1;
                dgvAtencion.CurrentCell = dgvAtencion.Rows[ixDgvAtencion].Cells["dgvAtencion_fecha"];
                foreach (DataGridViewRow row in dgvAtencion.Rows)
                    if (row.Index == ixDgvAtencion)
                        row.Selected = true;
            }
        }

        private void showAtencionDetalle()
        {
            if (lsAtenciones.Count > 0 && dgvAtencion.CurrentRow != null)
            {
                try
                {
                    obAtencion = lsAtenciones[ixDgvAtencion];
                    dtpAtencion.Value = obAtencion.fecha;
                    txtProxFecha.Text = obAtencion.proxFecha;
                    txtProxHora.Text = obAtencion.proxHora;
                }
                catch (Exception)
                {
                    limpiarAtencion();
                }
            }
            else
                limpiarAtencion();
        }

        private bool validar_1()
        {
            if (lsInformes == null || lsInformes.Count < 1 || obInforme == null)
            {
                Utils.msg("Se requiere un \"Informe\" seleccionado.", Estado.WARNING);
                return false;
            }
            if (obInforme.cerrado)
            {
                Utils.msg("Este \"Informe\" ya está finalizado.", Estado.WARNING);
                return false;
            }
            return true;
        }

        private bool validar_2()
        {
            if (lsAtenciones.Count == 1 && obInforme.idVendedor == -1)
            {
                Utils.msg("Falta asignar un ejectivo de ventas. Para asignarlo, actualiza/modifica el \"Informe\".", Estado.WARNING);
                return false;
            }
            if (!(obInforme.idTipoEstado == 2040 || obInforme.idTipoEstado == 2041))    // INICIADO - EN PROCESO
            {
                Utils.msg("Sólo para \"Informes\" con estado: INICIADO o EN PROCESO.", Estado.WARNING);
                return false;
            }
            if (cmbTipoEstado.SelectedItem != null && obInforme.idTipoEstado != (int)cmbTipoEstado.SelectedValue)
            {
                Utils.msg("Este \"Informe\" cambío de estado. No se corresponde con el filtro \"ESTADO\".", Estado.WARNING);
                return false;
            }
            return true;
        }

        private bool validarCtrls()
        {
            return true;
        }

        private void guardarAtencion()
        {
            if (!validarCtrls())
                return;

            // ATENCION
            if (obAtencion == null)
            {
                obAtencion = new Atencion()
                {
                    idAtencion = -1,
                    idNegocio = Vars.obEmpresa.idEmpresa,
                    idInforme = obInforme.idInforme,
                    fecha = new DateTime(1, 1, 1),
                    idVendedor = Vars.obUsuario.idUsuario,
                    vendedor = Vars.obUsuario.nomUsu.Substring(11, Vars.obUsuario.nomUsu.Length - 11).ToUpper()
                };
            }
            obAtencion.proxFecha = txtProxFecha.Text;
            obAtencion.proxHora = txtProxHora.Text;

            try
            {
                btnSaveAt.Enabled = false;

                dgvInforme.Refresh();
                habilitarAtencion(false);
                showAtenciones();
                operAtCRUD = CRUD.SELECT;
                Utils.msg("Los datos se guardaron correctamente.", Estado.SUCCESS);
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
            }
            finally
            {
                btnSaveAt.Enabled = true;
            }
        }

        private void showContacto()
        {
            if (obInforme == null)
                return;

            //obPerEst = Vars.obPerSel;
            //obPerEst = Task.Run(() => PersonaBridge.getPersonaByID(obInforme.idPersona)).Result;
            obFam = Task.Run(() => FamiliarBridge.getFamiliarByID(obInforme.idFamiliar, obInforme.idPersona)).Result;


            if (obFam != null)
            {
            }
        }

        private void btnPreMat_Click(object sender, EventArgs e)
        {
            //FALTA TRABAJAR ESTA PARTE - EL RESTO ESTA OK
            Utils.msg("Para continuar con la inscripción del estudiante utilice el formulario \"Inscripción\".", Estado.SUCCESS);
        }

        private void btnAddArticulos_Click(object sender, EventArgs e)
        {
            FrmArticuloFind frm = new FrmArticuloFind(CRUD.NONE, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                dgvArticulos.DataSource = frm.lsArticulosSel;

            }
        }

        private void cmbCampania_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }//end class

}
