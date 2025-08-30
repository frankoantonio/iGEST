using Krypton.Toolkit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
{
    public partial class UcMaster : UserControl
    {
        public Opcion obOpcion;

        public UcMaster()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Al llamar a este método se deshabilita los botones cuyo valor de la propiedad "tag" sea "btnOK"
        /// </summary>
        public void setLectura(Opcion xObOpcion)
        {
            this.obOpcion = xObOpcion;

            if (obOpcion?.soloLectura ?? false)
            {
                lblSubtitle.Visible = true;
                lblSubtitle.Text = "[SÓLO LECTURA]";
                lblSubtitle.BringToFront();

                var ctrls = GetAll(this, typeof(KryptonButton));
                foreach (KryptonButton btn in ctrls)
                    if (btn.Tag?.ToString() == "btnOK")
                        btn.Enabled = false;
            }
        }

        public void setPermisos()
        {
            Perfil obPerfil = Vars.obPerfil;
            Empresa obEmp = Vars.obEmpresa;
            //this.obOpcion = xObOpcion;

            if (Vars.obEmpresa.soloLectura)
            {
                lblSubtitle.Visible = true;
                lblSubtitle.Text = "[SÓLO LECTURA]";
                lblSubtitle.BringToFront();

                var ctrls = GetAll(this, typeof(KryptonButton));
                foreach (KryptonButton btn in ctrls)
                    if (btn.Tag?.ToString() == "btnInsert" || btn.Tag?.ToString() == "btnSave")
                        btn.Enabled = false;

                return;   //no se hace nada mas
            }

            if (obPerfil.nuevoX==false)
            {
                lblSubtitle.Visible = true;
                lblSubtitle.Text = "[SÓLO LECTURA]";
                lblSubtitle.BringToFront();

                var ctrls = GetAll(this, typeof(KryptonButton));
                foreach (KryptonButton btn in ctrls)
                    if (btn.Tag?.ToString() == "btnInsert" || btn.Tag?.ToString() == "btnSave")
                        btn.Enabled = false;
            }else if (obPerfil.modificarX == false)
            {
                lblSubtitle.Visible = true;
                lblSubtitle.Text = "[SÓLO LECTURA]";
                lblSubtitle.BringToFront();

                var ctrls = GetAll(this, typeof(KryptonButton));
                foreach (KryptonButton btn in ctrls)
                    if (btn.Tag?.ToString() == "btnUpdate")
                        btn.Enabled = false;
            }else if (obPerfil.eliminarX == false)
            {
                lblSubtitle.Visible = true;
                lblSubtitle.Text = "[SÓLO LECTURA]";
                lblSubtitle.BringToFront();

                var ctrls = GetAll(this, typeof(KryptonButton));
                foreach (KryptonButton btn in ctrls)
                    if (btn.Tag?.ToString() == "btnDel")
                        btn.Enabled = false;
            }else if (obPerfil.imprimirX == false)
            {
                lblSubtitle.Visible = true;
                lblSubtitle.Text = "[SÓLO LECTURA]";
                lblSubtitle.BringToFront();

                var ctrls = GetAll(this, typeof(KryptonButton));
                foreach (KryptonButton btn in ctrls)
                    if (btn.Tag?.ToString() == "btnPrint")
                        btn.Enabled = false;
            }
        }

        private IEnumerable<Control> GetAll(Control control, Type type)
        {
            var controls = control.Controls.Cast<Control>();

            return controls.SelectMany(ctrl => GetAll(ctrl, type)).Concat(controls).Where(c => c.GetType() == type);
        }

        private void UcMaster_Load(object sender, EventArgs e)
        {
            if (obOpcion != null)
            {
                lblTitle.Text = obOpcion.nomOpcion.ToUpper();
                imgTitle.Image = (System.Drawing.Bitmap)Vars.rm.GetObject("btnSys" + obOpcion.idSistema);
            }
        }

    }//end class 

}
