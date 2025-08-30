using com.yupanastudio.polariss.app.Properties;
using System;
using System.Linq;
using System.Net.Http;
using System.Resources;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmLogin : FrmMaster
    {
        public FrmLogin()
        {
            InitializeComponent();
            if (!Utils.validarCnxRemota())
                setError("Revise su conexión de red/internet e inténtalo nuevamente.");
        }

        private void FrmLogin_Load(object sender, EventArgs e)
        {
            cmbEmpresa.DataSource = com.yupanastudio.polariss.app.Vars.lsEmpINI;
            if (com.yupanastudio.polariss.app.Vars.lsEmpINI.Count == 1)
                cmbEmpresa.SelectedIndex = 0;
            else
            {
                cmbEmpresa.SelectedItem = null;
                this.imgLogo.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.login_1001;
            }
            cmbEmpresa.Select();
        }

        private void CmbEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            imgLogo.Image = null;
            if (cmbEmpresa.SelectedItem != null)
                this.imgLogo.Image = ((Empresa)cmbEmpresa.SelectedItem).imgLogoX;
        }

        private void BtnOk_Click(object sender, EventArgs e)
        {
            validarUsuario();
        }

        //
        // Métodos
        //        
        private void setError(String msgError)
        {
            imgCnx.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.connect_fail;
            cmbEmpresa.Enabled = false;
            txtNomUsu.Enabled = false;
            txtPwdUsu.Enabled = false;
            btnOk.Enabled = false;
            lblMsg.Text = msgError;
        }

        private bool validarCtrls()
        {
            if (cmbEmpresa.SelectedItem == null)
            {
                Utils.msg("Seleccione empresa.", Estado.WARNING);
                cmbEmpresa.Focus();
                return false;
            }
            else if (txtNomUsu.Text.Trim().Length < Vars.minCar)
            {
                Utils.msg("Se requiere al menos " + Vars.minCar + " caracteres para el nombre de usuario.", Estado.WARNING);
                txtNomUsu.Focus();
                return false;
            }
            else if (txtPwdUsu.Text.Trim().Length < Vars.minCar)
            {
                Utils.msg("Se requiere al menos " + Vars.minCar + " caracteres para la contraseña.", Estado.WARNING);
                txtPwdUsu.Focus();
                return false;
            }
            return true;
        }

        private async void validarUsuario()
        {
            if (!validarCtrls())
                return;

            btnOk.Enabled = false;

            try
            {
                // permite usar el certificado provisional que se puso en el API REST
                HttpClientHandler handler = new HttpClientHandler();
                handler.ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => true;
                Vars.client = new HttpClient(handler);

                Vars.obEmpINI = (Empresa)cmbEmpresa.SelectedItem;

                //LoginX obLogin = await new LoginXBridge().validarUsuario(Vars.obEmpINI.idEmpresa, Vars.obEmpINI.idEmpresa.ToString() + "." + txtNomUsu.Text, txtPwdUsu.Text);

                //if (obLogin != null)
                //{
                //    if (obLogin.ok)
                //    {
                //        // PRINCIPAL
                //        Vars.obEmpresa = obLogin.obEmpresa;
                //        Vars.lsEmpresaGroup = obLogin.lsEmpresaGroup;
                //        Vars.obUsuario = obLogin.obUsuario;
                //        Vars.lsSistemasEmp = obLogin.lsSistemasEmp;
                //        Vars.lsSedesEmp = obLogin.lsSedesEmp;
                //        Vars.lsSistemasUsu = obLogin.lsSistemasUsu;
                //        Vars.lsPerfilUsu = obLogin.lsPerfilUsu;
                //        //Vars.lsOpcionUsu = obLogin.lsOpcionUsu;  //del  perfil seleccionado recuperar las opciones 
                //        Vars.lsPaises = obLogin.lsPaises;
                //        Vars.lsDptos = obLogin.lsDptos;
                //        Vars.lsProvs = obLogin.lsProvs;
                //        Vars.lsDists = obLogin.lsDists;
                //        Vars.lsTipos = obLogin.lsTipos;
                //        Vars.lsVarGlobal = obLogin.lsVarGlobal;

                //        foreach (var item in obLogin.lsTipos.Where(x => x.clave != "").ToList())
                //            Vars.dicTipos.Add(item.grupo + "." + item.clave, item.idTipo);

                //        foreach (var item in obLogin.lsVarGlobal)
                //            Vars.dicVarGB.Add(item.nomVarGb, item.valor);

                //        Vars.rm = new ResourceManager("com.yupanastudio.igest.winapp.Properties.Resources", typeof(Resources).Assembly);
                //        Vars.minCar = int.Parse(Vars.dicVarGB["MinCarFind"]);

                //        Vars.cambioFecha = (obLogin.feHhServer.Date != obLogin.obUsuario.feOperacion);
                //        Vars.feOperacion = Vars.cambioFecha ? obLogin.obUsuario.feOperacion.AddHours(obLogin.feHhServer.Hour).AddMinutes(obLogin.feHhServer.Minute).AddSeconds(obLogin.feHhServer.Second + 2) : obLogin.feHhServer.AddSeconds(1);


                //        // FORM
                //        Vars.ucDefault = new UcFondo();

                //        this.Visible = false;

                //        FrmMain frm = new FrmMain(this);
                //        //frm.WindowState = System.Windows.Forms.FormWindowState.Maximized;
                //        frm.Show();
                //        frm.BringToFront();
                //        frm.treeOpcion.Focus();     //para que seleccione la primera opción del menú de opciones
                //        //frm.Location = new Point(-6,1);// System.Windows.Forms.FormStartPosition.CenterScreen;
                //        //frm.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;

                //        /*
                //        ////////////////////////////////
                //        /////////// QUITAR DE XLOGIN                        
                //        Vars.lsNivEduNeg = obLogin.lsNivEduNeg;
                //        Vars.lsGradoNeg = obLogin.lsGradoNeg;
                //        Vars.lsAreaProfNeg = obLogin.lsAreaProfNeg;
                //        Vars.lsCarrProfNeg = obLogin.lsCarrProfNeg;
                //        //////////////////////////////// 
                //        Vars.lsProdProyByNeg = Task.Run(() => ProductoProyectoBridge.getProdProyByNegocio(Vars.obEmpresa.idEmpresa)).Result.OrderBy(x => x.orden).ToList();                        
                //        Vars.lsSedeByPer = Task.Run(() => SedeBridge.getSedeByPersona(Vars.obUsuario.idUsuario)).Result.OrderBy(x => x.dirSede).ToList();
                //        //////////////////////////////// 
                //        Vars.lsBeneficios = Task.Run(() => BeneficioBridge.getBeneficioByNeg(Vars.obEmpresa.idEmpresa)).Result;
                //        ////////////////////////////////
                //        */
                //    }
                //    else
                //    {
                //        Utils.msg(obLogin.msg, Estado.WARNING);
                //    }
                //}
                //else
                //{
                //    Utils.msg("Sucedió un evento inesperando clinete1", Estado.WARNING);
                //}
            }
            catch (Exception ex)
            {
                Utils.msg(ex.Message, Estado.ERROR);
            }
            btnOk.Enabled = true;
        }

    }//end class

}
