using System;
using System.Net.Sockets;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
{
    public enum CRUD
    {
        NEW,
        EDIT,
        SELECT,
        NONE
    }

    public enum Estado
    {
        SUCCESS,
        WARNING,
        ERROR,
        YESNO,
        YESNOCANCEL
    }

    public enum PersonCat
    {
        TI_PERSONA,
        TRABAJADOR,
        USUARIO,
        CLIENTE,
        PROVEEDOR,
        ALUMNO_COLEGIO,
        ALUMNO_ACADEMIA,
        FAMILIAR_ALUMNO,
        FAMILIAR_TRABAJADOR
    }

    public class Respuesta
    {
        public Estado estado { get; set; }
        public String mensaje { get; set; }
        public Object obEntidad { get; set; }
    }

    public class Utils
    {
        public static void msg(String msg, Estado estado)
        {
            string titulo = "POLARISS";

            if (Vars.obPersonaUsu != null && estado != Estado.ERROR)
            {
                string[] noms = Vars.obPersonaUsu.nombres.Split(' ');
                msg = noms[0] + ".  " + msg;
            }

            switch (estado)
            {
                case Estado.SUCCESS:
                    MessageBox.Show(msg, titulo, MessageBoxButtons.OK, MessageBoxIcon.Information);
                    break;
                case Estado.WARNING:
                    MessageBox.Show(msg, titulo, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    break;
                case Estado.ERROR:
                    MessageBox.Show(msg, titulo, MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                default:
                    break;
            }
        }

        public static DialogResult msgQ(String msg, Estado estado)
        {
            string titulo = "POLARISS";

            if (Vars.obPersonaUsu != null && estado != Estado.ERROR)
            {
                string[] noms = Vars.obPersonaUsu.nombres.Split(' ');
                msg = noms[0] + ".  " + msg;
            }

            DialogResult dlg = DialogResult.Ignore;
            switch (estado)
            {
                case Estado.YESNO:
                    dlg = MessageBox.Show(msg, titulo, MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2);
                    break;
                case Estado.YESNOCANCEL:
                    dlg = MessageBox.Show(msg, titulo, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button3);
                    break;
                default:
                    break;
            }
            return dlg;
        }

        public static bool validarCnxRemota()
        {
            try
            {
                using (TcpClient cnx = new TcpClient(Vars.urlServer, Vars.urlServerPort))
                {
                    return cnx.Connected;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// Valida número de DNI o RUC
        /// </summary>
        /// <param name="idTipDoc">40, para DNI. 41, para RUC</param>
        /// <param name="numDoc">Número de documento</param>
        /// <returns>True si es el número es el correcto</returns>
        public static bool validarNumDoc(int idTipDoc, string numDoc)
        {
            if (!Regex.IsMatch(numDoc, @"^\d+$"))
                return false;
            else if (idTipDoc == 40 && numDoc.Trim().Length != 8)
                return false;
            else if (idTipDoc == 41 && !validarRuc(numDoc))
                return false;

            return true;
        }

        public static bool validarDNI(string numDoc)
        {
            if (!Regex.IsMatch(numDoc, @"^\d+$"))
                return false;
            else if (numDoc.Trim().Length != 8)
                return false;
            else if (numDoc == "00000000" || numDoc == "11111111" || numDoc == "22222222" || numDoc == "55555555" || numDoc == "66666666" ||
                numDoc == "88888888" || numDoc == "99999999" || numDoc == "12345678" || numDoc == "98765432" || numDoc == "13579999")
                return false;

            return true;
        }

        public static bool validarRuc(string strRuc)
        {
            if (strRuc.Length != 11)
                return false;

            //ulong result = 0;
            //if (!ulong.TryParse(strRuc, out result))
            //    return false;

            if (!Regex.IsMatch(strRuc, @"^\d+$"))
                return false;

            int n = int.Parse(strRuc.Substring(0, 2));
            if (n < 10 || n > 20)
                return false;

            int dig01 = Convert.ToInt32(strRuc.Substring(0, 1)) * 5;
            int dig02 = Convert.ToInt32(strRuc.Substring(1, 1)) * 4;
            int dig03 = Convert.ToInt32(strRuc.Substring(2, 1)) * 3;
            int dig04 = Convert.ToInt32(strRuc.Substring(3, 1)) * 2;
            int dig05 = Convert.ToInt32(strRuc.Substring(4, 1)) * 7;
            int dig06 = Convert.ToInt32(strRuc.Substring(5, 1)) * 6;
            int dig07 = Convert.ToInt32(strRuc.Substring(6, 1)) * 5;
            int dig08 = Convert.ToInt32(strRuc.Substring(7, 1)) * 4;
            int dig09 = Convert.ToInt32(strRuc.Substring(8, 1)) * 3;
            int dig10 = Convert.ToInt32(strRuc.Substring(9, 1)) * 2;
            int dig11 = Convert.ToInt32(strRuc.Substring(10, 1));

            int suma = dig01 + dig02 + dig03 + dig04 + dig05 + dig06 + dig07 + dig08 + dig09 + dig10;
            int residuo = suma % 11;
            int resta = 11 - residuo;

            int digChk = 0;
            if (resta == 10)
                digChk = 0;
            else if (resta == 11)
                digChk = 1;
            else
                digChk = resta;

            if (dig11 == digChk)
                return true;
            else
                return false;
        }

        public static bool validarCorreo(string mail)
        {
            string exRe = "^(([\\w-]+\\.)+[\\w-]+|([a-zA-Z]{1}|[\\w-]{2,}))@(([a-zA-Z]+[\\w-]+\\.){1,2}[a-zA-Z]{2,4})$";
            if (Regex.IsMatch(mail, exRe))
            {
                return true;
            }
            else
                return false;
        }

        public static bool validarNoms(string nombres, bool apes)
        {
            string nom = nombres.Trim().ToLower();
            int lgt = nom.Length;

            if (lgt == 0)
            {
                return false;
            }

            if (apes && lgt == 1 && nom.Equals("-"))
            {
                return true;
            }

            if (lgt > 0 && lgt < int.Parse(Vars.dicVarGB["MinCarNoms"]))
            {
                return false;
            }

            if (apes && lgt > 0 && lgt < int.Parse(Vars.dicVarGB["MinCarApes"]))
            {
                return false;
            }

            if (nom.Contains("sdf") || nom.Contains("wer") || nom.Contains("xcv"))
            {
                return false;
            }

            string a = nom.Substring(0, 1);
            string b = nom.Substring(1, 1);
            string c = nom.Substring(2, 1);

            if (a == b && b == c)
            {
                return false;
            }

            return true;
        }

        /// <summary>
        /// Valida ataque por inyección de código. Cuando dentro de la búsqueda se pasa el "/" da problemas al formar la URL
        /// </summary>
        /// <returns>Mensaje en blanco o cadena vacía si no hay error</returns>
        //public static string validarAttInjCode(string cadena)
        //{
        //    cadena = cadena.ToUpper();
        //    if (cadena.Contains("UPDATE") || cadena.Contains("INSERT") || cadena.Contains("SELECT") || cadena.Contains("EXECUTE") || cadena.Contains("DELETE") || cadena.Contains("DROP"))
        //        return "Se ha detectado código malicioso, no se ejecutará la búsqueda!!!";
        //    else if (cadena.Contains("/") || cadena.Contains("//") || cadena.Contains("\\") || cadena.Contains("\\\\") || cadena.Contains("/*") || cadena.Contains("*/") || cadena.Contains("--"))
        //    {
        //        cadena.Replace("\\", " ").Replace("/", " ");
        //        return "No se aceptan estos caracteres:\n--  /  //  \\  \\\\  /*  */";
        //    }
        //    return "";
        //    //.
        //}

        public static string allTrim_InjectCode(string cadena)
        {
            cadena = cadena.ToUpper().Replace("/*", " ").Replace("*/", " ").Replace("\\\\", " ").Replace("//", " ").Replace("EXECUTE", " ").Replace("DROP", " ").Replace("DELETE", " ").Replace("SELECT", " ").Replace("INSERT", " ").Replace("UPDATE", " ").Replace("--", " ").Replace("%", " ");
            return allTrim(cadena);
        }

        private static string allTrim(string cadena)
        {
            while (cadena.Contains("  "))
                cadena = cadena.Replace("  ", " ");

            return cadena.Trim();
        }

    }//end class

}
