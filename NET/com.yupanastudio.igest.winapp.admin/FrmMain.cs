using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmMain : Form
    {
        private FrmLogin frmLogin;          // se pasa sólo para cerrar la aplicación adecudamente
        //private bool cambiarLbl;          // para label intermitente
        private DateTime feLimiteUso;       // fecha_hora límite de uso del sistema
        private DateTime fhMinRestantes;    // para controlar tiempo restante
        private List<Perfil> lsPerfil;      // perfiles del usuario

        public FrmMain(FrmLogin frm)
        {
            InitializeComponent();

            frmLogin = frm;
            //cambiarLbl = false;
            feLimiteUso = Vars.feServer.Date.AddHours(23).AddMinutes(55);
            fhMinRestantes = Vars.feServer.Date.AddMinutes(10);

            if (Vars.feServer >= feLimiteUso)
            {
                Utils.msg("En mantenimiento, intententelo a las 00 horas.", Estado.WARNING);
                this.Dispose();
                return;
            }
        }

        private async void FrmMain_Load(object sender, EventArgs e)
        {
            // imagenes de la cabecera
            picHead1.Image = Vars.obEmpINI.imgBanner1X;
            picHead2.Image = Vars.obEmpINI.imgBanner2X;

            // usuario
            headUsuario.ValuesPrimary.Heading = Vars.obUsuario.obPersona.nomApesX;
            lblUsuario.Text = Vars.obUsuario.nomUsu.Substring(5).ToUpper();
            lblHost.Text = Environment.MachineName;
            lblFeOper.Text = Vars.feServer.ToString("dd MMM yyyy").ToUpper();
            lblHora.Text = Vars.feServer.ToString("hh:mm:ss tt").ToUpper();
            picUser.Image = await Vars.cargarImagenUsuAsync(Vars.obUsuario.obPersona.numDocIdent);

            // ocultar botón del sistema que no se tiene
            if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.COMERCIO"])
            {
                btnSisVAR.Visible = false;
                btnSisADM.Location = new Point(176, 0);
                btnSisADM.Size = new Size(90, 32);
            }
            else
            {
                if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.COLEGIO"] || Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.ACADEMIA"])
                {
                    this.toolTip1.SetToolTip(this.btnSisVAR, "ACADÉMICO");
                    btnSisVAR.Tag = Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.COLEGIO"] ? "COL" : "ACA";
                }
                else if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.CLINICA"])
                {
                    this.toolTip1.SetToolTip(this.btnSisVAR, "MÉDICO");
                    btnSisVAR.Tag = "MED";
                    btnSisVAR.Values.Image = (System.Drawing.Bitmap)Vars.rm.GetObject("btnSysMED");
                }
                else if (Vars.obEmpresa.idTipoEmpresa == Vars.dicTipos["TI_EMPRESA.BANCA"])
                {
                    this.toolTip1.SetToolTip(this.btnSisVAR, "BANCA");
                    btnSisVAR.Tag = "BKA";
                    btnSisVAR.Values.Image = (System.Drawing.Bitmap)Vars.rm.GetObject("btnSysBKA");
                }
            }

            // activar solo sistemas habilitados
            List<Krypton.Toolkit.KryptonButton> lsBtns = new List<Krypton.Toolkit.KryptonButton> { btnSisCOM, btnSisLGT, btnSisPER, btnSisFIN, btnSisVAR, btnSisADM };

            foreach (var btn in lsBtns)
                foreach (var sis in Vars.obEmpresa.lsEmpresaSistemas.Where(x => x.activo == true))
                    if (btn.Tag.ToString() == sis.idSistema)
                        btn.Enabled = true;

            // mostrar primer sistema activo y sus perfiles
            foreach (var item in lsBtns)
            {
                if (item.Enabled)
                {
                    cargarPerfil(item.Tag.ToString());
                    treeOpcion.Select();
                    break;
                }
            }

            //LOS TIPOS DE DE ESE SISTEMA
            //LOS TIPOS DE DE ESE SISTEMA
            //LOS TIPOS DE DE ESE SISTEMA
            /*
            Vars.lsNivEduNeg = obLogin.lsNivEduNeg;
            Vars.lsGradoNeg = obLogin.lsGradoNeg;
            Vars.lsAreaProfNeg = obLogin.lsAreaProfNeg;
            Vars.lsCarrProfNeg = obLogin.lsCarrProfNeg;
            //////////////////////////////// 
            Vars.lsProdProyByNeg = Task.Run(() => ProductoProyectoBridge.getProdProyByNegocio(Vars.obEmpresa.idEmpresa)).Result.OrderBy(x => x.orden).ToList();                        
            Vars.lsSedeByPer = Task.Run(() => SedeBridge.getSedeByPersona(Vars.obUsuario.idUsuario)).Result.OrderBy(x => x.dirSede).ToList();
            //////////////////////////////// 
            Vars.lsBeneficios = Task.Run(() => BeneficioBridge.getBeneficioByNeg(Vars.obEmpresa.idEmpresa)).Result;
            */
        }

        private void cargarPerfil(String idSistema)
        {
            headSistema.ValuesPrimary.Heading = Vars.lsSistemas.FirstOrDefault(y => y.idSistema == idSistema).nomSistema;
            headSistema.ValuesPrimary.Image = (System.Drawing.Bitmap)Vars.rm.GetObject("btnSys" + idSistema);
            lsPerfil = Vars.obUsuario.lsPerfil.Where(x => x.idSistema == idSistema).ToList();
            cmbPerfil.DataSource = lsPerfil;
            if (lsPerfil.Count == 0)
            {
                treeOpcion.Nodes.Clear();
            }
        }

        //public async Task cargarImagenUsuAsync()
        //{
        //    try
        //    {
        //        using (HttpClient httpClient = new HttpClient())
        //        {
        //            // Configurar para leer los encabezados y luego el contenido del stream
        //            using (var response = await httpClient.GetAsync(Vars.dicVarGB["UrlFotoTrab"] + Vars.obUsuario.obPersona.numDocIdent + ".jpg", HttpCompletionOption.ResponseHeadersRead))
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
            Vars.feServer = Vars.feServer.AddSeconds(1);
            lblHora.Text = Vars.feServer.ToString("hh:mm:ss tt").ToUpper();

            TimeSpan tsRestantes = feLimiteUso - Vars.feServer;

            if (tsRestantes.TotalMinutes <= 10)
            {
                fhMinRestantes = fhMinRestantes.AddSeconds(-1);
                lblTemporizador.Visible = true;
                lblTemporizador.Text = "QUEDA:  " + fhMinRestantes.ToString("mm:ss").ToUpper();

                //if (Vars.cambioFecha && lblTemporizador.Text.Equals("00:00:00"))
                {
                    this.timerSegundos.Tick -= new System.EventHandler(this.TimerSegundos_Tick);
                    Utils.msg("Se cerrará el sistema, se terminó el permiso del cambio de fecha.", Estado.WARNING);
                    closeFrm();
                }
            }
        
            //////DateTime dtAux = feLimiteUso.AddMinutes(-400);
            //////label1.Text = dtAux.ToString("dd MMM yyyy hh:mm:ss tt").ToUpper();
            //////if (Vars.feServer >= dtAux)
            //////{
            //////    //cambiarLbl = true;
            //////    fhMinRestantes = fhMinRestantes.AddSeconds(-1);
            //////    lblTemporizador.Visible = true;
            //////    //lblTemporizador.Text = fhMinRestantes.ToString("HH:mm:ss").ToUpper();
            //////    lblTemporizador.Text = "QUEDA:  " + fhMinRestantes.ToString("mm:ss").ToUpper();
            //////    //lblTemporizador.ForeColor = cambiarLbl ? Color.White : Color.Yellow;
            //////    //cambiarLbl = !cambiarLbl;
            //////}
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

        private void btnSisVAR_Click(object sender, EventArgs e)
        {
            cargarPerfil(btnSisVAR.Tag.ToString());
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
                    usrControl = (UcMaster)Activator.CreateInstance("com.yupanastudio.igest.winapp201.admin", "com.yupanastudio.igest.winapp." + nomClase).Unwrap();
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

    }//end class

}
