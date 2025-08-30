using com.yupanastudio.polariss.app.bridge;
using com.yupanastudio.polariss.app.template;
using com.yupanastudio.polariss.model;
using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app.principal
{
    public partial class FrmLogin : FrmMaster
    {
        private bool estCnx = false;
        public bool valOk = false;

        public FrmLogin()
        {
            InitializeComponent();
            estCnx = Utils.validarCnxRemota();
            if (!estCnx)
                setError("No hay comunicación con el servidor. Inténtelo nuevamente.");
        }

        private void FrmLogin_Load(object sender, EventArgs e)
        {
            cmbEmpresa.DataSource = com.yupanastudio.polariss.app.principal.Vars.lsEmpresas;
        }

        private void CmbEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbEmpresa.SelectedItem != null)
            {
                List<Negocio> lsNeg = ((Empresa)cmbEmpresa.SelectedItem).lsNegociosX;
                cmbNegocio.DataSource = lsNeg;
            }
        }

        private void CmbNegocio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbNegocio.SelectedItem != null)
            {
                try
                {
                    Negocio ob = ((Negocio)cmbNegocio.SelectedItem);
                    this.imgLogo.Image = ob.imgLogoX;
                }
                catch (Exception)
                {
                    imgLogo.Image = global::com.yupanastudio.polariss.app.Properties.Resources.logo;
                }
            }
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
            imgCnx.Image = global::com.yupanastudio.polariss.app.Properties.Resources.connect_fail;
            //cmbEmpresa.Enabled = false;
            //cmbNegocio.Enabled = false;
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
            else if (cmbNegocio.SelectedItem == null)
            {
                Utils.msg("Seleccione unidad de negocio.", Estado.WARNING);
                cmbNegocio.Focus();
                return false;
            }
            else if (txtNomUsu.Text.Trim().Length < Vars.minCar)
            {
                Utils.msg("Se requiere al menos " + Vars.minCar + " caracteres.", Estado.WARNING);
                txtNomUsu.Focus();
                return false;
            }
            else if (txtPwdUsu.Text.Trim().Length < Vars.minCar)
            {
                Utils.msg("Se requiere al menos " + Vars.minCar + " caracteres.", Estado.WARNING);
                txtPwdUsu.Focus();
                return false;
            }
            return true;
        }

        private bool validarEstados()
        {
            if (((Empresa)cmbEmpresa.SelectedItem).activo == false)
            {
                Utils.msg("La empresa no esta activo en el sistema.", Estado.WARNING);
                cmbEmpresa.Focus();
                return false;
            }
            else if (((Negocio)cmbNegocio.SelectedItem).activo == false)
            {
                Utils.msg("El negocio no esta activo en el sistema.", Estado.WARNING);
                cmbNegocio.Focus();
                return false;
            }
            return true;
        }

        private void validarUsuario()
        {
            //if (!validarCtrls())
            //    return;
            //if (!validarEstados())
            //    return;

            Cursor.Current = Cursors.WaitCursor;
            Empresa obEmp = (Empresa)cmbEmpresa.SelectedItem;
            Negocio obNeg = (Negocio)cmbNegocio.SelectedItem;


            try
            {
                XwLogin obXwLogin = new XwLoginBridge().validarUsuario(obEmp.idEmpresa, obNeg.idNegocio, obEmp.ruc + txtNomUsu.Text, txtPwdUsu.Text);
                Cursor.Current = Cursors.Default;

                //if (obXwLogin.estado == Estado.SUCCESS)
                if (true)
                {
                    //Vars.obEmpresa = obEmp;
                    //Vars.obNegocio = obNeg;
                    //Vars.obUsuario = obXwLogin.obUsuario;
                    //Vars.obPerUsuario = obXwLogin.obPerUsuario;
                    //Vars.obPerVarios = obXwLogin.obPerVarios;
                    //Vars.lsNegocioUsu = obXwLogin.lsNegocioUsu;
                    //Vars.lsSistemaUsu = obXwLogin.lsSistemaUsu;
                    //Vars.lsTipos = obXwLogin.lsTipos;
                    //foreach (var item in obXwLogin.lsGbVar)
                    //    Vars.lsGbVar.Add(item.nomGbVar, item.valor);
                    //Vars.lsPais = obXwLogin.lsPaises;
                    //Vars.lsDptos = obXwLogin.lsDptos;
                    //Vars.lsProvs = obXwLogin.lsProvs;

                    //this.Hide();
                    //FrmMain frm = new FrmMain(this);
                    //frm.Show();
                    //frm.BringToFront();
                    valOk = true;       // para evaluar en formulario principal
                    this.Dispose();
                }
                //else
                //{
                //    Utils.msg(obXwLogin.mensaje, Estado.ERROR);
                //}
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }//end class

}
