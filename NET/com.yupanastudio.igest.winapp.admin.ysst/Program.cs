using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Vars.lsEmpINI = new List<Empresa>()
            {
                new Empresa()
                {
                    idEmpresa =1001,
                    nomEmpresa ="YUPANA STUDIO E.I.R.L.",
                    nomComercial="POLARISS",
                    ruc ="20603133111",
                    imgLogoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.login_1001,
                    imgBanner1X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner1_1001,
                    imgBanner2X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner2_1001,
                    imgFondoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.fondo_1001
                }
            };

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FrmLogin());
        }

    }//end class

}
