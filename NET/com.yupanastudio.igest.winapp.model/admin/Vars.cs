using System;
using System.Collections.Generic;
using System.Drawing;
using System.Net.Http;
using System.Resources;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace com.yupanastudio.igest.winapp
{
    public class Vars
    {
        // PRECARGA
        public static ResourceManager rm;                   // para obtener los recursos de la aplicación  
        public static List<Empresa> lsEmpINI;               // se inicializa en "Program.cs" del proyecto de cada empresa
        public static Empresa obEmpINI;                     // valor de "cmbEmpresa" en "FrmLogin"
        public static int minCarInput = 6;                  // mínimo de caracteres exigidos, puede cambiar al cargar variables
        public static int urlServerPort = 443;              // se utiliza en el metodo validarCnxRemota()
        public static string urlServer = "localhost";
        public static string urlServerApp = $"https://{urlServer}";
        public static HttpClient httpClient;
        public static string tokenSession = "";

        // PRINCIPAL
        public static DateTime feServer;                    // fecha y hora del servidor
        public static Usuario obUsuario;                    // usuario actual
        public static Empresa obEmpresa;                    // empresa actual
        public static List<Empresa> lsEmpresaGroup;         // empresas del grupo empresarial
        public static List<Sistema> lsSistemas;             // todos los sistemas
        public static List<Pais> lsPaises;                  // lista de paises
        public static List<Departamento> lsDepartamentos;   // lista de departamentos
        public static List<Provincia> lsProvincias;         // lista de provincias
        public static List<Distrito> lsDistritos;           // lista de distritos
        public static List<Tipo> lsTipos;                   // lista de tipos
        public static List<VarGlobal> lsVarGlobals;         // lista de variable globales
        public static Dictionary<string, int> dicTipos = new Dictionary<string, int>();         // diccionario de tipos
        public static Dictionary<string, string> dicVarGB = new Dictionary<string, string>();   // diccionario de variables globales        


        public static Sistema obSysCurrent;                  // sistema actual?? 
        public static Perfil obPerfil;                  // perfil actual del usuario, siempre distinto a "PERFIL USUARIO" 





        public enum ClasePersona
        {
            ESTUDIANTE_COLE,
            ESTUDIANTE_ACAD,
            ESTUDIANTE_INST,
            ESTUDIANTE_UNIV,
            TRABAJADOR,
            FAM_ESTUDIANTE,
            FAM_TRABAJADOR
        }

        //public static DateTime ffhhServer;              // fecha del servidor SOLO USAR EN EL MAIN_FORM, SI Es FECHA DIFERENTE
        //public static UsuarioFecha obUsuFecha;

        //SOLO_LECTURA SOLO_LECTURA SOLO_LECTURA SOLO_LECTURA 
        //SOLO_LECTURA SOLO_LECTURA SOLO_LECTURA SOLO_LECTURA 
        public static bool soloLectura = false;
        //SOLO_LECTURA SOLO_LECTURA SOLO_LECTURA SOLO_LECTURA 
        //SOLO_LECTURA SOLO_LECTURA SOLO_LECTURA SOLO_LECTURA 

        public static Persona obClienteSel;                     //  OK. Persona seleccionada
        public static Persona obAlumnoSel;                      //  OK. Persona seleccionada
        public static Persona obTrabajadorSel;                  //  OK. Persona seleccionada
        public static Persona obCliSel;                         //  OK. Persona seleccionada


        //public static Negocio obNegocio;                // BORRAR
        public static Persona obPerSel;                 //  OK. Persona seleccionada
        ////////////public static Usuario obUsuario;            // SE VA COMBINAR CON EL SIGUIENTE OBJETO
        public static Persona obPersonaUsu;         // SE TIENE QUE UNIR CON EL OBJETO ANTERIOR
        //public static List<Sistema> lsSisOpcion;    // sistemas y opciones del usuario 

        public static UserControl ucDefault;
        public static List<Sede> lsSedeByEmp;                   //  OK  
        public static List<Sede> lsSedeByPer;       // OBTENER LAS SEDES QUE CORRESPONDEN AL USUARIO ########


        public static string usuDistSel;                //se va poner valor la primera vez que selecciones distrito donde trabaja, si solo es un distrito, se carga automaticamente

        public static Sede obSedeUsuSel = new Sede() { idSede = 6, dirSede = "", idDistrito = "110101" };        //?                 YA TIENE EL DISTRITO CON ESO SE PUEDE INDICAR EL DISTRITO POR DEFECTO
        public static List<Sede> usuLsSedes;            //?
        public static List<Distrito> usuLsDistritos;    //?





        // COMERCIAL
        public static List<Beneficio> lsBeneficios;
        //public static List<ProdProy> lsProdProyNeg;
        public static List<ProductoProyecto> lsProdProyByNeg;       //  OK  
        public static List<Campania> lsCampaniaNegAct;
        //public static List<Campania> lsCampaniasNegTop10;
        //public static List<Campania> lsCampaniasNegActivo;
        public static List<ProductoSunat> lsProdSunatSegmento;      //ok
        public static List<String> lsSubcategoria;                  //ok
        public static List<String> lsMarca;                         //ok
        public static List<String> lsModelo;                        //ok
        public static List<String> lsNomArticulo;                   //ok





        // ACADEMICO        
        public static List<NivelEdu> lsNivEduNeg;
        public static List<Grado> lsGradoNeg;
        public static List<AreaProf> lsAreaProfNeg;
        public static List<CarreraProf> lsCarrProfNeg;   // si no tiene los propios, que jale los que estan predefinidos por areAS

        //public static EstudianteCole obEstColSel;
        //public static EstudianteAcad obEstAcadSel;                                                 //




        // LABORAL
        //public static Trabajador obTrabSel;




        //public static UcFondo = new UcFondo();

        // ESTO SE ESTA UTILIZANDOOOOOOOOOOOOOOOO        OKKKKKKKKKKKKKKK


        /*
                
        //public static List<Negocio> lsNegocioUsu;
        //public static List<Sistema> lsSistemaUsu;

        */


        //public static string defRegion = "11";
        //public static Persona obPerFind;

        // COMERCIAL    
        /*
        public static Persona obPerVarios;
        public static Persona obPerCliente;
        public static List<Sede> lsLocalUsu;
        public static Sede obLocalUsu;
        public static List<PuntoVenta> lsPtVta;
        public static PuntoVenta obPtVta;
        public static List<Serie> lsSerie;
        public static Serie obSerie;
        public static List<Caja> lsCaja;
        public static Caja obCaja;


        public static List<Afectacion> lsAfectacion;
        */

        //public static double montoMinCliVar = 700.00;
        //public static bool vtaConLectora = true;


        //public static Persona obCliente;
        //public static float minBoletaVta;           //importe minimo sin datos de cliente
        //public static bool lectorCodeBar;      //recuperar de varibles globales establecido po empresa, negocio
        //public static int diasCredito;              //dias de credito a partir de la fecha de emision (vencimiento) por empresa

        //public static string hostName;
        //public static List<Empresa> lsEmpresa;
        //public static Host obHost;
        //public static List<Empresa> lsEmpresaIni;           // solo para carga inicial de empresas en login
        //public static Opcion opcionSys;


        public static async Task<Image> cargarImagenUsuAsync(string nomFoto)
        {
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    // Configurar para leer los encabezados y luego el contenido del stream
                    using (var response = await client.GetAsync(Vars.dicVarGB["UrlFotoTrab"] + nomFoto + ".jpg", HttpCompletionOption.ResponseHeadersRead))
                    {
                        if (response.IsSuccessStatusCode)
                            using (var stream = await response.Content.ReadAsStreamAsync())
                            {
                                return Bitmap.FromStream(stream);
                            }
                        else
                            return global::com.yupanastudio.igest.winapp.Properties.Resources.usuario;
                    }
                }
            }
            catch (Exception)
            {
                return global::com.yupanastudio.igest.winapp.Properties.Resources.usuario;
            }
        }

    }// end class

}
