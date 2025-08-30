using com.yupanastudio.polariss.model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app.principal
{
    public class Vars
    {
        public static int grupoEmp;                 // identificador de grupo de empresas
        public static string urlHostLogos = "http://polariss.net.pe/logos/";
        public static string urlHostFotos = "http://polariss.net.pe/fotos/";
        public static string urlAssembly = "com.yupana.polariss.app.main";        
        public static string urlUcDefault = "com.yupana.polariss.app.main.principal.UcFondo";        
        public static int minCar = 5;               // mínimo de caracteres para rellenar y para buscar
               

        // ESTO SE ESTA UTILIZANDOOOOOOOOOOOOOOOO        OKKKKKKKKKKKKKKK

        // VARS LOADS
        public static List<Empresa> lsEmpresas;     //se inicializa en el proyecto de cada empresa



        // PRINCIPAL
        public static Empresa obEmpresa;
        public static Negocio obNegocio;
        public static Usuario obUsuario;
        public static Persona obPerUsuario;
        public static List<Negocio> lsNegocioUsu;
        public static List<Sistema> lsSistemaUsu;
        public static List<Tipo> lsTipos;
        public static Dictionary<string, string> lsGbVar = new Dictionary<string, string>();
        public static List<Pais> lsPais;
        public static List<Departamento> lsDptos;
        public static List<Provincia> lsProvs;





        //public static string defRegion = "11";
        //public static Persona obPerFind;

        // COMERCIAL    
        public static Persona obPerVarios;
        public static Persona obPerCliente;
        public static List<Local> lsLocalUsu;
        public static Local obLocalUsu;
        public static List<PuntoVenta> lsPtVta;
        public static PuntoVenta obPtVta;
        public static List<Serie> lsSerie;
        public static Serie obSerie;
        public static List<Caja> lsCaja;
        public static Caja obCaja;




        public static List<Afectacion> lsAfectacion;



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






    }// end class

}
