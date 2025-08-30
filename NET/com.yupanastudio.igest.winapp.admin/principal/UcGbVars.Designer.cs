namespace com.yupanastudio.igest.winapp
{
    partial class UcGbVars
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvGbVar = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvGbVar_idGbVar = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvGbVar_idEmpresa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvGbVar_nomEmpX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvGbVar_idSistema = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvGbVar_nomGbVar = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvGbVar_valor = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvGbVar_descripcion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnCopy = new Krypton.Toolkit.KryptonButton();
            this.btnSave = new Krypton.Toolkit.KryptonButton();
            this.btnCancel = new Krypton.Toolkit.KryptonButton();
            this.btnEdit = new Krypton.Toolkit.KryptonButton();
            this.cmbEmpresa = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.cmbVarGb = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.rbtVarGb = new Krypton.Toolkit.KryptonRadioButton();
            this.rbtEmpresa = new Krypton.Toolkit.KryptonRadioButton();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlBody.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvGbVar)).BeginInit();
            this.SuspendLayout();
            // 
            // lblSubtitle
            // 
            this.lblSubtitle.Location = new System.Drawing.Point(596, 4);
            this.lblSubtitle.Text = "Control de \"Variables Globales\"";
            // 
            // pnlBody
            // 
            this.pnlBody.Controls.Add(this.rbtVarGb);
            this.pnlBody.Controls.Add(this.rbtEmpresa);
            this.pnlBody.Controls.Add(this.cmbVarGb);
            this.pnlBody.Controls.Add(this.cmbEmpresa);
            this.pnlBody.Controls.Add(this.btnCancel);
            this.pnlBody.Controls.Add(this.btnSave);
            this.pnlBody.Controls.Add(this.btnCopy);
            this.pnlBody.Controls.Add(this.btnEdit);
            this.pnlBody.Controls.Add(this.dgvGbVar);
            this.pnlBody.Controls.SetChildIndex(this.dgvGbVar, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEdit, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnCopy, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnSave, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnCancel, 0);
            this.pnlBody.Controls.SetChildIndex(this.cmbEmpresa, 0);
            this.pnlBody.Controls.SetChildIndex(this.cmbVarGb, 0);
            this.pnlBody.Controls.SetChildIndex(this.rbtEmpresa, 0);
            this.pnlBody.Controls.SetChildIndex(this.rbtVarGb, 0);
            this.pnlBody.Controls.SetChildIndex(this.pnlHeader, 0);
            // 
            // dgvGbVar
            // 
            this.dgvGbVar.AllowUserToAddRows = false;
            this.dgvGbVar.AllowUserToDeleteRows = false;
            this.dgvGbVar.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvGbVar.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvGbVar_idGbVar,
            this.dgvGbVar_idEmpresa,
            this.dgvGbVar_nomEmpX,
            this.dgvGbVar_idSistema,
            this.dgvGbVar_nomGbVar,
            this.dgvGbVar_valor,
            this.dgvGbVar_descripcion});
            this.dgvGbVar.Location = new System.Drawing.Point(10, 60);
            this.dgvGbVar.MultiSelect = false;
            this.dgvGbVar.Name = "dgvGbVar";
            this.dgvGbVar.RowHeadersWidth = 22;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvGbVar.RowsDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvGbVar.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvGbVar.Size = new System.Drawing.Size(980, 550);
            this.dgvGbVar.TabIndex = 8;
            // 
            // dgvGbVar_idGbVar
            // 
            this.dgvGbVar_idGbVar.DataPropertyName = "idVarGb";
            this.dgvGbVar_idGbVar.FillWeight = 39.28729F;
            this.dgvGbVar_idGbVar.HeaderText = "idVarGb";
            this.dgvGbVar_idGbVar.Name = "dgvGbVar_idGbVar";
            this.dgvGbVar_idGbVar.ReadOnly = true;
            this.dgvGbVar_idGbVar.Visible = false;
            // 
            // dgvGbVar_idEmpresa
            // 
            this.dgvGbVar_idEmpresa.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvGbVar_idEmpresa.DataPropertyName = "idEmpresa";
            this.dgvGbVar_idEmpresa.FillWeight = 55F;
            this.dgvGbVar_idEmpresa.HeaderText = "ID. EMP.";
            this.dgvGbVar_idEmpresa.Name = "dgvGbVar_idEmpresa";
            this.dgvGbVar_idEmpresa.ReadOnly = true;
            this.dgvGbVar_idEmpresa.Width = 55;
            // 
            // dgvGbVar_nomEmpX
            // 
            this.dgvGbVar_nomEmpX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvGbVar_nomEmpX.DataPropertyName = "nomEmpX";
            this.dgvGbVar_nomEmpX.FillWeight = 125F;
            this.dgvGbVar_nomEmpX.HeaderText = "NOM. EMPRESA";
            this.dgvGbVar_nomEmpX.Name = "dgvGbVar_nomEmpX";
            this.dgvGbVar_nomEmpX.ReadOnly = true;
            this.dgvGbVar_nomEmpX.Width = 125;
            // 
            // dgvGbVar_idSistema
            // 
            this.dgvGbVar_idSistema.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvGbVar_idSistema.DataPropertyName = "idSistema";
            this.dgvGbVar_idSistema.FillWeight = 80F;
            this.dgvGbVar_idSistema.HeaderText = "ID. SISTEMA";
            this.dgvGbVar_idSistema.Name = "dgvGbVar_idSistema";
            this.dgvGbVar_idSistema.ReadOnly = true;
            this.dgvGbVar_idSistema.Width = 80;
            // 
            // dgvGbVar_nomGbVar
            // 
            this.dgvGbVar_nomGbVar.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvGbVar_nomGbVar.DataPropertyName = "nomVarGb";
            this.dgvGbVar_nomGbVar.FillWeight = 125F;
            this.dgvGbVar_nomGbVar.HeaderText = "NOMBRE VARIABLE";
            this.dgvGbVar_nomGbVar.Name = "dgvGbVar_nomGbVar";
            this.dgvGbVar_nomGbVar.ReadOnly = true;
            this.dgvGbVar_nomGbVar.Width = 125;
            // 
            // dgvGbVar_valor
            // 
            this.dgvGbVar_valor.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvGbVar_valor.DataPropertyName = "valor";
            this.dgvGbVar_valor.FillWeight = 200F;
            this.dgvGbVar_valor.HeaderText = "VALOR";
            this.dgvGbVar_valor.Name = "dgvGbVar_valor";
            this.dgvGbVar_valor.ReadOnly = true;
            this.dgvGbVar_valor.Width = 200;
            // 
            // dgvGbVar_descripcion
            // 
            this.dgvGbVar_descripcion.DataPropertyName = "descripcion";
            this.dgvGbVar_descripcion.HeaderText = "DESCRIPCIÓN";
            this.dgvGbVar_descripcion.Name = "dgvGbVar_descripcion";
            this.dgvGbVar_descripcion.ReadOnly = true;
            // 
            // btnCopy
            // 
            this.btnCopy.Location = new System.Drawing.Point(824, 33);
            this.btnCopy.Name = "btnCopy";
            this.btnCopy.Size = new System.Drawing.Size(40, 25);
            this.btnCopy.TabIndex = 4;
            this.toolTip.SetToolTip(this.btnCopy, "Copiar variables a empresas");
            this.btnCopy.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_copy;
            this.btnCopy.Values.Text = "";
            this.btnCopy.Click += new System.EventHandler(this.btnCopy_Click);
            // 
            // btnSave
            // 
            this.btnSave.Enabled = false;
            this.btnSave.Location = new System.Drawing.Point(908, 33);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(40, 25);
            this.btnSave.TabIndex = 6;
            this.toolTip.SetToolTip(this.btnSave, "Guardar los cambios");
            this.btnSave.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_save;
            this.btnSave.Values.Text = "";
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Enabled = false;
            this.btnCancel.Location = new System.Drawing.Point(950, 33);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(40, 25);
            this.btnCancel.TabIndex = 7;
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación");
            this.btnCancel.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnCancelar;
            this.btnCancel.Values.Text = "";
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(866, 33);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(40, 25);
            this.btnEdit.TabIndex = 5;
            this.toolTip.SetToolTip(this.btnEdit, "Modificar \"Variables\"");
            this.btnEdit.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            this.btnEdit.Values.Text = "";
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // cmbEmpresa
            // 
            this.cmbEmpresa.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbEmpresa.DisplayMember = "nomComercial";
            this.cmbEmpresa.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbEmpresa.DropDownWidth = 250;
            this.cmbEmpresa.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbEmpresa.FormattingEnabled = true;
            this.cmbEmpresa.Location = new System.Drawing.Point(148, 33);
            this.cmbEmpresa.Name = "cmbEmpresa";
            this.cmbEmpresa.Size = new System.Drawing.Size(180, 21);
            this.cmbEmpresa.TabIndex = 1;
            this.cmbEmpresa.ValueMember = "idEmpresa";
            this.cmbEmpresa.SelectedIndexChanged += new System.EventHandler(this.cmbEmpresa_SelectedIndexChanged);
            // 
            // cmbVarGb
            // 
            this.cmbVarGb.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbVarGb.DisplayMember = "nomVarGb";
            this.cmbVarGb.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbVarGb.Enabled = false;
            this.cmbVarGb.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbVarGb.FormattingEnabled = true;
            this.cmbVarGb.Location = new System.Drawing.Point(483, 33);
            this.cmbVarGb.Name = "cmbVarGb";
            this.cmbVarGb.Size = new System.Drawing.Size(180, 21);
            this.cmbVarGb.TabIndex = 3;
            this.cmbVarGb.ValueMember = "idVarGb";
            this.cmbVarGb.SelectedIndexChanged += new System.EventHandler(this.cmbVarGb_SelectedIndexChanged);
            // 
            // rbtVarGb
            // 
            this.rbtVarGb.Location = new System.Drawing.Point(347, 33);
            this.rbtVarGb.Name = "rbtVarGb";
            this.rbtVarGb.Size = new System.Drawing.Size(133, 20);
            this.rbtVarGb.TabIndex = 2;
            this.rbtVarGb.TabStop = false;
            this.rbtVarGb.Values.Text = "Filtrar por \"Variable\"";
            this.rbtVarGb.CheckedChanged += new System.EventHandler(this.rbtEmpresa_CheckedChanged);
            // 
            // rbtEmpresa
            // 
            this.rbtEmpresa.Checked = true;
            this.rbtEmpresa.Location = new System.Drawing.Point(10, 33);
            this.rbtEmpresa.Name = "rbtEmpresa";
            this.rbtEmpresa.Size = new System.Drawing.Size(135, 20);
            this.rbtEmpresa.TabIndex = 0;
            this.rbtEmpresa.TabStop = false;
            this.rbtEmpresa.Values.Text = "Filtrar por \"Empresa\"";
            this.rbtEmpresa.CheckedChanged += new System.EventHandler(this.rbtEmpresa_CheckedChanged);
            // 
            // UcGbVars
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Name = "UcGbVars";
            this.Load += new System.EventHandler(this.UcGbVars_Load);
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlBody.ResumeLayout(false);
            this.pnlBody.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvGbVar)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private Krypton.Toolkit.KryptonDataGridView dgvGbVar;
        private Krypton.Toolkit.KryptonButton btnCopy;
        private Krypton.Toolkit.KryptonButton btnCancel;
        private Krypton.Toolkit.KryptonButton btnSave;
        private Krypton.Toolkit.KryptonButton btnEdit;
        private ComboBoxMy cmbVarGb;
        private ComboBoxMy cmbEmpresa;
        private Krypton.Toolkit.KryptonRadioButton rbtVarGb;
        private Krypton.Toolkit.KryptonRadioButton rbtEmpresa;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvGbVar_idGbVar;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvGbVar_idEmpresa;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvGbVar_nomEmpX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvGbVar_idSistema;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvGbVar_nomGbVar;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvGbVar_valor;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvGbVar_descripcion;
    }
}
