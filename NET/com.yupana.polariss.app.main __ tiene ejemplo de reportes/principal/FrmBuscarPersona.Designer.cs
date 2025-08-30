namespace com.yupana.polariss.app.main.principal
{
    partial class FrmBuscarPersona
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmBuscarPersona));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.gbx1 = new ComponentFactory.Krypton.Toolkit.KryptonGroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txtFind = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.rbtApeNoms = new ComponentFactory.Krypton.Toolkit.KryptonRadioButton();
            this.rbtDocIdent = new ComponentFactory.Krypton.Toolkit.KryptonRadioButton();
            this.btnFind = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.dgvPersonas = new ComponentFactory.Krypton.Toolkit.KryptonDataGridView();
            this.dgvPersonas_selX = new ComponentFactory.Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.dgvPersonas_idPersona = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPersonas_tipoPerX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPersonas_docIdent = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPersonas_apeNomsX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPersonas_sigla = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPersonas_perConRuc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnAdd = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnEdit = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.lblCantPersona = new System.Windows.Forms.Label();
            this.lnkSel = new ComponentFactory.Krypton.Toolkit.KryptonLinkLabel();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1.Panel)).BeginInit();
            this.gbx1.Panel.SuspendLayout();
            this.gbx1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPersonas)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.lnkSel);
            this.pnlMain.Controls.Add(this.lblCantPersona);
            this.pnlMain.Controls.Add(this.dgvPersonas);
            this.pnlMain.Controls.Add(this.gbx1);
            this.pnlMain.Size = new System.Drawing.Size(550, 355);
            this.pnlMain.TabIndex = 0;
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.gbx1, 0);
            this.pnlMain.Controls.SetChildIndex(this.dgvPersonas, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblCantPersona, 0);
            this.pnlMain.Controls.SetChildIndex(this.lnkSel, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(553, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(108, 15);
            this.lblTitle.Text = "Buscar Persona";
            // 
            // imgTitle
            // 
            this.imgTitle.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_find;
            // 
            // pnlFooter
            // 
            this.pnlFooter.Controls.Add(this.btnEdit);
            this.pnlFooter.Controls.Add(this.btnAdd);
            this.pnlFooter.Location = new System.Drawing.Point(0, 315);
            this.pnlFooter.Size = new System.Drawing.Size(550, 40);
            this.pnlFooter.Controls.SetChildIndex(this.btnOk, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnCancel, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnAdd, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnEdit, 0);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(430, 6);
            this.btnCancel.TabIndex = 8;
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(315, 6);
            this.btnOk.TabIndex = 7;
            this.btnOk.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnOk.Values.Image")));
            this.btnOk.Values.Text = "&Seleccionar";
            this.btnOk.Click += new System.EventHandler(this.BtnOk_Click);
            // 
            // gbx1
            // 
            this.gbx1.CaptionStyle = ComponentFactory.Krypton.Toolkit.LabelStyle.BoldPanel;
            this.gbx1.GroupBackStyle = ComponentFactory.Krypton.Toolkit.PaletteBackStyle.GridHeaderColumnList;
            this.gbx1.Location = new System.Drawing.Point(10, 35);
            this.gbx1.Name = "gbx1";
            // 
            // gbx1.Panel
            // 
            this.gbx1.Panel.Controls.Add(this.label2);
            this.gbx1.Panel.Controls.Add(this.label1);
            this.gbx1.Panel.Controls.Add(this.txtFind);
            this.gbx1.Panel.Controls.Add(this.rbtApeNoms);
            this.gbx1.Panel.Controls.Add(this.rbtDocIdent);
            this.gbx1.Panel.Controls.Add(this.btnFind);
            this.gbx1.Size = new System.Drawing.Size(530, 65);
            this.gbx1.TabIndex = 0;
            this.gbx1.Values.Heading = "";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Navy;
            this.label2.Location = new System.Drawing.Point(13, 30);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(55, 13);
            this.label2.TabIndex = 15;
            this.label2.Text = "Contenido";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Navy;
            this.label1.Location = new System.Drawing.Point(10, 5);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(58, 13);
            this.label1.TabIndex = 14;
            this.label1.Text = "Buscar por";
            // 
            // txtFind
            // 
            this.txtFind.Location = new System.Drawing.Point(75, 30);
            this.txtFind.Name = "txtFind";
            this.txtFind.Size = new System.Drawing.Size(410, 23);
            this.txtFind.TabIndex = 2;
            this.txtFind.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtFind.TextChanged += new System.EventHandler(this.TxtFind_TextChanged);
            this.txtFind.KeyDown += new System.Windows.Forms.KeyEventHandler(this.TxtFind_KeyDown);
            this.txtFind.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtFind_KeyPress);
            // 
            // rbtApeNoms
            // 
            this.rbtApeNoms.Checked = true;
            this.rbtApeNoms.Location = new System.Drawing.Point(204, 3);
            this.rbtApeNoms.Name = "rbtApeNoms";
            this.rbtApeNoms.Size = new System.Drawing.Size(221, 20);
            this.rbtApeNoms.TabIndex = 1;
            this.rbtApeNoms.Values.Text = "Apellidos y Nombres  |  Razón Social";
            this.rbtApeNoms.CheckedChanged += new System.EventHandler(this.RbtBusqueda_CheckedChanged);
            // 
            // rbtDocIdent
            // 
            this.rbtDocIdent.Location = new System.Drawing.Point(75, 3);
            this.rbtDocIdent.Name = "rbtDocIdent";
            this.rbtDocIdent.Size = new System.Drawing.Size(119, 20);
            this.rbtDocIdent.TabIndex = 0;
            this.rbtDocIdent.Values.Text = "Doc. de Identidad";
            this.rbtDocIdent.CheckedChanged += new System.EventHandler(this.RbtBusqueda_CheckedChanged);
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(485, 30);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(30, 25);
            this.btnFind.TabIndex = 3;
            this.btnFind.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_find;
            this.btnFind.Values.Text = "";
            this.btnFind.Click += new System.EventHandler(this.BtnFind_Click);
            // 
            // dgvPersonas
            // 
            this.dgvPersonas.AllowUserToAddRows = false;
            this.dgvPersonas.AllowUserToDeleteRows = false;
            this.dgvPersonas.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvPersonas.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvPersonas_selX,
            this.dgvPersonas_idPersona,
            this.dgvPersonas_tipoPerX,
            this.dgvPersonas_docIdent,
            this.dgvPersonas_apeNomsX,
            this.dgvPersonas_sigla,
            this.dgvPersonas_perConRuc});
            this.dgvPersonas.Location = new System.Drawing.Point(10, 110);
            this.dgvPersonas.MultiSelect = false;
            this.dgvPersonas.Name = "dgvPersonas";
            this.dgvPersonas.RowHeadersWidth = 20;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.CornflowerBlue;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.Color.White;
            this.dgvPersonas.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvPersonas.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvPersonas.Size = new System.Drawing.Size(530, 177);
            this.dgvPersonas.TabIndex = 1;
            this.dgvPersonas.CellValueChanged += new System.Windows.Forms.DataGridViewCellEventHandler(this.DgvPersonas_CellValueChanged);
            this.dgvPersonas.CurrentCellDirtyStateChanged += new System.EventHandler(this.DgvPersonas_CurrentCellDirtyStateChanged);
            this.dgvPersonas.KeyDown += new System.Windows.Forms.KeyEventHandler(this.DgvPersonas_KeyDown);
            // 
            // dgvPersonas_selX
            // 
            this.dgvPersonas_selX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvPersonas_selX.DataPropertyName = "selX";
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.NullValue = false;
            this.dgvPersonas_selX.DefaultCellStyle = dataGridViewCellStyle1;
            this.dgvPersonas_selX.FalseValue = null;
            this.dgvPersonas_selX.FillWeight = 35F;
            this.dgvPersonas_selX.HeaderText = "SEL.";
            this.dgvPersonas_selX.IndeterminateValue = null;
            this.dgvPersonas_selX.Name = "dgvPersonas_selX";
            this.dgvPersonas_selX.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvPersonas_selX.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvPersonas_selX.TrueValue = null;
            this.dgvPersonas_selX.Width = 35;
            // 
            // dgvPersonas_idPersona
            // 
            this.dgvPersonas_idPersona.DataPropertyName = "idPersona";
            this.dgvPersonas_idPersona.HeaderText = "idPersona";
            this.dgvPersonas_idPersona.Name = "dgvPersonas_idPersona";
            this.dgvPersonas_idPersona.Visible = false;
            // 
            // dgvPersonas_tipoPerX
            // 
            this.dgvPersonas_tipoPerX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvPersonas_tipoPerX.DataPropertyName = "tipoPerX";
            this.dgvPersonas_tipoPerX.FillWeight = 37F;
            this.dgvPersonas_tipoPerX.HeaderText = "TIPO";
            this.dgvPersonas_tipoPerX.Name = "dgvPersonas_tipoPerX";
            this.dgvPersonas_tipoPerX.ReadOnly = true;
            this.dgvPersonas_tipoPerX.Width = 37;
            // 
            // dgvPersonas_docIdent
            // 
            this.dgvPersonas_docIdent.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvPersonas_docIdent.DataPropertyName = "docIdent";
            this.dgvPersonas_docIdent.FillWeight = 80F;
            this.dgvPersonas_docIdent.HeaderText = "DNI | RUC";
            this.dgvPersonas_docIdent.Name = "dgvPersonas_docIdent";
            this.dgvPersonas_docIdent.ReadOnly = true;
            this.dgvPersonas_docIdent.Width = 80;
            // 
            // dgvPersonas_apeNomsX
            // 
            this.dgvPersonas_apeNomsX.DataPropertyName = "apeNomsX";
            this.dgvPersonas_apeNomsX.HeaderText = "APES. NOMBRES | RAZÓN SOCIAL";
            this.dgvPersonas_apeNomsX.Name = "dgvPersonas_apeNomsX";
            this.dgvPersonas_apeNomsX.ReadOnly = true;
            // 
            // dgvPersonas_sigla
            // 
            this.dgvPersonas_sigla.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvPersonas_sigla.DataPropertyName = "sigla";
            this.dgvPersonas_sigla.FillWeight = 65F;
            this.dgvPersonas_sigla.HeaderText = "SIGLA";
            this.dgvPersonas_sigla.Name = "dgvPersonas_sigla";
            this.dgvPersonas_sigla.ReadOnly = true;
            this.dgvPersonas_sigla.Width = 65;
            // 
            // dgvPersonas_perConRuc
            // 
            this.dgvPersonas_perConRuc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvPersonas_perConRuc.DataPropertyName = "perConRuc";
            this.dgvPersonas_perConRuc.FillWeight = 80F;
            this.dgvPersonas_perConRuc.HeaderText = "RUC PERSONA NATURAL";
            this.dgvPersonas_perConRuc.Name = "dgvPersonas_perConRuc";
            this.dgvPersonas_perConRuc.ReadOnly = true;
            this.dgvPersonas_perConRuc.Width = 80;
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(10, 6);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(30, 28);
            this.btnAdd.TabIndex = 5;
            this.btnAdd.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_add;
            this.btnAdd.Values.Text = "";
            this.btnAdd.Click += new System.EventHandler(this.BtnAdd_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(45, 6);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(30, 28);
            this.btnEdit.TabIndex = 6;
            this.btnEdit.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_edit;
            this.btnEdit.Values.Text = "";
            this.btnEdit.Click += new System.EventHandler(this.BtnEdit_Click);
            // 
            // lblCantPersona
            // 
            this.lblCantPersona.BackColor = System.Drawing.Color.Transparent;
            this.lblCantPersona.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCantPersona.ForeColor = System.Drawing.Color.Navy;
            this.lblCantPersona.Location = new System.Drawing.Point(184, 291);
            this.lblCantPersona.Name = "lblCantPersona";
            this.lblCantPersona.Size = new System.Drawing.Size(357, 20);
            this.lblCantPersona.TabIndex = 2;
            this.lblCantPersona.Text = "Seleccionados: 0";
            this.lblCantPersona.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lnkSel
            // 
            this.lnkSel.AutoSize = false;
            this.lnkSel.Location = new System.Drawing.Point(5, 291);
            this.lnkSel.Name = "lnkSel";
            this.lnkSel.Size = new System.Drawing.Size(133, 20);
            this.lnkSel.TabIndex = 2;
            this.lnkSel.Values.Text = "Ver seleccionados";
            this.lnkSel.LinkClicked += new System.EventHandler(this.LnkSel_LinkClicked);
            // 
            // FrmBuscarPersona
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(550, 355);
            this.Name = "FrmBuscarPersona";
            this.Text = "Búsqueda";
            this.pnlMain.ResumeLayout(false);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gbx1.Panel)).EndInit();
            this.gbx1.Panel.ResumeLayout(false);
            this.gbx1.Panel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1)).EndInit();
            this.gbx1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvPersonas)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private ComponentFactory.Krypton.Toolkit.KryptonGroupBox gbx1;
        private ComponentFactory.Krypton.Toolkit.KryptonRadioButton rbtApeNoms;
        private ComponentFactory.Krypton.Toolkit.KryptonRadioButton rbtDocIdent;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnFind;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtFind;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnEdit;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnAdd;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private ComponentFactory.Krypton.Toolkit.KryptonDataGridView dgvPersonas;
        private ComponentFactory.Krypton.Toolkit.KryptonLinkLabel lnkSel;
        private System.Windows.Forms.Label lblCantPersona;
        private ComponentFactory.Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn dgvPersonas_selX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPersonas_idPersona;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPersonas_tipoPerX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPersonas_docIdent;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPersonas_apeNomsX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPersonas_sigla;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPersonas_perConRuc;
    }
}