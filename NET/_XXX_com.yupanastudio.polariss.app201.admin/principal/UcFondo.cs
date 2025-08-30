using System;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
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
                imgFondo.Image = Vars.obEmpINI.imgFondoX;
            }
            catch (Exception)
            {
                imgFondo.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.fondo_10001;
            }
        }

    }//end class

}
