namespace com.yupanastudio.polariss.app
{
    partial class UcEmpresasORIG
    {
        /// <summary> 
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de componentes

        /// <summary> 
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvNegocios = new ComponentFactory.Krypton.Toolkit.KryptonDataGridView();
            this.dgvNeg_idNegocio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvNeg_idTipoNegocio = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvNeg_nomNegocio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvNeg_activo = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dgvNeg_idEmpresa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvNeg_imgLogoX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvNeg_imgBannerX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvNeg_imgFondoX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvNeg_lsSistemaX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvNeg_lsSedeX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmpresas = new ComponentFactory.Krypton.Toolkit.KryptonDataGridView();
            this.dgvEmp_idEmpresa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmp_nomEmpresa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmp_nomComercial = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmp_ruc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmp_direccion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmp_telefonos = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmp_activo = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dgvEmp_sunatUsu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmp_sunatPwd = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.dgvSedes = new ComponentFactory.Krypton.Toolkit.KryptonDataGridView();
            this.dgvSed_idSede = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSed_nomSede = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSed_dirSede = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSed_idDistrito = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSed_idEmpresa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSed_oficial = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dgvSed_codSunat = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSed_rutaFe = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSed_tokenFe = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblNeg = new System.Windows.Forms.Label();
            this.lblSede = new System.Windows.Forms.Label();
            this.btnNewEmp = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnEditEmp = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnEditNeg = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnNewNeg = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.btnEditSede = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnNewSede = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlBody.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvNegocios)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEmpresas)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSedes)).BeginInit();
            this.SuspendLayout();
            // 
            // lblSubtitle
            // 
            this.lblSubtitle.Text = "Control de empresas, negocios y sedes";
            // 
            // pnlBody
            // 
            this.pnlBody.Controls.Add(this.btnEditSede);
            this.pnlBody.Controls.Add(this.btnNewSede);
            this.pnlBody.Controls.Add(this.btnEditNeg);
            this.pnlBody.Controls.Add(this.btnNewNeg);
            this.pnlBody.Controls.Add(this.btnEditEmp);
            this.pnlBody.Controls.Add(this.btnNewEmp);
            this.pnlBody.Controls.Add(this.lblSede);
            this.pnlBody.Controls.Add(this.lblNeg);
            this.pnlBody.Controls.Add(this.dgvNegocios);
            this.pnlBody.Controls.Add(this.dgvSedes);
            this.pnlBody.Controls.Add(this.label1);
            this.pnlBody.Controls.Add(this.dgvEmpresas);
            this.pnlBody.Controls.SetChildIndex(this.dgvEmpresas, 0);
            this.pnlBody.Controls.SetChildIndex(this.label1, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvSedes, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvNegocios, 0);
            this.pnlBody.Controls.SetChildIndex(this.lblNeg, 0);
            this.pnlBody.Controls.SetChildIndex(this.lblSede, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnNewEmp, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEditEmp, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnNewNeg, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEditNeg, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnNewSede, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEditSede, 0);
            this.pnlBody.Controls.SetChildIndex(this.pnlHeader, 0);
            // 
            // dgvNegocios
            // 
            this.dgvNegocios.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvNegocios.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvNeg_idNegocio,
            this.dgvNeg_idTipoNegocio,
            this.dgvNeg_nomNegocio,
            this.dgvNeg_activo,
            this.dgvNeg_idEmpresa,
            this.dgvNeg_imgLogoX,
            this.dgvNeg_imgBannerX,
            this.dgvNeg_imgFondoX,
            this.dgvNeg_lsSistemaX,
            this.dgvNeg_lsSedeX});
            this.dgvNegocios.Location = new System.Drawing.Point(10, 334);
            this.dgvNegocios.MultiSelect = false;
            this.dgvNegocios.Name = "dgvNegocios";
            this.dgvNegocios.ReadOnly = true;
            this.dgvNegocios.RowHeadersWidth = 22;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.SlateBlue;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.White;
            this.dgvNegocios.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvNegocios.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvNegocios.Size = new System.Drawing.Size(455, 276);
            this.dgvNegocios.TabIndex = 17;
            // 
            // dgvNeg_idNegocio
            // 
            this.dgvNeg_idNegocio.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvNeg_idNegocio.DataPropertyName = "idNegocio";
            this.dgvNeg_idNegocio.FillWeight = 80F;
            this.dgvNeg_idNegocio.HeaderText = "ID. NEGOCIO";
            this.dgvNeg_idNegocio.Name = "dgvNeg_idNegocio";
            this.dgvNeg_idNegocio.ReadOnly = true;
            this.dgvNeg_idNegocio.Width = 80;
            // 
            // dgvNeg_idTipoNegocio
            // 
            this.dgvNeg_idTipoNegocio.DataPropertyName = "idTipoNegocio";
            this.dgvNeg_idTipoNegocio.HeaderText = "TIPO NEGOCIO";
            this.dgvNeg_idTipoNegocio.Name = "dgvNeg_idTipoNegocio";
            this.dgvNeg_idTipoNegocio.ReadOnly = true;
            this.dgvNeg_idTipoNegocio.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvNeg_idTipoNegocio.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // dgvNeg_nomNegocio
            // 
            this.dgvNeg_nomNegocio.DataPropertyName = "nomNegocio";
            this.dgvNeg_nomNegocio.HeaderText = "NOMBRE UND. NEGOCIO";
            this.dgvNeg_nomNegocio.Name = "dgvNeg_nomNegocio";
            this.dgvNeg_nomNegocio.ReadOnly = true;
            // 
            // dgvNeg_activo
            // 
            this.dgvNeg_activo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvNeg_activo.DataPropertyName = "activo";
            this.dgvNeg_activo.FillWeight = 55F;
            this.dgvNeg_activo.HeaderText = "ACTIVO";
            this.dgvNeg_activo.Name = "dgvNeg_activo";
            this.dgvNeg_activo.ReadOnly = true;
            this.dgvNeg_activo.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvNeg_activo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvNeg_activo.Width = 55;
            // 
            // dgvNeg_idEmpresa
            // 
            this.dgvNeg_idEmpresa.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvNeg_idEmpresa.DataPropertyName = "idEmpresa";
            this.dgvNeg_idEmpresa.FillWeight = 80F;
            this.dgvNeg_idEmpresa.HeaderText = "ID. EMPRESA";
            this.dgvNeg_idEmpresa.Name = "dgvNeg_idEmpresa";
            this.dgvNeg_idEmpresa.ReadOnly = true;
            this.dgvNeg_idEmpresa.Visible = false;
            this.dgvNeg_idEmpresa.Width = 80;
            // 
            // dgvNeg_imgLogoX
            // 
            this.dgvNeg_imgLogoX.DataPropertyName = "imgLogoX";
            this.dgvNeg_imgLogoX.HeaderText = "imgLogoX";
            this.dgvNeg_imgLogoX.Name = "dgvNeg_imgLogoX";
            this.dgvNeg_imgLogoX.ReadOnly = true;
            this.dgvNeg_imgLogoX.Visible = false;
            // 
            // dgvNeg_imgBannerX
            // 
            this.dgvNeg_imgBannerX.DataPropertyName = "imgBannerX";
            this.dgvNeg_imgBannerX.HeaderText = "imgBannerX";
            this.dgvNeg_imgBannerX.Name = "dgvNeg_imgBannerX";
            this.dgvNeg_imgBannerX.ReadOnly = true;
            this.dgvNeg_imgBannerX.Visible = false;
            // 
            // dgvNeg_imgFondoX
            // 
            this.dgvNeg_imgFondoX.DataPropertyName = "imgFondoX";
            this.dgvNeg_imgFondoX.HeaderText = "imgFondoX";
            this.dgvNeg_imgFondoX.Name = "dgvNeg_imgFondoX";
            this.dgvNeg_imgFondoX.ReadOnly = true;
            this.dgvNeg_imgFondoX.Visible = false;
            // 
            // dgvNeg_lsSistemaX
            // 
            this.dgvNeg_lsSistemaX.DataPropertyName = "lsSistemaX";
            this.dgvNeg_lsSistemaX.HeaderText = "lsSistemaX";
            this.dgvNeg_lsSistemaX.Name = "dgvNeg_lsSistemaX";
            this.dgvNeg_lsSistemaX.ReadOnly = true;
            this.dgvNeg_lsSistemaX.Visible = false;
            // 
            // dgvNeg_lsSedeX
            // 
            this.dgvNeg_lsSedeX.DataPropertyName = "lsSedeX";
            this.dgvNeg_lsSedeX.HeaderText = "lsSedeX";
            this.dgvNeg_lsSedeX.Name = "dgvNeg_lsSedeX";
            this.dgvNeg_lsSedeX.ReadOnly = true;
            this.dgvNeg_lsSedeX.Visible = false;
            // 
            // dgvEmpresas
            // 
            this.dgvEmpresas.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvEmpresas.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvEmp_idEmpresa,
            this.dgvEmp_nomEmpresa,
            this.dgvEmp_nomComercial,
            this.dgvEmp_ruc,
            this.dgvEmp_direccion,
            this.dgvEmp_telefonos,
            this.dgvEmp_activo,
            this.dgvEmp_sunatUsu,
            this.dgvEmp_sunatPwd});
            this.dgvEmpresas.Location = new System.Drawing.Point(10, 60);
            this.dgvEmpresas.MultiSelect = false;
            this.dgvEmpresas.Name = "dgvEmpresas";
            this.dgvEmpresas.ReadOnly = true;
            this.dgvEmpresas.RowHeadersWidth = 22;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.SlateBlue;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.White;
            this.dgvEmpresas.RowsDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvEmpresas.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvEmpresas.Size = new System.Drawing.Size(980, 223);
            this.dgvEmpresas.TabIndex = 11;
            this.dgvEmpresas.SelectionChanged += new System.EventHandler(this.dgvEmpresas_SelectionChanged);
            // 
            // dgvEmp_idEmpresa
            // 
            this.dgvEmp_idEmpresa.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvEmp_idEmpresa.DataPropertyName = "idEmpresa";
            this.dgvEmp_idEmpresa.FillWeight = 80F;
            this.dgvEmp_idEmpresa.HeaderText = "ID. EMPRESA";
            this.dgvEmp_idEmpresa.Name = "dgvEmp_idEmpresa";
            this.dgvEmp_idEmpresa.ReadOnly = true;
            this.dgvEmp_idEmpresa.Width = 80;
            // 
            // dgvEmp_nomEmpresa
            // 
            this.dgvEmp_nomEmpresa.DataPropertyName = "nomEmpresa";
            this.dgvEmp_nomEmpresa.HeaderText = "NOMBRE EMPRESA";
            this.dgvEmp_nomEmpresa.Name = "dgvEmp_nomEmpresa";
            this.dgvEmp_nomEmpresa.ReadOnly = true;
            // 
            // dgvEmp_nomComercial
            // 
            this.dgvEmp_nomComercial.DataPropertyName = "nomComercial";
            this.dgvEmp_nomComercial.HeaderText = "NOMBRE COMERCIAL";
            this.dgvEmp_nomComercial.Name = "dgvEmp_nomComercial";
            this.dgvEmp_nomComercial.ReadOnly = true;
            // 
            // dgvEmp_ruc
            // 
            this.dgvEmp_ruc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvEmp_ruc.DataPropertyName = "ruc";
            this.dgvEmp_ruc.FillWeight = 80F;
            this.dgvEmp_ruc.HeaderText = "RUC";
            this.dgvEmp_ruc.Name = "dgvEmp_ruc";
            this.dgvEmp_ruc.ReadOnly = true;
            this.dgvEmp_ruc.Width = 80;
            // 
            // dgvEmp_direccion
            // 
            this.dgvEmp_direccion.DataPropertyName = "direccion";
            this.dgvEmp_direccion.HeaderText = "DIRECCIÓN";
            this.dgvEmp_direccion.Name = "dgvEmp_direccion";
            this.dgvEmp_direccion.ReadOnly = true;
            // 
            // dgvEmp_telefonos
            // 
            this.dgvEmp_telefonos.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvEmp_telefonos.DataPropertyName = "telefonos";
            this.dgvEmp_telefonos.FillWeight = 105F;
            this.dgvEmp_telefonos.HeaderText = "TELÉFONOS";
            this.dgvEmp_telefonos.Name = "dgvEmp_telefonos";
            this.dgvEmp_telefonos.ReadOnly = true;
            this.dgvEmp_telefonos.Width = 105;
            // 
            // dgvEmp_activo
            // 
            this.dgvEmp_activo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvEmp_activo.DataPropertyName = "activo";
            this.dgvEmp_activo.FillWeight = 55F;
            this.dgvEmp_activo.HeaderText = "ACTIVO";
            this.dgvEmp_activo.Name = "dgvEmp_activo";
            this.dgvEmp_activo.ReadOnly = true;
            this.dgvEmp_activo.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvEmp_activo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvEmp_activo.Width = 55;
            // 
            // dgvEmp_sunatUsu
            // 
            this.dgvEmp_sunatUsu.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvEmp_sunatUsu.DataPropertyName = "sunatUsu";
            this.dgvEmp_sunatUsu.FillWeight = 80F;
            this.dgvEmp_sunatUsu.HeaderText = "SUNAT USU.";
            this.dgvEmp_sunatUsu.Name = "dgvEmp_sunatUsu";
            this.dgvEmp_sunatUsu.ReadOnly = true;
            this.dgvEmp_sunatUsu.Width = 80;
            // 
            // dgvEmp_sunatPwd
            // 
            this.dgvEmp_sunatPwd.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvEmp_sunatPwd.DataPropertyName = "sunatPwd";
            this.dgvEmp_sunatPwd.FillWeight = 80F;
            this.dgvEmp_sunatPwd.HeaderText = "SUNAT PWD.";
            this.dgvEmp_sunatPwd.Name = "dgvEmp_sunatPwd";
            this.dgvEmp_sunatPwd.ReadOnly = true;
            this.dgvEmp_sunatPwd.Width = 80;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(7, 40);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 15);
            this.label1.TabIndex = 15;
            this.label1.Text = "Empresas";
            // 
            // dgvSedes
            // 
            this.dgvSedes.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvSedes.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvSed_idSede,
            this.dgvSed_nomSede,
            this.dgvSed_dirSede,
            this.dgvSed_idDistrito,
            this.dgvSed_idEmpresa,
            this.dgvSed_oficial,
            this.dgvSed_codSunat,
            this.dgvSed_rutaFe,
            this.dgvSed_tokenFe});
            this.dgvSedes.Location = new System.Drawing.Point(480, 334);
            this.dgvSedes.MultiSelect = false;
            this.dgvSedes.Name = "dgvSedes";
            this.dgvSedes.ReadOnly = true;
            this.dgvSedes.RowHeadersWidth = 22;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.SlateBlue;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.Color.White;
            this.dgvSedes.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvSedes.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvSedes.Size = new System.Drawing.Size(510, 276);
            this.dgvSedes.TabIndex = 16;
            // 
            // dgvSed_idSede
            // 
            this.dgvSed_idSede.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSed_idSede.DataPropertyName = "idSede";
            this.dgvSed_idSede.FillWeight = 55F;
            this.dgvSed_idSede.HeaderText = "ID. SEDE";
            this.dgvSed_idSede.Name = "dgvSed_idSede";
            this.dgvSed_idSede.ReadOnly = true;
            this.dgvSed_idSede.Width = 55;
            // 
            // dgvSed_nomSede
            // 
            this.dgvSed_nomSede.DataPropertyName = "nomSede";
            this.dgvSed_nomSede.HeaderText = "NOMBRE SEDE";
            this.dgvSed_nomSede.Name = "dgvSed_nomSede";
            this.dgvSed_nomSede.ReadOnly = true;
            // 
            // dgvSed_dirSede
            // 
            this.dgvSed_dirSede.DataPropertyName = "dirSede";
            this.dgvSed_dirSede.HeaderText = "DIRECCIÓN";
            this.dgvSed_dirSede.Name = "dgvSed_dirSede";
            this.dgvSed_dirSede.ReadOnly = true;
            // 
            // dgvSed_idDistrito
            // 
            this.dgvSed_idDistrito.DataPropertyName = "idDistrito";
            this.dgvSed_idDistrito.HeaderText = "idDistrito";
            this.dgvSed_idDistrito.Name = "dgvSed_idDistrito";
            this.dgvSed_idDistrito.ReadOnly = true;
            this.dgvSed_idDistrito.Visible = false;
            // 
            // dgvSed_idEmpresa
            // 
            this.dgvSed_idEmpresa.DataPropertyName = "idEmpresa";
            this.dgvSed_idEmpresa.HeaderText = "idEmpresa";
            this.dgvSed_idEmpresa.Name = "dgvSed_idEmpresa";
            this.dgvSed_idEmpresa.ReadOnly = true;
            this.dgvSed_idEmpresa.Visible = false;
            // 
            // dgvSed_oficial
            // 
            this.dgvSed_oficial.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSed_oficial.DataPropertyName = "oficial";
            this.dgvSed_oficial.FillWeight = 55F;
            this.dgvSed_oficial.HeaderText = "OFICIAL";
            this.dgvSed_oficial.Name = "dgvSed_oficial";
            this.dgvSed_oficial.ReadOnly = true;
            this.dgvSed_oficial.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvSed_oficial.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvSed_oficial.Width = 55;
            // 
            // dgvSed_codSunat
            // 
            this.dgvSed_codSunat.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSed_codSunat.DataPropertyName = "codSunat";
            this.dgvSed_codSunat.FillWeight = 50F;
            this.dgvSed_codSunat.HeaderText = "COD. SUNAT";
            this.dgvSed_codSunat.Name = "dgvSed_codSunat";
            this.dgvSed_codSunat.ReadOnly = true;
            this.dgvSed_codSunat.Width = 50;
            // 
            // dgvSed_rutaFe
            // 
            this.dgvSed_rutaFe.DataPropertyName = "rutaFe";
            this.dgvSed_rutaFe.HeaderText = "RUTA PSE";
            this.dgvSed_rutaFe.Name = "dgvSed_rutaFe";
            this.dgvSed_rutaFe.ReadOnly = true;
            // 
            // dgvSed_tokenFe
            // 
            this.dgvSed_tokenFe.DataPropertyName = "tokenFe";
            this.dgvSed_tokenFe.HeaderText = "TOKEN PSE";
            this.dgvSed_tokenFe.Name = "dgvSed_tokenFe";
            this.dgvSed_tokenFe.ReadOnly = true;
            // 
            // lblNeg
            // 
            this.lblNeg.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.lblNeg.ForeColor = System.Drawing.Color.MidnightBlue;
            this.lblNeg.Location = new System.Drawing.Point(7, 314);
            this.lblNeg.Name = "lblNeg";
            this.lblNeg.Size = new System.Drawing.Size(367, 15);
            this.lblNeg.TabIndex = 18;
            this.lblNeg.Text = "...";
            // 
            // lblSede
            // 
            this.lblSede.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSede.ForeColor = System.Drawing.Color.MidnightBlue;
            this.lblSede.Location = new System.Drawing.Point(477, 314);
            this.lblSede.Name = "lblSede";
            this.lblSede.Size = new System.Drawing.Size(422, 15);
            this.lblSede.TabIndex = 19;
            this.lblSede.Text = "...";
            // 
            // btnNewEmp
            // 
            this.btnNewEmp.Location = new System.Drawing.Point(905, 33);
            this.btnNewEmp.Name = "btnNewEmp";
            this.btnNewEmp.Size = new System.Drawing.Size(40, 25);
            this.btnNewEmp.TabIndex = 20;
            this.toolTip1.SetToolTip(this.btnNewEmp, "Nueva \"Empresa\"");
            this.btnNewEmp.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_add;
            this.btnNewEmp.Values.Text = "";
            this.btnNewEmp.Click += new System.EventHandler(this.btnNewEmp_Click);
            // 
            // btnEditEmp
            // 
            this.btnEditEmp.Location = new System.Drawing.Point(950, 33);
            this.btnEditEmp.Name = "btnEditEmp";
            this.btnEditEmp.Size = new System.Drawing.Size(40, 25);
            this.btnEditEmp.TabIndex = 21;
            this.toolTip1.SetToolTip(this.btnEditEmp, "Editar \"Empresa\"");
            this.btnEditEmp.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_edit;
            this.btnEditEmp.Values.Text = "";
            this.btnEditEmp.Click += new System.EventHandler(this.btnEditEmp_Click);
            // 
            // btnEditNeg
            // 
            this.btnEditNeg.Location = new System.Drawing.Point(425, 307);
            this.btnEditNeg.Name = "btnEditNeg";
            this.btnEditNeg.Size = new System.Drawing.Size(40, 25);
            this.btnEditNeg.TabIndex = 25;
            this.toolTip1.SetToolTip(this.btnEditNeg, "Editar \"Unidad de Negocio\"");
            this.btnEditNeg.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_edit;
            this.btnEditNeg.Values.Text = "";
            this.btnEditNeg.Click += new System.EventHandler(this.btnEditNeg_Click);
            // 
            // btnNewNeg
            // 
            this.btnNewNeg.Location = new System.Drawing.Point(380, 307);
            this.btnNewNeg.Name = "btnNewNeg";
            this.btnNewNeg.Size = new System.Drawing.Size(40, 25);
            this.btnNewNeg.TabIndex = 24;
            this.toolTip1.SetToolTip(this.btnNewNeg, "Nueva \"Unidad de Negocio\"");
            this.btnNewNeg.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_add;
            this.btnNewNeg.Values.Text = "";
            this.btnNewNeg.Click += new System.EventHandler(this.btnNewNeg_Click);
            // 
            // btnEditSede
            // 
            this.btnEditSede.Location = new System.Drawing.Point(950, 307);
            this.btnEditSede.Name = "btnEditSede";
            this.btnEditSede.Size = new System.Drawing.Size(40, 25);
            this.btnEditSede.TabIndex = 29;
            this.toolTip1.SetToolTip(this.btnEditSede, "Editar \"Sede\"");
            this.btnEditSede.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_edit;
            this.btnEditSede.Values.Text = "";
            this.btnEditSede.Click += new System.EventHandler(this.btnEditSede_Click);
            // 
            // btnNewSede
            // 
            this.btnNewSede.Location = new System.Drawing.Point(905, 307);
            this.btnNewSede.Name = "btnNewSede";
            this.btnNewSede.Size = new System.Drawing.Size(40, 25);
            this.btnNewSede.TabIndex = 28;
            this.toolTip1.SetToolTip(this.btnNewSede, "Nueva \"Sede\"");
            this.btnNewSede.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_add;
            this.btnNewSede.Values.Text = "";
            this.btnNewSede.Click += new System.EventHandler(this.btnNewSede_Click);
            // 
            // UcEmpresas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Name = "UcEmpresas";
            this.Load += new System.EventHandler(this.UcEmpresas_Load);
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlBody.ResumeLayout(false);
            this.pnlBody.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvNegocios)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEmpresas)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSedes)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private ComponentFactory.Krypton.Toolkit.KryptonDataGridView dgvEmpresas;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblSede;
        private System.Windows.Forms.Label lblNeg;
        private ComponentFactory.Krypton.Toolkit.KryptonDataGridView dgvSedes;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnNewEmp;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnEditEmp;
        private System.Windows.Forms.ToolTip toolTip1;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnEditSede;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnNewSede;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnEditNeg;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnNewNeg;
        private ComponentFactory.Krypton.Toolkit.KryptonDataGridView dgvNegocios;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvNeg_idNegocio;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvNeg_idTipoNegocio;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvNeg_nomNegocio;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvNeg_activo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvNeg_idEmpresa;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvNeg_imgLogoX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvNeg_imgBannerX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvNeg_imgFondoX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvNeg_lsSistemaX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvNeg_lsSedeX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSed_idSede;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSed_nomSede;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSed_dirSede;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSed_idDistrito;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSed_idEmpresa;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvSed_oficial;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSed_codSunat;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSed_rutaFe;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSed_tokenFe;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvEmp_idEmpresa;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvEmp_nomEmpresa;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvEmp_nomComercial;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvEmp_ruc;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvEmp_direccion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvEmp_telefonos;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvEmp_activo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvEmp_sunatUsu;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvEmp_sunatPwd;
    }
}
