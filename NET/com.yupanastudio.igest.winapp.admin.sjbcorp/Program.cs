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
                    idEmpresa =1004,
                    grupoEmp="SJBCORP",
                    nomEmpresa ="CORPORACIÓN EDUCATIVA SAN JUAN BOSCO S.A.C.",
                    nomComercial="COLEGIO PARTICULAR SAN JUAN BOSCO",
                    ruc ="20133746278",
                    imgLogoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.logo_1004,
                    imgBanner1X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner1_1004,
                    imgBanner2X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner2_1004,
                    imgFondoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.fondo_1004
                },
                new Empresa()
                {
                    idEmpresa =1005,
                    grupoEmp="SJBCORP",
                    nomEmpresa ="CORPORACIÓN EDUCATIVA SAN JUAN BOSCO S.A.C.",
                    nomComercial="ACADEMIA PREUNIVERSITARIA SAN FERNANDO",
                    ruc ="20133746278",
                    imgLogoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.logo_1005,
                    imgBanner1X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner1_1005,
                    imgBanner2X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner2_1005,
                    imgFondoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.fondo_1005
                },
                new Empresa()
                {
                    idEmpresa =1006,
                    grupoEmp="SJBCORP",
                    nomEmpresa ="CORPORACIÓN EDUCATIVA SAN JUAN BOSCO S.A.C.",
                    nomComercial="POLIDEPORTIVO SJB",
                    ruc ="20133746278",
                    imgLogoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.logo_1006,
                    imgBanner1X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner1_1006,
                    imgBanner2X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner2_1006,
                    imgFondoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.fondo_1006
                }
            };

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FrmLogin());
        }

    }//end class

}
