using com.yupanastudio.igest.winapp;
using System;
using System.Data;
using System.Linq;

namespace com.yupanastudio.igest.winapp
{
    public partial class UcTipos : UcMaster
    {
        public UcTipos()
        {
            InitializeComponent();
        }

        private async void UcTipos_Load(object sender, EventArgs e)
        {
            Vars.lsTipos = (await TipoBridge.getTipoAll()).OrderBy(x => x.idTipo).ToList();
            dgvTipos.DataSource = Vars.lsTipos;
        }
        

    }//end class

}
