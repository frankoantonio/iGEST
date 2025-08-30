namespace com.yupanastudio.polariss.app
{
    partial class FrmFamsEst
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmFamsEst));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            this.btnNew = new Krypton.Toolkit.KryptonButton();
            this.btnEdit = new Krypton.Toolkit.KryptonButton();
            this.dgvFams = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvFams_idFamEst = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvFams_idFamiliar = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvFams_apeNomsX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvFams_idTipoPariente = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvFams_apoderado = new Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.lblGrpFam = new Krypton.Toolkit.KryptonLabel();
            this.btnCancela = new Krypton.Toolkit.KryptonButton();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvFams)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.lblGrpFam);
            this.pnlMain.Controls.Add(this.dgvFams);
            this.pnlMain.Size = new System.Drawing.Size(550, 302);
            this.pnlMain.Controls.SetChildIndex(this.dgvFams, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblGrpFam, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(550, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(99, 20);
            this.lblTitle.Text = "FAMILIARES";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Controls.Add(this.btnCancela);
            this.pnlFooter.Controls.Add(this.btnEdit);
            this.pnlFooter.Controls.Add(this.btnNew);
            this.pnlFooter.Location = new System.Drawing.Point(0, 262);
            this.pnlFooter.Size = new System.Drawing.Size(550, 40);
            this.pnlFooter.TabIndex = 2;
            this.pnlFooter.Controls.SetChildIndex(this.btnNew, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnEdit, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnOk, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnCancel, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnCancela, 0);
            // 
            // btnCancel
            // 
            this.btnCancel.Enabled = false;
            this.btnCancel.Location = new System.Drawing.Point(188, 12);
            this.btnCancel.Size = new System.Drawing.Size(28, 22);
            this.btnCancel.TabIndex = 3;
            this.toolTip.SetToolTip(this.btnCancel, "Cerrar formulario.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cerrar";
            this.btnCancel.Visible = false;
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(310, 6);
            this.btnOk.TabIndex = 2;
            this.toolTip.SetToolTip(this.btnOk, "Aceptar los cambios.");
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnAceptar;
            this.btnOk.Values.Text = "&Aceptar";
            this.btnOk.Visible = false;
            // 
            // lblOper
            // 
            this.lblOper.Image = null;
            this.lblOper.Location = new System.Drawing.Point(415, 6);
            this.lblOper.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(10, 6);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(40, 28);
            this.btnNew.TabIndex = 0;
            this.btnNew.Tag = "btnOK";
            this.toolTip.SetToolTip(this.btnNew, "Agregar \"Familiar\" a este  grupo.");
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
            this.toolTip.SetToolTip(this.btnEdit, "Modificar \"Familiar\".");
            this.btnEdit.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            this.btnEdit.Values.Text = "";
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // dgvFams
            // 
            this.dgvFams.AllowUserToAddRows = false;
            this.dgvFams.AllowUserToDeleteRows = false;
            this.dgvFams.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvFams.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvFams_idFamEst,
            this.dgvFams_idFamiliar,
            this.dgvFams_apeNomsX,
            this.dgvFams_idTipoPariente,
            this.dgvFams_apoderado});
            this.dgvFams.Location = new System.Drawing.Point(10, 70);
            this.dgvFams.MultiSelect = false;
            this.dgvFams.Name = "dgvFams";
            this.dgvFams.ReadOnly = true;
            this.dgvFams.RowHeadersWidth = 22;
            dataGridViewCellStyle6.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle6.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvFams.RowsDefaultCellStyle = dataGridViewCellStyle6;
            this.dgvFams.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvFams.Size = new System.Drawing.Size(530, 177);
            this.dgvFams.StandardTab = true;
            this.dgvFams.TabIndex = 1;
            // 
            // dgvFams_idFamEst
            // 
            this.dgvFams_idFamEst.DataPropertyName = "idFamEst";
            this.dgvFams_idFamEst.HeaderText = "idFamEst";
            this.dgvFams_idFamEst.Name = "dgvFams_idFamEst";
            this.dgvFams_idFamEst.ReadOnly = true;
            this.dgvFams_idFamEst.Visible = false;
            // 
            // dgvFams_idFamiliar
            // 
            this.dgvFams_idFamiliar.DataPropertyName = "idFamiliar";
            this.dgvFams_idFamiliar.HeaderText = "idFamiliar";
            this.dgvFams_idFamiliar.Name = "dgvFams_idFamiliar";
            this.dgvFams_idFamiliar.ReadOnly = true;
            this.dgvFams_idFamiliar.Visible = false;
            // 
            // dgvFams_apeNomsX
            // 
            this.dgvFams_apeNomsX.DataPropertyName = "apeNomsX";
            this.dgvFams_apeNomsX.HeaderText = "Apellidos y Nombres";
            this.dgvFams_apeNomsX.Name = "dgvFams_apeNomsX";
            this.dgvFams_apeNomsX.ReadOnly = true;
            // 
            // dgvFams_idTipoPariente
            // 
            this.dgvFams_idTipoPariente.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvFams_idTipoPariente.DataPropertyName = "idTipoPariente";
            this.dgvFams_idTipoPariente.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvFams_idTipoPariente.FillWeight = 120F;
            this.dgvFams_idTipoPariente.HeaderText = "Parentesco";
            this.dgvFams_idTipoPariente.Name = "dgvFams_idTipoPariente";
            this.dgvFams_idTipoPariente.ReadOnly = true;
            this.dgvFams_idTipoPariente.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvFams_idTipoPariente.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvFams_idTipoPariente.Width = 120;
            // 
            // dgvFams_apoderado
            // 
            this.dgvFams_apoderado.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvFams_apoderado.DataPropertyName = "apoderado";
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle5.NullValue = false;
            this.dgvFams_apoderado.DefaultCellStyle = dataGridViewCellStyle5;
            this.dgvFams_apoderado.FalseValue = null;
            this.dgvFams_apoderado.FillWeight = 70F;
            this.dgvFams_apoderado.HeaderText = "Apoderado";
            this.dgvFams_apoderado.IndeterminateValue = null;
            this.dgvFams_apoderado.Name = "dgvFams_apoderado";
            this.dgvFams_apoderado.ReadOnly = true;
            this.dgvFams_apoderado.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvFams_apoderado.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvFams_apoderado.TrueValue = null;
            this.dgvFams_apoderado.Width = 70;
            // 
            // lblGrpFam
            // 
            this.lblGrpFam.LabelStyle = Krypton.Toolkit.LabelStyle.BoldControl;
            this.lblGrpFam.Location = new System.Drawing.Point(4, 45);
            this.lblGrpFam.Name = "lblGrpFam";
            this.lblGrpFam.Size = new System.Drawing.Size(121, 20);
            this.lblGrpFam.TabIndex = 0;
            this.lblGrpFam.Values.ExtraText = "???";
            this.lblGrpFam.Values.Text = "MIEMBROS DE:";
            // 
            // btnCancela
            // 
            this.btnCancela.Location = new System.Drawing.Point(430, 6);
            this.btnCancela.Name = "btnCancela";
            this.btnCancela.Size = new System.Drawing.Size(110, 28);
            this.btnCancela.TabIndex = 3;
            this.toolTip.SetToolTip(this.btnCancela, "Cerrar formulario.");
            this.btnCancela.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnCancelar;
            this.btnCancela.Values.Text = "&Cerrar";
            this.btnCancela.Click += new System.EventHandler(this.btnCancela_Click);
            // 
            // FrmFamsEst
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = null;
            this.ClientSize = new System.Drawing.Size(550, 302);
            this.Name = "FrmFamsEst";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmFamsEst_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvFams)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private Krypton.Toolkit.KryptonButton btnNew;
        private Krypton.Toolkit.KryptonButton btnEdit;
        private Krypton.Toolkit.KryptonDataGridView dgvFams;
        private Krypton.Toolkit.KryptonLabel lblGrpFam;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvFams_idFamEst;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvFams_idFamiliar;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvFams_apeNomsX;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvFams_idTipoPariente;
        private Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn dgvFams_apoderado;
        private Krypton.Toolkit.KryptonButton btnCancela;
    }
}