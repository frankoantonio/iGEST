using com.yupanastudio.igest.winapp.Properties;
using System;
using System.Drawing;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Resources;
using System.Threading.Tasks;
using static com.yupanastudio.igest.winapp.Utils;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmLogin : FrmMasterOK
    {
        public FrmLogin()
        {
            InitializeComponent();

            Vars.rm = new ResourceManager("com.yupanastudio.igest.winapp.Properties.Resources", typeof(Resources).Assembly);

            if (!Utils.validarCnxRemota())
                setError();
        }

        private void FrmLogin_Load(object sender, EventArgs e)
        {
            cmbEmpresa.DataSource = com.yupanastudio.igest.winapp.Vars.lsEmpINI;
            if (com.yupanastudio.igest.winapp.Vars.lsEmpINI.Count == 1)
            {
                cmbEmpresa.SelectedIndex = 0;
                cmbEmpresa.Enabled = false;
                cmbEmpresa.TabStop = false;
                txtNomUsu.Select();
            }
            else
            {
                cmbEmpresa.SelectedItem = null;
                this.imgLogo.Image = (System.Drawing.Bitmap)Vars.rm.GetObject("logo_1000");
                cmbEmpresa.Select();
            }
        }

        private void CmbEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            imgLogo.Image = null;
            if (cmbEmpresa.SelectedItem != null)
            {
                Vars.obEmpINI = (Empresa)cmbEmpresa.SelectedItem;
                this.imgLogo.Image = Vars.obEmpINI.imgLogoX;
            }
        }

        private async void BtnOk_Click(object sender, EventArgs e)
        {
            await validarUsuario();
        }

        //
        // Métodos
        //        
        private void setError()
        {
            imgCnx.Image = (System.Drawing.Bitmap)Vars.rm.GetObject("connect_fail");
            cmbEmpresa.Enabled = false;
            txtNomUsu.Enabled = false;
            txtPwdUsu.Enabled = false;
            btnOk.Enabled = false;
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "Revisa tu conexión de red o el internet e inténtalo nuevamente.";
        }

        private bool validarCtrls()
        {
            if (cmbEmpresa.SelectedItem == null)
            {
                Utils.msg("Selecciona una empresa.", Estado.WARNING);
                cmbEmpresa.Focus();
                return false;
            }
            else if (txtNomUsu.Text.Trim().Length < Vars.minCarInput)
            {
                Utils.msg("Se requiere al menos " + Vars.minCarInput + " caracteres para el nombre de usuario.", Estado.WARNING);
                txtNomUsu.Focus();
                txtNomUsu.SelectAll();
                return false;
            }
            else if (txtPwdUsu.Text.Trim().Length < Vars.minCarInput)
            {
                Utils.msg("Se requiere al menos " + Vars.minCarInput + " caracteres para la contraseña.", Estado.WARNING);
                txtPwdUsu.Focus();
                txtPwdUsu.SelectAll();
                return false;
            }
            return true;
        }

        private async Task validarUsuario()
        {
            if (!validarCtrls()) return;

            try
            {
                btnOk.Enabled = false;

                ClientInfo obClientInfo = Utils.getClientInfo();
                if (obClientInfo == null) return;
                else
                {
                    obClientInfo.nomUsu = Vars.obEmpINI.idEmpresa.ToString() + "." + txtNomUsu.Text;
                    obClientInfo.pwdUsu = txtPwdUsu.Text;
                    obClientInfo.idUsuario = -1;
                    obClientInfo.idEmpresa = Vars.obEmpINI.idEmpresa;
                    obClientInfo.grupoEmp = Vars.obEmpINI.grupoEmp;
                    obClientInfo.idTipoPersona = 95060; //TRABAJADOR
                }

                // autenticar en el servidor
                HttpClientHandler handler = new HttpClientHandler();
                handler.ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => true;
                Vars.httpClient = new HttpClient(handler);

                RptaLogin obRpta = await UsuarioService.getLoginX(obClientInfo);

                if (obRpta != null && obRpta.token != null && obRpta.obLoginX != null)
                {
                    Vars.tokenSession = obRpta.token.ToString();
                    Vars.httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", Vars.tokenSession);

                    Vars.feServer = obRpta.obLoginX.fhServer;
                    Vars.obUsuario = obRpta.obLoginX.obUsuario;
                    Vars.obEmpresa = obRpta.obLoginX.obEmpresa;
                    Vars.lsEmpresaGroup = obRpta.obLoginX.lsEmpresa;
                    Vars.lsSistemas = obRpta.obLoginX.lsSistema;
                    Vars.lsPaises = obRpta.obLoginX.lsPais;
                    Vars.lsDepartamentos = obRpta.obLoginX.lsDepartamento;
                    Vars.lsProvincias = obRpta.obLoginX.lsProvincia;
                    Vars.lsDistritos = obRpta.obLoginX.lsDistrito;
                    Vars.lsTipos = obRpta.obLoginX.lsTipo;
                    Vars.lsVarGlobals = obRpta.obLoginX.lsVarGlobal;

                    if (Vars.dicTipos.Count == 0)
                        foreach (var item in Vars.lsTipos.Where(x => x.clave != "").ToList())
                            Vars.dicTipos.Add(item.grupo + "." + item.clave, item.idTipo);

                    if (Vars.dicVarGB.Count == 0)
                        foreach (var item in Vars.lsVarGlobals)
                            Vars.dicVarGB.Add(item.nomVarGb, item.valor);

                    Vars.minCarInput = int.Parse(Vars.dicVarGB["MinCarInput"]);

                    Vars.ucDefault = new UcFondo();

                    this.Visible = false;

                    FrmMain frm = new FrmMain(this);
                    //frm.WindowState = System.Windows.Forms.FormWindowState.Maximized;
                    frm.Show();
                    frm.BringToFront();
                }
                else
                {
                    Utils.msg("Sucedió un evento inesperando, no se pudo recuperar las credenciales.", Estado.ERROR);
                    btnOk.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                Utils.msg(ex.Message, Estado.ERROR);
                btnOk.Enabled = true;
            }
        }

    }//end class

}
