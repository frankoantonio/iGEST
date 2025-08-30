namespace com.yupanastudio.polariss.app
{
    partial class FrmGrupoFamFind
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmGrupoFamFind));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvGrpFam = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvGrpFam_idGrpFam = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvGrpFam_nomGrpFam = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvGrpFam_procedencia = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvGrpFam_cerrado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtFind = new Krypton.Toolkit.KryptonTextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.btnFind = new Krypton.Toolkit.KryptonButton();
            this.btnNew = new Krypton.Toolkit.KryptonButton();
            this.btnEdit = new Krypton.Toolkit.KryptonButton();
            this.lblMsgFind = new System.Windows.Forms.Label();
            this.lsbMembers = new Krypton.Toolkit.KryptonListBox();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvGrpFam)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.lsbMembers);
            this.pnlMain.Controls.Add(this.txtFind);
            this.pnlMain.Controls.Add(this.btnFind);
            this.pnlMain.Controls.Add(this.label11);
            this.pnlMain.Controls.Add(this.dgvGrpFam);
            this.pnlMain.Controls.Add(this.lblMsgFind);
            this.pnlMain.Size = new System.Drawing.Size(530, 285);
            this.pnlMain.Controls.SetChildIndex(this.lblMsgFind, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.dgvGrpFam, 0);
            this.pnlMain.Controls.SetChildIndex(this.label11, 0);
            this.pnlMain.Controls.SetChildIndex(this.btnFind, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtFind, 0);
            this.pnlMain.Controls.SetChildIndex(this.lsbMembers, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(530, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(129, 20);
            this.lblTitle.Text = "GRUPO FAMILIAR";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Controls.Add(this.btnEdit);
            this.pnlFooter.Controls.Add(this.btnNew);
            this.pnlFooter.Location = new System.Drawing.Point(0, 245);
            this.pnlFooter.Size = new System.Drawing.Size(530, 40);
            this.pnlFooter.TabIndex = 6;
            this.pnlFooter.Controls.SetChildIndex(this.btnNew, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnEdit, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnOk, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnCancel, 0);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(410, 6);
            this.btnCancel.TabIndex = 3;
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar selección.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(290, 6);
            this.btnOk.TabIndex = 2;
            this.toolTip.SetToolTip(this.btnOk, "Seleccionar \"Grupo Familiar\".");
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnAceptar;
            this.btnOk.Values.Text = "&Seleccionar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Image = null;
            this.lblOper.Location = new System.Drawing.Point(395, 6);
            this.lblOper.Text = "[SELECCIÓN]";
            this.lblOper.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // dgvGrpFam
            // 
            this.dgvGrpFam.AllowUserToAddRows = false;
            this.dgvGrpFam.AllowUserToDeleteRows = false;
            this.dgvGrpFam.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvGrpFam.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvGrpFam_idGrpFam,
            this.dgvGrpFam_nomGrpFam,
            this.dgvGrpFam_procedencia,
            this.dgvGrpFam_cerrado});
            this.dgvGrpFam.Location = new System.Drawing.Point(10, 95);
            this.dgvGrpFam.MultiSelect = false;
            this.dgvGrpFam.Name = "dgvGrpFam";
            this.dgvGrpFam.ReadOnly = true;
            this.dgvGrpFam.RowHeadersWidth = 22;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvGrpFam.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvGrpFam.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvGrpFam.Size = new System.Drawing.Size(300, 133);
            this.dgvGrpFam.StandardTab = true;
            this.dgvGrpFam.TabIndex = 2;
            this.dgvGrpFam.SelectionChanged += new System.EventHandler(this.dgvGrpFam_SelectionChanged);
            this.dgvGrpFam.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvInst_KeyDown);
            // 
            // dgvGrpFam_idGrpFam
            // 
            this.dgvGrpFam_idGrpFam.DataPropertyName = "idGrpFam";
            this.dgvGrpFam_idGrpFam.HeaderText = "idGrpFam";
            this.dgvGrpFam_idGrpFam.Name = "dgvGrpFam_idGrpFam";
            this.dgvGrpFam_idGrpFam.ReadOnly = true;
            this.dgvGrpFam_idGrpFam.Visible = false;
            // 
            // dgvGrpFam_nomGrpFam
            // 
            this.dgvGrpFam_nomGrpFam.DataPropertyName = "nomGrpFam";
            this.dgvGrpFam_nomGrpFam.HeaderText = "NOMBRE GRUPO";
            this.dgvGrpFam_nomGrpFam.Name = "dgvGrpFam_nomGrpFam";
            this.dgvGrpFam_nomGrpFam.ReadOnly = true;
            // 
            // dgvGrpFam_procedencia
            // 
            this.dgvGrpFam_procedencia.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvGrpFam_procedencia.DataPropertyName = "procedencia";
            this.dgvGrpFam_procedencia.FillWeight = 110F;
            this.dgvGrpFam_procedencia.HeaderText = "PROCEDENCIA";
            this.dgvGrpFam_procedencia.Name = "dgvGrpFam_procedencia";
            this.dgvGrpFam_procedencia.ReadOnly = true;
            this.dgvGrpFam_procedencia.Width = 110;
            // 
            // dgvGrpFam_cerrado
            // 
            this.dgvGrpFam_cerrado.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvGrpFam_cerrado.DataPropertyName = "cerrado";
            this.dgvGrpFam_cerrado.FillWeight = 35F;
            this.dgvGrpFam_cerrado.HeaderText = "CERRADO";
            this.dgvGrpFam_cerrado.Name = "dgvGrpFam_cerrado";
            this.dgvGrpFam_cerrado.ReadOnly = true;
            this.dgvGrpFam_cerrado.Visible = false;
            this.dgvGrpFam_cerrado.Width = 35;
            // 
            // txtFind
            // 
            this.txtFind.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtFind.Location = new System.Drawing.Point(56, 50);
            this.txtFind.MaxLength = 25;
            this.txtFind.Name = "txtFind";
            this.txtFind.Size = new System.Drawing.Size(433, 23);
            this.txtFind.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
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
            this.btnFind.Location = new System.Drawing.Point(490, 50);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(30, 22);
            this.btnFind.TabIndex = 1;
            this.toolTip.SetToolTip(this.btnFind, "Buscar \"Grupo Familiar\".");
            this.btnFind.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_find;
            this.btnFind.Values.Text = "";
            this.btnFind.Click += new System.EventHandler(this.btnFind_Click);
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(10, 6);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(40, 28);
            this.btnNew.TabIndex = 0;
            this.btnNew.Tag = "btnOK";
            this.toolTip.SetToolTip(this.btnNew, "Crear nuevo \"Grupo Familiar\".");
            this.btnNew.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_add;
            this.btnNew.Values.Text = "";
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(51, 6);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(40, 28);
            this.btnEdit.TabIndex = 1;
            this.btnEdit.Tag = "btnOK";
            this.toolTip.SetToolTip(this.btnEdit, "Modificar \"Grupo Familiar\".");
            this.btnEdit.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            this.btnEdit.Values.Text = "";
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // lblMsgFind
            // 
            this.lblMsgFind.AutoSize = true;
            this.lblMsgFind.BackColor = System.Drawing.Color.Transparent;
            this.lblMsgFind.Font = new System.Drawing.Font("Microsoft Sans Serif", 7F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMsgFind.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblMsgFind.Location = new System.Drawing.Point(52, 69);
            this.lblMsgFind.Name = "lblMsgFind";
            this.lblMsgFind.Size = new System.Drawing.Size(172, 13);
            this.lblMsgFind.TabIndex = 101;
            this.lblMsgFind.Text = "Escribe el nombre del grupo familiar";
            // 
            // lsbMembers
            // 
            this.lsbMembers.Location = new System.Drawing.Point(320, 95);
            this.lsbMembers.Name = "lsbMembers";
            this.lsbMembers.Size = new System.Drawing.Size(200, 133);
            this.lsbMembers.StateDisabled.Item.Content.LongText.Color1 = System.Drawing.Color.Brown;
            this.lsbMembers.StateDisabled.Item.Content.ShortText.Color1 = System.Drawing.Color.Brown;
            this.lsbMembers.TabIndex = 3;
            // 
            // FrmGrupoFamFind
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(530, 285);
            this.Name = "FrmGrupoFamFind";
            this.Text = "EmpresaFrm";
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvGrpFam)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private Krypton.Toolkit.KryptonDataGridView dgvGrpFam;
        private Krypton.Toolkit.KryptonTextBox txtFind;
        private System.Windows.Forms.Label label11;
        private Krypton.Toolkit.KryptonButton btnFind;
        private Krypton.Toolkit.KryptonButton btnNew;
        private Krypton.Toolkit.KryptonButton btnEdit;
        private System.Windows.Forms.Label lblMsgFind;
        private Krypton.Toolkit.KryptonListBox lsbMembers;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvGrpFam_idGrpFam;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvGrpFam_nomGrpFam;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvGrpFam_procedencia;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvGrpFam_cerrado;
    }
}