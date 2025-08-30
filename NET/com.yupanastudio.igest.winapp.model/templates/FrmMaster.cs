using Krypton.Toolkit;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmMaster : Form
    {
        private Point _Offset = Point.Empty;

        /// <summary>
        /// Si se establece a "true" el formulario es de "solo soloLectura" y no se puede guardar o seleccionar
        /// </summary>
        public bool xLectura = false;
        public CRUD xOperCRUD;
        public CrudDB crudDB;

        /// <summary>
        /// Si se establece a "true" indica que la operación se ejecutó correctamente
        /// </summary>
        public bool operOK = false;

        //solo en el login NO va tener en valor
        Perfil obPerfil = Vars.obPerfil;

        public FrmMaster()
        {
            InitializeComponent();
        }

        public FrmMaster(CRUD xOperCRUD, bool xLectura)
        {
            InitializeComponent();

            this.xOperCRUD = xOperCRUD;
            this.xLectura = xLectura;

            imgTitle.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            lblOper.Visible = true;

            if (xLectura)
            {
                btnOk.Enabled = false;
                lblOper.Image = null;
                lblOper.Width = 125;
                lblOper.Location = new Point(467, 10);
                lblOper.Text = "[SÓLO LECTURA]";
                lblOper.TextAlign = ContentAlignment.TopRight;
                return;
            }
            else if (xOperCRUD == CRUD.NEW)
            {
                lblOper.Width = 135;
                lblOper.Location = new Point(454, 10);
                lblOper.Text = "[Nuevo Registro]";
                lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_add;
            }
            else if (xOperCRUD == CRUD.EDIT)
            {
                lblOper.Width = 147;
                lblOper.Location = new Point(440, 10);
                lblOper.Text = "[Modifica Registro]";
                //lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            }
            else if (xOperCRUD == CRUD.SELECT)
            {
                lblOper.Width = 95;
                lblOper.Location = new Point(497, 10);
                lblOper.Text = "[SELECCIÓN]";
                lblOper.Image = null;
                lblOper.TextAlign = ContentAlignment.TopRight;
            }
            else if (xOperCRUD == CRUD.NONE)
            {
                lblOper.Visible = false;
            }
        }

        public FrmMaster(CRUD xOperCRUD)
        {
            InitializeComponent();

            this.xOperCRUD = xOperCRUD;

            imgTitle.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            lblOper.Visible = true;

            if (xLectura)
            {
                btnOk.Enabled = false;
                lblOper.Image = null;
                lblOper.Width = 125;
                lblOper.Location = new Point(467, 10);
                lblOper.Text = "[SÓLO LECTURA]";
                lblOper.TextAlign = ContentAlignment.TopRight;
                return;
            }
            else if (xOperCRUD == CRUD.NEW)
            {
                lblOper.Width = 135;
                lblOper.Location = new Point(454, 10);
                lblOper.Text = "[Nuevo Registro]";
                lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_add;
            }
            else if (xOperCRUD == CRUD.EDIT)
            {
                lblOper.Width = 147;
                lblOper.Location = new Point(440, 10);
                lblOper.Text = "[Modifica Registro]";
                lblOper.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            }
            else if (xOperCRUD == CRUD.SELECT)
            {
                lblOper.Width = 95;
                lblOper.Location = new Point(497, 10);
                lblOper.Text = "[SELECCIÓN]";
                lblOper.Image = null;
                lblOper.TextAlign = ContentAlignment.TopRight;
            }
            else if (xOperCRUD == CRUD.NONE)
            {
                lblOper.Visible = false;
            }
        }

        private void pnlMain_Paint(object sender, PaintEventArgs e)
        {
            ControlPaint.DrawBorder(e.Graphics, this.pnlMain.ClientRectangle, Color.DarkGray, ButtonBorderStyle.Solid);
        }

        private void pnlHeader_Paint(object sender, PaintEventArgs e)
        {
            //ControlPaint.DrawBorder(e.Graphics, this.pnlHeader.ClientRectangle, Color.FromArgb(71, 71, 107), ButtonBorderStyle.Solid);
            ControlPaint.DrawBorder(e.Graphics, this.pnlHeader.ClientRectangle, Color.SteelBlue, ButtonBorderStyle.Solid);
        }

        private void pnlFooter_Paint(object sender, PaintEventArgs e)
        {
            ControlPaint.DrawBorder(e.Graphics, this.pnlFooter.ClientRectangle, Color.SteelBlue, ButtonBorderStyle.Solid);
        }

        private void pnlHeader_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                _Offset = new Point(e.X, e.Y);
            }
        }

        private void pnlHeader_MouseMove(object sender, MouseEventArgs e)
        {
            if (_Offset != Point.Empty)
            {
                Point newlocation = this.Location;
                newlocation.X += e.X - _Offset.X;
                newlocation.Y += e.Y - _Offset.Y;
                this.Location = newlocation;
            }
        }

        private void pnlHeader_MouseUp(object sender, MouseEventArgs e)
        {
            _Offset = Point.Empty;
        }

        private void btnCancel_Click_1(object sender, EventArgs e)
        {
            this.Dispose();
        }

        /// <summary>
        /// Al llamar a este método se deshabilita los botones cuyo valor de la propiedad "tag" sea "btnOK"
        /// </summary>
        public void setLectura()
        {
            var ctrls = GetAll(this, typeof(KryptonButton));
            foreach (KryptonButton btn in ctrls)
                if (btn.Tag?.ToString() == "btnOK")
                    btn.Enabled = false;
        }

        private IEnumerable<Control> GetAll(Control control, Type type)
        {
            var controls = control.Controls.Cast<Control>();

            return controls.SelectMany(ctrl => GetAll(ctrl, type)).Concat(controls).Where(c => c.GetType() == type);
        }

        public void setPermisos()
        {
            var ctrls = GetAll(this, typeof(KryptonButton));
            foreach (KryptonButton btn in ctrls)
            {
                var tag = btn.Tag?.ToString();
                if (tag == "btnNUEVO" && obPerfil.nuevoX == false)
                    btn.Enabled = false;
                else if (tag == "btnMODIFICAR" && obPerfil.modificarX == false)
                    btn.Enabled = false;
                else if (tag == "btnELIMINAR" && obPerfil.eliminarX == false)
                    btn.Enabled = false;
                else if (tag == "btnIMPRIMIR" && obPerfil.imprimirX == false)
                    btn.Enabled = false;
                else if (tag == "btnGUARDAR" && obPerfil.nuevoX == false && obPerfil.modificarX == false)
                    btn.Enabled = false;
                else if (tag == "btnGUARDAR" && (obPerfil.nuevoX || obPerfil.modificarX))
                    btn.Enabled = true;
                else if (tag == "")
                    btn.Enabled = true;
                //else 
                //    btn.Enabled = false;
            }       
        }

        private void FrmMaster_Load(object sender, EventArgs e)
        {
            // ACA EN EL ONLOAD SE DEBE VERIFICAR LOS PERMISOS
            // O SI NO DESPUES DE CARGADO EL FORMULARIO HIJO, TODOS LOS HIJOS TIENEN QUE LLAMAR ->
            // A UN METODO QUE DIGA PERMISOS()

        }

        public void setPermisosOK(Opcion obOpcionSis)
        {
            var ctrls = GetAll(this, typeof(KryptonButton));
            foreach (KryptonButton btn in ctrls)
            {
                var tag = btn.Tag?.ToString();
                if (tag == "btnCREATE" && obOpcionSis.lsPermisos[0] == CrudDB.CREAR)
                    btn.Enabled = true;
                else if (tag == "btnREAD" && obOpcionSis.lsPermisos[1] == CrudDB.VER)
                    btn.Enabled = true;
                else if (tag == "btnUPDATE" && obOpcionSis.lsPermisos[2] == CrudDB.EDITAR)
                    btn.Enabled = true;
                else if (tag == "btnDELETE" && obOpcionSis.lsPermisos[3] == CrudDB.ELIMINAR)
                    btn.Enabled = true;
                else if (tag == "btnPRINT" && obOpcionSis.lsPermisos[4] == CrudDB.IMPRIMIR)
                    btn.Enabled = true;
                else
                    btn.Enabled = false;
            }
        }

    }//end class

}
