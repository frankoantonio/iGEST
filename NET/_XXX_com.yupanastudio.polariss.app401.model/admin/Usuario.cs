using System;

namespace com.yupanastudio.polariss.app
{
    public class Usuario : Persona
    {
        public long idUsuario { get; set; }
        public string nomUsu { get; set; }
        public string pwdUsu { get; set; }
        public DateTime feOperacion { get; set; }
        public bool activo { get; set; }
        public bool cambioPwd { get; set; }

    }//end class

}
