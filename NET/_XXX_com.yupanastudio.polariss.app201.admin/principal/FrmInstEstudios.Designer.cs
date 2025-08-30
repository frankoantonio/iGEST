namespace com.yupanastudio.polariss.app
{
    partial class FrmInstEstudios
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmInstEstudios));
            this.label19 = new System.Windows.Forms.Label();
            this.txtNombre = new Krypton.Toolkit.KryptonTextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.cmbTipoInst = new com.yupanastudio.polariss.app.ComboBoxMy();
            this.label9 = new System.Windows.Forms.Label();
            this.txtSigla = new Krypton.Toolkit.KryptonTextBox();
            this.dgvInst = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvInst_idInstEst = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvInst_idTipoInst = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvInst_nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvInst_ciudad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvInst_sigla = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvInst_countUsoX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtFind = new Krypton.Toolkit.KryptonTextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.btnFind = new Krypton.Toolkit.KryptonButton();
            this.btnNew = new Krypton.Toolkit.KryptonButton();
            this.btnEdit = new Krypton.Toolkit.KryptonButton();
            this.gbx2 = new Krypton.Toolkit.KryptonGroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtCiudad = new Krypton.Toolkit.KryptonTextBox();
            this.btnSave = new Krypton.Toolkit.KryptonButton();
            this.btnCancelOper = new Krypton.Toolkit.KryptonButton();
            this.label27 = new System.Windows.Forms.Label();
            this.lblMsgFind = new System.Windows.Forms.Label();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvInst)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx2.Panel)).BeginInit();
            this.gbx2.Panel.SuspendLayout();
            this.gbx2.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.txtFind);
            this.pnlMain.Controls.Add(this.lblMsgFind);
            this.pnlMain.Controls.Add(this.label27);
            this.pnlMain.Controls.Add(this.gbx2);
            this.pnlMain.Controls.Add(this.btnNew);
            this.pnlMain.Controls.Add(this.btnEdit);
            this.pnlMain.Controls.Add(this.btnFind);
            this.pnlMain.Controls.Add(this.label11);
            this.pnlMain.Controls.Add(this.dgvInst);
            this.pnlMain.Controls.Add(this.btnSave);
            this.pnlMain.Controls.Add(this.btnCancelOper);
            this.pnlMain.Size = new System.Drawing.Size(600, 367);
            this.pnlMain.Controls.SetChildIndex(this.btnCancelOper, 0);
            this.pnlMain.Controls.SetChildIndex(this.btnSave, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.dgvInst, 0);
            this.pnlMain.Controls.SetChildIndex(this.label11, 0);
            this.pnlMain.Controls.SetChildIndex(this.btnFind, 0);
            this.pnlMain.Controls.SetChildIndex(this.btnEdit, 0);
            this.pnlMain.Controls.SetChildIndex(this.btnNew, 0);
            this.pnlMain.Controls.SetChildIndex(this.gbx2, 0);
            this.pnlMain.Controls.SetChildIndex(this.label27, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblMsgFind, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtFind, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(600, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(190, 20);
            this.lblTitle.Text = "INSTITUCIÓN DE ESTUDIOS";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 325);
            this.pnlFooter.Size = new System.Drawing.Size(600, 40);
            this.pnlFooter.TabIndex = 8;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(305, 6);
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar selección.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(185, 6);
            this.toolTip.SetToolTip(this.btnOk, "Seleccionar \"Inst. de Estudio\".");
            this.btnOk.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnOk.Values.Image")));
            this.btnOk.Values.Text = "&Seleccionar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(461, 6);
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.BackColor = System.Drawing.Color.Transparent;
            this.label19.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label19.Location = new System.Drawing.Point(5, 45);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(52, 15);
            this.label19.TabIndex = 65;
            this.label19.Text = "Nombre";
            this.label19.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtNombre
            // 
            this.txtNombre.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtNombre.Enabled = false;
            this.txtNombre.Location = new System.Drawing.Point(59, 45);
            this.txtNombre.MaxLength = 75;
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(292, 23);
            this.txtNombre.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtNombre.TabIndex = 2;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.BackColor = System.Drawing.Color.Transparent;
            this.label8.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label8.Location = new System.Drawing.Point(26, 15);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(31, 15);
            this.label8.TabIndex = 67;
            this.label8.Text = "Tipo";
            this.label8.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbTipoInst
            // 
            this.cmbTipoInst.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbTipoInst.DisplayMember = "nomTipo";
            this.cmbTipoInst.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTipoInst.Enabled = false;
            this.cmbTipoInst.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbTipoInst.FormattingEnabled = true;
            this.cmbTipoInst.Items.AddRange(new object[] {
            "Educación Básica",
            "Educación Técnica 1 año",
            "Educación Tecnica 3 años",
            "Escuelas de Artes y culturales",
            "Escualas de militares",
            "Escuales policiales",
            "Universidades",
            "Otros"});
            this.cmbTipoInst.Location = new System.Drawing.Point(59, 15);
            this.cmbTipoInst.Name = "cmbTipoInst";
            this.cmbTipoInst.Size = new System.Drawing.Size(292, 21);
            this.cmbTipoInst.TabIndex = 0;
            this.cmbTipoInst.ValueMember = "idTipo";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.BackColor = System.Drawing.Color.Transparent;
            this.label9.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label9.Location = new System.Drawing.Point(381, 15);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(35, 15);
            this.label9.TabIndex = 68;
            this.label9.Text = "Sigla";
            this.label9.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtSigla
            // 
            this.txtSigla.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtSigla.Enabled = false;
            this.txtSigla.Location = new System.Drawing.Point(418, 15);
            this.txtSigla.MaxLength = 25;
            this.txtSigla.Name = "txtSigla";
            this.txtSigla.Size = new System.Drawing.Size(150, 23);
            this.txtSigla.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtSigla.TabIndex = 1;
            // 
            // dgvInst
            // 
            this.dgvInst.AllowUserToAddRows = false;
            this.dgvInst.AllowUserToDeleteRows = false;
            this.dgvInst.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvInst.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvInst_idInstEst,
            this.dgvInst_idTipoInst,
            this.dgvInst_nombre,
            this.dgvInst_ciudad,
            this.dgvInst_sigla,
            this.dgvInst_countUsoX});
            this.dgvInst.Location = new System.Drawing.Point(10, 95);
            this.dgvInst.MultiSelect = false;
            this.dgvInst.Name = "dgvInst";
            this.dgvInst.ReadOnly = true;
            this.dgvInst.RowHeadersWidth = 22;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvInst.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvInst.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvInst.Size = new System.Drawing.Size(580, 89);
            this.dgvInst.StandardTab = true;
            this.dgvInst.TabIndex = 2;
            this.dgvInst.SelectionChanged += new System.EventHandler(this.dgvInst_SelectionChanged);
            this.dgvInst.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvInst_KeyDown);
            // 
            // dgvInst_idInstEst
            // 
            this.dgvInst_idInstEst.DataPropertyName = "idInstEst";
            this.dgvInst_idInstEst.HeaderText = "idInstEst";
            this.dgvInst_idInstEst.Name = "dgvInst_idInstEst";
            this.dgvInst_idInstEst.ReadOnly = true;
            this.dgvInst_idInstEst.Visible = false;
            // 
            // dgvInst_idTipoInst
            // 
            this.dgvInst_idTipoInst.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvInst_idTipoInst.DataPropertyName = "idTipoInst";
            this.dgvInst_idTipoInst.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvInst_idTipoInst.FillWeight = 130F;
            this.dgvInst_idTipoInst.HeaderText = "TIPO";
            this.dgvInst_idTipoInst.Name = "dgvInst_idTipoInst";
            this.dgvInst_idTipoInst.ReadOnly = true;
            this.dgvInst_idTipoInst.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvInst_idTipoInst.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvInst_idTipoInst.Width = 130;
            // 
            // dgvInst_nombre
            // 
            this.dgvInst_nombre.DataPropertyName = "nombre";
            this.dgvInst_nombre.HeaderText = "NOMBRE";
            this.dgvInst_nombre.Name = "dgvInst_nombre";
            this.dgvInst_nombre.ReadOnly = true;
            // 
            // dgvInst_ciudad
            // 
            this.dgvInst_ciudad.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvInst_ciudad.DataPropertyName = "ciudad";
            this.dgvInst_ciudad.FillWeight = 80F;
            this.dgvInst_ciudad.HeaderText = "CIUDAD";
            this.dgvInst_ciudad.Name = "dgvInst_ciudad";
            this.dgvInst_ciudad.ReadOnly = true;
            this.dgvInst_ciudad.Width = 80;
            // 
            // dgvInst_sigla
            // 
            this.dgvInst_sigla.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvInst_sigla.DataPropertyName = "sigla";
            this.dgvInst_sigla.FillWeight = 70F;
            this.dgvInst_sigla.HeaderText = "SIGLA";
            this.dgvInst_sigla.Name = "dgvInst_sigla";
            this.dgvInst_sigla.ReadOnly = true;
            this.dgvInst_sigla.Width = 70;
            // 
            // dgvInst_countUsoX
            // 
            this.dgvInst_countUsoX.DataPropertyName = "countUsoX";
            this.dgvInst_countUsoX.HeaderText = "countUsoX";
            this.dgvInst_countUsoX.Name = "dgvInst_countUsoX";
            this.dgvInst_countUsoX.ReadOnly = true;
            this.dgvInst_countUsoX.Visible = false;
            // 
            // txtFind
            // 
            this.txtFind.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtFind.Location = new System.Drawing.Point(56, 50);
            this.txtFind.MaxLength = 25;
            this.txtFind.Name = "txtFind";
            this.txtFind.Size = new System.Drawing.Size(503, 23);
            this.txtFind.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtFind.TabIndex = 0;
            this.txtFind.Enter += new System.EventHandler(this.txtFind_Enter);
            this.txtFind.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtFind_KeyDown);
            this.txtFind.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtFind_KeyPress);
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.BackColor = System.Drawing.Color.Transparent;
            this.label11.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label11.Location = new System.Drawing.Point(8, 50);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(46, 15);
            this.label11.TabIndex = 74;
            this.label11.Text = "Buscar";
            this.label11.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(560, 50);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(30, 22);
            this.btnFind.TabIndex = 1;
            this.toolTip.SetToolTip(this.btnFind, "Buscar por nombre o sigla.");
            this.btnFind.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnFind.Values.Image")));
            this.btnFind.Values.Text = "";
            this.btnFind.Click += new System.EventHandler(this.btnFind_Click);
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(509, 198);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(40, 25);
            this.btnNew.TabIndex = 3;
            this.toolTip.SetToolTip(this.btnNew, "Crear nueva \"Inst.  de Estudio\".");
            this.btnNew.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnNew.Values.Image")));
            this.btnNew.Values.Text = "";
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(550, 198);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(40, 25);
            this.btnEdit.TabIndex = 4;
            this.toolTip.SetToolTip(this.btnEdit, "Modificar \"Inst. de Estudio\".");
            this.btnEdit.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnEdit.Values.Image")));
            this.btnEdit.Values.Text = "";
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // gbx2
            // 
            this.gbx2.CaptionStyle = Krypton.Toolkit.LabelStyle.NormalControl;
            this.gbx2.Location = new System.Drawing.Point(10, 225);
            this.gbx2.Name = "gbx2";
            // 
            // gbx2.Panel
            // 
            this.gbx2.Panel.Controls.Add(this.label1);
            this.gbx2.Panel.Controls.Add(this.txtCiudad);
            this.gbx2.Panel.Controls.Add(this.label9);
            this.gbx2.Panel.Controls.Add(this.label19);
            this.gbx2.Panel.Controls.Add(this.cmbTipoInst);
            this.gbx2.Panel.Controls.Add(this.txtSigla);
            this.gbx2.Panel.Controls.Add(this.label8);
            this.gbx2.Panel.Controls.Add(this.txtNombre);
            this.gbx2.Size = new System.Drawing.Size(580, 85);
            this.gbx2.StateCommon.Back.Color1 = System.Drawing.Color.PaleTurquoise;
            this.gbx2.StateCommon.Content.ShortText.Font = new System.Drawing.Font("Arial", 9F);
            this.gbx2.TabIndex = 7;
            this.gbx2.Values.Heading = "";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(369, 45);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(47, 15);
            this.label1.TabIndex = 70;
            this.label1.Text = "Ciudad";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtCiudad
            // 
            this.txtCiudad.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtCiudad.Enabled = false;
            this.txtCiudad.Location = new System.Drawing.Point(418, 45);
            this.txtCiudad.MaxLength = 50;
            this.txtCiudad.Name = "txtCiudad";
            this.txtCiudad.Size = new System.Drawing.Size(150, 23);
            this.txtCiudad.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtCiudad.TabIndex = 3;
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(509, 198);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(40, 25);
            this.btnSave.TabIndex = 5;
            this.toolTip.SetToolTip(this.btnSave, "Guardar \"Inst.  de Estudios\".");
            this.btnSave.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnSave.Values.Image")));
            this.btnSave.Values.Text = "";
            this.btnSave.Visible = false;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnCancelOper
            // 
            this.btnCancelOper.Location = new System.Drawing.Point(550, 198);
            this.btnCancelOper.Name = "btnCancelOper";
            this.btnCancelOper.Size = new System.Drawing.Size(40, 25);
            this.btnCancelOper.TabIndex = 6;
            this.toolTip.SetToolTip(this.btnCancelOper, "Cancelar esta operación.");
            this.btnCancelOper.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancelOper.Values.Image")));
            this.btnCancelOper.Values.Text = "";
            this.btnCancelOper.Visible = false;
            this.btnCancelOper.Click += new System.EventHandler(this.btnCancelOper_Click);
            // 
            // label27
            // 
            this.label27.AutoSize = true;
            this.label27.BackColor = System.Drawing.Color.Transparent;
            this.label27.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label27.Location = new System.Drawing.Point(8, 205);
            this.label27.Name = "label27";
            this.label27.Size = new System.Drawing.Size(137, 16);
            this.label27.TabIndex = 95;
            this.label27.Text = "Institución de estudios";
            this.label27.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // lblMsgFind
            // 
            this.lblMsgFind.AutoSize = true;
            this.lblMsgFind.BackColor = System.Drawing.Color.Transparent;
            this.lblMsgFind.Font = new System.Drawing.Font("Microsoft Sans Serif", 7F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMsgFind.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblMsgFind.Location = new System.Drawing.Point(52, 69);
            this.lblMsgFind.Name = "lblMsgFind";
            this.lblMsgFind.Size = new System.Drawing.Size(222, 13);
            this.lblMsgFind.TabIndex = 109;
            this.lblMsgFind.Text = "Escribe el nombre de la institución de estudios";
            // 
            // FrmInstEstudios
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 365);
            this.Name = "FrmInstEstudios";
            this.Text = "EmpresaFrm";
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvInst)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx2.Panel)).EndInit();
            this.gbx2.Panel.ResumeLayout(false);
            this.gbx2.Panel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx2)).EndInit();
            this.gbx2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Label label19;
        private Krypton.Toolkit.KryptonTextBox txtNombre;
        private Krypton.Toolkit.KryptonTextBox txtSigla;
        private System.Windows.Forms.Label label9;
        private ComboBoxMy cmbTipoInst;
        private System.Windows.Forms.Label label8;
        private Krypton.Toolkit.KryptonDataGridView dgvInst;
        private Krypton.Toolkit.KryptonTextBox txtFind;
        private System.Windows.Forms.Label label11;
        private Krypton.Toolkit.KryptonButton btnFind;
        private Krypton.Toolkit.KryptonButton btnNew;
        private Krypton.Toolkit.KryptonButton btnEdit;
        private Krypton.Toolkit.KryptonGroupBox gbx2;
        private Krypton.Toolkit.KryptonButton btnSave;
        private Krypton.Toolkit.KryptonButton btnCancelOper;
        private System.Windows.Forms.Label label27;
        private System.Windows.Forms.Label lblMsgFind;
        private System.Windows.Forms.Label label1;
        private Krypton.Toolkit.KryptonTextBox txtCiudad;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvInst_idInstEst;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvInst_idTipoInst;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvInst_nombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvInst_ciudad;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvInst_sigla;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvInst_countUsoX;
    }
}