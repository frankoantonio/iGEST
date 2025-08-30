namespace com.yupanastudio.igest.winapp
{
    partial class FrmPersonaFind
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmPersonaFind));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvPersona = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvPersona_idPersona = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPersona_idTipoPersona = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvPersona_numDocIdent = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPersona_apeNomsX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnNew = new Krypton.Toolkit.KryptonButton();
            this.btnEdit = new Krypton.Toolkit.KryptonButton();
            this.rbtRazSoc = new Krypton.Toolkit.KryptonRadioButton();
            this.rbtDocIdent = new Krypton.Toolkit.KryptonRadioButton();
            this.label2 = new System.Windows.Forms.Label();
            this.btnFind = new Krypton.Toolkit.KryptonButton();
            this.label1 = new System.Windows.Forms.Label();
            this.txtContenido = new Krypton.Toolkit.KryptonTextBox();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPersona)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.txtContenido);
            this.pnlMain.Controls.Add(this.btnFind);
            this.pnlMain.Controls.Add(this.label2);
            this.pnlMain.Controls.Add(this.dgvPersona);
            this.pnlMain.Controls.Add(this.rbtDocIdent);
            this.pnlMain.Controls.Add(this.rbtRazSoc);
            this.pnlMain.Controls.Add(this.label1);
            this.pnlMain.Size = new System.Drawing.Size(600, 353);
            this.pnlMain.Controls.SetChildIndex(this.label1, 0);
            this.pnlMain.Controls.SetChildIndex(this.rbtRazSoc, 0);
            this.pnlMain.Controls.SetChildIndex(this.rbtDocIdent, 0);
            this.pnlMain.Controls.SetChildIndex(this.dgvPersona, 0);
            this.pnlMain.Controls.SetChildIndex(this.label2, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.btnFind, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtContenido, 0);
            // 
            // lblTitle
            // 
            this.lblTitle.Text = "BÚSQUEDA DE ___";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Controls.Add(this.btnEdit);
            this.pnlFooter.Controls.Add(this.btnNew);
            this.pnlFooter.Location = new System.Drawing.Point(0, 313);
            this.pnlFooter.TabIndex = 5;
            this.pnlFooter.Controls.SetChildIndex(this.btnOk, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnCancel, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnNew, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnEdit, 0);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(480, 6);
            this.btnCancel.TabIndex = 4;
            this.btnCancel.Tag = "";
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(360, 6);
            this.btnOk.TabIndex = 3;
            this.toolTip.SetToolTip(this.btnOk, "Seleccionar.");
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnAceptar;
            this.btnOk.Values.Text = "&Seleccionar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // dgvPersona
            // 
            this.dgvPersona.AllowUserToAddRows = false;
            this.dgvPersona.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvPersona.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dgvPersona.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvPersona_idPersona,
            this.dgvPersona_idTipoPersona,
            this.dgvPersona_numDocIdent,
            this.dgvPersona_apeNomsX});
            this.dgvPersona.Location = new System.Drawing.Point(10, 125);
            this.dgvPersona.MultiSelect = false;
            this.dgvPersona.Name = "dgvPersona";
            this.dgvPersona.RowHeadersWidth = 22;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvPersona.RowsDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvPersona.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvPersona.Size = new System.Drawing.Size(580, 178);
            this.dgvPersona.StandardTab = true;
            this.dgvPersona.TabIndex = 4;
            this.dgvPersona.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvPersona_KeyDown);
            // 
            // dgvPersona_idPersona
            // 
            this.dgvPersona_idPersona.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvPersona_idPersona.DataPropertyName = "idPersona";
            this.dgvPersona_idPersona.FillWeight = 75F;
            this.dgvPersona_idPersona.HeaderText = "ID. PERSONA";
            this.dgvPersona_idPersona.Name = "dgvPersona_idPersona";
            this.dgvPersona_idPersona.ReadOnly = true;
            this.dgvPersona_idPersona.Visible = false;
            this.dgvPersona_idPersona.Width = 75;
            // 
            // dgvPersona_idTipoPersona
            // 
            this.dgvPersona_idTipoPersona.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvPersona_idTipoPersona.DataPropertyName = "idTipoPersona";
            this.dgvPersona_idTipoPersona.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvPersona_idTipoPersona.FillWeight = 95F;
            this.dgvPersona_idTipoPersona.HeaderText = "TIPO PERSONA";
            this.dgvPersona_idTipoPersona.Name = "dgvPersona_idTipoPersona";
            this.dgvPersona_idTipoPersona.ReadOnly = true;
            this.dgvPersona_idTipoPersona.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvPersona_idTipoPersona.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvPersona_idTipoPersona.Width = 95;
            // 
            // dgvPersona_numDocIdent
            // 
            this.dgvPersona_numDocIdent.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvPersona_numDocIdent.DataPropertyName = "numDocIdent";
            this.dgvPersona_numDocIdent.FillWeight = 80F;
            this.dgvPersona_numDocIdent.HeaderText = "NRO. DOC.";
            this.dgvPersona_numDocIdent.Name = "dgvPersona_numDocIdent";
            this.dgvPersona_numDocIdent.ReadOnly = true;
            this.dgvPersona_numDocIdent.Width = 80;
            // 
            // dgvPersona_apeNomsX
            // 
            this.dgvPersona_apeNomsX.DataPropertyName = "apeNomsX";
            this.dgvPersona_apeNomsX.HeaderText = "APELLIDOS, NOMBRES / RAZÓN SOCIAL";
            this.dgvPersona_apeNomsX.Name = "dgvPersona_apeNomsX";
            this.dgvPersona_apeNomsX.ReadOnly = true;
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(10, 6);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(40, 28);
            this.btnNew.TabIndex = 1;
            this.btnNew.Tag = "btnNUEVO";
            this.toolTip.SetToolTip(this.btnNew, "Agregar nuevo registro.");
            this.btnNew.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_add;
            this.btnNew.Values.Text = "";
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(51, 6);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(40, 28);
            this.btnEdit.TabIndex = 2;
            this.btnEdit.Tag = "btnMODIFICAR";
            this.toolTip.SetToolTip(this.btnEdit, "Modificar registro.");
            this.btnEdit.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            this.btnEdit.Values.Text = "";
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // rbtRazSoc
            // 
            this.rbtRazSoc.Location = new System.Drawing.Point(278, 50);
            this.rbtRazSoc.Name = "rbtRazSoc";
            this.rbtRazSoc.Size = new System.Drawing.Size(328, 20);
            this.rbtRazSoc.TabIndex = 0;
            this.rbtRazSoc.Values.Text = "Apellidos y Nombres / Razón Social / Nombre de Grupo";
            this.rbtRazSoc.CheckedChanged += new System.EventHandler(this.rbtRazSoc_CheckedChanged);
            // 
            // rbtDocIdent
            // 
            this.rbtDocIdent.Checked = true;
            this.rbtDocIdent.Location = new System.Drawing.Point(82, 50);
            this.rbtDocIdent.Name = "rbtDocIdent";
            this.rbtDocIdent.Size = new System.Drawing.Size(183, 18);
            this.rbtDocIdent.StateNormal.ShortText.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.rbtDocIdent.TabIndex = 1;
            this.rbtDocIdent.Values.Text = "N° Documento de Identidad";
            this.rbtDocIdent.CheckedChanged += new System.EventHandler(this.rbtDocIdent_CheckedChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label2.ForeColor = System.Drawing.Color.Navy;
            this.label2.Location = new System.Drawing.Point(11, 85);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(68, 16);
            this.label2.TabIndex = 57;
            this.label2.Text = "Contenido";
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(560, 85);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(30, 22);
            this.btnFind.TabIndex = 3;
            this.btnFind.Tag = "";
            this.toolTip.SetToolTip(this.btnFind, "Realizar búsqueda.");
            this.btnFind.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_find;
            this.btnFind.Values.Text = "";
            this.btnFind.Click += new System.EventHandler(this.btnFind_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label1.ForeColor = System.Drawing.Color.Navy;
            this.label1.Location = new System.Drawing.Point(7, 50);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(72, 16);
            this.label1.TabIndex = 56;
            this.label1.Text = "Buscar por";
            // 
            // txtContenido
            // 
            this.txtContenido.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtContenido.Location = new System.Drawing.Point(82, 85);
            this.txtContenido.MaxLength = 20;
            this.txtContenido.Name = "txtContenido";
            this.txtContenido.Size = new System.Drawing.Size(477, 23);
            this.txtContenido.TabIndex = 2;
            this.txtContenido.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtContenido.Enter += new System.EventHandler(this.txtContenido_Enter);
            this.txtContenido.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtContenido_KeyDown);
            this.txtContenido.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtContenido_KeyPress);
            // 
            // FrmPersonaFind
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 353);
            this.Name = "FrmPersonaFind";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmPersonaFind_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvPersona)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private Krypton.Toolkit.KryptonDataGridView dgvPersona;
        private Krypton.Toolkit.KryptonButton btnEdit;
        private Krypton.Toolkit.KryptonButton btnNew;
        private System.Windows.Forms.Label label1;
        private Krypton.Toolkit.KryptonButton btnFind;
        private System.Windows.Forms.Label label2;
        private Krypton.Toolkit.KryptonTextBox txtContenido;
        private Krypton.Toolkit.KryptonRadioButton rbtDocIdent;
        private Krypton.Toolkit.KryptonRadioButton rbtRazSoc;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPersona_idPersona;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvPersona_idTipoPersona;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPersona_numDocIdent;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPersona_apeNomsX;
    }
}