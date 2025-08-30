using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using com.yupana.polariss.app.main.principal;
using com.yupanastudio.polariss.model;

namespace com.yupanastudio.polariss.app.principal
{
    static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            if (args.Count() > 0)
                Vars.grupoEmp = Int32.Parse(args[0]);
            else
            {
                Utils.msg("No se indicó parámetros de inicialización.Configúrelo e intente nuevamente.", Estado.ERROR);
                return;
            }

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FrmLogin());
        }

    }//end class

}
