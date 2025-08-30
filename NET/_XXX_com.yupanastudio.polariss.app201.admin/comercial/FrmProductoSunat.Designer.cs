namespace com.yupanastudio.polariss.app
{
    partial class FrmProductoSunat
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmProductoSunat));
            this.dgvProdSunat = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvProdSunat_idProdSunat = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvProdSunat_tipo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvProdSunat_nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.btnFind = new Krypton.Toolkit.KryptonButton();
            this.txtContenido = new Krypton.Toolkit.KryptonTextBox();
            this.cmbSegmento = new com.yupanastudio.polariss.app.ComboBoxMy();
            this.cmbFamilia = new com.yupanastudio.polariss.app.ComboBoxMy();
            this.cmbClase = new com.yupanastudio.polariss.app.ComboBoxMy();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.lblMsgFind = new System.Windows.Forms.Label();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProdSunat)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.label4);
            this.pnlMain.Controls.Add(this.label3);
            this.pnlMain.Controls.Add(this.label2);
            this.pnlMain.Controls.Add(this.cmbClase);
            this.pnlMain.Controls.Add(this.cmbFamilia);
            this.pnlMain.Controls.Add(this.cmbSegmento);
            this.pnlMain.Controls.Add(this.txtContenido);
            this.pnlMain.Controls.Add(this.label1);
            this.pnlMain.Controls.Add(this.btnFind);
            this.pnlMain.Controls.Add(this.dgvProdSunat);
            this.pnlMain.Controls.Add(this.lblMsgFind);
            this.pnlMain.Size = new System.Drawing.Size(720, 453);
            this.pnlMain.Controls.SetChildIndex(this.lblMsgFind, 0);
            this.pnlMain.Controls.SetChildIndex(this.dgvProdSunat, 0);
            this.pnlMain.Controls.SetChildIndex(this.btnFind, 0);
            this.pnlMain.Controls.SetChildIndex(this.label1, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtContenido, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbSegmento, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbFamilia, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbClase, 0);
            this.pnlMain.Controls.SetChildIndex(this.label2, 0);
            this.pnlMain.Controls.SetChildIndex(this.label3, 0);
            this.pnlMain.Controls.SetChildIndex(this.label4, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(720, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(201, 15);
            this.lblTitle.Text = "CÓDIGO PRODUCTO SUNAT";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 413);
            this.pnlFooter.Size = new System.Drawing.Size(720, 40);
            this.pnlFooter.TabIndex = 6;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(365, 6);
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(245, 6);
            this.toolTip.SetToolTip(this.btnOk, "Seleccionar \"Producto\" o \"Clase\".");
            this.btnOk.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnOk.Values.Image")));
            this.btnOk.Values.Text = "&Seleccionar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(583, 6);
            // 
            // dgvProdSunat
            // 
            this.dgvProdSunat.AllowUserToAddRows = false;
            this.dgvProdSunat.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvProdSunat.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvProdSunat_idProdSunat,
            this.dgvProdSunat_tipo,
            this.dgvProdSunat_nombre});
            this.dgvProdSunat.Location = new System.Drawing.Point(10, 138);
            this.dgvProdSunat.MultiSelect = false;
            this.dgvProdSunat.Name = "dgvProdSunat";
            this.dgvProdSunat.RowHeadersWidth = 22;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvProdSunat.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvProdSunat.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvProdSunat.Size = new System.Drawing.Size(700, 265);
            this.dgvProdSunat.StandardTab = true;
            this.dgvProdSunat.TabIndex = 5;
            this.dgvProdSunat.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvProdSunat_KeyDown);
            // 
            // dgvProdSunat_idProdSunat
            // 
            this.dgvProdSunat_idProdSunat.DataPropertyName = "idProdSunat";
            this.dgvProdSunat_idProdSunat.HeaderText = "idProdSunat";
            this.dgvProdSunat_idProdSunat.Name = "dgvProdSunat_idProdSunat";
            this.dgvProdSunat_idProdSunat.Visible = false;
            // 
            // dgvProdSunat_tipo
            // 
            this.dgvProdSunat_tipo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvProdSunat_tipo.DataPropertyName = "tipo";
            this.dgvProdSunat_tipo.FillWeight = 80F;
            this.dgvProdSunat_tipo.HeaderText = "TIPO";
            this.dgvProdSunat_tipo.Name = "dgvProdSunat_tipo";
            this.dgvProdSunat_tipo.ReadOnly = true;
            this.dgvProdSunat_tipo.Width = 80;
            // 
            // dgvProdSunat_nombre
            // 
            this.dgvProdSunat_nombre.DataPropertyName = "nombre";
            this.dgvProdSunat_nombre.HeaderText = "NOMBRE";
            this.dgvProdSunat_nombre.Name = "dgvProdSunat_nombre";
            this.dgvProdSunat_nombre.ReadOnly = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(7, 95);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(46, 15);
            this.label1.TabIndex = 56;
            this.label1.Text = "Buscar";
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(680, 95);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(30, 22);
            this.btnFind.TabIndex = 4;
            this.toolTip.SetToolTip(this.btnFind, "Realizar búsqueda.");
            this.btnFind.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnFind.Values.Image")));
            this.btnFind.Values.Text = "";
            this.btnFind.Click += new System.EventHandler(this.btnFind_Click);
            // 
            // txtContenido
            // 
            this.txtContenido.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtContenido.Location = new System.Drawing.Point(56, 95);
            this.txtContenido.MaxLength = 100;
            this.txtContenido.Name = "txtContenido";
            this.txtContenido.Size = new System.Drawing.Size(623, 23);
            this.txtContenido.TabIndex = 3;
            this.txtContenido.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtContenido.Enter += new System.EventHandler(this.txtContenido_Enter);
            this.txtContenido.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtContenido_KeyDown);
            this.txtContenido.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtContenido_KeyPress);
            // 
            // cmbSegmento
            // 
            this.cmbSegmento.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbSegmento.DisplayMember = "nombre";
            this.cmbSegmento.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSegmento.DropDownWidth = 500;
            this.cmbSegmento.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbSegmento.FormattingEnabled = true;
            this.cmbSegmento.Location = new System.Drawing.Point(10, 65);
            this.cmbSegmento.Name = "cmbSegmento";
            this.cmbSegmento.Size = new System.Drawing.Size(220, 21);
            this.cmbSegmento.TabIndex = 0;
            this.cmbSegmento.ValueMember = "idProdSunat";
            this.cmbSegmento.SelectedIndexChanged += new System.EventHandler(this.cmbSegmento_SelectedIndexChanged);
            // 
            // cmbFamilia
            // 
            this.cmbFamilia.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbFamilia.DisplayMember = "nombre";
            this.cmbFamilia.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbFamilia.DropDownWidth = 500;
            this.cmbFamilia.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbFamilia.FormattingEnabled = true;
            this.cmbFamilia.Location = new System.Drawing.Point(250, 65);
            this.cmbFamilia.Name = "cmbFamilia";
            this.cmbFamilia.Size = new System.Drawing.Size(220, 21);
            this.cmbFamilia.TabIndex = 1;
            this.cmbFamilia.ValueMember = "idProdSunat";
            this.cmbFamilia.SelectedIndexChanged += new System.EventHandler(this.cmbFamilia_SelectedIndexChanged);
            // 
            // cmbClase
            // 
            this.cmbClase.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbClase.DisplayMember = "nombre";
            this.cmbClase.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbClase.DropDownWidth = 500;
            this.cmbClase.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbClase.FormattingEnabled = true;
            this.cmbClase.Location = new System.Drawing.Point(490, 65);
            this.cmbClase.Name = "cmbClase";
            this.cmbClase.Size = new System.Drawing.Size(220, 21);
            this.cmbClase.TabIndex = 2;
            this.cmbClase.ValueMember = "idProdSunat";
            this.cmbClase.SelectedIndexChanged += new System.EventHandler(this.cmbClase_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label2.Location = new System.Drawing.Point(7, 45);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(64, 15);
            this.label2.TabIndex = 62;
            this.label2.Text = "Segmento";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label3.Location = new System.Drawing.Point(247, 45);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(48, 15);
            this.label3.TabIndex = 63;
            this.label3.Text = "Familia";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label4.Location = new System.Drawing.Point(487, 45);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(40, 15);
            this.label4.TabIndex = 64;
            this.label4.Text = "Clase";
            // 
            // lblMsgFind
            // 
            this.lblMsgFind.AutoSize = true;
            this.lblMsgFind.BackColor = System.Drawing.Color.Transparent;
            this.lblMsgFind.Font = new System.Drawing.Font("Microsoft Sans Serif", 7F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMsgFind.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblMsgFind.Location = new System.Drawing.Point(52, 114);
            this.lblMsgFind.Name = "lblMsgFind";
            this.lblMsgFind.Size = new System.Drawing.Size(199, 13);
            this.lblMsgFind.TabIndex = 65;
            this.lblMsgFind.Text = "Escribe nombre del \"Producto\" o \"Clase\"";
            // 
            // FrmProductoSunat
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(720, 453);
            this.Name = "FrmProductoSunat";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmProductoSunat_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvProdSunat)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private Krypton.Toolkit.KryptonDataGridView dgvProdSunat;
        private Krypton.Toolkit.KryptonTextBox txtContenido;
        private System.Windows.Forms.Label label1;
        private Krypton.Toolkit.KryptonButton btnFind;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvProdSunat_idProdSunat;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvProdSunat_tipo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvProdSunat_nombre;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private ComboBoxMy cmbClase;
        private ComboBoxMy cmbFamilia;
        private ComboBoxMy cmbSegmento;
        private System.Windows.Forms.Label lblMsgFind;
    }
}