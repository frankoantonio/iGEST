using System;
using System.Drawing;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app.template
{
    public partial class FrmMaster : Form
    {
        private Point _Offset = Point.Empty;

        public FrmMaster()
        {
            InitializeComponent();
        }

        private void pnlMain_Paint(object sender, PaintEventArgs e)
        {
            ControlPaint.DrawBorder(e.Graphics, this.pnlMain.ClientRectangle, Color.LightGray, ButtonBorderStyle.Solid);
        }

        private void pnlHeader_Paint(object sender, PaintEventArgs e)
        {
            ControlPaint.DrawBorder(e.Graphics, this.pnlHeader.ClientRectangle, Color.Gray, ButtonBorderStyle.Solid);
        }

        private void pnlFooter_Paint(object sender, PaintEventArgs e)
        {
            ControlPaint.DrawBorder(e.Graphics, this.pnlFooter.ClientRectangle, Color.Gray, ButtonBorderStyle.Solid);
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

        private void BtnCancel_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

    }//end class

}
