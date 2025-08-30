using System;
using System.Collections.Generic;
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
                    idEmpresa =1000,
                    grupoEmp="YUPANA",
                    nomEmpresa ="YUPANA STUDIO SAC",
                    nomComercial="iGEST.PE",
                    ruc ="20603133111",
                    imgLogoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.logo_1000,
                    imgBanner1X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner1_1000,
                    imgBanner2X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner2_1000,
                    imgFondoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.fondo_1000
                }
            };

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FrmLogin());
        }

    }//end class

}
