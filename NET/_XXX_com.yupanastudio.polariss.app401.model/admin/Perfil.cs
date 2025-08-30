using System.Collections.Generic;

namespace com.yupanastudio.polariss.app
{
    public class Perfil
    {
        public int idPerfil { get; set; }
        public string idSistema { get; set; }
        public string nomPerfil { get; set; }
        public bool activo { get; set; }
        public int idTipoEmpresa { get; set; }
        public string descripcion { get; set; }
        public int idEmpresa { get; set; }
        public int idUsuPerfilX { get; set; }
        public long idUsuarioX { get; set; }
        public bool activoX { get; set; }
        //public bool selX { get; set; }
        public bool nuevoX { get; set; }
        public bool modificarX { get; set; }
        public bool eliminarX { get; set; }
        public bool imprimirX { get; set; }
        public List<Opcion> lsOpcionX { get; set; }

    }//end class

}
