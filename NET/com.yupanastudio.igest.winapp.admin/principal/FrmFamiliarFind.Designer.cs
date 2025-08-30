namespace com.yupanastudio.igest.winapp
{
    partial class FrmFamiliarFind
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmProductoSunat));
            this.dgvPersona = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvPersona_idPersona = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPersona_numDocIdent = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPersona_apeNomsX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnNew = new Krypton.Toolkit.KryptonButton();
            this.btnEdit = new Krypton.Toolkit.KryptonButton();
            this.rbtNoms = new Krypton.Toolkit.KryptonRadioButton();
            this.rbtFams = new Krypton.Toolkit.KryptonRadioButton();
            this.label2 = new System.Windows.Forms.Label();
            this.btnFind = new Krypton.Toolkit.KryptonButton();
            this.lblMsgFind = new System.Windows.Forms.Label();
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
            this.pnlMain.Controls.Add(this.label1);
            this.pnlMain.Controls.Add(this.lblMsgFind);
            this.pnlMain.Controls.Add(this.btnFind);
            this.pnlMain.Controls.Add(this.label2);
            this.pnlMain.Controls.Add(this.dgvPersona);
            this.pnlMain.Controls.Add(this.rbtFams);
            this.pnlMain.Controls.Add(this.rbtNoms);
            this.pnlMain.Size = new System.Drawing.Size(600, 355);
            this.pnlMain.Controls.SetChildIndex(this.rbtNoms, 0);
            this.pnlMain.Controls.SetChildIndex(this.rbtFams, 0);
            this.pnlMain.Controls.SetChildIndex(this.dgvPersona, 0);
            this.pnlMain.Controls.SetChildIndex(this.label2, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.btnFind, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblMsgFind, 0);
            this.pnlMain.Controls.SetChildIndex(this.label1, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtContenido, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(600, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(169, 15);
            this.lblTitle.Text = "BÚSQUEDA FAMILIARES";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Controls.Add(this.btnEdit);
            this.pnlFooter.Controls.Add(this.btnNew);
            this.pnlFooter.Location = new System.Drawing.Point(0, 315);
            this.pnlFooter.Size = new System.Drawing.Size(600, 40);
            this.pnlFooter.TabIndex = 5;
            this.pnlFooter.Controls.SetChildIndex(this.btnOk, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnCancel, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnNew, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnEdit, 0);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(480, 6);
            this.btnCancel.TabIndex = 3;
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(360, 6);
            this.btnOk.TabIndex = 2;
            this.toolTip.SetToolTip(this.btnOk, "Seleccionar \"Familiar\".");
            this.btnOk.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnOk.Values.Image")));
            this.btnOk.Values.Text = "&Seleccionar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(463, 6);
            // 
            // dgvPersona
            // 
            this.dgvPersona.AllowUserToAddRows = false;
            this.dgvPersona.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvPersona.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvPersona_idPersona,
            this.dgvPersona_numDocIdent,
            this.dgvPersona_apeNomsX});
            this.dgvPersona.Location = new System.Drawing.Point(10, 123);
            this.dgvPersona.MultiSelect = false;
            this.dgvPersona.Name = "dgvPersona";
            this.dgvPersona.RowHeadersWidth = 22;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvPersona.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvPersona.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvPersona.Size = new System.Drawing.Size(580, 177);
            this.dgvPersona.StandardTab = true;
            this.dgvPersona.TabIndex = 4;
            this.dgvPersona.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvPersona_KeyDown);
            // 
            // dgvPersona_idPersona
            // 
            this.dgvPersona_idPersona.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvPersona_idPersona.DataPropertyName = "idPersona";
            this.dgvPersona_idPersona.FillWeight = 75F;
            this.dgvPersona_idPersona.HeaderText = "ID. TI_PERSONA";
            this.dgvPersona_idPersona.Name = "dgvPersona_idPersona";
            this.dgvPersona_idPersona.ReadOnly = true;
            this.dgvPersona_idPersona.Visible = false;
            this.dgvPersona_idPersona.Width = 75;
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
            this.dgvPersona_apeNomsX.HeaderText = "APELLIDOS y NOMBRES";
            this.dgvPersona_apeNomsX.Name = "dgvPersona_apeNomsX";
            this.dgvPersona_apeNomsX.ReadOnly = true;
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(10, 6);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(40, 28);
            this.btnNew.TabIndex = 0;
            this.btnNew.Tag = "";
            this.toolTip.SetToolTip(this.btnNew, "Crear nuevo \"Familiar\".");
            this.btnNew.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnNew.Values.Image")));
            this.btnNew.Values.Text = "";
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(51, 6);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(40, 28);
            this.btnEdit.TabIndex = 1;
            this.btnEdit.Tag = "";
            this.toolTip.SetToolTip(this.btnEdit, "Modificar \"Familiar\".");
            this.btnEdit.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnEdit.Values.Image")));
            this.btnEdit.Values.Text = "";
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // rbtNoms
            // 
            this.rbtNoms.Checked = true;
            this.rbtNoms.Location = new System.Drawing.Point(77, 50);
            this.rbtNoms.Name = "rbtNoms";
            this.rbtNoms.Size = new System.Drawing.Size(136, 20);
            this.rbtNoms.TabIndex = 0;
            this.rbtNoms.Values.Text = "Apellidos y Nombres";
            this.rbtNoms.CheckedChanged += new System.EventHandler(this.rbtNoms_CheckedChanged);
            // 
            // rbtFams
            // 
            this.rbtFams.Location = new System.Drawing.Point(227, 50);
            this.rbtFams.Name = "rbtFams";
            this.rbtFams.Size = new System.Drawing.Size(122, 20);
            this.rbtFams.TabIndex = 1;
            this.toolTip.SetToolTip(this.rbtFams, "Todos los familiares asociados.");
            this.rbtFams.Values.Text = "Lista de Familiares";
            this.rbtFams.CheckedChanged += new System.EventHandler(this.rbtFams_CheckedChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label2.Location = new System.Drawing.Point(11, 80);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(64, 15);
            this.label2.TabIndex = 57;
            this.label2.Text = "Contenido";
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(560, 80);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(30, 22);
            this.btnFind.TabIndex = 3;
            this.toolTip.SetToolTip(this.btnFind, "Realizar búsqueda.");
            this.btnFind.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnFind.Values.Image")));
            this.btnFind.Values.Text = "";
            this.btnFind.Click += new System.EventHandler(this.btnFind_Click);
            // 
            // lblMsgFind
            // 
            this.lblMsgFind.AutoSize = true;
            this.lblMsgFind.BackColor = System.Drawing.Color.Transparent;
            this.lblMsgFind.Font = new System.Drawing.Font("Microsoft Sans Serif", 7F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMsgFind.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblMsgFind.Location = new System.Drawing.Point(74, 99);
            this.lblMsgFind.Name = "lblMsgFind";
            this.lblMsgFind.Size = new System.Drawing.Size(145, 13);
            this.lblMsgFind.TabIndex = 4;
            this.lblMsgFind.Text = "Escribe apellidos y/o nombres";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(8, 50);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(67, 15);
            this.label1.TabIndex = 56;
            this.label1.Text = "Buscar por";
            // 
            // txtContenido
            // 
            this.txtContenido.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtContenido.Location = new System.Drawing.Point(77, 80);
            this.txtContenido.MaxLength = 20;
            this.txtContenido.Name = "txtContenido";
            this.txtContenido.Size = new System.Drawing.Size(482, 23);
            this.txtContenido.TabIndex = 2;
            this.txtContenido.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtContenido.Enter += new System.EventHandler(this.txtContenido_Enter);
            this.txtContenido.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtContenido_KeyDown);
            this.txtContenido.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtContenido_KeyPress);
            // 
            // FrmFamiliarFind
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 355);
            this.Name = "FrmFamiliarFind";
            this.Text = "EmpresaFrm";
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
        private System.Windows.Forms.Label lblMsgFind;
        private Krypton.Toolkit.KryptonButton btnFind;
        private System.Windows.Forms.Label label2;
        private Krypton.Toolkit.KryptonTextBox txtContenido;
        private Krypton.Toolkit.KryptonRadioButton rbtFams;
        private Krypton.Toolkit.KryptonRadioButton rbtNoms;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPersona_idPersona;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPersona_numDocIdent;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPersona_apeNomsX;
    }
}