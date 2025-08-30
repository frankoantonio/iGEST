using System;

namespace com.yupanastudio.polariss.app
{
    public class UsuarioFecha
    {
        public long idUsuario { get; set; }
        public int idNegocio { get; set; }
        public string idSistema { get; set; }
        public DateTime feSolicita { get; set; }
        public DateTime feCambio { get; set; }
        public String motivo { get; set; }
        public int desde { get; set; }
        public int hasta { get; set; }
        public long idAutoriza { get; set; }

    }//end class

}
