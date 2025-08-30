using Krypton.Toolkit;
using System;
using System.Threading.Tasks;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmCategoria : FrmMaster
    {
        private ProductoSunat obClaseSunat = null;  // para obtener clase que corresponde a una categoría
        public Categoria xObCategoria = null;       // objeto que se recibe/selecciona

        public FrmCategoria(Categoria xObCategoria, CRUD xOperCRUD, bool xLectura) : base(xOperCRUD, xLectura)
        {
            InitializeComponent();
            this.xObCategoria = xObCategoria;
        }

        private void FrmCategoria_Load(object sender, EventArgs e)
        {
            if (xOperCRUD == CRUD.EDIT)
            {
                txtCodigo.Text = xObCategoria.codInterno;
                nudOrden.Value = xObCategoria.orden;
                txtNombre.Text = xObCategoria.nomCategoria;
                obClaseSunat = Task.Run(() => ProductoSunatBridge.getProductoSunatByID(xObCategoria.idClaseSunat)).Result;
                txtClase.Text = obClaseSunat?.nombre;
            }
            else
                xObCategoria = new Categoria() { idCategoria = -1, idNegocio = Vars.obEmpresa.idTipoEmpresa, idEmpresa = Vars.obEmpresa.idEmpresa };
        }

        private void txtCodigo_Enter(object sender, EventArgs e)
        {
            if (sender.GetType() == typeof(KryptonTextBox))
                ((KryptonTextBox)sender).SelectAll();
        }

        private void btnClaseSunat_Click(object sender, EventArgs e)
        {
            FrmProductoSunat frm = new FrmProductoSunat(true, obClaseSunat, this.xLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                obClaseSunat = frm.xObProdSunat;
                txtClase.Text = obClaseSunat.nombre;
            }
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            if (!validarCtrls())
                return;

            xObCategoria.orden = (int)nudOrden.Value;
            xObCategoria.codInterno = txtCodigo.Text;
            xObCategoria.nomCategoria = txtNombre.Text;
            xObCategoria.idClaseSunat = obClaseSunat != null ? obClaseSunat.idProdSunat : -1;
            xObCategoria.nomClaseSunatX = obClaseSunat != null ? obClaseSunat.nombre : "";

            try
            {
                btnOk.Enabled = false;
                xObCategoria = Task.Run(() => CategoriaBridge.upsert(xObCategoria)).Result;
                operOK = true;
                Utils.msg("Los datos se guardaron correctamente.", Estado.SUCCESS);
                this.Dispose();
            }
            catch (Exception ex)
            {
                Utils.msg(ex.ToString(), Estado.ERROR);
                btnOk.Enabled = true;
            }
        }

        //
        // Métodos
        //
        private bool validarCtrls()
        {
            txtCodigo.Text = Utils.allTrim_InjectCode(txtCodigo.Text);
            if (txtCodigo.Text.Length < 3)
            {
                Utils.msg("Se requiere al menos tres caracteres.", Estado.WARNING);
                txtCodigo.Focus();
                return false;
            }

            if (nudOrden.Value < 1)
            {
                Utils.msg("Ingrese un número mayor a cero.", Estado.WARNING);
                nudOrden.Focus();
                return false;
            }

            txtNombre.Text = Utils.allTrim_InjectCode(txtNombre.Text);
            if (txtNombre.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Se requiere al menos " + Vars.dicVarGB["MinCarInput"] + " caracteres.", Estado.WARNING);
                txtNombre.Focus();
                return false;
            }

            return true;
        }

    }//end class

}
