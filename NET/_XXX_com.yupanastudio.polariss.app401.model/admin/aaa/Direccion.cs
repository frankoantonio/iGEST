using System.Linq;

namespace com.yupanastudio.polariss.app
{
    public class Direccion
    {
        public long idDireccion { get; set; }
        public int idTipoVia { get; set; }
        public string nomTipoVia { get; set; }
        public string nomVia { get; set; }
        public int idTipoZona { get; set; }
        public string nomTipoZona { get; set; }
        public string nomZona { get; set; }
        public string referencia { get; set; }
        public int idPais { get; set; }
        public string idDistrito { get; set; }
        public string latitud { get; set; }
        public string longitud { get; set; }
        public int idEmpresa { get; set; }
        public int countUsoX { get; set; }
        public string fullDirX
        {
            get
            {
                return
                    nomTipoVia + " " + nomVia + (idTipoZona == 132 ? "" : "; " + nomTipoZona + " " + nomZona) + "; " +
                    Vars.lsDists.Where(x => x.idDistrito == idDistrito).FirstOrDefault().fullNameX_DisProDep;
            }
        }

        public Direccion() { }

        /// <summary>
        /// Para crear un nuevo objeto y no se enlace por referencia
        /// </summary>
        public Direccion(Direccion obDir)
        {
            this.idDireccion = obDir.idDireccion;
            this.idTipoVia = obDir.idTipoVia;
            this.nomTipoVia = obDir.nomTipoVia;
            this.nomVia = obDir.nomVia;
            this.idTipoZona = obDir.idTipoZona;
            this.nomTipoZona = obDir.nomTipoZona;
            this.nomZona = obDir.nomZona;
            this.referencia = obDir.referencia;
            this.idPais = obDir.idPais;
            this.idDistrito = obDir.idDistrito;
            this.latitud = obDir.latitud;
            this.longitud = obDir.longitud;
            this.idEmpresa = obDir.idEmpresa;
            this.countUsoX = obDir.countUsoX;
        }

    }//end class

}
