namespace com.yupanastudio.igest.winapp
{
    partial class FrmDocsEst
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmDocsEst));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvDocs = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvDocs_selX = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dgvDocs_idDocsEst = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDocs_idDocs = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDocs_nomDocX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDocs_recibeFe = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDocs_recibeUsu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDocs_actualizaFe = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDocs_actualizaUsu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDocs_devuelveFe = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDocs_devuelveUsu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvDocs_obligadoX = new Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.btnActualiza = new Krypton.Toolkit.KryptonButton();
            this.btnRecibe = new Krypton.Toolkit.KryptonButton();
            this.btnDevuelve = new Krypton.Toolkit.KryptonButton();
            this.btnCancela = new Krypton.Toolkit.KryptonButton();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDocs)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.dgvDocs);
            this.pnlMain.Size = new System.Drawing.Size(680, 285);
            this.pnlMain.Controls.SetChildIndex(this.dgvDocs, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(680, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(301, 15);
            this.lblTitle.Text = "DOCUMENTOS EXIGIDOS";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Controls.Add(this.btnCancela);
            this.pnlFooter.Controls.Add(this.btnDevuelve);
            this.pnlFooter.Controls.Add(this.btnActualiza);
            this.pnlFooter.Controls.Add(this.btnRecibe);
            this.pnlFooter.Location = new System.Drawing.Point(0, 245);
            this.pnlFooter.Size = new System.Drawing.Size(680, 40);
            this.pnlFooter.Controls.SetChildIndex(this.btnRecibe, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnActualiza, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnDevuelve, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnCancela, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnOk, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnCancel, 0);
            // 
            // btnCancel
            // 
            this.btnCancel.Enabled = false;
            this.btnCancel.Location = new System.Drawing.Point(362, 12);
            this.btnCancel.Size = new System.Drawing.Size(20, 22);
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            this.btnCancel.Visible = false;
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(440, 6);
            this.btnOk.TabIndex = 3;
            this.toolTip.SetToolTip(this.btnOk, "Guardar los cambios.");
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_save;
            this.btnOk.Values.Text = "&Guardar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(543, 5);
            // 
            // dgvDocs
            // 
            this.dgvDocs.AllowUserToAddRows = false;
            this.dgvDocs.AllowUserToDeleteRows = false;
            this.dgvDocs.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvDocs.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvDocs_selX,
            this.dgvDocs_idDocsEst,
            this.dgvDocs_idDocs,
            this.dgvDocs_nomDocX,
            this.dgvDocs_recibeFe,
            this.dgvDocs_recibeUsu,
            this.dgvDocs_actualizaFe,
            this.dgvDocs_actualizaUsu,
            this.dgvDocs_devuelveFe,
            this.dgvDocs_devuelveUsu,
            this.dgvDocs_obligadoX});
            this.dgvDocs.Location = new System.Drawing.Point(10, 50);
            this.dgvDocs.MultiSelect = false;
            this.dgvDocs.Name = "dgvDocs";
            this.dgvDocs.RowHeadersWidth = 22;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvDocs.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvDocs.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvDocs.Size = new System.Drawing.Size(660, 178);
            this.dgvDocs.StandardTab = true;
            this.dgvDocs.TabIndex = 0;
            // 
            // dgvDocs_selX
            // 
            this.dgvDocs_selX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDocs_selX.DataPropertyName = "selX";
            this.dgvDocs_selX.FillWeight = 40F;
            this.dgvDocs_selX.HeaderText = "SEL.";
            this.dgvDocs_selX.Name = "dgvDocs_selX";
            this.dgvDocs_selX.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvDocs_selX.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvDocs_selX.Width = 40;
            // 
            // dgvDocs_idDocsEst
            // 
            this.dgvDocs_idDocsEst.DataPropertyName = "idDocsEst";
            this.dgvDocs_idDocsEst.HeaderText = "idDocsEst";
            this.dgvDocs_idDocsEst.Name = "dgvDocs_idDocsEst";
            this.dgvDocs_idDocsEst.ReadOnly = true;
            this.dgvDocs_idDocsEst.Visible = false;
            // 
            // dgvDocs_idDocs
            // 
            this.dgvDocs_idDocs.DataPropertyName = "idDocs";
            this.dgvDocs_idDocs.HeaderText = "idDocs";
            this.dgvDocs_idDocs.Name = "dgvDocs_idDocs";
            this.dgvDocs_idDocs.ReadOnly = true;
            this.dgvDocs_idDocs.Visible = false;
            // 
            // dgvDocs_nomDocX
            // 
            this.dgvDocs_nomDocX.DataPropertyName = "nomDocX";
            this.dgvDocs_nomDocX.HeaderText = "DOCUMENTO";
            this.dgvDocs_nomDocX.Name = "dgvDocs_nomDocX";
            this.dgvDocs_nomDocX.ReadOnly = true;
            // 
            // dgvDocs_recibeFe
            // 
            this.dgvDocs_recibeFe.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDocs_recibeFe.DataPropertyName = "recibeFe";
            this.dgvDocs_recibeFe.FillWeight = 80F;
            this.dgvDocs_recibeFe.HeaderText = "FE. RECIBE";
            this.dgvDocs_recibeFe.Name = "dgvDocs_recibeFe";
            this.dgvDocs_recibeFe.ReadOnly = true;
            this.dgvDocs_recibeFe.Width = 80;
            // 
            // dgvDocs_recibeUsu
            // 
            this.dgvDocs_recibeUsu.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDocs_recibeUsu.DataPropertyName = "recibeUsu";
            this.dgvDocs_recibeUsu.FillWeight = 60F;
            this.dgvDocs_recibeUsu.HeaderText = "USUARIO";
            this.dgvDocs_recibeUsu.Name = "dgvDocs_recibeUsu";
            this.dgvDocs_recibeUsu.ReadOnly = true;
            this.dgvDocs_recibeUsu.Width = 60;
            // 
            // dgvDocs_actualizaFe
            // 
            this.dgvDocs_actualizaFe.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDocs_actualizaFe.DataPropertyName = "actualizaFe";
            this.dgvDocs_actualizaFe.FillWeight = 80F;
            this.dgvDocs_actualizaFe.HeaderText = "FE. ACTUALIZA";
            this.dgvDocs_actualizaFe.Name = "dgvDocs_actualizaFe";
            this.dgvDocs_actualizaFe.ReadOnly = true;
            this.dgvDocs_actualizaFe.Width = 80;
            // 
            // dgvDocs_actualizaUsu
            // 
            this.dgvDocs_actualizaUsu.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDocs_actualizaUsu.DataPropertyName = "actualizaUsu";
            this.dgvDocs_actualizaUsu.FillWeight = 60F;
            this.dgvDocs_actualizaUsu.HeaderText = "USUARIO";
            this.dgvDocs_actualizaUsu.Name = "dgvDocs_actualizaUsu";
            this.dgvDocs_actualizaUsu.ReadOnly = true;
            this.dgvDocs_actualizaUsu.Width = 60;
            // 
            // dgvDocs_devuelveFe
            // 
            this.dgvDocs_devuelveFe.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDocs_devuelveFe.DataPropertyName = "devuelveFe";
            this.dgvDocs_devuelveFe.FillWeight = 80F;
            this.dgvDocs_devuelveFe.HeaderText = "FE. DEVOLUCIÓN";
            this.dgvDocs_devuelveFe.Name = "dgvDocs_devuelveFe";
            this.dgvDocs_devuelveFe.ReadOnly = true;
            this.dgvDocs_devuelveFe.Width = 80;
            // 
            // dgvDocs_devuelveUsu
            // 
            this.dgvDocs_devuelveUsu.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDocs_devuelveUsu.DataPropertyName = "devuelveUsu";
            this.dgvDocs_devuelveUsu.FillWeight = 60F;
            this.dgvDocs_devuelveUsu.HeaderText = "USUARIO";
            this.dgvDocs_devuelveUsu.Name = "dgvDocs_devuelveUsu";
            this.dgvDocs_devuelveUsu.ReadOnly = true;
            this.dgvDocs_devuelveUsu.Width = 60;
            // 
            // dgvDocs_obligadoX
            // 
            this.dgvDocs_obligadoX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvDocs_obligadoX.DataPropertyName = "obligadoX";
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.NullValue = false;
            this.dgvDocs_obligadoX.DefaultCellStyle = dataGridViewCellStyle1;
            this.dgvDocs_obligadoX.FalseValue = null;
            this.dgvDocs_obligadoX.FillWeight = 55F;
            this.dgvDocs_obligadoX.HeaderText = "OBLIGATORIO";
            this.dgvDocs_obligadoX.IndeterminateValue = null;
            this.dgvDocs_obligadoX.Name = "dgvDocs_obligadoX";
            this.dgvDocs_obligadoX.ReadOnly = true;
            this.dgvDocs_obligadoX.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvDocs_obligadoX.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvDocs_obligadoX.TrueValue = null;
            this.dgvDocs_obligadoX.Width = 55;
            // 
            // btnActualiza
            // 
            this.btnActualiza.Location = new System.Drawing.Point(96, 6);
            this.btnActualiza.Name = "btnActualiza";
            this.btnActualiza.Size = new System.Drawing.Size(85, 28);
            this.btnActualiza.TabIndex = 1;
            this.btnActualiza.Tag = "btnOK";
            this.toolTip.SetToolTip(this.btnActualiza, "Marcar los documentos que se va actualizar.");
            this.btnActualiza.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.nodo;
            this.btnActualiza.Values.Text = "&Actualizar";
            this.btnActualiza.Click += new System.EventHandler(this.btnActualiza_Click);
            // 
            // btnRecibe
            // 
            this.btnRecibe.Location = new System.Drawing.Point(10, 6);
            this.btnRecibe.Name = "btnRecibe";
            this.btnRecibe.Size = new System.Drawing.Size(85, 28);
            this.btnRecibe.TabIndex = 0;
            this.btnRecibe.Tag = "btnOK";
            this.toolTip.SetToolTip(this.btnRecibe, "Marcar los documentos que se va recepcionar.");
            this.btnRecibe.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.nodo;
            this.btnRecibe.Values.Text = "&Recibir";
            this.btnRecibe.Click += new System.EventHandler(this.btnRecibe_Click);
            // 
            // btnDevuelve
            // 
            this.btnDevuelve.Location = new System.Drawing.Point(182, 6);
            this.btnDevuelve.Name = "btnDevuelve";
            this.btnDevuelve.Size = new System.Drawing.Size(85, 28);
            this.btnDevuelve.TabIndex = 2;
            this.btnDevuelve.Tag = "btnOK";
            this.toolTip.SetToolTip(this.btnDevuelve, "Marcar los documentos que se va devolver.");
            this.btnDevuelve.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.nodo;
            this.btnDevuelve.Values.Text = "&Devolver";
            this.btnDevuelve.Click += new System.EventHandler(this.btnDevuelve_Click);
            // 
            // btnCancela
            // 
            this.btnCancela.Location = new System.Drawing.Point(560, 6);
            this.btnCancela.Name = "btnCancela";
            this.btnCancela.Size = new System.Drawing.Size(110, 28);
            this.btnCancela.TabIndex = 4;
            this.btnCancela.Tag = "";
            this.toolTip.SetToolTip(this.btnCancela, "Cerrar formulario.");
            this.btnCancela.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnCancelar;
            this.btnCancela.Values.Text = "&Cerrar";
            this.btnCancela.Click += new System.EventHandler(this.btnCancela_Click);
            // 
            // FrmDocsEst
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(680, 285);
            this.Name = "FrmDocsEst";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmDocsEst_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDocs)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Krypton.Toolkit.KryptonDataGridView dgvDocs;
        private Krypton.Toolkit.KryptonButton btnDevuelve;
        private Krypton.Toolkit.KryptonButton btnActualiza;
        private Krypton.Toolkit.KryptonButton btnRecibe;
        private Krypton.Toolkit.KryptonButton btnCancela;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvDocs_selX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDocs_idDocsEst;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDocs_idDocs;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDocs_nomDocX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDocs_recibeFe;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDocs_recibeUsu;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDocs_actualizaFe;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDocs_actualizaUsu;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDocs_devuelveFe;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvDocs_devuelveUsu;
        private Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn dgvDocs_obligadoX;
    }
}