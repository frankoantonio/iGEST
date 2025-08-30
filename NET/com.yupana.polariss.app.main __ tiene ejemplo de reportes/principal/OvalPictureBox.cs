using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Text;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupana.polariss.app.main.principal
{
    class OvalPictureBox : PictureBox
    {
        public OvalPictureBox()
        {
            this.BackColor = Color.DarkGray;
        }

        protected override void OnResize(EventArgs e)
        {
            base.OnResize(e);
            using (var gp = new GraphicsPath())
            {
                Rectangle r = new Rectangle(0, 0, this.Width - 1, this.Height - 1);
                gp.AddEllipse(r);
                this.Region = new Region(gp);
            }
        }

    }//end class

}
