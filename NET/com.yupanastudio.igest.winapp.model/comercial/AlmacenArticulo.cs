using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class AlmacenArticulo
    {
        public bool selX { get; set; }
        public long idAlmArt { get; set; }
        public int idAlmacen { get; set; }
        public long idArticulo { get; set; }
        public int stock { get; set; }
        public int stockFracc { get; set; }
        public string nomAlmacenX { get; set; }
        public bool actAlmacenX { get; set; }
        public int cantSel { get; set; }
        public int cantSelFracc { get; set; }

    }//end class

}
