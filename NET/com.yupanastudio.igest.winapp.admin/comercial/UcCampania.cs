using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class UcCampania : UcMaster
    {
        private Campania obCampania;
        private List<Campania> lsCampanias;
        private List<CronogramaPlantilla> lsCronograma = new List<CronogramaPlantilla>();

        public UcCampania()
        {
            InitializeComponent();
            dgvCampanias.AutoGenerateColumns = false;
            dgvCronograma.AutoGenerateColumns = false;
            dgvCamp_idProdProy.ValueMember = "idProdProy";
            dgvCamp_idProdProy.DisplayMember = "nomProdProy";
            dgvCamp_idTipoPeriodo.ValueMember = "idTipo";
            dgvCamp_idTipoPeriodo.DisplayMember = "nomTipo";
            dgvCamp_idTipoModEst.ValueMember = "idTipo";
            dgvCamp_idTipoModEst.DisplayMember = "nomTipo";
            dgvCamp_idTipoTurno.ValueMember = "idTipo";
            dgvCamp_idTipoTurno.DisplayMember = "nomTipo";
        }

        private void UcCampania_Load(object sender, EventArgs e)
        {
            ////////dgvCamp_idProdProy.DataSource = Vars.lsProdProyByNeg;
            ////////dgvCamp_idTipoPeriodo.DataSource = Vars.lsTipo.Where(x => x.grupo == "TI_PERIODICIDAD").ToList();
            ////////dgvCamp_idTipoModEst.DataSource = Vars.lsTipo.Where(x => x.grupo == "TI_MOD_ESTUDIO").ToList();
            ////////dgvCamp_idTipoTurno.DataSource = Vars.lsTipo.Where(x => x.grupo == "TI_TURNO").ToList();

            ////////if (!(Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.COLEGIO"] || Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.ACADEMIA"]))
            ////////{
            ////////    dgvCamp_idTipoModEst.Visible = false;
            ////////    dgvCamp_idTipoTurno.Visible = false;
            ////////}

            //////nudAnio.Value = Vars.feServer.Year;
        }

        private void nudAnio_Enter(object sender, EventArgs e)
        {
            nudAnio.Select(0, nudAnio.Text.Length);
        }

        private void nudAnio_ValueChanged(object sender, EventArgs e)
        {
            mostrarCampanias(Task.Run(() => CampaniaBridge.getCampaniaByAnio(Vars.obEmpresa.idEmpresa, (int)nudAnio.Value)).Result);
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            FrmCampania frm = new FrmCampania(null, CRUD.NEW, this.obOpcion.soloLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                if (nudAnio.Value != frm.xObCampania.anio)
                    nudAnio.Value = frm.xObCampania.anio;
                else
                    mostrarCampanias(Task.Run(() => CampaniaBridge.getCampaniaByAnio(Vars.obEmpresa.idEmpresa, (int)nudAnio.Value)).Result);

                for (int i = 0; i < lsCampanias.Count; i++)
                    if (lsCampanias[i].idCampania == frm.xObCampania.idCampania)
                    {
                        dgvCampanias.Select();
                        dgvCampanias.CurrentCell = dgvCampanias.Rows[i].Cells["dgvCamp_codSede"];
                        return;
                    }
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (!validarCtrl1())
                return;

            bool readOnlyAux = false;
            if (lsCampanias[dgvCampanias.CurrentRow.Index].activo == false)
            {
                Utils.msg("La campaña no esta activo, no podrás modificarlo.", Estado.WARNING);
                readOnlyAux = true;
            }
            else if (lsCampanias[dgvCampanias.CurrentRow.Index].anio < Vars.feServer.Year)
            {
                Utils.msg("Solo puedes editar campañas del año actual o posterior.", Estado.WARNING);
                readOnlyAux = true;
            }

            FrmCampania frm = new FrmCampania(lsCampanias[dgvCampanias.CurrentRow.Index], CRUD.EDIT, (this.obOpcion.soloLectura ? true : readOnlyAux));
            frm.ShowDialog();
            if (frm.operOK)
            {
                if (nudAnio.Value != frm.xObCampania.anio)
                {
                    nudAnio.Value = frm.xObCampania.anio;
                    for (int i = 0; i < lsCampanias.Count; i++)
                        if (lsCampanias[i].idCampania == frm.xObCampania.idCampania)
                        {
                            dgvCampanias.Select();
                            dgvCampanias.CurrentCell = dgvCampanias.Rows[i].Cells["dgvCamp_codSede"];
                            return;
                        }
                }
                else
                {
                    lsCampanias[dgvCampanias.CurrentRow.Index] = frm.xObCampania;
                    dgvCampanias.Refresh();
                }
                obCampania = lsCampanias[dgvCampanias.CurrentRow.Index];
            }
        }

        private void dgvCampanias_SelectionChanged(object sender, EventArgs e)
        {
            mostrarCronograma();
        }

        private void mostrarCronograma()
        {
            if (dgvCampanias.CurrentRow != null && lsCampanias.Count > 0)
            {
                obCampania = lsCampanias[dgvCampanias.CurrentRow.Index];
                txtNomCampania.Text = obCampania.nomCampania;

                lsCronograma = Task.Run(() => CronogramaPlantillaBridge.getCronogramaPlantillaByIDCampania(obCampania.idCampania)).Result;
                lsCronograma = lsCronograma.Select(item => { item.selX = item.fePago != item.fePagoOrig; return item; }).OrderBy(x => x.orden).ToList();
                dgvCronograma.DataSource = lsCronograma;

                if (lsCronograma.Count > 0)
                {
                    this.nudCuotas.ValueChanged -= new System.EventHandler(this.nudCuotas_ValueChanged);
                    this.dtpIniCuota.ValueChanged -= new System.EventHandler(this.dtpIniCuota_ValueChanged);
                    nudCuotas.Value = lsCronograma.Count;
                    dtpIniCuota.Value = lsCronograma[0].fePago;
                    this.nudCuotas.ValueChanged += new System.EventHandler(this.nudCuotas_ValueChanged);
                    this.dtpIniCuota.ValueChanged += new System.EventHandler(this.dtpIniCuota_ValueChanged);
                }
                else
                {
                    nudCuotas.Value = 0;
                    dtpIniCuota.Value = obCampania.feIni;// dtpIniCuota.MinDate;
                }
            }
            else
            {
                txtNomCampania.Text = "";
                obCampania = null;
                nudCuotas.Value = 0;
                dtpIniCuota.Value = dtpIniCuota.MinDate;
                dgvCronograma.DataSource = lsCronograma = new List<CronogramaPlantilla>();
            }
        }

        private void chbSetCuotas_CheckedChanged(object sender, EventArgs e)
        {
            if (obCampania == null)
            {
                Utils.msg("Se requiere una campaña seleccionada.", Estado.WARNING);
                this.chbSetCuotas.CheckedChanged -= new System.EventHandler(this.chbSetCuotas_CheckedChanged);                
                chbSetCuotas.Checked = false;
                this.chbSetCuotas.CheckedChanged += new System.EventHandler(this.chbSetCuotas_CheckedChanged);
                return;
            }
            if (!obCampania.activo && chbSetCuotas.Checked)
            {
                Utils.msg("La campaña no está activo.", Estado.WARNING);
                this.chbSetCuotas.CheckedChanged -= new System.EventHandler(this.chbSetCuotas_CheckedChanged);
                chbSetCuotas.Checked = false;
                this.chbSetCuotas.CheckedChanged += new System.EventHandler(this.chbSetCuotas_CheckedChanged);
                return;
            }

            habilitarCtrl(chbSetCuotas.Checked);
            mostrarCronograma();
        }

        private void dgvCronograma_CellValueChanged(object sender, System.Windows.Forms.DataGridViewCellEventArgs e)
        {
            if (dgvCronograma.CurrentRow != null && lsCronograma.Count > 0)
            {
                bool sel = (bool)dgvCronograma.CurrentRow.Cells["dgvCron_selX"].Value;

                dgvCronograma.CurrentRow.Cells["dgvCron_fePago"].ReadOnly = !sel;

                if (sel)
                {
                    dgvCronograma.CurrentRow.Cells["dgvCron_fePago"].Style.BackColor = Color.Yellow;
                    dgvCronograma.CurrentRow.Cells["dgvCron_fePago"].Style.SelectionBackColor = Color.Yellow;
                }
                else
                {
                    dgvCronograma.CurrentRow.Cells["dgvCron_fePago"].Style.BackColor = Color.White;
                    dgvCronograma.CurrentRow.Cells["dgvCron_fePago"].Style.SelectionBackColor = Color.LemonChiffon;
                    lsCronograma[dgvCronograma.CurrentRow.Index].fePago = lsCronograma[dgvCronograma.CurrentRow.Index].fePagoOrig;
                }
                dgvCronograma.Invalidate();
            }
        }

        private void dgvCronograma_CurrentCellDirtyStateChanged(object sender, EventArgs e)
        {
            if (dgvCronograma.IsCurrentCellDirty)
            {
                dgvCronograma.CommitEdit(DataGridViewDataErrorContexts.Commit);
            }
        }

        private void dtpIniCuota_ValueChanged(object sender, EventArgs e)
        {
            setCuotas();
        }

        private void nudCuotas_ValueChanged(object sender, EventArgs e)
        {
            setCuotas();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!validarCtrl2())
                return;

            if (DialogResult.Yes == Utils.msgQ("Estas seguro de registrar los cambios?", Estado.YESNO))
            {
                try
                {
                    bool b = Task.Run(() => CronogramaPlantillaBridge.upsert(lsCronograma)).Result;
                    chbSetCuotas.Checked = false;
                    Utils.msg("Los datos se guardaron correctamente.", Estado.SUCCESS);
                }
                catch (Exception ex)
                {
                    Utils.msg(ex.ToString(), Estado.ERROR);
                }
            }
        }

        //
        // Métodos
        //
        private bool validarCtrl1()
        {
            if (dgvCampanias.CurrentRow == null || lsCampanias.Count < 1)
            {
                Utils.msg("Se requiere un registro seleccionado.", Estado.WARNING);
                return false;
            }
            return true;
        }

        private bool validarCtrl2()
        {
            if (lsCronograma.Count <= 0)
            {
                Utils.msg("No se definió ninguna cuota.", Estado.WARNING);
                return false;
            }

            if (lsCronograma.GroupBy(x => x.fePago).Where(y => y.Count() > 1).Count() > 0)
            {
                Utils.msg("No se acepta cuotas con la misma fecha.", Estado.WARNING);
                return false;
            }

            for (int i = 1; i < lsCronograma.Count; i++)
            {
                if (lsCronograma[i].fePago < lsCronograma[i - 1].fePago)
                {
                    Utils.msg("Las fechas tienen que ir de acuerdo al orden de cuotas.", Estado.WARNING);
                    return false;
                }
            }

            foreach (var item in lsCronograma)
            {
                if (item.selX && item.fePago == item.fePagoOrig)
                {
                    Utils.msg("Seleccionaste para modificar y no modificaste la fecha.", Estado.WARNING);
                    return false;
                }
            }

            return true;
        }

        private void mostrarCampanias(List<Campania> ls)
        {
            lsCampanias = ls.OrderBy(x => x.codSede).ThenBy(y => y.ordenX).ThenBy(z => z.frecuencia).ToList();
            dgvCampanias.DataSource = lsCampanias;
            dgvCampanias.Refresh();
        }

        private void setCuotas()
        {
            lsCronograma = new List<CronogramaPlantilla>();

            dgvCron_fePago.ReadOnly = true;

            if (obCampania != null)
            {
                Tipo obTipoPeriodo = Vars.lsTipos.Where(x => x.idTipo == obCampania.idTipoPeriodo).FirstOrDefault();

                int idTipoPeriodo = obTipoPeriodo.idTipo;

                DateTime feIni = dtpIniCuota.Value;


                int diaCuota = feIni.Day;

                for (int cuota = 1; cuota <= nudCuotas.Value; cuota++)
                {
                    CronogramaPlantilla ob = new CronogramaPlantilla();
                    ob.idCronPlant = -1;
                    ob.idCampania = obCampania.idCampania;
                    ob.orden = cuota;

                    //QUITAR LAS TILDESSSSSSSSSSS

                    if (obTipoPeriodo.valor2 == "DÍA")
                        ob.nombre = "CUOTA " + cuota + " | " + feIni.ToString("yyyy-MMMM-dd").ToUpper();
                    else if (obTipoPeriodo.valor2 == "MES")
                        ob.nombre = "CUOTA " + cuota + " | " + feIni.ToString("yyyy-MMMM").ToUpper();
                    else if (obTipoPeriodo.valor2 == "AÑO")
                        ob.nombre = "CUOTA " + cuota + " | " + feIni.ToString("yyyy").ToUpper();

                    ob.numMes = feIni.Month;
                    ob.periodo = feIni.ToString("yyyy-MM");
                    ob.fePago = feIni;  // en la primera cuota, tiene el valor del dtp
                    ob.fePagoOrig = feIni;
                    lsCronograma.Add(ob);

                    if (obTipoPeriodo.valor2 == "DÍA")
                    {
                        feIni = feIni.AddDays(int.Parse(obTipoPeriodo.valor1));
                    }
                    else if (obTipoPeriodo.valor2 == "MES")
                    {
                        DateTime feOrig = feIni;
                        feIni = feIni.AddMonths(int.Parse(obTipoPeriodo.valor1));
                        int diasNuevoMes = (new DateTime(feIni.Year, feIni.Month, 1).AddMonths(1).AddDays(-1)).Day;
                        bool lastDay = diasNuevoMes == feIni.Day;

                        int x = 0;
                        if (diaCuota > 28 && !lastDay && diaCuota - feIni.Day != 0)
                        {
                            if (feOrig.Month == 2)
                                feIni = new DateTime(feIni.Year, feIni.Month, diasNuevoMes);
                            else
                                feIni = feIni.AddDays(diaCuota - feIni.Day);
                        }
                    }
                    else if (obTipoPeriodo.valor2 == "AÑO")
                    {
                        feIni = feIni.AddYears(int.Parse(obTipoPeriodo.valor1));
                    }
                }
            }


            dgvCronograma.DataSource = lsCronograma;
            dgvCronograma.Refresh();
        }

        private void habilitarCtrl(bool b)
        {
            nudAnio.Enabled = !b;
            btnEdit.Enabled = !b;
            btnNew.Enabled = !b;
            dgvCampanias.Enabled = !b;
            dtpIniCuota.Enabled = b;
            nudCuotas.Enabled = b;
            dgvCron_selX.ReadOnly = !b;
            btnGuardar.Enabled = this.obOpcion.soloLectura ? false : b;
            dgvCron_selX.HeaderText = chbSetCuotas.Checked ? "MODIFICAR FECHA" : "MODIFICADO";
        }

    }//end class

}
