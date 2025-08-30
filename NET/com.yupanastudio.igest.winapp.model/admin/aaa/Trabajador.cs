using System;

namespace com.yupanastudio.igest.winapp
{
    public class Trabajador : Persona
    {
        public long idTrabajador { get; set; }
        public int idTipoSexo { get; set; }
        public int idTipoEstCivil { get; set; }
        public int idTipoVivienda { get; set; }
        public int idTipoVivMaterial { get; set; }
        public int idTipoVivCondicion { get; set; }
        public long idDireccion { get; set; }
        public int idTipoMovilidad { get; set; }
        public int idTipoSitEdu { get; set; }
        public long idInstEgreso { get; set; }
        public int idTipoTitulo { get; set; }
        public String profesion { get; set; }
        public String ocupacion { get; set; }
        public String correoPer { get; set; }
        public String correoLab { get; set; }
        public String celularPer { get; set; }
        public String celularLab { get; set; }
        public String telefono { get; set; }
        public String obs { get; set; }
        public bool activo { get; set; }


        /// <summary>
        /// //////////////////////
        /// </summary>        
        //public long idInstEst { get; set; }

        public int idTipoVincLab { get; set; }
        public int idTipoJornLab { get; set; }
        public int idTipoCatTrab { get; set; }
        public int idClaseTrab { get; set; }
        public string observacion { get; set; }

        /// <summary>
        /// ///////////////////////quitar todo lo que sigue
        /// </summary>
        /// 
        public Persona obPerX { get; set; }
        public Direccion obDirX { get; set; }
        public LugarNac obLugNacX { get; set; }

    }//end class

}
