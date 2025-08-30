using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmMain : Form
    {
        private FrmLogin frmLogin;          // se pasa sólo para cerrar la aplicación adecudamente
        private bool cambiarLbl;            // para label intermitente
        private DateTime feLimiteUso;       // fecha_hora límite de uso del sistema
        private DateTime feCtrlCambio;      // para controlar tiempo permitido, cuando la fecha del usuario ha cambiado
        private List<Perfil> lsPerfil;      // perfiles del usuario

        public FrmMain(FrmLogin frm)
        {
            frmLogin = frm;
            cambiarLbl = false;
            feLimiteUso = Vars.feOperacion.Date.AddHours(23).AddMinutes(59);
            feCtrlCambio = Vars.feOperacion.Date.AddHours(double.Parse(Vars.dicVarGB["HorasCambio"]));
            InitializeComponent();
        }

        private async void FrmMain_Load(object sender, EventArgs e)
        {
            picHead1.Image = Vars.obEmpINI.imgBannerX;
            headUsuario.ValuesPrimary.Heading = Vars.obUsuario.nomApesX;
            lblUsuario.Text = Vars.obUsuario.nomUsu.Substring(5).ToUpper();
            lblHost.Text = Dns.GetHostName().ToUpper();
            lblFeOper.Text = Vars.feOperacion.ToString("dd MMM yyyy").ToUpper();
            lblHora.Text = Vars.feOperacion.ToString("hh:mm:ss tt").ToUpper();

            // enfatizar que ha cambiado de fecha
            if (Vars.cambioFecha)
            {
                toolTip1.SetToolTip(headUsuario.Panel, "Está trabajando en una fecha diferente al servidor.\nVerifique el tiempo restante que le queda.");
                headUsuario.StateNormal.Back.Color1 = System.Drawing.Color.Red;
                lblUsuario.ForeColor = Color.White;
                lblHost.ForeColor = Color.White;
                lblFeOper.ForeColor = Color.White;
                lblHora.ForeColor = Color.White;
                lblTemporizador.Visible = true;
                lblFeOper.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold);
                lblHora.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold);
            }

            // botones activos 
            if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.CLINICA"])
                btnSisVAR.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnSysMED;
            else if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.BANCA"])
                btnSisVAR.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnSysBKA;

            var dicBtns = new Dictionary<Krypton.Toolkit.KryptonButton, string> { { btnSisCOM, "COM" }, { btnSisLGT, "LGT" }, { btnSisPER, "PER" }, { btnSisFIN, "FIN" }, { btnSisADM, "ADM" } };
            if (Vars.lsSistemasUsu.Any(x => new[] { "COL", "ACA", "MED", "BKA" }.Contains(x.idSistema)))
                dicBtns.Add(btnSisVAR, Vars.lsSistemasUsu.First(x => new[] { "COL", "ACA", "MED", "BKA" }.Contains(x.idSistema)).idSistema);

            foreach (var kvp in dicBtns)
            {
                var btnX = kvp.Key;
                var idSis = kvp.Value;
                btnX.Enabled = Vars.lsSistemasUsu.Any(x => x.idSistema == idSis);
                if (btnX.Enabled) toolTip1.SetToolTip(btnX, Vars.lsSistemasUsu.First(x => x.idSistema == idSis).nomSistema);
            }

            // perfiles del usuario
            cargarPerfil(Vars.lsSistemasUsu.First().idSistema);

            // imagen de usuario
            //await cargarImagenUsuAsync();
            picUser.Image = await Vars.cargarImagenUsuAsync(Vars.obUsuario.numDocIdent);
        }

        private void cargarPerfil(String idSis)
        {
            headSistema.ValuesPrimary.Heading = Vars.lsSistemasUsu.FirstOrDefault(y => y.idSistema == idSis).nomSistema;
            headSistema.ValuesPrimary.Image = (System.Drawing.Bitmap)Vars.rm.GetObject("btnSys" + idSis);
            lsPerfil = Vars.lsPerfilUsu.Where(x => x.idSistema == idSis).ToList();
            cmbPerfil.DataSource = lsPerfil;
        }

        //public async Task cargarImagenUsuAsync()
        //{
        //    try
        //    {
        //        using (HttpClient client = new HttpClient())
        //        {
        //            // Configurar para leer los encabezados y luego el contenido del stream
        //            using (var response = await client.GetAsync(Vars.dicVarGB["UrlFotoTrab"] + Vars.obUsuario.numDocIdent + ".jpg", HttpCompletionOption.ResponseHeadersRead))
        //            {
        //                if (response.IsSuccessStatusCode)
        //                    using (var stream = await response.Content.ReadAsStreamAsync())
        //                    {
        //                        picUser.Invoke((Action)(() => picUser.Image = Bitmap.FromStream(stream)));
        //                    }
        //                else
        //                    picUser.Invoke((Action)(() => picUser.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.usuario));
        //            }
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        picUser.Invoke((Action)(() => picUser.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.usuario));
        //    }
        //}

        private void TimerSegundos_Tick(object sender, EventArgs e)
        {
            Vars.feOperacion = Vars.feOperacion.AddSeconds(1);
            lblHora.Text = Vars.feOperacion.ToString("hh:mm:ss tt").ToUpper();

            if (Vars.cambioFecha)
            {
                feCtrlCambio = feCtrlCambio.AddSeconds(-1);
                lblTemporizador.Text = feCtrlCambio.ToString("HH:mm:ss").ToUpper();
                lblTemporizador.ForeColor = cambiarLbl ? Color.White : Color.Yellow;
                cambiarLbl = !cambiarLbl;
            }

            if (Vars.feOperacion >= feLimiteUso)
            {
                this.timerSegundos.Tick -= new System.EventHandler(this.TimerSegundos_Tick);
                Utils.msg("Se cerrará el sistema, es todo por hoy.", Estado.WARNING);
                closeFrm();
            }
            else if (Vars.cambioFecha && lblTemporizador.Text.Equals("00:00:00"))
            {
                this.timerSegundos.Tick -= new System.EventHandler(this.TimerSegundos_Tick);
                Utils.msg("Se cerrará el sistema, se terminó el permiso del cambio de fecha.", Estado.WARNING);
                closeFrm();
            }
        }

        private void btnSisComercial_Click(object sender, EventArgs e)
        {
            cargarPerfil("COM");
        }

        private void btnSisLogistico_Click(object sender, EventArgs e)
        {
            cargarPerfil("LGT");
        }

        private void btnSisLaboral_Click(object sender, EventArgs e)
        {
            cargarPerfil("PER");
        }

        private void btnSisFinanciero_Click(object sender, EventArgs e)
        {
            cargarPerfil("FIN");
        }

        private void btnSisAcademico_Click(object sender, EventArgs e)
        {
            if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.COLEGIO"])
                cargarPerfil("COL");
            else if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.ACADEMIA"])
                cargarPerfil("ACA");
            else if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.CLINICA"])
                cargarPerfil("MED");
            else if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.BANCA"])
                cargarPerfil("BKA");
        }

        private void btnSisPrincipal_Click(object sender, EventArgs e)
        {
            cargarPerfil("ADM");
        }

        private void TreeOpcion_AfterSelect(object sender, TreeViewEventArgs e)
        {
            if (e != null)
            {
                string nomCtrl = ((Opcion)e.Node.Tag).nomControl;
                if (nomCtrl == "")
                    setPnlWork(nomCtrl, null);
                else
                    setPnlWork(nomCtrl, ((Opcion)e.Node.Tag));
            }
        }

        private void TreeOpcion_BeforeCollapse(object sender, TreeViewCancelEventArgs e)
        {
            e.Cancel = true;
        }

        private void FrmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (Utils.msgQ("Esta seguro de cerrar el sistema?", Estado.YESNO) == DialogResult.Yes)
                closeFrm();
            else
                e.Cancel = true;
        }

        //
        // Métodos
        //
        private void setOpcionesOK(List<Opcion> lsOpcSys)
        {
            treeOpcion.Nodes.Clear();
            List<TreeNode> lsTreePadres = new List<TreeNode>();

            TreeNode nodoPapa = null;
            foreach (var opcSys in lsOpcSys)
            {
                if (opcSys.idPadre == -1)
                {
                    nodoPapa = new TreeNode(opcSys.nomOpcion);
                    nodoPapa.Tag = opcSys;
                    nodoPapa.Name = opcSys.nomOpcion;
                    lsTreePadres.Add(nodoPapa);
                }
                else
                {
                    TreeNode nodoHijo = new TreeNode(opcSys.nomOpcion);
                    nodoHijo.Tag = opcSys;
                    nodoHijo.Name = opcSys.nomOpcion;
                    nodoPapa.Nodes.Add(nodoHijo);
                }
            }
            treeOpcion.Nodes.AddRange(lsTreePadres.ToArray());
            treeOpcion.ExpandAll();
        }

        private void setPnlWork(String nomClase, Opcion obOpcion)
        {
            try
            {
                pnlWork.Controls.Clear();

                UserControl usrControl;
                if (nomClase == "")
                    usrControl = Vars.ucDefault;
                else
                {
                    usrControl = (UcMaster)Activator.CreateInstance("com.yupanastudio.polariss.app201.admin", "com.yupanastudio.polariss.app." + nomClase).Unwrap();
                    //((UcMaster)usrControl).obOpcion = obOpcion;
                    ((UcMaster)usrControl).setLectura(obOpcion);
                }

                usrControl.Anchor = ((System.Windows.Forms.AnchorStyles)((((
                    System.Windows.Forms.AnchorStyles.Top |
                    System.Windows.Forms.AnchorStyles.Bottom) |
                    System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)));

                pnlWork.Controls.Add(usrControl);
                usrControl.Location = new System.Drawing.Point(-1, -1);
                usrControl.Name = nomClase;
                //usrControl.Size = new System.Drawing.Size(1139, 611);                
                usrControl.Size = new System.Drawing.Size(this.Width - 279, this.Height - 118);

                usrControl.TabIndex = 0;
            }
            catch (Exception ex)
            {
                setPnlWork("", null);
                Utils.msg(ex.ToString(), Estado.ERROR);
            }
        }

        private void closeFrm()
        {
            this.Dispose();
            frmLogin.Dispose();
        }


        private void cmbPerfil_SelectedIndexChanged(object sender, EventArgs e)
        {
            Vars.obPerfil = null;
            if (lsPerfil.Count > 0 && cmbPerfil.SelectedItem != null)
            {
                Vars.obPerfil = lsPerfil[cmbPerfil.SelectedIndex];
                setOpcionesOK(Vars.obPerfil.lsOpcionX);
                treeOpcion.Select();
            }
        }

        private void imgMin_Click(object sender, EventArgs e)
        {
            Utils.msg("ANCHO: " + this.Width.ToString(), Estado.SUCCESS);
            Utils.msg("ALTO: " + this.Height.ToString(), Estado.SUCCESS);
        }

    }//end class

}
