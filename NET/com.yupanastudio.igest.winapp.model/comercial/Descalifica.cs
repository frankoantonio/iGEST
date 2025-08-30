namespace com.yupanastudio.igest.winapp
{
    public class Descalifica
    {
        public long idDescalifica { get; set; }
        public long idInforme { get; set; }
        public long idAtencion { get; set; }
        public int idTipoDescalifica { get; set; }
        public long idInstEst { get; set; }
        public string porqueInstEst { get; set; }
        public string obs { get; set; }
        public bool llamarProx { get; set; }
        public int idTipoAtencion { get; set; }

    }//end class

}
