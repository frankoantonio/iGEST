using Krypton.Toolkit;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmMasterOK : Form
    {
        private Point offSet = Point.Empty;
        private CrudDB xOperCrudDB;
        private Opcion xObOpcionSis;

        /// <summary>
        /// Si se establece a "true" indica que la operación se ejecutó correctamente
        /// </summary>
        public bool isOperOK = false;

        public FrmMasterOK()
        {
            InitializeComponent();
        }

        public FrmMasterOK(CrudDB xOperCrudDB, Opcion xObOpcionSis)
        {
            InitializeComponent();

            this.xOperCrudDB = xOperCrudDB;
            this.xObOpcionSis = xObOpcionSis;

            if (xOperCrudDB == CrudDB.NONE)
            {
                lblOper.Visible = false;
                lblSubTitle.Visible = false;
            }
            else if (xOperCrudDB == CrudDB.VER)
            {
                lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_remove;//icono ojito
                lblSubTitle.Text = "[Solo Lectura]";
            }
            else if (xOperCrudDB == CrudDB.SELECCIONAR)
            {
                lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_ok;
                lblSubTitle.Text = "[Seleccionar]";
            }
            else if (xOperCrudDB == CrudDB.CREAR)
            {
                lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_add;
                lblSubTitle.Text = "[Nuevo Registro]";
            }
            else if (xOperCrudDB == CrudDB.EDITAR)
            {
                lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
                lblSubTitle.Text = "[Modificar Registro]";
            }
            else if (xOperCrudDB == CrudDB.ELIMINAR)
            {
                lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_delete;
                lblSubTitle.Text = "[Eliminar Registro]";
            }
            else if (xOperCrudDB == CrudDB.IMPRIMIR)
            {
                lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_find;
                lblSubTitle.Text = "[Imprimir]";
            }
            else if (xOperCrudDB == CrudDB.ROOT)
            {
                lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_warning;
                lblSubTitle.Text = "[Configurar]";
            }
        }

        private void pnlMain_Paint(object sender, PaintEventArgs e)
        {
            ControlPaint.DrawBorder(e.Graphics, this.pnlMain.ClientRectangle, Color.DarkGray, ButtonBorderStyle.Solid);
        }

        private void pnlHeader_Paint(object sender, PaintEventArgs e)
        {
            ControlPaint.DrawBorder(e.Graphics, this.pnlHeader.ClientRectangle, Color.DarkSlateBlue, ButtonBorderStyle.Solid);
        }

        private void pnlFooter_Paint(object sender, PaintEventArgs e)
        {
            ControlPaint.DrawBorder(e.Graphics, this.pnlFooter.ClientRectangle, Color.SteelBlue, ButtonBorderStyle.Solid);
        }

        private void pnlHeader_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
                offSet = new Point(e.X, e.Y);
        }

        private void pnlHeader_MouseMove(object sender, MouseEventArgs e)
        {
            if (offSet != Point.Empty)
            {
                Point newlocation = this.Location;
                newlocation.X += e.X - offSet.X;
                newlocation.Y += e.Y - offSet.Y;
                this.Location = newlocation;
            }
        }

        private void pnlHeader_MouseUp(object sender, MouseEventArgs e)
        {
            offSet = Point.Empty;
        }

        private void FrmMaster_Load(object sender, EventArgs e)
        {
            setPermisos();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private IEnumerable<Control> GetAll(Control control, Type type)
        {
            var controls = control.Controls.Cast<Control>();
            return controls.SelectMany(ctrl => GetAll(ctrl, type)).Concat(controls).Where(c => c.GetType() == type);
        }

        /// <summary>
        /// Deshabilita botones que están con el tag "btnVerify" si no tienen permisos
        /// </summary>
        public void setPermisos()
        {
            if (xOperCrudDB == CrudDB.NONE || xOperCrudDB == CrudDB.SELECCIONAR || xObOpcionSis == null)
                return;

            if (!xObOpcionSis.ver)
            {
                Utils.msg("No tiene permisos para visualizar este componente.", Estado.WARNING);
                this.Dispose();
            }

            var ctrls = GetAll(this, typeof(KryptonButton));
            foreach (KryptonButton btn in ctrls)
            {
                var tag = btn.Tag?.ToString();
                if (tag == "btnOK")
                {
                    if (
                        (xOperCrudDB == CrudDB.CREAR && !xObOpcionSis.crear) ||
                        (xOperCrudDB == CrudDB.EDITAR && !xObOpcionSis.editar) ||
                        (xOperCrudDB == CrudDB.ELIMINAR && !xObOpcionSis.eliminar) ||
                        (xOperCrudDB == CrudDB.IMPRIMIR && !xObOpcionSis.imprimir))
                    {
                        btn.Enabled = false;
                        lblSubTitle.Text = (xOperCrudDB == CrudDB.CREAR || xOperCrudDB == CrudDB.EDITAR || xOperCrudDB == CrudDB.ELIMINAR) ? "[Solo Lectura]" : lblSubTitle.Text;
                        lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_warning;
                    }
                }
            }
        }

    }//end class

}
