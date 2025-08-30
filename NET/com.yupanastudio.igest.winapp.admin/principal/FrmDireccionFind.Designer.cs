namespace com.yupanastudio.igest.winapp
{
    partial class FrmDireccionFind
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmDireccionFind));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvDir = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvDir_idDireccion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDir_nomTipoVia = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDir_nomVia = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDir_nomTipoZona = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDir_nomZona = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDir_idDistrito = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDir_countUsoX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtFind = new Krypton.Toolkit.KryptonTextBox();
            this.btnFind = new Krypton.Toolkit.KryptonButton();
            this.label1 = new System.Windows.Forms.Label();
            this.rbtGrpFam = new Krypton.Toolkit.KryptonRadioButton();
            this.rbtVia = new Krypton.Toolkit.KryptonRadioButton();
            this.label2 = new System.Windows.Forms.Label();
            this.btnEdit = new Krypton.Toolkit.KryptonButton();
            this.btnNew = new Krypton.Toolkit.KryptonButton();
            this.lblMsgFind = new System.Windows.Forms.Label();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDir)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.txtFind);
            this.pnlMain.Controls.Add(this.lblMsgFind);
            this.pnlMain.Controls.Add(this.label2);
            this.pnlMain.Controls.Add(this.label1);
            this.pnlMain.Controls.Add(this.rbtGrpFam);
            this.pnlMain.Controls.Add(this.rbtVia);
            this.pnlMain.Controls.Add(this.btnFind);
            this.pnlMain.Controls.Add(this.dgvDir);
            this.pnlMain.Size = new System.Drawing.Size(630, 338);
            this.pnlMain.Controls.SetChildIndex(this.dgvDir, 0);
            this.pnlMain.Controls.SetChildIndex(this.btnFind, 0);
            this.pnlMain.Controls.SetChildIndex(this.rbtVia, 0);
            this.pnlMain.Controls.SetChildIndex(this.rbtGrpFam, 0);
            this.pnlMain.Controls.SetChildIndex(this.label1, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.label2, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblMsgFind, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtFind, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(630, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(168, 20);
            this.lblTitle.Text = "BÚSQUEDA DIRECCIÓN";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Controls.Add(this.btnEdit);
            this.pnlFooter.Controls.Add(this.btnNew);
            this.pnlFooter.Location = new System.Drawing.Point(0, 298);
            this.pnlFooter.Size = new System.Drawing.Size(630, 40);
            this.pnlFooter.TabIndex = 5;
            this.pnlFooter.Controls.SetChildIndex(this.btnOk, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnCancel, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnNew, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnEdit, 0);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(510, 6);
            this.btnCancel.TabIndex = 3;
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(395, 6);
            this.btnOk.TabIndex = 2;
            this.toolTip.SetToolTip(this.btnOk, "Seleccionar \"Dirección\".");
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnAceptar;
            this.btnOk.Values.Text = "&Seleccionar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(493, 6);
            // 
            // dgvDir
            // 
            this.dgvDir.AllowUserToAddRows = false;
            this.dgvDir.AllowUserToDeleteRows = false;
            this.dgvDir.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvDir.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvDir_idDireccion,
            this.dgvDir_nomTipoVia,
            this.dgvDir_nomVia,
            this.dgvDir_nomTipoZona,
            this.dgvDir_nomZona,
            this.dgvDir_idDistrito,
            this.dgvDir_countUsoX});
            this.dgvDir.Location = new System.Drawing.Point(10, 125);
            this.dgvDir.MultiSelect = false;
            this.dgvDir.Name = "dgvDir";
            this.dgvDir.ReadOnly = true;
            this.dgvDir.RowHeadersWidth = 22;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvDir.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvDir.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvDir.Size = new System.Drawing.Size(610, 158);
            this.dgvDir.StandardTab = true;
            this.dgvDir.TabIndex = 4;
            this.dgvDir.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvDir_KeyDown);
            // 
            // dgvDir_idDireccion
            // 
            this.dgvDir_idDireccion.DataPropertyName = "idDireccionX";
            this.dgvDir_idDireccion.HeaderText = "idDireccionX";
            this.dgvDir_idDireccion.Name = "dgvDir_idDireccion";
            this.dgvDir_idDireccion.ReadOnly = true;
            this.dgvDir_idDireccion.Visible = false;
            // 
            // dgvDir_nomTipoVia
            // 
            this.dgvDir_nomTipoVia.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDir_nomTipoVia.DataPropertyName = "nomTipoVia";
            this.dgvDir_nomTipoVia.FillWeight = 50F;
            this.dgvDir_nomTipoVia.HeaderText = "VÍA";
            this.dgvDir_nomTipoVia.Name = "dgvDir_nomTipoVia";
            this.dgvDir_nomTipoVia.ReadOnly = true;
            this.dgvDir_nomTipoVia.Width = 50;
            // 
            // dgvDir_nomVia
            // 
            this.dgvDir_nomVia.DataPropertyName = "nomVia";
            this.dgvDir_nomVia.HeaderText = "NOMBRE VÍA";
            this.dgvDir_nomVia.Name = "dgvDir_nomVia";
            this.dgvDir_nomVia.ReadOnly = true;
            // 
            // dgvDir_nomTipoZona
            // 
            this.dgvDir_nomTipoZona.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDir_nomTipoZona.DataPropertyName = "nomTipoZona";
            this.dgvDir_nomTipoZona.FillWeight = 50F;
            this.dgvDir_nomTipoZona.HeaderText = "TI_ZONA";
            this.dgvDir_nomTipoZona.Name = "dgvDir_nomTipoZona";
            this.dgvDir_nomTipoZona.ReadOnly = true;
            this.dgvDir_nomTipoZona.Width = 50;
            // 
            // dgvDir_nomZona
            // 
            this.dgvDir_nomZona.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDir_nomZona.DataPropertyName = "nomZona";
            this.dgvDir_nomZona.FillWeight = 130F;
            this.dgvDir_nomZona.HeaderText = "NOMBRE TI_ZONA";
            this.dgvDir_nomZona.Name = "dgvDir_nomZona";
            this.dgvDir_nomZona.ReadOnly = true;
            this.dgvDir_nomZona.Width = 130;
            // 
            // dgvDir_idDistrito
            // 
            this.dgvDir_idDistrito.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDir_idDistrito.DataPropertyName = "idDistrito";
            this.dgvDir_idDistrito.FillWeight = 60F;
            this.dgvDir_idDistrito.HeaderText = "UBIGEO";
            this.dgvDir_idDistrito.Name = "dgvDir_idDistrito";
            this.dgvDir_idDistrito.ReadOnly = true;
            this.dgvDir_idDistrito.Width = 60;
            // 
            // dgvDir_countUsoX
            // 
            this.dgvDir_countUsoX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDir_countUsoX.DataPropertyName = "countUsoX";
            this.dgvDir_countUsoX.FillWeight = 35F;
            this.dgvDir_countUsoX.HeaderText = "USO";
            this.dgvDir_countUsoX.Name = "dgvDir_countUsoX";
            this.dgvDir_countUsoX.ReadOnly = true;
            this.dgvDir_countUsoX.Visible = false;
            this.dgvDir_countUsoX.Width = 35;
            // 
            // txtFind
            // 
            this.txtFind.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtFind.Location = new System.Drawing.Point(77, 80);
            this.txtFind.MaxLength = 25;
            this.txtFind.Name = "txtFind";
            this.txtFind.Size = new System.Drawing.Size(512, 23);
            this.txtFind.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.txtFind.TabIndex = 2;
            this.txtFind.Enter += new System.EventHandler(this.txtFind_Enter);
            this.txtFind.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtFind_KeyDown);
            this.txtFind.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtFind_KeyPress);
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(590, 80);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(30, 22);
            this.btnFind.TabIndex = 3;
            this.toolTip.SetToolTip(this.btnFind, "Buscar \"Dirección\" por nombre de calle.");
            this.btnFind.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_find;
            this.btnFind.Values.Text = "";
            this.btnFind.Click += new System.EventHandler(this.btnFind_Click);
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
            this.label1.TabIndex = 98;
            this.label1.Text = "Buscar por";
            // 
            // rbtGrpFam
            // 
            this.rbtGrpFam.Location = new System.Drawing.Point(243, 50);
            this.rbtGrpFam.Name = "rbtGrpFam";
            this.rbtGrpFam.Size = new System.Drawing.Size(165, 20);
            this.rbtGrpFam.TabIndex = 1;
            this.rbtGrpFam.Values.Text = "Dirección de los familiares";
            this.rbtGrpFam.CheckedChanged += new System.EventHandler(this.rbtGrpFam_CheckedChanged);
            // 
            // rbtVia
            // 
            this.rbtVia.Checked = true;
            this.rbtVia.Location = new System.Drawing.Point(77, 50);
            this.rbtVia.Name = "rbtVia";
            this.rbtVia.Size = new System.Drawing.Size(154, 20);
            this.rbtVia.TabIndex = 0;
            this.rbtVia.Values.Text = "Nombre de la calle o vía";
            this.rbtVia.CheckedChanged += new System.EventHandler(this.rbtVia_CheckedChanged);
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
            this.label2.TabIndex = 99;
            this.label2.Text = "Contenido";
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(51, 6);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(40, 28);
            this.btnEdit.TabIndex = 1;
            this.btnEdit.Tag = "";
            this.toolTip.SetToolTip(this.btnEdit, "Modificar \"Dirección\".");
            this.btnEdit.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            this.btnEdit.Values.Text = "";
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(10, 6);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(40, 28);
            this.btnNew.TabIndex = 0;
            this.btnNew.Tag = "";
            this.toolTip.SetToolTip(this.btnNew, "Crear nueva \"Dirección\".");
            this.btnNew.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_add;
            this.btnNew.Values.Text = "";
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // lblMsgFind
            // 
            this.lblMsgFind.AutoSize = true;
            this.lblMsgFind.BackColor = System.Drawing.Color.Transparent;
            this.lblMsgFind.Font = new System.Drawing.Font("Microsoft Sans Serif", 7F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMsgFind.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblMsgFind.Location = new System.Drawing.Point(74, 99);
            this.lblMsgFind.Name = "lblMsgFind";
            this.lblMsgFind.Size = new System.Drawing.Size(214, 13);
            this.lblMsgFind.TabIndex = 100;
            this.lblMsgFind.Text = "Escribe el nombre de su calle (Ej. bolog 779)";
            // 
            // FrmDireccionFind
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(630, 338);
            this.Name = "FrmDireccionFind";
            this.Text = "EmpresaFrm";
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDir)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private Krypton.Toolkit.KryptonDataGridView dgvDir;
        private Krypton.Toolkit.KryptonTextBox txtFind;
        private Krypton.Toolkit.KryptonButton btnFind;
        private System.Windows.Forms.Label label1;
        private Krypton.Toolkit.KryptonRadioButton rbtGrpFam;
        private Krypton.Toolkit.KryptonRadioButton rbtVia;
        private System.Windows.Forms.Label label2;
        private Krypton.Toolkit.KryptonButton btnEdit;
        private Krypton.Toolkit.KryptonButton btnNew;
        private System.Windows.Forms.Label lblMsgFind;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDir_idDireccion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDir_nomTipoVia;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDir_nomVia;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDir_nomTipoZona;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDir_nomZona;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDir_idDistrito;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDir_countUsoX;
    }
}