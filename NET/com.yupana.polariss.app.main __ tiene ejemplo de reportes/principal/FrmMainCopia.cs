using com.yupanastudio.polariss.app.Properties;
using com.yupanastudio.polariss.model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Resources;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app.principal
{
    public partial class FrmMainCopia : Form
    {
        private FrmLogin frmLogin;
        private Point _Offset = Point.Empty;
        private int indexSistema = -1;
        private string[] nodeSel;
        private bool validado = false;

        //public FrmMain(FrmLogin frmLogin)
        //{
        //    //this.frmLogin = frmLogin;
        //    //this.nodeSel = new string[Vars.lsSistemaUsu.Count];
        //    //for (int i = 0; i < Vars.lsSistemaUsu.Count; i++)
        //    //    nodeSel[i] = "";

        //    InitializeComponent();
        //}

        public FrmMainCopia()
        {
            //this.nodeSel = new string[Vars.lsSistemaUsu.Count];
            //for (int i = 0; i < Vars.lsSistemaUsu.Count; i++)
            //    nodeSel[i] = "";

            InitializeComponent();
        }

        private void FrmMain_Load(object sender, EventArgs e)
        {
            //cmbSistema.DataSource = Vars.lsSistemaUsu;
            //setUsuario();

            //frmLogin = new FrmLogin();
            //DialogResult d =   frmLogin.ShowDialog();
            //if (DialogResult.OK == d)
            //{
            //    MessageBox.Show("TODO OK");
            //}else if (DialogResult.Cancel == d)
            //{
            //    this.Dispose();
            //}

            // si tipo_negocio es academico cambiar
            /*
            btnPrincipal.Location = new Point(0, 2);
            btnComercial.Location = new Point(33, 2);
            btnLogistico.Location = new Point(66, 2);
            btnLaboral.Location = new Point(99, 2);
            btnFinanciero.Location = new Point(132, 2);
            btnAcademico.Location = new Point(165, 2);

            btnPrincipal.Size = new Size(33, 30);
            btnComercial.Size = new Size(33, 30);
            btnLogistico.Size = new Size(33, 30);
            btnLaboral.Size = new Size(33, 30);
            btnFinanciero.Size = new Size(33, 30);
            btnAcademico.Size = new Size(33, 30);

            btnAcademico.Visible = true;
            */




            //setPnlWork(Vars.urlUcDefault);
        }

        private void CmbSistema_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbSistema.SelectedItem != null)
            {
                indexSistema = cmbSistema.SelectedIndex;
                Sistema ob = (Sistema)cmbSistema.SelectedItem;
                headSistema.ValuesPrimary.Heading = ob.nomSistema;

                var rm = new ResourceManager(Vars.urlAssembly + ".Properties.Resources", typeof(Resources).Assembly);
                headSistema.ValuesPrimary.Image = (System.Drawing.Bitmap)rm.GetObject("icoSys" + ob.idSistema);

                setOpciones(ob);

                TreeNode[] tns = treeOpcion.Nodes.Find(nodeSel[indexSistema], true);
                if (tns.Length > 0)
                    treeOpcion.SelectedNode = tns[0];
                else
                    treeOpcion.SelectedNode = treeOpcion.Nodes[0];

                treeOpcion.Focus();
                treeOpcion.Refresh();
            }
        }

        private void TreeOpcion_AfterSelect(object sender, TreeViewEventArgs e)
        {
            if (e != null)
            {
                nodeSel[indexSistema] = e.Node.Text;
                string nomCtrl = ((Opcion)e.Node.Tag).nomControl;
                setPnlWork(nomCtrl == "" ? Vars.urlUcDefault : nomCtrl);
            }
        }

        private void TreeOpcion_BeforeCollapse(object sender, TreeViewCancelEventArgs e)
        {
            e.Cancel = true;
        }

        private void ImgClose_Click(object sender, EventArgs e)
        {
            closeFrm();
        }

        private void ImgMin_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void pnlHead_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                _Offset = new Point(e.X, e.Y);
            }
        }
        private void pnlHead_MouseMove(object sender, MouseEventArgs e)
        {
            if (_Offset != Point.Empty)
            {
                Point newlocation = this.Location;
                newlocation.X += e.X - _Offset.X;
                newlocation.Y += e.Y - _Offset.Y;
                this.Location = newlocation;
            }
        }
        private void pnlHead_MouseUp(object sender, MouseEventArgs e)
        {
            _Offset = Point.Empty;
        }

        private void ImgClose_MouseHover(object sender, EventArgs e)
        {
            imgClose.Image = global::com.yupanastudio.polariss.app.Properties.Resources.form_close_bold;
        }
        private void ImgClose_MouseLeave(object sender, EventArgs e)
        {
            imgClose.Image = global::com.yupanastudio.polariss.app.Properties.Resources.form_close;
        }
        private void ImgMin_MouseHover(object sender, EventArgs e)
        {
            imgMin.Image = global::com.yupanastudio.polariss.app.Properties.Resources.form_min_bold;
        }
        private void ImgMin_MouseLeave(object sender, EventArgs e)
        {
            imgMin.Image = global::com.yupanastudio.polariss.app.Properties.Resources.form_min;
        }

        private void TimerReloj_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString("hh:mm:ss tt").ToUpper();
        }
        private void TimerHora_Tick(object sender, EventArgs e)
        {
            // a partir del arranque, ejecutar cada hora 
            // si tiene fecha de operación cambiado y hora es mayor de las once de las noche, reiniciar sistema
        }
        private void TimerCambioFecha_Tick(object sender, EventArgs e)
        {
            // a partir del arranque, ejecutar en dos horas
            // si cambió fecha de operación, tiene un par de horas para trabajar
            // se muestra "lblContador" se oculta "lblTime"
        }


        //
        // Métodos
        //
        private void setUsuario()
        {
            headUsuario.ValuesPrimary.Heading = Vars.obPerUsuario.apeNomsX;
            lblFeOper.Text = Vars.obUsuario.feOperacion.ToString("dd/MMM/yyyy");
            lblHost.Text = Dns.GetHostName();
            lblUsuario.Text = Vars.obUsuario.nomUsu.Substring(11).ToLower();
            try
            {
                var request = WebRequest.Create(Vars.urlHostFotos + Vars.obEmpresa.idEmpresa + "/" + Vars.obPerUsuario.docIdent + ".jpg");
                using (var stream = request.GetResponse().GetResponseStream())
                {
                    //imgUser.Image = Bitmap.FromStream(stream);
                }
            }
            catch (Exception)
            {
                //imgUser.Image = global::com.yupanastudio.polariss.app.Properties.Resources.usuario;
            }
        }

        private void setOpciones(Sistema obSis)
        {
            treeOpcion.Nodes.Clear();

            List<Opcion> lsOpcSys = obSis.lsOpcionX.Where(x => "109HEA".Equals(x.idTiOpcion) || "109PNL".Equals(x.idTiOpcion)).ToList();
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
            this.treeOpcion.Nodes.AddRange(lsTreePadres.ToArray());
            treeOpcion.ExpandAll();
        }

        private void setPnlWork(String nomClase)
        {
            try
            {
                pnlWork.Controls.Clear();

                UserControl UsrCtrl = (UserControl)Activator.CreateInstance(Vars.urlAssembly, nomClase).Unwrap();
                pnlWork.Controls.Add(UsrCtrl);
                UsrCtrl.Location = new System.Drawing.Point(0, 0);
                UsrCtrl.Name = nomClase;
                UsrCtrl.Size = new System.Drawing.Size(1000, 620);
                UsrCtrl.TabIndex = 0;
            }
            catch (Exception ex)
            {
                setPnlWork(Vars.urlUcDefault);
                Utils.msg(ex.ToString(), Estado.ERROR);
            }
        }

        private void closeFrm()
        {
            this.Dispose();
            frmLogin.Dispose();
        }

        private void FrmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Esta seguro de cerrar la aplicación?", "POLARISS", MessageBoxButtons.YesNo) == DialogResult.Yes)
                closeFrm();
            else
                e.Cancel = true;
        }

        private void FrmMain_Activated(object sender, EventArgs e)
        {
            if (!validado)
            {
                frmLogin = new FrmLogin();
                DialogResult d = frmLogin.ShowDialog();

                if (!frmLogin.valOk)
                {
                    this.Dispose();
                }
                else
                {
                    validado = true;
                    this.BringToFront();
                }
            }
        }

    }//end class

}
