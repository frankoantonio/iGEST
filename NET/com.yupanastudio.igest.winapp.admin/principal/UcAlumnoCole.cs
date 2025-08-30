using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using com.yupanastudio.igest.winapp;

namespace com.yupanastudio.igest.winapp
{
    public partial class UcAlumnoCole : UcMaster
    {
        List<Empresa> lsEmp;
        List<Negocio> lsNeg;
        List<Sede> lsSede;

        public UcAlumnoCole()
        {
            InitializeComponent();            
        }

        private async void UcEmpresas_Load(object sender, EventArgs e)
        {
            //lsEmp = await EmpresaService.getEmpresaAllWithoutChild();
        }

              

        //
        // Métodos
        //
        
       

   
        private void kryptonLinkLabel1_LinkClicked(object sender, EventArgs e)
        {

        }

        private void label22_Click(object sender, EventArgs e)
        {

        }

        private void label26_Click(object sender, EventArgs e)
        {

        }

        private void label18_Click(object sender, EventArgs e)
        {

        }

        private void label28_Click(object sender, EventArgs e)
        {

        }

        private void chbActivo_CheckedChanged(object sender, EventArgs e)
        {

        }
    }//end class

}
