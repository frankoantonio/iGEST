
using System;

namespace com.yupanastudio.polariss.app
{
    public class CronogramaPlantilla
    {
        public bool selX { get; set; }
        public long idCronPlant { get; set; }
        public long idCampania { get; set; }
        public int orden { get; set; }
        public string nombre { get; set; }
        public int numMes { get; set; }
        public string periodo { get; set; }
        public DateTime fePago { get; set; }
        public DateTime fePagoOrig { get; set; }

    }//end class

}
