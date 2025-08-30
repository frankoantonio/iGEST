using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Reporting.WinForms;

namespace com.yupana.polariss.app.main
{
    public partial class Form1 : Form
    {

        private BindingSource NegocioBindingSource;
        ReportDataSource reportDataSource1 = new ReportDataSource();

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            /*
            this.reportViewer1.LocalReport.DataSources.Clear();            
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            
            this.reportViewer1.LocalReport.ReportPath = Application.StartupPath + "\\Report1.rdlc";
            this.reportViewer1.Name = "Report1";
            this.reportViewer1.ProcessingMode = ProcessingMode.Local;

            List<Negocio> ls = new NegocioBO().lsNegocio();
            //BindingSource bs = new BindingSource { DataSource = ls };
            //NegocioBindingSource = new BindingSource { DataSource = ls };
            //ReportDataSource rds = new ReportDataSource("Titulo de Reporte", NegocioBindingSource);
            //rds.Value = bs;

            //NegocioBindingSource.DataSource = typeof(System.Collections.Generic.List<Negocio>);
            NegocioBindingSource.DataSource = new BindingSource { DataSource = ls };

            //this.reportViewer1.LocalReport.DataSources.Add(rds);
            this.reportViewer1.LocalReport.Refresh();
            this.reportViewer1.RefreshReport();
            */

            this.NegocioBindingSource = new System.Windows.Forms.BindingSource(this.components);
            // 
            // NegocioBindingSource
            //
            /*
            List<Negocio> ls = new NegocioBO().lstGENNegocioGetByIdEmp(1005);
            
            //this.NegocioBindingSource.DataSource = typeof(System.Collections.Generic.List<com.yupana.polariss.model.Negocio>);
            this.NegocioBindingSource.DataSource = new BindingSource { DataSource = ls };
            reportDataSource1.Name = "dsNegocio";
            reportDataSource1.Value = this.NegocioBindingSource;
            */
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "Polariss.Report1.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(623, 260);
            this.reportViewer1.TabIndex = 0;
            this.reportViewer1.SetDisplayMode(DisplayMode.PrintLayout);
            this.reportViewer1.ZoomMode = ZoomMode.PageWidth;
            //this.reportViewer1.ZoomPercent = 75;

            ///////////
            ///
            /// 
            /*
            List<Empresa> lsEmp = new EmpresaBO().lstGENEmpresaGetByGrp(100002);
            EmpresaBindingSource.DataSource = new BindingSource() { DataSource = lsEmp };
            NegocioBindingSource1.DataSource = new BindingSource() { DataSource = lsEmp[0].lsNegociosX };
            */
            ////////////

            this.reportViewer1.RefreshReport();
            this.reportViewer2.RefreshReport();


            ((System.ComponentModel.ISupportInitialize)(this.NegocioBindingSource)).EndInit();


            //this.reportViewer2.RefreshReport();
        }
    }
}
