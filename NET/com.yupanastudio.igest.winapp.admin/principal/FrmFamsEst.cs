using com.yupanastudio.igest.winapp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public partial class FrmFamsEst : FrmMaster
    {
        private Persona xObPersona;             // objeto "Persona" que representa al estudiante
        private GrupoFamiliar xObGrpFam;        // objeto "Grupo Familiar" del estudiante
        public List<Familiar> xLsFams;

        public FrmFamsEst(Persona xObPersona, GrupoFamiliar xObGrpFam, List<Familiar> xLsFams, bool xLectura) : base(CRUD.NONE, xLectura)
        {
            InitializeComponent();
            this.xObPersona = xObPersona;
            this.xObGrpFam = xObGrpFam;
            this.xLsFams = xLsFams.OrderByDescending(x => x.apoderado).ThenBy(y => y.idTipoPariente).ThenBy(z => z.apeNomsX).ToList();
            lblGrpFam.Values.ExtraText = xObGrpFam.fullGrpFamX;
            if (xLectura) this.setLectura();
        }

        private void FrmFamsEst_Load(object sender, EventArgs e)
        {
            dgvFams_idTipoPariente.ValueMember = "idTipo";
            dgvFams_idTipoPariente.DisplayMember = "nomTipo";
            dgvFams_idTipoPariente.DataSource = Vars.lsTipos.Where(x => x.grupo == "TI_PARENTESCO").ToList();  // no requiere ordenar
            dgvFams.AutoGenerateColumns = false;
            dgvFams.DataSource = xLsFams;
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            this.Enabled = false;
            FrmFamiliarFind frm = new FrmFamiliarFind(xObPersona, true, false, true, this.xLectura);
            frm.ShowDialog();
            if (frm.operOK)
            {
                Familiar obFamAux = frm.obFamSel;

                if (obFamAux.obPerX.idGrpFam != xObGrpFam.idGrpFam) // actualizar en servidor el identificador de grupo familiar
                {
                    obFamAux.obPerX.idGrpFam = xObGrpFam.idGrpFam;
                    obFamAux = Task.Run(() => FamiliarBridge.upsert(obFamAux)).Result;
                }

                obFamAux.apeNomsX = obFamAux.obPerX.apeNomsX;

                if (xLsFams.Where(x => x.idFamiliar == obFamAux.idFamiliar).Count() > 0)
                {
                    for (int i = 0; i < xLsFams.Count; i++)
                        if (xLsFams[i].idFamiliar == obFamAux.idFamiliar)
                            xLsFams[i] = obFamAux;
                }
                else
                {
                    xLsFams.Add(obFamAux);
                }

                dgvFams.DataSource = xLsFams = xLsFams.OrderByDescending(x => x.apoderado).ThenBy(y => y.idTipoPariente).ThenBy(z => z.apeNomsX).ToList();
            }
            this.Enabled = true;
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (xLsFams[dgvFams.CurrentRow.Index].idFamiliar == xObPersona.idPersona)
            {
                Utils.msg("Se requiere un familiar, estas seleccionando al estudiante.", Estado.WARNING);
                return;
            }

            this.Enabled = false;
            try
            {
                int ix = dgvFams.CurrentRow.Index;
                FrmFamiliar frm = new FrmFamiliar(xLsFams[ix].idFamiliar, xObPersona, true, CRUD.EDIT, this.xLectura);
                frm.ShowDialog();
                if (frm.operOK)
                {
                    Familiar obFamAux = frm.xObFamiliar;
                    obFamAux.apeNomsX = obFamAux.obPerX.apeNomsX;
                    xLsFams[ix] = obFamAux;
                    dgvFams.DataSource = xLsFams = xLsFams.OrderByDescending(x => x.apoderado).ThenBy(y => y.idTipoPariente).ThenBy(z => z.apeNomsX).ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            this.Enabled = true;
        }

        private void btnCancela_Click(object sender, EventArgs e)
        {
            if (xLsFams.Where(x => x.apoderado).Count() != 1)
                Utils.msg("Se requiere un apoderado, solo uno.", Estado.WARNING);
            this.Dispose();
        }

    }//end class

}
