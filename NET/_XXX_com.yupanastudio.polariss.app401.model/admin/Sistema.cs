using System.Collections.Generic;

namespace com.yupanastudio.polariss.app
{
    public class Sistema
    {
        public string idSistema { get; set; }
        public string nomSistema { get; set; }
        public string nomCorto { get; set; }
        public string descripcion { get; set; }
        public int orden { get; set; }
        public List<Opcion> lsOpcionX { get; set; }

    }//end class

}
