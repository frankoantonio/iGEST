using com.yupanastudio.polariss.app.Properties;
using System;
using System.Drawing;
using System.Resources;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app.principal
{
    public partial class UcFondo : UserControl
    {
        public UcFondo()
        {
            InitializeComponent();
            setFondo();
        }

        private void setFondo()
        {
            try
            {
                var rm = new ResourceManager(Vars.urlAssembly + ".Properties.Resources", typeof(Resources).Assembly);
                Image img = (System.Drawing.Bitmap)rm.GetObject("banner_neg_" + Vars.obNegocio.idNegocio);
                if (img != null)
                    imgFondo.Image = (System.Drawing.Bitmap)rm.GetObject("banner_neg_" + Vars.obNegocio.idNegocio);
                else
                    imgFondo.Image = global::com.yupanastudio.polariss.app.Properties.Resources.banner_neg_10001;
            }
            catch (Exception)
            {
                imgFondo.Image = global::com.yupanastudio.polariss.app.Properties.Resources.banner_neg_10001;
            }
        }

    }//end class

}
