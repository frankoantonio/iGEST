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
                    idEmpresa =1007,
                    grupoEmp="SABAL",
                    nomEmpresa ="SABAL GROUP SA",
                    nomComercial="CASA DEL NIÑO Y LA MADRE",
                    ruc ="20133746278",
                    imgLogoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.logo_1007,
                    imgBanner1X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner1_1007,
                    imgBanner2X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner2_1007,
                    imgFondoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.fondo_1007
                }
            };

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FrmLogin());
        }

    }//end class

}
