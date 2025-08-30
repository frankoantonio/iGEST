using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
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
                    grupoEmp="YUPANA",
                    nomEmpresa = "YUPANA STUDIO E.I.R.L.",
                    nomComercial = "POLARISS",
                    ruc = "20603133111",
                    imgLogoX = global::com.yupanastudio.igest.winapp.Properties.Resources.login_1001,
                    imgBannerX = global::com.yupanastudio.igest.winapp.Properties.Resources.banner_10001,
                    imgFondoX = global::com.yupanastudio.igest.winapp.Properties.Resources.fondo_10001
                }
            };

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FrmLogin());
        }

    }//end class

}
