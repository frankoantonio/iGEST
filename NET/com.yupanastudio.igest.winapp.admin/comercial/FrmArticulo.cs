using com.yupanastudio.igest.winapp;
using Krypton.Toolkit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmArticulo : FrmMaster
    {
        private ProductoSunat obProdSunat_Cat;      // asociado a la categoría
        private ProductoSunat obProdSunat_Art;      // asociado al artículo
        public Articulo xObArticulo;

        public FrmArticulo(List<Categoria> xLsCategoria, Articulo xObArticulo, CRUD xOperCRUD, bool xLectura) : base(xOperCRUD, xLectura)
        {
            InitializeComponent();

            this.xObArticulo = xObArticulo;

            if (Vars.lsSubcategoria == null) Vars.lsSubcategoria = Task.Run(() => ArticuloBridge.getSubcategoria(Vars.obEmpresa.idEmpresa)).Result;
            if (Vars.lsNomArticulo == null) Vars.lsNomArticulo = Task.Run(() => ArticuloBridge.getNomArticulo(Vars.obEmpresa.idEmpresa)).Result;
            if (Vars.lsMarca == null) Vars.lsMarca = Task.Run(() => ArticuloBridge.getMarca(Vars.obEmpresa.idEmpresa)).Result;
            if (Vars.lsModelo == null) Vars.lsModelo = Task.Run(() => ArticuloBridge.getModelo(Vars.obEmpresa.idEmpresa)).Result;

            autocompletarTxt();

            cmbCategoria.DataSource = xLsCategoria;
            cmbAfecta.DataSource = (Task.Run(() => AfectacionBridge.getAfectacion()).Result).Where(x => x.activo).OrderBy(y => y.orden).ToList();
            cmbUnMed.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_UND_MED" && x.activo).OrderBy(y => y.orden).ThenBy(Z => Z.nomTipo).ToList();
            cmbMoneda.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_MONEDAS" && x.activo).OrderBy(y => y.orden).ToList();
        }

        private void FrmArticulo_Load(object sender, EventArgs e)
        {
            if (xOperCRUD == CRUD.EDIT && xObArticulo != null)
            {
                cmbCategoria.SelectedValue = xObArticulo.idCategoria;
                txtSubcategoria.Text = xObArticulo.subCategoria;
                cmbTipoBS.SelectedIndex = xObArticulo.tipo == "B" ? 0 : 1;
                txtCodInterno.Text = xObArticulo.codInterno;
                obProdSunat_Art = Task.Run(() => ProductoSunatBridge.getProductoSunatByID(xObArticulo.idProdSunat)).Result;
                txtProdSunat.Text = obProdSunat_Art?.nombre;
                txtNombre.Text = xObArticulo.nomArticulo;
                txtMarca.Text = xObArticulo.marca;
                txtModelo.Text = xObArticulo.modelo;
                txtDescrip.Text = xObArticulo.descripcion;
                cmbAfecta.SelectedValue = xObArticulo.idAfectacion;
                cmbUnMed.SelectedValue = xObArticulo.undMed;
                nudFraccion.Value = xObArticulo.fraccion;
                chbVenta.Checked = xObArticulo.venta;
                chbCompra.Checked = xObArticulo.compra;
                cmbMoneda.SelectedValue = xObArticulo.undMoneda;
                txtPrecioConIGV.Text = xObArticulo.precioConIgv.ToString("0.0000");
                txtPrecioConIgvFr.Text = xObArticulo.precioConIgvFr.ToString("0.0000");
                txtStock.Text = xObArticulo.stock.ToString();
                txtStockFr.Text = xObArticulo.stockFr.ToString();
                chbEditPrecio.Checked = xObArticulo.editPrecio;
                chbActivo.Checked = xObArticulo.activo;
                chbPatrimonio.Checked = xObArticulo.patrimonio;
                if (xObArticulo.validado)
                {
                    lblDataOK.Visible = true;
                    txtNombre.Enabled = false;
                    txtMarca.Enabled = false;
                    txtModelo.Enabled = false;
                }
            }
            else if (xOperCRUD == CRUD.NEW)
            {
                cmbCategoria.SelectedItem = null;
                cmbTipoBS.SelectedItem = null;
                cmbAfecta.SelectedItem = null;
                cmbUnMed.SelectedItem = null;
                cmbMoneda.SelectedItem = null;

                xObArticulo = new Articulo()
                {
                    idArticulo = -1,
                    codInterno = "-1",
                    idEmpresa = Vars.obEmpresa.idEmpresa,
                    idNegocio = Vars.obEmpresa.idEmpresa,
                    validado = false,
                    stock = 0,
                    stockFr = 0
                };
            }
        }

        private void txtSubcategoria_Enter(object sender, EventArgs e)
        {
            if (sender.GetType() == typeof(KryptonTextBox))
                ((KryptonTextBox)sender).SelectAll();
        }

        private void cmbCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbCategoria.SelectedItem != null)
            {
                Categoria ob = ((Categoria)cmbCategoria.SelectedItem);
                obProdSunat_Cat = Task.Run(() => ProductoSunatBridge.getProductoSunatByID(ob.idClaseSunat)).Result;
                lblCodSunat.Text = "CLASE SUNAT: " + obProdSunat_Cat.nombre;
            }
            else
            {
                obProdSunat_Cat = null;
                lblCodSunat.Text = "";
            }
        }

        private void cmbTipoBS_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTipoBS.SelectedItem != null && cmbTipoBS.SelectedIndex == 0) // 0 = Bien
            {
                cmbUnMed.SelectedItem = null;
                cmbUnMed.Enabled = true;
                chbPatrimonio.Enabled = true;
            }
            else
            {
                cmbUnMed.SelectedValue = "ZZ";      // ZZ = UNIDAD (SERVICIOS)
                cmbUnMed.Enabled = false;
                chbPatrimonio.Enabled = false;
                chbPatrimonio.Checked = false;
            }
        }

        private void btnProdSunat_Click(object sender, EventArgs e)
        {
            FrmProductoSunat frm = new FrmProductoSunat(false, obProdSunat_Art == null ? obProdSunat_Cat : obProdSunat_Art, this.xLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                // evaluar sí pertenece a la misma categoría
                if (obProdSunat_Cat != null &&
                    frm.xObProdSunat.codigoPadre != obProdSunat_Cat.codigo &&
                    DialogResult.Yes != Utils.msgQ("El producto seleccionado no pertenece a la \"Categoría/Clase\" asociada.\nDeseas continuar?", Estado.YESNO))
                    return;
                obProdSunat_Art = frm.xObProdSunat;
                txtProdSunat.Text = obProdSunat_Art.nombre;
            }
        }

        private void nudFraccion_ValueChanged(object sender, EventArgs e)
        {
            int valor = (int)nudFraccion.Value;

            if (chbVenta.Checked && valor > 1)
                txtPrecioConIgvFr.Enabled = true;
            else
            {
                txtPrecioConIgvFr.Enabled = false;
                txtPrecioConIgvFr.Text = "0.00";
            }
        }

        private void chbVenta_CheckedChanged(object sender, EventArgs e)
        {
            if (chbVenta.Checked)
            {
                txtPrecioConIGV.Enabled = true;
                if (nudFraccion.Value > 1)
                    txtPrecioConIgvFr.Enabled = true;
                chbEditPrecio.Enabled = true;
            }
            else
            {
                txtPrecioConIGV.Enabled = false;
                txtPrecioConIgvFr.Enabled = false;
                txtPrecioConIGV.Text = "0.00";
                txtPrecioConIgvFr.Text = "0.00";
                chbEditPrecio.Enabled = false;
                chbEditPrecio.Checked = false;
            }
        }

        private void chbCompra_CheckedChanged(object sender, EventArgs e)
        {
            if (chbCompra.Checked && !chbVenta.Checked)
            {
                chbEditPrecio.Enabled = false;
                chbEditPrecio.Checked = false;
            }
        }

        private void txtPrecioConIGV_Leave(object sender, EventArgs e)
        {
            try
            {
                txtPrecioConIGV.Text = decimal.Parse(txtPrecioConIGV.Text).ToString("0.0000");
            }
            catch (Exception)
            {
                txtPrecioConIGV.Text = "0.00";
            }
        }

        private void txtPrecioConIgvFr_Leave(object sender, EventArgs e)
        {
            try
            {
                txtPrecioConIgvFr.Text = decimal.Parse(txtPrecioConIgvFr.Text).ToString("0.0000");
            }
            catch (Exception)
            {
                txtPrecioConIgvFr.Text = "0.00";
            }
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            guardar();
        }

        //
        // Métodos
        //
        private bool validarCtrls()
        {
            if (cmbCategoria.SelectedItem == null)
            {
                Utils.msg("Selecciona la categoría.", Estado.WARNING);
                cmbCategoria.Focus();
                return false;
            }

            txtSubcategoria.Text = Utils.allTrim_InjectCode(txtSubcategoria.Text);

            if (cmbTipoBS.SelectedItem == null)
            {
                Utils.msg("Indica sí es un bien o servicio.", Estado.WARNING);
                cmbTipoBS.Focus();
                return false;
            }

            txtNombre.Text = Utils.allTrim_InjectCode(txtNombre.Text);
            if (txtNombre.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Escribe correctamente el nombre del bien o servicio.", Estado.WARNING);
                txtNombre.Focus();
                return false;
            }

            txtMarca.Text = Utils.allTrim_InjectCode(txtMarca.Text);
            txtModelo.Text = Utils.allTrim_InjectCode(txtModelo.Text);

            txtDescrip.Text = Utils.allTrim_InjectCode(txtDescrip.Text);
            if (txtDescrip.Text.Length > 0 && txtDescrip.Text.Length < int.Parse(Vars.dicVarGB["MinCarInput"]))
            {
                Utils.msg("Escribe correctamente las características del bien o servicio.", Estado.WARNING);
                txtDescrip.Focus();
                return false;
            }
            if (cmbAfecta.SelectedItem == null)
            {
                Utils.msg("Selecciona el tipo de afectación.", Estado.WARNING);
                cmbAfecta.Focus();
                return false;
            }
            if (cmbUnMed.SelectedItem == null)
            {
                Utils.msg("Selecciona la unidad de medida.", Estado.WARNING);
                cmbUnMed.Focus();
                return false;
            }
            if (!chbVenta.Checked && !chbCompra.Checked)
            {
                Utils.msg("Indica sí el bien o servicio es para vender o comprar.", Estado.WARNING);
                chbVenta.Focus();
                return false;
            }
            if (cmbMoneda.SelectedItem == null)
            {
                Utils.msg("Selecciona el tipo de moneda.", Estado.WARNING);
                cmbMoneda.Focus();
                return false;
            }
            if (chbVenta.Checked && double.Parse(txtPrecioConIGV.Text) <= 0)
            {
                Utils.msg("Indica el precio de venta.", Estado.WARNING);
                txtPrecioConIGV.Focus();
                return false;
            }
            if (chbVenta.Checked && nudFraccion.Value > 1 && double.Parse(txtPrecioConIgvFr.Text) <= 0)
            {
                Utils.msg("Cual es el precio de venta de la fracción.", Estado.WARNING);
                txtPrecioConIgvFr.Focus();
                return false;
            }
            return true;
        }

        private void autocompletarTxt()
        {
            AutoCompleteStringCollection lstSubcatAux = new AutoCompleteStringCollection();
            AutoCompleteStringCollection lsNomArtAux = new AutoCompleteStringCollection();
            AutoCompleteStringCollection lsMarcaAux = new AutoCompleteStringCollection();
            AutoCompleteStringCollection lsModeloAux = new AutoCompleteStringCollection();

            for (int i = 0; i < Vars.lsSubcategoria.Count; i++)
                lstSubcatAux.Add(Vars.lsSubcategoria[i]);
            txtSubcategoria.AutoCompleteCustomSource = lstSubcatAux;

            for (int i = 0; i < Vars.lsNomArticulo.Count; i++)
                lsNomArtAux.Add(Vars.lsNomArticulo[i]);
            txtNombre.AutoCompleteCustomSource = lsNomArtAux;

            for (int i = 0; i < Vars.lsMarca.Count; i++)
                lsMarcaAux.Add(Vars.lsMarca[i]);
            txtMarca.AutoCompleteCustomSource = lsMarcaAux;

            for (int i = 0; i < Vars.lsModelo.Count; i++)
                lsModeloAux.Add(Vars.lsModelo[i]);
            txtModelo.AutoCompleteCustomSource = lsModeloAux;
        }

        private void guardar()
        {
            if (!validarCtrls())
                return;

            xObArticulo.idCategoria = (long)cmbCategoria.SelectedValue;
            xObArticulo.subCategoria = txtSubcategoria.Text;
            xObArticulo.tipo = cmbTipoBS.SelectedIndex == 0 ? "B" : "S";
            xObArticulo.idProdSunat = obProdSunat_Art != null ? obProdSunat_Art.idProdSunat : -1;
            xObArticulo.nomArticulo = txtNombre.Text;
            xObArticulo.marca = txtMarca.Text;
            xObArticulo.modelo = txtModelo.Text;
            xObArticulo.descripcion = txtDescrip.Text;
            xObArticulo.idAfectacion = (int)cmbAfecta.SelectedValue;
            xObArticulo.undMed = (string)cmbUnMed.SelectedValue;
            xObArticulo.fraccion = (int)nudFraccion.Value;
            xObArticulo.venta = chbVenta.Checked;
            xObArticulo.compra = chbCompra.Checked;
            xObArticulo.undMoneda = (string)cmbMoneda.SelectedValue; ;
            xObArticulo.precioConIgv = double.Parse(txtPrecioConIGV.Text);
            xObArticulo.precioConIgvFr = double.Parse(txtPrecioConIgvFr.Text);
            xObArticulo.editPrecio = chbEditPrecio.Checked;
            xObArticulo.activo = chbActivo.Checked;
            xObArticulo.patrimonio = chbPatrimonio.Checked;

            try
            {
                btnOk.Enabled = false;
                xObArticulo = Task.Run(() => ArticuloBridge.upsert(xObArticulo)).Result;
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

    }//end class

}