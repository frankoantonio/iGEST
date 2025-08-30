namespace com.yupanastudio.igest.winapp
{
    partial class UcEmpresas
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvEmpresas = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvEmp_idEmpresa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmp_idTipoNeg = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvEmp_idTipoGrp = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvEmp_ruc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmp_nomComercial = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmp_direccion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmp_telefonos = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvEmp_activo = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.dgvSedes = new Krypton.Toolkit.KryptonDataGridView();
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
            this.btnNewEmp = new Krypton.Toolkit.KryptonButton();
            this.btnEditEmp = new Krypton.Toolkit.KryptonButton();
            this.btnEditSis = new Krypton.Toolkit.KryptonButton();
            this.btnEditSede = new Krypton.Toolkit.KryptonButton();
            this.btnNewSede = new Krypton.Toolkit.KryptonButton();
            this.btnCancelSis = new Krypton.Toolkit.KryptonButton();
            this.btnOkSis = new Krypton.Toolkit.KryptonButton();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.dgvSis = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvSis_idEmpSis = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSis_idEmpresa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSis_activo = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dgvSis_idSistema = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSis_nomSisX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kryptonDataGridView1 = new Krypton.Toolkit.KryptonDataGridView();
            this.kryptonDataGridView2 = new Krypton.Toolkit.KryptonDataGridView();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlBody.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEmpresas)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSedes)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSis)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonDataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonDataGridView2)).BeginInit();
            this.SuspendLayout();
            // 
            // lblSubtitle
            // 
            this.lblSubtitle.Text = "Control de empresas, sistemas y sedes";
            // 
            // pnlBody
            // 
            this.pnlBody.Controls.Add(this.label7);
            this.pnlBody.Controls.Add(this.label6);
            this.pnlBody.Controls.Add(this.label5);
            this.pnlBody.Controls.Add(this.label4);
            this.pnlBody.Controls.Add(this.kryptonDataGridView2);
            this.pnlBody.Controls.Add(this.kryptonDataGridView1);
            this.pnlBody.Controls.Add(this.dgvSis);
            this.pnlBody.Controls.Add(this.label3);
            this.pnlBody.Controls.Add(this.label2);
            this.pnlBody.Controls.Add(this.btnCancelSis);
            this.pnlBody.Controls.Add(this.btnOkSis);
            this.pnlBody.Controls.Add(this.btnEditSede);
            this.pnlBody.Controls.Add(this.btnNewSede);
            this.pnlBody.Controls.Add(this.btnEditSis);
            this.pnlBody.Controls.Add(this.btnEditEmp);
            this.pnlBody.Controls.Add(this.btnNewEmp);
            this.pnlBody.Controls.Add(this.lblSede);
            this.pnlBody.Controls.Add(this.lblNeg);
            this.pnlBody.Controls.Add(this.dgvSedes);
            this.pnlBody.Controls.Add(this.label1);
            this.pnlBody.Controls.Add(this.dgvEmpresas);
            this.pnlBody.Controls.SetChildIndex(this.dgvEmpresas, 0);
            this.pnlBody.Controls.SetChildIndex(this.label1, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvSedes, 0);
            this.pnlBody.Controls.SetChildIndex(this.lblNeg, 0);
            this.pnlBody.Controls.SetChildIndex(this.lblSede, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnNewEmp, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEditEmp, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEditSis, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnNewSede, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEditSede, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnOkSis, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnCancelSis, 0);
            this.pnlBody.Controls.SetChildIndex(this.label2, 0);
            this.pnlBody.Controls.SetChildIndex(this.label3, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvSis, 0);
            this.pnlBody.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlBody.Controls.SetChildIndex(this.kryptonDataGridView1, 0);
            this.pnlBody.Controls.SetChildIndex(this.kryptonDataGridView2, 0);
            this.pnlBody.Controls.SetChildIndex(this.label4, 0);
            this.pnlBody.Controls.SetChildIndex(this.label5, 0);
            this.pnlBody.Controls.SetChildIndex(this.label6, 0);
            this.pnlBody.Controls.SetChildIndex(this.label7, 0);
            // 
            // dgvEmpresas
            // 
            this.dgvEmpresas.AllowUserToAddRows = false;
            this.dgvEmpresas.AllowUserToDeleteRows = false;
            this.dgvEmpresas.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvEmpresas.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvEmp_idEmpresa,
            this.dgvEmp_idTipoNeg,
            this.dgvEmp_idTipoGrp,
            this.dgvEmp_ruc,
            this.dgvEmp_nomComercial,
            this.dgvEmp_direccion,
            this.dgvEmp_telefonos,
            this.dgvEmp_activo});
            this.dgvEmpresas.Location = new System.Drawing.Point(10, 70);
            this.dgvEmpresas.MultiSelect = false;
            this.dgvEmpresas.Name = "dgvEmpresas";
            this.dgvEmpresas.ReadOnly = true;
            this.dgvEmpresas.RowHeadersWidth = 22;
            dataGridViewCellStyle10.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle10.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvEmpresas.RowsDefaultCellStyle = dataGridViewCellStyle10;
            this.dgvEmpresas.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvEmpresas.Size = new System.Drawing.Size(455, 288);
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
            // dgvEmp_idTipoNeg
            // 
            this.dgvEmp_idTipoNeg.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvEmp_idTipoNeg.DataPropertyName = "idTipoNeg";
            this.dgvEmp_idTipoNeg.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvEmp_idTipoNeg.FillWeight = 85F;
            this.dgvEmp_idTipoNeg.HeaderText = "TIP. TI_NEGOCIO";
            this.dgvEmp_idTipoNeg.Name = "dgvEmp_idTipoNeg";
            this.dgvEmp_idTipoNeg.ReadOnly = true;
            this.dgvEmp_idTipoNeg.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvEmp_idTipoNeg.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvEmp_idTipoNeg.Width = 85;
            // 
            // dgvEmp_idTipoGrp
            // 
            this.dgvEmp_idTipoGrp.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvEmp_idTipoGrp.DataPropertyName = "grupoEmp";
            this.dgvEmp_idTipoGrp.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvEmp_idTipoGrp.FillWeight = 105F;
            this.dgvEmp_idTipoGrp.HeaderText = "GRP. EMPRESA";
            this.dgvEmp_idTipoGrp.Name = "dgvEmp_idTipoGrp";
            this.dgvEmp_idTipoGrp.ReadOnly = true;
            this.dgvEmp_idTipoGrp.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvEmp_idTipoGrp.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvEmp_idTipoGrp.Width = 105;
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
            // dgvEmp_nomComercial
            // 
            this.dgvEmp_nomComercial.DataPropertyName = "nomComercial";
            this.dgvEmp_nomComercial.HeaderText = "NOMBRE COMERCIAL";
            this.dgvEmp_nomComercial.Name = "dgvEmp_nomComercial";
            this.dgvEmp_nomComercial.ReadOnly = true;
            // 
            // dgvEmp_direccion
            // 
            this.dgvEmp_direccion.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvEmp_direccion.DataPropertyName = "direccion";
            this.dgvEmp_direccion.FillWeight = 165F;
            this.dgvEmp_direccion.HeaderText = "DIRECCIÓN";
            this.dgvEmp_direccion.Name = "dgvEmp_direccion";
            this.dgvEmp_direccion.ReadOnly = true;
            this.dgvEmp_direccion.Width = 165;
            // 
            // dgvEmp_telefonos
            // 
            this.dgvEmp_telefonos.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvEmp_telefonos.DataPropertyName = "telefonos";
            this.dgvEmp_telefonos.FillWeight = 95F;
            this.dgvEmp_telefonos.HeaderText = "TELÉFONOS";
            this.dgvEmp_telefonos.Name = "dgvEmp_telefonos";
            this.dgvEmp_telefonos.ReadOnly = true;
            this.dgvEmp_telefonos.Width = 95;
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
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(7, 40);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 15);
            this.label1.TabIndex = 15;
            this.label1.Text = "Empresas";
            // 
            // dgvSedes
            // 
            this.dgvSedes.AllowUserToAddRows = false;
            this.dgvSedes.AllowUserToDeleteRows = false;
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
            this.dgvSedes.Location = new System.Drawing.Point(480, 410);
            this.dgvSedes.MultiSelect = false;
            this.dgvSedes.Name = "dgvSedes";
            this.dgvSedes.ReadOnly = true;
            this.dgvSedes.RowHeadersWidth = 22;
            dataGridViewCellStyle9.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle9.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvSedes.RowsDefaultCellStyle = dataGridViewCellStyle9;
            this.dgvSedes.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvSedes.Size = new System.Drawing.Size(510, 200);
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
            this.dgvSed_idSede.Visible = false;
            this.dgvSed_idSede.Width = 55;
            // 
            // dgvSed_nomSede
            // 
            this.dgvSed_nomSede.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSed_nomSede.DataPropertyName = "nomSede";
            this.dgvSed_nomSede.FillWeight = 70F;
            this.dgvSed_nomSede.HeaderText = "COD. INTERNO";
            this.dgvSed_nomSede.Name = "dgvSed_nomSede";
            this.dgvSed_nomSede.ReadOnly = true;
            this.dgvSed_nomSede.Width = 70;
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
            this.dgvSed_oficial.DataPropertyName = "sunatOficial";
            this.dgvSed_oficial.FillWeight = 55F;
            this.dgvSed_oficial.HeaderText = "SUNAT";
            this.dgvSed_oficial.Name = "dgvSed_oficial";
            this.dgvSed_oficial.ReadOnly = true;
            this.dgvSed_oficial.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvSed_oficial.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvSed_oficial.Width = 55;
            // 
            // dgvSed_codSunat
            // 
            this.dgvSed_codSunat.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSed_codSunat.DataPropertyName = "sunatCod";
            this.dgvSed_codSunat.FillWeight = 40F;
            this.dgvSed_codSunat.HeaderText = "COD. SUNAT";
            this.dgvSed_codSunat.Name = "dgvSed_codSunat";
            this.dgvSed_codSunat.ReadOnly = true;
            this.dgvSed_codSunat.Width = 40;
            // 
            // dgvSed_rutaFe
            // 
            this.dgvSed_rutaFe.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSed_rutaFe.DataPropertyName = "facEleRuta";
            this.dgvSed_rutaFe.FillWeight = 90F;
            this.dgvSed_rutaFe.HeaderText = "RUTA FACT. ELECT.";
            this.dgvSed_rutaFe.Name = "dgvSed_rutaFe";
            this.dgvSed_rutaFe.ReadOnly = true;
            this.dgvSed_rutaFe.Width = 90;
            // 
            // dgvSed_tokenFe
            // 
            this.dgvSed_tokenFe.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSed_tokenFe.DataPropertyName = "facEleToken";
            this.dgvSed_tokenFe.FillWeight = 90F;
            this.dgvSed_tokenFe.HeaderText = "TOKEN FACT. ELECT.";
            this.dgvSed_tokenFe.Name = "dgvSed_tokenFe";
            this.dgvSed_tokenFe.ReadOnly = true;
            this.dgvSed_tokenFe.Width = 90;
            // 
            // lblNeg
            // 
            this.lblNeg.Font = new System.Drawing.Font("Arial", 9F);
            this.lblNeg.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblNeg.Location = new System.Drawing.Point(65, 380);
            this.lblNeg.Name = "lblNeg";
            this.lblNeg.Size = new System.Drawing.Size(265, 15);
            this.lblNeg.TabIndex = 18;
            this.lblNeg.Text = "...";
            // 
            // lblSede
            // 
            this.lblSede.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSede.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblSede.Location = new System.Drawing.Point(518, 380);
            this.lblSede.Name = "lblSede";
            this.lblSede.Size = new System.Drawing.Size(380, 15);
            this.lblSede.TabIndex = 19;
            this.lblSede.Text = "...";
            // 
            // btnNewEmp
            // 
            this.btnNewEmp.Location = new System.Drawing.Point(907, 40);
            this.btnNewEmp.Name = "btnNewEmp";
            this.btnNewEmp.Size = new System.Drawing.Size(40, 25);
            this.btnNewEmp.TabIndex = 20;
            this.toolTip.SetToolTip(this.btnNewEmp, "Agregar nueva \"Empresa\"");
            this.btnNewEmp.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_add;
            this.btnNewEmp.Values.Text = "";
            this.btnNewEmp.Click += new System.EventHandler(this.btnNewEmp_Click);
            // 
            // btnEditEmp
            // 
            this.btnEditEmp.Location = new System.Drawing.Point(950, 40);
            this.btnEditEmp.Name = "btnEditEmp";
            this.btnEditEmp.Size = new System.Drawing.Size(40, 25);
            this.btnEditEmp.TabIndex = 21;
            this.toolTip.SetToolTip(this.btnEditEmp, "Modificar \"Empresa\"");
            this.btnEditEmp.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            this.btnEditEmp.Values.Text = "";
            this.btnEditEmp.Click += new System.EventHandler(this.btnEditEmp_Click);
            // 
            // btnEditSis
            // 
            this.btnEditSis.Location = new System.Drawing.Point(336, 380);
            this.btnEditSis.Name = "btnEditSis";
            this.btnEditSis.Size = new System.Drawing.Size(40, 25);
            this.btnEditSis.TabIndex = 25;
            this.toolTip.SetToolTip(this.btnEditSis, "Asignar \"Sistemas\"");
            this.btnEditSis.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            this.btnEditSis.Values.Text = "";
            this.btnEditSis.Click += new System.EventHandler(this.btnEditSis_Click);
            // 
            // btnEditSede
            // 
            this.btnEditSede.Location = new System.Drawing.Point(950, 380);
            this.btnEditSede.Name = "btnEditSede";
            this.btnEditSede.Size = new System.Drawing.Size(40, 25);
            this.btnEditSede.TabIndex = 29;
            this.toolTip.SetToolTip(this.btnEditSede, "Modificar \"Sede\"");
            this.btnEditSede.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            this.btnEditSede.Values.Text = "";
            this.btnEditSede.Click += new System.EventHandler(this.btnEditSede_Click);
            // 
            // btnNewSede
            // 
            this.btnNewSede.Location = new System.Drawing.Point(906, 380);
            this.btnNewSede.Name = "btnNewSede";
            this.btnNewSede.Size = new System.Drawing.Size(40, 25);
            this.btnNewSede.TabIndex = 28;
            this.toolTip.SetToolTip(this.btnNewSede, "Agregar nueva \"Sede\"");
            this.btnNewSede.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_add;
            this.btnNewSede.Values.Text = "";
            this.btnNewSede.Click += new System.EventHandler(this.btnNewSede_Click);
            // 
            // btnCancelSis
            // 
            this.btnCancelSis.Enabled = false;
            this.btnCancelSis.Location = new System.Drawing.Point(425, 380);
            this.btnCancelSis.Name = "btnCancelSis";
            this.btnCancelSis.Size = new System.Drawing.Size(40, 25);
            this.btnCancelSis.TabIndex = 31;
            this.toolTip.SetToolTip(this.btnCancelSis, "Cancelar la operación");
            this.btnCancelSis.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnCancelar;
            this.btnCancelSis.Values.Text = "";
            this.btnCancelSis.Click += new System.EventHandler(this.btnCancelSis_Click);
            // 
            // btnOkSis
            // 
            this.btnOkSis.Enabled = false;
            this.btnOkSis.Location = new System.Drawing.Point(381, 380);
            this.btnOkSis.Name = "btnOkSis";
            this.btnOkSis.Size = new System.Drawing.Size(40, 25);
            this.btnOkSis.TabIndex = 30;
            this.toolTip.SetToolTip(this.btnOkSis, "Guardar los cambios");
            this.btnOkSis.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_save;
            this.btnOkSis.Values.Text = "";
            this.btnOkSis.Click += new System.EventHandler(this.btnOkSis_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(7, 380);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(60, 15);
            this.label2.TabIndex = 32;
            this.label2.Text = "Sistemas";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(477, 380);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(43, 15);
            this.label3.TabIndex = 33;
            this.label3.Text = "Sedes";
            // 
            // dgvSis
            // 
            this.dgvSis.AllowUserToAddRows = false;
            this.dgvSis.AllowUserToDeleteRows = false;
            this.dgvSis.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvSis.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvSis_idEmpSis,
            this.dgvSis_idEmpresa,
            this.dgvSis_activo,
            this.dgvSis_idSistema,
            this.dgvSis_nomSisX});
            this.dgvSis.Location = new System.Drawing.Point(10, 410);
            this.dgvSis.MultiSelect = false;
            this.dgvSis.Name = "dgvSis";
            this.dgvSis.RowHeadersWidth = 22;
            dataGridViewCellStyle8.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle8.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvSis.RowsDefaultCellStyle = dataGridViewCellStyle8;
            this.dgvSis.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvSis.Size = new System.Drawing.Size(455, 200);
            this.dgvSis.TabIndex = 34;
            // 
            // dgvSis_idEmpSis
            // 
            this.dgvSis_idEmpSis.DataPropertyName = "idEmpSis";
            this.dgvSis_idEmpSis.HeaderText = "idEmpSis";
            this.dgvSis_idEmpSis.Name = "dgvSis_idEmpSis";
            this.dgvSis_idEmpSis.ReadOnly = true;
            this.dgvSis_idEmpSis.Visible = false;
            // 
            // dgvSis_idEmpresa
            // 
            this.dgvSis_idEmpresa.DataPropertyName = "idEmpresa";
            this.dgvSis_idEmpresa.HeaderText = "idEmpresa";
            this.dgvSis_idEmpresa.Name = "dgvSis_idEmpresa";
            this.dgvSis_idEmpresa.ReadOnly = true;
            this.dgvSis_idEmpresa.Visible = false;
            // 
            // dgvSis_activo
            // 
            this.dgvSis_activo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSis_activo.DataPropertyName = "activo";
            this.dgvSis_activo.FillWeight = 70F;
            this.dgvSis_activo.HeaderText = "ACTIVO";
            this.dgvSis_activo.Name = "dgvSis_activo";
            this.dgvSis_activo.ReadOnly = true;
            this.dgvSis_activo.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvSis_activo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvSis_activo.Width = 70;
            // 
            // dgvSis_idSistema
            // 
            this.dgvSis_idSistema.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSis_idSistema.DataPropertyName = "idSistema";
            this.dgvSis_idSistema.FillWeight = 95F;
            this.dgvSis_idSistema.HeaderText = "ID. SISTEMA";
            this.dgvSis_idSistema.Name = "dgvSis_idSistema";
            this.dgvSis_idSistema.ReadOnly = true;
            this.dgvSis_idSistema.Width = 95;
            // 
            // dgvSis_nomSisX
            // 
            this.dgvSis_nomSisX.DataPropertyName = "nomSisX";
            this.dgvSis_nomSisX.HeaderText = "NOMBRE SISTEMA";
            this.dgvSis_nomSisX.Name = "dgvSis_nomSisX";
            this.dgvSis_nomSisX.ReadOnly = true;
            // 
            // kryptonDataGridView1
            // 
            this.kryptonDataGridView1.AllowUserToAddRows = false;
            this.kryptonDataGridView1.AllowUserToDeleteRows = false;
            this.kryptonDataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.kryptonDataGridView1.Location = new System.Drawing.Point(480, 70);
            this.kryptonDataGridView1.MultiSelect = false;
            this.kryptonDataGridView1.Name = "kryptonDataGridView1";
            this.kryptonDataGridView1.ReadOnly = true;
            this.kryptonDataGridView1.RowHeadersWidth = 22;
            dataGridViewCellStyle7.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle7.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.kryptonDataGridView1.RowsDefaultCellStyle = dataGridViewCellStyle7;
            this.kryptonDataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.kryptonDataGridView1.Size = new System.Drawing.Size(510, 143);
            this.kryptonDataGridView1.TabIndex = 35;
            // 
            // kryptonDataGridView2
            // 
            this.kryptonDataGridView2.AllowUserToAddRows = false;
            this.kryptonDataGridView2.AllowUserToDeleteRows = false;
            this.kryptonDataGridView2.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.kryptonDataGridView2.Location = new System.Drawing.Point(480, 246);
            this.kryptonDataGridView2.MultiSelect = false;
            this.kryptonDataGridView2.Name = "kryptonDataGridView2";
            this.kryptonDataGridView2.ReadOnly = true;
            this.kryptonDataGridView2.RowHeadersWidth = 22;
            dataGridViewCellStyle6.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle6.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.kryptonDataGridView2.RowsDefaultCellStyle = dataGridViewCellStyle6;
            this.kryptonDataGridView2.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.kryptonDataGridView2.Size = new System.Drawing.Size(510, 112);
            this.kryptonDataGridView2.TabIndex = 36;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(477, 40);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(43, 15);
            this.label4.TabIndex = 37;
            this.label4.Text = "Sedes";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(477, 228);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(60, 15);
            this.label5.TabIndex = 38;
            this.label5.Text = "Negocios";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(7, 361);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(126, 15);
            this.label6.TabIndex = 39;
            this.label6.Text = "sistemas del negocio";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(477, 361);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(109, 15);
            this.label7.TabIndex = 40;
            this.label7.Text = "sedes del negocio";
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
            ((System.ComponentModel.ISupportInitialize)(this.dgvEmpresas)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSedes)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSis)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonDataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonDataGridView2)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private Krypton.Toolkit.KryptonDataGridView dgvEmpresas;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblSede;
        private System.Windows.Forms.Label lblNeg;
        private Krypton.Toolkit.KryptonDataGridView dgvSedes;
        private Krypton.Toolkit.KryptonButton btnNewEmp;
        private Krypton.Toolkit.KryptonButton btnEditEmp;
        private Krypton.Toolkit.KryptonButton btnEditSede;
        private Krypton.Toolkit.KryptonButton btnNewSede;
        private Krypton.Toolkit.KryptonButton btnEditSis;
        private Krypton.Toolkit.KryptonButton btnCancelSis;
        private Krypton.Toolkit.KryptonButton btnOkSis;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private Krypton.Toolkit.KryptonDataGridView dgvSis;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSis_idEmpSis;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSis_idEmpresa;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvSis_activo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSis_idSistema;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSis_nomSisX;
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
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvEmp_idTipoNeg;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvEmp_idTipoGrp;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvEmp_ruc;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvEmp_nomComercial;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvEmp_direccion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvEmp_telefonos;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvEmp_activo;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private Krypton.Toolkit.KryptonDataGridView kryptonDataGridView2;
        private Krypton.Toolkit.KryptonDataGridView kryptonDataGridView1;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
    }
}
