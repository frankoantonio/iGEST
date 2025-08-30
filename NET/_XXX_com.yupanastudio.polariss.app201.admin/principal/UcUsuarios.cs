using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
{
    public partial class UcUsuarios : UcMaster
    {
        List<Empresa> lsEmp;
        List<Negocio> lsNeg;
        List<Sede> lsSede;

        public UcUsuarios()
        {
            InitializeComponent();
            //SetStyle(ControlStyles.OptimizedDoubleBuffer | ControlStyles.AllPaintingInWmPaint, true);
        }

        private void UcUsuarios_Load(object sender, EventArgs e)
        {
            cmbDocIdent.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_DOC_IDENT").OrderBy(y => y.orden).ToList();
            cmbDocIdent.SelectedIndex = -1;
        }

        //
        // Métodos
        //
        private void UcTrabajador_Load(object sender, EventArgs e)
        {

        }

        private void btnFind_Click(object sender, EventArgs e)
        {

        }//end class

        private void btnOk_Click(object sender, EventArgs e)
        {
            //guardar

            //des_habilitar controles
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            //cancelar operacion
            //des_habilitar controles
        }

        private async void btnFind_Click_1(object sender, EventArgs e)
        {
            FrmPersonaFind frm = new FrmPersonaFind(Vars.dicTipos["TI_PERSONA.NATURAL"], false, false);
            frm.ShowDialog();
            if (frm.obPersonaSel != null)
            {
                Persona obPer = frm.obPersonaSel;

                if (bool.Parse(Vars.dicVarGB["ReqUsuIsTrab"]))
                {
                    Trabajador obTrab = await TrabajadorBridge.getTrabajadorByID(obPer.idPersona);
                    if (obTrab == null)
                    {
                        Utils.msg("La persona que seleccionaste, no está registrado como trabajador.", Estado.WARNING);
                        return;
                    }

                    if (!obTrab.activo)
                    {
                        Utils.msg("El trabajador no está activo.", Estado.WARNING);

                        //bloquear los controles, ,pero si permitir mirar
                        //return;
                    }

                    txtCorreoLab.Text = obTrab.correoLab;
                    chbTrabActivo.Checked = obTrab.activo;                    
                }

                picUser.Image = await Vars.cargarImagenUsuAsync(obPer.numDocIdent);
                cmbDocIdent.SelectedValue = obPer.idTipoDocIdent;
                txtDocIdent.Text = obPer.numDocIdent;
                txtNombres.Text = obPer.nombres;
                txtPaterno.Text = obPer.paterno;
                txtMaterno.Text = obPer.materno;
            }

            //RECUPERAR DATOS DEL USUARIO
            //RECUPERAR SUS SISTEMAS ASIGNADOS
            //RECUPERAR LOS ÉRFILES POR SISTEMA
            //RECUPERAR LA LISTA DE OPCIONES POR PERFIL SEL
        }


        private void desHabilitarCtrl(bool b)
        {
            
        }

        private void btnNewUsu_Click(object sender, EventArgs e)
        {
            txtCorreoLab.Enabled = true;
            chbUsuarioActivo.Enabled = true;
        }
    }

}
