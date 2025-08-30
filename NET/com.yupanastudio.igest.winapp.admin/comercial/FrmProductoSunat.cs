using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmProductoSunat : FrmMaster
    {
        private bool xSeleccionarClase;             // true; para seleccionar una "clase" asociado a la categoría del B/S --- false; puede seleccionar "clase" o "producto"
        private List<ProductoSunat> lsProdSunat;    // lista de productos Sunat, los del nivel 4 
        public ProductoSunat xObProdSunat;          // objeto que llega, objeto que se selecciona

        public FrmProductoSunat(bool xSeleccionarClase, ProductoSunat xObProdSunat, bool xLectura) : base(CRUD.SELECT, xLectura)
        {
            InitializeComponent();

            this.xSeleccionarClase = xSeleccionarClase;
            this.xObProdSunat = xObProdSunat;

            dgvProdSunat.AutoGenerateColumns = false;

            if (xSeleccionarClase)
            {
                this.cmbClase.SelectedIndexChanged -= new System.EventHandler(this.cmbClase_SelectedIndexChanged);
                this.toolTip.SetToolTip(this.btnOk, "Seleccionar \"Clase\".");
                lblTitle.Text = "SELECCIÓN CLASE SUNAT";
                lblMsgFind.Text = "Escribe nombre de la \"Clase\"";
            }
        }

        private void FrmProductoSunat_Load(object sender, EventArgs e)
        {
            this.cmbSegmento.SelectedIndexChanged -= new System.EventHandler(this.cmbSegmento_SelectedIndexChanged);

            if (Vars.lsProdSunatSegmento == null)
                Vars.lsProdSunatSegmento = Task.Run(() => ProductoSunatBridge.getProductoSunatByNivel(1, "-")).Result.OrderBy(x => x.nombre).ToList();
            List<ProductoSunat> lsSegmento = Vars.lsProdSunatSegmento;
            cmbSegmento.DataSource = lsSegmento;

            this.cmbSegmento.SelectedIndexChanged += new System.EventHandler(this.cmbSegmento_SelectedIndexChanged);
            cmbSegmento.SelectedIndex = -1;

            if (xObProdSunat != null)
            {
                ProductoSunat obPS = lsSegmento.Where(x => x.codigo == xObProdSunat.codigo.Substring(0, 2)).FirstOrDefault();
                cmbSegmento.SelectedValue = obPS.idProdSunat;
                if (xSeleccionarClase)
                    cmbClase.Select();
                else
                    dgvProdSunat.Select();
            }
        }

        private void cmbSegmento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbSegmento.SelectedItem != null)
            {
                txtContenido.Text = "";
                ProductoSunat ob = (ProductoSunat)cmbSegmento.SelectedItem;
                this.cmbFamilia.SelectedIndexChanged -= new System.EventHandler(this.cmbFamilia_SelectedIndexChanged);
                List<ProductoSunat> lsFamilia = Task.Run(() => ProductoSunatBridge.getProductoSunatByNivel(2, ob.codigo)).Result.OrderBy(x => x.nombre).ToList();
                cmbFamilia.DataSource = lsFamilia;
                this.cmbFamilia.SelectedIndexChanged += new System.EventHandler(this.cmbFamilia_SelectedIndexChanged);
                cmbFamilia.SelectedIndex = -1;

                if (xObProdSunat != null && lsFamilia.Exists(x => x.codigo == xObProdSunat.codigo.Substring(0, 4)))
                {
                    ProductoSunat obPS = lsFamilia.Where(x => x.codigo == xObProdSunat.codigo.Substring(0, 4)).FirstOrDefault();
                    cmbFamilia.SelectedValue = obPS.idProdSunat;
                }
            }
            else
            {
                cmbFamilia.DataSource = new List<ProductoSunat>();
                cmbClase.DataSource = new List<ProductoSunat>();
                dgvProdSunat.DataSource = lsProdSunat = new List<ProductoSunat>();
            }
        }

        private void cmbFamilia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbFamilia.SelectedItem != null)
            {
                ProductoSunat ob = (ProductoSunat)cmbFamilia.SelectedItem;
                if (!xSeleccionarClase) this.cmbClase.SelectedIndexChanged -= new System.EventHandler(this.cmbClase_SelectedIndexChanged);
                List<ProductoSunat> lsClase = Task.Run(() => ProductoSunatBridge.getProductoSunatByNivel(3, ob.codigo)).Result.OrderBy(x => x.nombre).ToList();
                cmbClase.DataSource = lsClase;
                if (!xSeleccionarClase) this.cmbClase.SelectedIndexChanged += new System.EventHandler(this.cmbClase_SelectedIndexChanged);
                cmbClase.SelectedIndex = -1;

                if (xObProdSunat != null && lsClase.Exists(x => x.codigo == xObProdSunat.codigo.Substring(0, 6)))
                {
                    ProductoSunat obPS = lsClase.Where(x => x.codigo == xObProdSunat.codigo.Substring(0, 6)).FirstOrDefault();
                    cmbClase.SelectedValue = obPS.idProdSunat;
                }
            }
            else
            {
                cmbClase.DataSource = new List<ProductoSunat>();
                dgvProdSunat.DataSource = lsProdSunat = new List<ProductoSunat>();
            }
        }

        private void cmbClase_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbClase.SelectedItem != null)
            {
                ProductoSunat ob = (ProductoSunat)cmbClase.SelectedItem;
                lsProdSunat = Task.Run(() => ProductoSunatBridge.getProductoSunatByNivel(4, ob.codigo)).Result.OrderBy(x => x.nombre).ToList();
                dgvProdSunat.DataSource = lsProdSunat;
                // seleccionar "xObProdSunat" en el "dgvProdSunat" si fuera el caso
                if (xObProdSunat != null && lsProdSunat.Exists(x => x.codigo == xObProdSunat.codigo))
                {
                    for (int i = 0; i < lsProdSunat.Count; i++)
                        if (lsProdSunat[i].codigo == xObProdSunat.codigo)
                        {
                            dgvProdSunat.CurrentCell = dgvProdSunat.Rows[i].Cells["dgvProdSunat_tipo"];
                            break;
                        }
                }
            }
            else
                dgvProdSunat.DataSource = lsProdSunat = new List<ProductoSunat>();
        }

        private void txtContenido_Enter(object sender, EventArgs e)
        {
            txtContenido.SelectAll();
        }

        private void txtContenido_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == Convert.ToChar(Keys.Enter))
                busqueda();
        }

        private void txtContenido_KeyDown(object sender, KeyEventArgs e)
        {
            if (dgvProdSunat.Rows.Count > 0 && (e.KeyCode == Keys.Down))
            {
                dgvProdSunat.Focus();
                dgvProdSunat.CurrentCell = dgvProdSunat.Rows[0].Cells[1];
            }
        }

        private void dgvProdSunat_KeyDown(object sender, KeyEventArgs e)
        {
            if (dgvProdSunat.Rows.Count > 0 && dgvProdSunat.CurrentRow.Index == 0 && e.KeyCode == Keys.Up)
                txtContenido.Focus();
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            busqueda();
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            if (xSeleccionarClase)
            {
                if (cmbClase.SelectedItem == null)
                {
                    if (dgvProdSunat.CurrentRow == null || lsProdSunat[dgvProdSunat.CurrentRow.Index].nivel != 3)//3=clase
                    {
                        Utils.msg("Selecciona un registro. Del tipo \"CLASE\".", Estado.WARNING);
                        return;
                    }
                    xObProdSunat = lsProdSunat[dgvProdSunat.CurrentRow.Index];
                }
                else
                    xObProdSunat = (ProductoSunat)cmbClase.SelectedItem;
            }
            else
            {
                if (dgvProdSunat.CurrentRow == null || !(lsProdSunat[dgvProdSunat.CurrentRow.Index].nivel == 3 || lsProdSunat[dgvProdSunat.CurrentRow.Index].nivel == 4)) //3=clase;4=producto
                {
                    Utils.msg("Selecciona un registro. Que sea del tipo \"CLASE\" o \"PRODUCTO\".", Estado.WARNING);
                    return;
                }
                else
                    xObProdSunat = lsProdSunat[dgvProdSunat.CurrentRow.Index];
            }

            this.operOK = true;
            this.Dispose();
        }

        //
        // Métodos
        //
        private bool validarBusqueda()
        {
            txtContenido.Text = Utils.allTrim_InjectCode(txtContenido.Text);
            if (txtContenido.Text.Length < int.Parse(Vars.dicVarGB["MinCarFind"]))
            {
                Utils.msg("Se requiere como mínimo " + Vars.dicVarGB["MinCarFind"] + " caracteres.", Estado.WARNING);
                txtContenido.Focus();
                return false;
            }

            return true;
        }

        private void busqueda()
        {
            if (!validarBusqueda())
                return;

            cmbSegmento.SelectedItem = null;

            lsProdSunat = (Task.Run(() => ProductoSunatBridge.getProductoSunatByFind(txtContenido.Text.Trim())).Result).OrderBy(x => x.nombre).ToList();
            dgvProdSunat.DataSource = lsProdSunat;

            if (lsProdSunat.Count > 0)
            {
                dgvProdSunat.Focus();
                dgvProdSunat.CurrentCell = dgvProdSunat.Rows[0].Cells[1];
            }
            else
            {
                txtContenido.Focus();
                Utils.msg("No se encontró resultados, realiza otra búsqueda.", Estado.WARNING);
            }
        }

    }//end class

}
