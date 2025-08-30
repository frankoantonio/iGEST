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
                    idEmpresa =1002,
                    grupoEmp="SALOAYZA",
                    nomEmpresa ="YHA GIBU TAMMY GERALDINI",
                    nomComercial="BAZAR LIBRERÍA GERALDINE",
                    ruc ="10078230849",
                    imgLogoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.login_1002,
                    imgBanner1X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner_10002,
                    imgFondoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.fondo_10002
                },
                new Empresa()
                {
                    idEmpresa =1003,
                    grupoEmp="SALOAYZA",
                    nomEmpresa ="SALAZAR LOAYZA MIGUEL ANGEL",
                    nomComercial="MI MUNDO DE LOS LIBROS",
                    ruc ="10078268129",
                    imgLogoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.login_1003,
                    imgBanner1X =   global::com.yupanastudio.igest.winapp.Properties.Resources.banner_10003,
                    imgFondoX =   global::com.yupanastudio.igest.winapp.Properties.Resources.fondo_10003
                }
            };

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FrmLogin());
        }

    }//end class

}
