using System.Collections.Generic;

namespace com.yupanastudio.igest.winapp
{
    public class Usuario
    {
        public long idUsuario { get; set; }
        public string nomUsu { get; set; }
        public string pwdUsu { get; set; }
        public bool activo { get; set; }
        public bool cambioPwd { get; set; }
        public Persona obPersona { get; set; }
        public List<UsuarioSedeSistema> lsUsuarioSedeSistema { get; set; }
        public List<Perfil> lsPerfil { get; set; }

    }//end class

}
