using System.Collections.Generic;

namespace com.yupanastudio.igest.winapp
{
    public class Opcion
    {
        public int idOpcion { get; set; }
        public int idPadre { get; set; }
        public string idSistema { get; set; }
        public int idPerfil { get; set; }
        public string nomOpcion { get; set; }
        public string nomControl { get; set; }
        public int orden { get; set; }
        public int idTipoOpcion { get; set; }
        public int idTipoEmpresa { get; set; }
        public bool activo { get; set; }
        public bool premium { get; set; }
        public int idEmpresa { get; set; }

        public bool soloLectura { get; set; }       //BORRAR LUEGO de quitar todas las referncias

        public string permisos { get; set; }

        public List<CrudDB> lsPermisos { get; set; }

        public bool ver { get; set; }
        public bool crear { get; set; }
        public bool editar { get; set; }
        public bool eliminar { get; set; }
        public bool imprimir { get; set; }


    }//end class

}
