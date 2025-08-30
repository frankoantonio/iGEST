namespace com.yupanastudio.igest.winapp
{
    partial class UcNegocios
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.label1 = new System.Windows.Forms.Label();
            this.dgvSedes = new Krypton.Toolkit.KryptonDataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.lblSedess = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.dgvSis = new Krypton.Toolkit.KryptonDataGridView();
            this.btnCancelSede = new Krypton.Toolkit.KryptonButton();
            this.btnOkSede = new Krypton.Toolkit.KryptonButton();
            this.btnEditSede = new Krypton.Toolkit.KryptonButton();
            this.btnEditSis = new Krypton.Toolkit.KryptonButton();
            this.btnCancelSis = new Krypton.Toolkit.KryptonButton();
            this.btnOkSis = new Krypton.Toolkit.KryptonButton();
            this.lblSistemas = new System.Windows.Forms.Label();
            this.lblSede = new System.Windows.Forms.Label();
            this.cmbNegocio = new System.Windows.Forms.ComboBox();
            this.cmbEmpresa = new System.Windows.Forms.ComboBox();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.dgvSedes_idNegocioSede = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSedes_idNegocio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSedes_activo = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dgvSedes_idSede = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSedes_nomSede = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSedes_dirSede = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSedes_idDistrito = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSedes_idEmpresa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSedes_oficial = new Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.dgvSedes_codSunat = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSedes_rutaFe = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSedes_tokenFe = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSis_idNegSedeSis = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSis_idNegocioSede = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSis_activo = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dgvSis_idSistema = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSis_nomSistemaX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvSis_ordenSisX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlBody.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSedes)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSis)).BeginInit();
            this.SuspendLayout();
            // 
            // lblSubtitle
            // 
            this.lblSubtitle.Text = "Asignar sedes y sistemas";
            // 
            // pnlBody
            // 
            this.pnlBody.Controls.Add(this.cmbEmpresa);
            this.pnlBody.Controls.Add(this.cmbNegocio);
            this.pnlBody.Controls.Add(this.lblSede);
            this.pnlBody.Controls.Add(this.lblSistemas);
            this.pnlBody.Controls.Add(this.btnEditSis);
            this.pnlBody.Controls.Add(this.btnCancelSis);
            this.pnlBody.Controls.Add(this.btnOkSis);
            this.pnlBody.Controls.Add(this.btnEditSede);
            this.pnlBody.Controls.Add(this.btnCancelSede);
            this.pnlBody.Controls.Add(this.btnOkSede);
            this.pnlBody.Controls.Add(this.label7);
            this.pnlBody.Controls.Add(this.dgvSis);
            this.pnlBody.Controls.Add(this.lblSedess);
            this.pnlBody.Controls.Add(this.label2);
            this.pnlBody.Controls.Add(this.label1);
            this.pnlBody.Controls.Add(this.dgvSedes);
            this.pnlBody.TabIndex = 0;
            this.pnlBody.Controls.SetChildIndex(this.dgvSedes, 0);
            this.pnlBody.Controls.SetChildIndex(this.label1, 0);
            this.pnlBody.Controls.SetChildIndex(this.label2, 0);
            this.pnlBody.Controls.SetChildIndex(this.lblSedess, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvSis, 0);
            this.pnlBody.Controls.SetChildIndex(this.label7, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnOkSede, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnCancelSede, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEditSede, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnOkSis, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnCancelSis, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEditSis, 0);
            this.pnlBody.Controls.SetChildIndex(this.lblSistemas, 0);
            this.pnlBody.Controls.SetChildIndex(this.lblSede, 0);
            this.pnlBody.Controls.SetChildIndex(this.cmbNegocio, 0);
            this.pnlBody.Controls.SetChildIndex(this.cmbEmpresa, 0);
            this.pnlBody.Controls.SetChildIndex(this.pnlHeader, 0);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(7, 40);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 15);
            this.label1.TabIndex = 17;
            this.label1.Text = "Empresas";
            // 
            // dgvSedes
            // 
            this.dgvSedes.AllowUserToAddRows = false;
            this.dgvSedes.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvSedes.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvSedes_idNegocioSede,
            this.dgvSedes_idNegocio,
            this.dgvSedes_activo,
            this.dgvSedes_idSede,
            this.dgvSedes_nomSede,
            this.dgvSedes_dirSede,
            this.dgvSedes_idDistrito,
            this.dgvSedes_idEmpresa,
            this.dgvSedes_oficial,
            this.dgvSedes_codSunat,
            this.dgvSedes_rutaFe,
            this.dgvSedes_tokenFe});
            this.dgvSedes.Location = new System.Drawing.Point(10, 130);
            this.dgvSedes.MultiSelect = false;
            this.dgvSedes.Name = "dgvSedes";
            this.dgvSedes.RowHeadersWidth = 22;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.LightGray;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.Black;
            this.dgvSedes.RowsDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvSedes.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvSedes.Size = new System.Drawing.Size(980, 245);
            this.dgvSedes.TabIndex = 3;
            this.dgvSedes.SelectionChanged += new System.EventHandler(this.dgvSedes_SelectionChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(7, 70);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(81, 15);
            this.label2.TabIndex = 19;
            this.label2.Text = "Und. Negocio";
            // 
            // lblSedess
            // 
            this.lblSedess.AutoSize = true;
            this.lblSedess.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSedess.Location = new System.Drawing.Point(7, 110);
            this.lblSedess.Name = "lblSedess";
            this.lblSedess.Size = new System.Drawing.Size(63, 15);
            this.lblSedess.TabIndex = 21;
            this.lblSedess.Text = "Sedes de:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(7, 412);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(81, 15);
            this.label7.TabIndex = 32;
            this.label7.Text = "Sistemas de:";
            // 
            // dgvSis
            // 
            this.dgvSis.AllowUserToAddRows = false;
            this.dgvSis.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvSis.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvSis_idNegSedeSis,
            this.dgvSis_idNegocioSede,
            this.dgvSis_activo,
            this.dgvSis_idSistema,
            this.dgvSis_nomSistemaX,
            this.dgvSis_ordenSisX});
            this.dgvSis.Location = new System.Drawing.Point(10, 432);
            this.dgvSis.MultiSelect = false;
            this.dgvSis.Name = "dgvSis";
            this.dgvSis.RowHeadersWidth = 22;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.LightGray;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.Black;
            this.dgvSis.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvSis.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvSis.Size = new System.Drawing.Size(980, 178);
            this.dgvSis.TabIndex = 7;
            // 
            // btnCancelSede
            // 
            this.btnCancelSede.Enabled = false;
            this.btnCancelSede.Location = new System.Drawing.Point(900, 100);
            this.btnCancelSede.Name = "btnCancelSede";
            this.btnCancelSede.Size = new System.Drawing.Size(90, 25);
            this.btnCancelSede.TabIndex = 6;
            this.toolTip1.SetToolTip(this.btnCancelSede, "Cancelar operación");
            this.btnCancelSede.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnCancelar;
            this.btnCancelSede.Values.Text = "&Cancelar";
            this.btnCancelSede.Click += new System.EventHandler(this.btnCancelSede_Click);
            // 
            // btnOkSede
            // 
            this.btnOkSede.Enabled = false;
            this.btnOkSede.Location = new System.Drawing.Point(805, 100);
            this.btnOkSede.Name = "btnOkSede";
            this.btnOkSede.Size = new System.Drawing.Size(90, 25);
            this.btnOkSede.TabIndex = 5;
            this.toolTip1.SetToolTip(this.btnOkSede, "Guardar cambios");
            this.btnOkSede.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_save;
            this.btnOkSede.Values.Text = "&Guardar";
            this.btnOkSede.Click += new System.EventHandler(this.btnOkSede_Click);
            // 
            // btnEditSede
            // 
            this.btnEditSede.Location = new System.Drawing.Point(710, 100);
            this.btnEditSede.Name = "btnEditSede";
            this.btnEditSede.Size = new System.Drawing.Size(90, 25);
            this.btnEditSede.TabIndex = 4;
            this.toolTip1.SetToolTip(this.btnEditSede, "Habilitar \"Sedes\"");
            this.btnEditSede.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            this.btnEditSede.Values.Text = "&Editar";
            this.btnEditSede.Click += new System.EventHandler(this.btnEditSede_Click);
            // 
            // btnEditSis
            // 
            this.btnEditSis.Location = new System.Drawing.Point(710, 402);
            this.btnEditSis.Name = "btnEditSis";
            this.btnEditSis.Size = new System.Drawing.Size(90, 25);
            this.btnEditSis.TabIndex = 8;
            this.toolTip1.SetToolTip(this.btnEditSis, "Habilitar \"Sistemas\"");
            this.btnEditSis.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            this.btnEditSis.Values.Text = "&Editar";
            this.btnEditSis.Click += new System.EventHandler(this.btnEditSis_Click);
            // 
            // btnCancelSis
            // 
            this.btnCancelSis.Enabled = false;
            this.btnCancelSis.Location = new System.Drawing.Point(900, 402);
            this.btnCancelSis.Name = "btnCancelSis";
            this.btnCancelSis.Size = new System.Drawing.Size(90, 25);
            this.btnCancelSis.TabIndex = 10;
            this.toolTip1.SetToolTip(this.btnCancelSis, "Cancelar operación");
            this.btnCancelSis.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnCancelar;
            this.btnCancelSis.Values.Text = "&Cancelar";
            this.btnCancelSis.Click += new System.EventHandler(this.btnCancelSis_Click);
            // 
            // btnOkSis
            // 
            this.btnOkSis.Enabled = false;
            this.btnOkSis.Location = new System.Drawing.Point(805, 402);
            this.btnOkSis.Name = "btnOkSis";
            this.btnOkSis.Size = new System.Drawing.Size(90, 25);
            this.btnOkSis.TabIndex = 9;
            this.toolTip1.SetToolTip(this.btnOkSis, "Guardar cambios");
            this.btnOkSis.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_save;
            this.btnOkSis.Values.Text = "&Guardar";
            this.btnOkSis.Click += new System.EventHandler(this.btnOkSis_Click);
            // 
            // lblSistemas
            // 
            this.lblSistemas.AutoSize = true;
            this.lblSistemas.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSistemas.ForeColor = System.Drawing.Color.DarkSlateBlue;
            this.lblSistemas.Location = new System.Drawing.Point(87, 412);
            this.lblSistemas.Name = "lblSistemas";
            this.lblSistemas.Size = new System.Drawing.Size(16, 15);
            this.lblSistemas.TabIndex = 52;
            this.lblSistemas.Text = "...";
            // 
            // lblSede
            // 
            this.lblSede.AutoSize = true;
            this.lblSede.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSede.ForeColor = System.Drawing.Color.DarkSlateBlue;
            this.lblSede.Location = new System.Drawing.Point(69, 110);
            this.lblSede.Name = "lblSede";
            this.lblSede.Size = new System.Drawing.Size(16, 15);
            this.lblSede.TabIndex = 53;
            this.lblSede.Text = "...";
            // 
            // cmbNegocio
            // 
            this.cmbNegocio.DisplayMember = "nomNegocio";
            this.cmbNegocio.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbNegocio.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbNegocio.FormattingEnabled = true;
            this.cmbNegocio.Location = new System.Drawing.Point(98, 70);
            this.cmbNegocio.Name = "cmbNegocio";
            this.cmbNegocio.Size = new System.Drawing.Size(300, 21);
            this.cmbNegocio.TabIndex = 2;
            this.cmbNegocio.ValueMember = "idEmpresa";
            this.cmbNegocio.SelectedIndexChanged += new System.EventHandler(this.cmbNegocio_SelectedIndexChanged);
            // 
            // cmbEmpresa
            // 
            this.cmbEmpresa.DisplayMember = "nomComercial";
            this.cmbEmpresa.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbEmpresa.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbEmpresa.FormattingEnabled = true;
            this.cmbEmpresa.Location = new System.Drawing.Point(98, 40);
            this.cmbEmpresa.Name = "cmbEmpresa";
            this.cmbEmpresa.Size = new System.Drawing.Size(300, 21);
            this.cmbEmpresa.TabIndex = 1;
            this.cmbEmpresa.ValueMember = "idEmpresa";
            this.cmbEmpresa.SelectedIndexChanged += new System.EventHandler(this.cmbEmpresa_SelectedIndexChanged);
            // 
            // dgvSedes_idNegocioSede
            // 
            this.dgvSedes_idNegocioSede.DataPropertyName = "idNegocioSede";
            this.dgvSedes_idNegocioSede.HeaderText = "idNegocioSede";
            this.dgvSedes_idNegocioSede.Name = "dgvSedes_idNegocioSede";
            this.dgvSedes_idNegocioSede.ReadOnly = true;
            this.dgvSedes_idNegocioSede.Visible = false;
            // 
            // dgvSedes_idNegocio
            // 
            this.dgvSedes_idNegocio.DataPropertyName = "idEmpresa";
            this.dgvSedes_idNegocio.HeaderText = "idEmpresa";
            this.dgvSedes_idNegocio.Name = "dgvSedes_idNegocio";
            this.dgvSedes_idNegocio.ReadOnly = true;
            this.dgvSedes_idNegocio.Visible = false;
            // 
            // dgvSedes_activo
            // 
            this.dgvSedes_activo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSedes_activo.DataPropertyName = "activo";
            this.dgvSedes_activo.FillWeight = 80F;
            this.dgvSedes_activo.HeaderText = "HABILITADO";
            this.dgvSedes_activo.Name = "dgvSedes_activo";
            this.dgvSedes_activo.ReadOnly = true;
            this.dgvSedes_activo.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvSedes_activo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvSedes_activo.Width = 80;
            // 
            // dgvSedes_idSede
            // 
            this.dgvSedes_idSede.DataPropertyName = "idSede";
            this.dgvSedes_idSede.HeaderText = "idSede";
            this.dgvSedes_idSede.Name = "dgvSedes_idSede";
            this.dgvSedes_idSede.ReadOnly = true;
            this.dgvSedes_idSede.Visible = false;
            // 
            // dgvSedes_nomSede
            // 
            this.dgvSedes_nomSede.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSedes_nomSede.DataPropertyName = "nomSede";
            this.dgvSedes_nomSede.FillWeight = 120F;
            this.dgvSedes_nomSede.HeaderText = "COD. SEDE";
            this.dgvSedes_nomSede.Name = "dgvSedes_nomSede";
            this.dgvSedes_nomSede.ReadOnly = true;
            this.dgvSedes_nomSede.Width = 120;
            // 
            // dgvSedes_dirSede
            // 
            this.dgvSedes_dirSede.DataPropertyName = "dirSede";
            this.dgvSedes_dirSede.HeaderText = "DIRECCIÓN";
            this.dgvSedes_dirSede.Name = "dgvSedes_dirSede";
            this.dgvSedes_dirSede.ReadOnly = true;
            // 
            // dgvSedes_idDistrito
            // 
            this.dgvSedes_idDistrito.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSedes_idDistrito.DataPropertyName = "idDistrito";
            this.dgvSedes_idDistrito.FillWeight = 80F;
            this.dgvSedes_idDistrito.HeaderText = "ID. DISTRITO";
            this.dgvSedes_idDistrito.Name = "dgvSedes_idDistrito";
            this.dgvSedes_idDistrito.ReadOnly = true;
            this.dgvSedes_idDistrito.Width = 80;
            // 
            // dgvSedes_idEmpresa
            // 
            this.dgvSedes_idEmpresa.DataPropertyName = "idEmpresa";
            this.dgvSedes_idEmpresa.HeaderText = "idEmpresa";
            this.dgvSedes_idEmpresa.Name = "dgvSedes_idEmpresa";
            this.dgvSedes_idEmpresa.ReadOnly = true;
            this.dgvSedes_idEmpresa.Visible = false;
            // 
            // dgvSedes_oficial
            // 
            this.dgvSedes_oficial.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSedes_oficial.DataPropertyName = "sunatOficial";
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.NullValue = false;
            this.dgvSedes_oficial.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvSedes_oficial.FalseValue = null;
            this.dgvSedes_oficial.FillWeight = 75F;
            this.dgvSedes_oficial.HeaderText = "V.B. SUNAT";
            this.dgvSedes_oficial.IndeterminateValue = null;
            this.dgvSedes_oficial.Name = "dgvSedes_oficial";
            this.dgvSedes_oficial.ReadOnly = true;
            this.dgvSedes_oficial.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvSedes_oficial.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvSedes_oficial.TrueValue = null;
            this.dgvSedes_oficial.Width = 75;
            // 
            // dgvSedes_codSunat
            // 
            this.dgvSedes_codSunat.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSedes_codSunat.DataPropertyName = "sunatCod";
            this.dgvSedes_codSunat.FillWeight = 80F;
            this.dgvSedes_codSunat.HeaderText = "COD. SUNAT";
            this.dgvSedes_codSunat.Name = "dgvSedes_codSunat";
            this.dgvSedes_codSunat.ReadOnly = true;
            this.dgvSedes_codSunat.Width = 80;
            // 
            // dgvSedes_rutaFe
            // 
            this.dgvSedes_rutaFe.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSedes_rutaFe.DataPropertyName = "facEleRuta";
            this.dgvSedes_rutaFe.FillWeight = 90F;
            this.dgvSedes_rutaFe.HeaderText = "RUTA F.E.";
            this.dgvSedes_rutaFe.Name = "dgvSedes_rutaFe";
            this.dgvSedes_rutaFe.ReadOnly = true;
            this.dgvSedes_rutaFe.Width = 90;
            // 
            // dgvSedes_tokenFe
            // 
            this.dgvSedes_tokenFe.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSedes_tokenFe.DataPropertyName = "facEleToken";
            this.dgvSedes_tokenFe.FillWeight = 90F;
            this.dgvSedes_tokenFe.HeaderText = "TOKEN F.E.";
            this.dgvSedes_tokenFe.Name = "dgvSedes_tokenFe";
            this.dgvSedes_tokenFe.ReadOnly = true;
            this.dgvSedes_tokenFe.Width = 90;
            // 
            // dgvSis_idNegSedeSis
            // 
            this.dgvSis_idNegSedeSis.DataPropertyName = "idNegSedeSis";
            this.dgvSis_idNegSedeSis.HeaderText = "idNegSedeSis";
            this.dgvSis_idNegSedeSis.Name = "dgvSis_idNegSedeSis";
            this.dgvSis_idNegSedeSis.ReadOnly = true;
            this.dgvSis_idNegSedeSis.Visible = false;
            // 
            // dgvSis_idNegocioSede
            // 
            this.dgvSis_idNegocioSede.DataPropertyName = "idNegocioSede";
            this.dgvSis_idNegocioSede.HeaderText = "idNegocioSede";
            this.dgvSis_idNegocioSede.Name = "dgvSis_idNegocioSede";
            this.dgvSis_idNegocioSede.ReadOnly = true;
            this.dgvSis_idNegocioSede.Visible = false;
            // 
            // dgvSis_activo
            // 
            this.dgvSis_activo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSis_activo.DataPropertyName = "activo";
            this.dgvSis_activo.FillWeight = 80F;
            this.dgvSis_activo.HeaderText = "HABILITADO";
            this.dgvSis_activo.Name = "dgvSis_activo";
            this.dgvSis_activo.ReadOnly = true;
            this.dgvSis_activo.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvSis_activo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvSis_activo.Width = 80;
            // 
            // dgvSis_idSistema
            // 
            this.dgvSis_idSistema.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSis_idSistema.DataPropertyName = "idSistema";
            this.dgvSis_idSistema.FillWeight = 80F;
            this.dgvSis_idSistema.HeaderText = "ID. SISTEMA";
            this.dgvSis_idSistema.Name = "dgvSis_idSistema";
            this.dgvSis_idSistema.ReadOnly = true;
            this.dgvSis_idSistema.Width = 80;
            // 
            // dgvSis_nomSistemaX
            // 
            this.dgvSis_nomSistemaX.DataPropertyName = "nomSistemaX";
            this.dgvSis_nomSistemaX.HeaderText = "NOM. SISTEMA";
            this.dgvSis_nomSistemaX.Name = "dgvSis_nomSistemaX";
            this.dgvSis_nomSistemaX.ReadOnly = true;
            // 
            // dgvSis_ordenSisX
            // 
            this.dgvSis_ordenSisX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvSis_ordenSisX.DataPropertyName = "ordenSisX";
            this.dgvSis_ordenSisX.FillWeight = 80F;
            this.dgvSis_ordenSisX.HeaderText = "ORDEN";
            this.dgvSis_ordenSisX.Name = "dgvSis_ordenSisX";
            this.dgvSis_ordenSisX.ReadOnly = true;
            this.dgvSis_ordenSisX.Width = 80;
            // 
            // UcNegocios
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Name = "UcNegocios";
            this.Load += new System.EventHandler(this.UcNegocios_Load);
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlBody.ResumeLayout(false);
            this.pnlBody.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSedes)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSis)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private Krypton.Toolkit.KryptonDataGridView dgvSedes;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lblSedess;
        private System.Windows.Forms.Label label7;
        private Krypton.Toolkit.KryptonDataGridView dgvSis;
        private Krypton.Toolkit.KryptonButton btnCancelSede;
        private Krypton.Toolkit.KryptonButton btnOkSede;
        private Krypton.Toolkit.KryptonButton btnEditSede;
        private Krypton.Toolkit.KryptonButton btnEditSis;
        private Krypton.Toolkit.KryptonButton btnCancelSis;
        private Krypton.Toolkit.KryptonButton btnOkSis;
        private System.Windows.Forms.Label lblSistemas;
        private System.Windows.Forms.Label lblSede;
        private System.Windows.Forms.ComboBox cmbEmpresa;
        private System.Windows.Forms.ComboBox cmbNegocio;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSis_idNegSedeSis;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSis_idNegocioSede;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvSis_activo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSis_idSistema;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSis_nomSistemaX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSis_ordenSisX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSedes_idNegocioSede;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSedes_idNegocio;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvSedes_activo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSedes_idSede;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSedes_nomSede;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSedes_dirSede;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSedes_idDistrito;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSedes_idEmpresa;
        private Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn dgvSedes_oficial;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSedes_codSunat;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSedes_rutaFe;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvSedes_tokenFe;
    }
}
