namespace com.yupanastudio.polariss.app
{
    public class Articulo
    {
        public bool selX { get; set; }
        public long idArticulo { get; set; }
        public long idCategoria { get; set; }
        public int idAfectacion { get; set; }
        public bool venta { get; set; }
        public bool compra { get; set; }
        public string codInterno { get; set; }
        public long idProdSunat { get; set; }
        public string subCategoria { get; set; }
        public string nomArticulo { get; set; }
        public string marca { get; set; }
        public string modelo { get; set; }
        public string descripcion { get; set; }
        public bool activo { get; set; }
        public string undMed { get; set; }
        public bool validado { get; set; }
        public int fraccion { get; set; }
        public string tipo { get; set; }
        public double precioConIgv { get; set; }
        public double precioConIgvFr { get; set; }
        public int idNegocio { get; set; }
        public int idEmpresa { get; set; }
        public bool editPrecio { get; set; }
        public bool patrimonio { get; set; }
        public int stock { get; set; }
        public int stockFr { get; set; }
        public string undMoneda { get; set; }
        public string fullNameX { get { return (nomArticulo + (marca != "" ? " * " + marca : "") + (modelo != "" ? " * " + modelo : "") + (descripcion != "" ? " * " + descripcion : "")); } }

        public override bool Equals(object obj)
        {
            return obj is Articulo articulo &&
                   idArticulo == articulo.idArticulo;
        }

        public override int GetHashCode()
        {
            return 913964393 + idArticulo.GetHashCode();
        }

    }//end class

}
