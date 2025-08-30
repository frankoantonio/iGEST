using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace com.yupana.polariss.app.main.principal
{
    public partial class FrmReporte : Form
    {
        public FrmReporte()
        {
            InitializeComponent();
        }

        private void FrmReporte_Load(object sender, EventArgs e)
        {
            /*
            ///////////
            List<RepFacturaDet> lsEmp = new RepFacturaDetBO().lstRepFacturaDetByIdVta(1);
            repFacturaDetBindingSource.DataSource = new BindingSource() { DataSource = lsEmp };

            empresaBindingSource.DataSource = new BindingSource() { DataSource = Vars.obEmpresa };
            negocioBindingSource.DataSource = new BindingSource() { DataSource = Vars.obNegocio };
            personaBindingSource.DataSource = new BindingSource() { DataSource = new PersonaBO().getPersonaByID(11) };
            ventaBindingSource.DataSource = new BindingSource() { DataSource = new VentaBO().getVentaByPrm(10004, "03", "B001", 123) };
            ////////////

            this.reportViewer1.RefreshReport();
            */
        }

    }//end class

}
