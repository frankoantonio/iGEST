namespace com.yupanastudio.igest.winapp
{
    partial class UcCategorias
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UcCategorias));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.btnEdit = new Krypton.Toolkit.KryptonButton();
            this.label27 = new System.Windows.Forms.Label();
            this.btnNew = new Krypton.Toolkit.KryptonButton();
            this.dgvCategoria = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvCat_idCategoria = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCat_orden = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCat_codInterno = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCat_nomCategoria = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCat_nombreClaseX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlBody.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCategoria)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlHeader
            // 
            this.pnlHeader.TabIndex = 4;
            // 
            // lblSubtitle
            // 
            this.lblSubtitle.ImageAlign = System.Drawing.ContentAlignment.TopRight;
            this.lblSubtitle.Location = new System.Drawing.Point(579, 4);
            this.lblSubtitle.Size = new System.Drawing.Size(413, 18);
            this.lblSubtitle.Text = "";
            // 
            // lblTitle
            // 
            this.lblTitle.TabIndex = 0;
            // 
            // pnlBody
            // 
            this.pnlBody.Controls.Add(this.dgvCategoria);
            this.pnlBody.Controls.Add(this.btnNew);
            this.pnlBody.Controls.Add(this.btnEdit);
            this.pnlBody.Controls.Add(this.label27);
            this.pnlBody.TabIndex = 0;
            this.pnlBody.Controls.SetChildIndex(this.label27, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEdit, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnNew, 0);
            this.pnlBody.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvCategoria, 0);
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(950, 33);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(40, 25);
            this.btnEdit.TabIndex = 2;
            this.toolTip.SetToolTip(this.btnEdit, "Modificar \"Categoría\".");
            this.btnEdit.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_edit;
            this.btnEdit.Values.Text = "";
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // label27
            // 
            this.label27.AutoSize = true;
            this.label27.BackColor = System.Drawing.Color.Transparent;
            this.label27.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label27.Location = new System.Drawing.Point(7, 35);
            this.label27.Name = "label27";
            this.label27.Size = new System.Drawing.Size(198, 16);
            this.label27.TabIndex = 0;
            this.label27.Text = "Categorías de Bienes y Servicios";
            this.label27.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(909, 33);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(40, 25);
            this.btnNew.TabIndex = 1;
            this.toolTip.SetToolTip(this.btnNew, "Crear nueva \"Categoría\".");
            this.btnNew.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnNew.Values.Image")));
            this.btnNew.Values.Text = "";
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // dgvCategoria
            // 
            this.dgvCategoria.AllowUserToAddRows = false;
            this.dgvCategoria.AllowUserToDeleteRows = false;
            this.dgvCategoria.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvCategoria.ColumnHeadersHeight = 22;
            this.dgvCategoria.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvCat_idCategoria,
            this.dgvCat_orden,
            this.dgvCat_codInterno,
            this.dgvCat_nomCategoria,
            this.dgvCat_nombreClaseX});
            this.dgvCategoria.Location = new System.Drawing.Point(10, 60);
            this.dgvCategoria.MultiSelect = false;
            this.dgvCategoria.Name = "dgvCategoria";
            this.dgvCategoria.ReadOnly = true;
            this.dgvCategoria.RowHeadersWidth = 22;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvCategoria.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvCategoria.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvCategoria.Size = new System.Drawing.Size(980, 550);
            this.dgvCategoria.StandardTab = true;
            this.dgvCategoria.TabIndex = 0;
            // 
            // dgvCat_idCategoria
            // 
            this.dgvCat_idCategoria.DataPropertyName = "idCategoria";
            this.dgvCat_idCategoria.HeaderText = "idCategoria";
            this.dgvCat_idCategoria.Name = "dgvCat_idCategoria";
            this.dgvCat_idCategoria.ReadOnly = true;
            this.dgvCat_idCategoria.Visible = false;
            // 
            // dgvCat_orden
            // 
            this.dgvCat_orden.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCat_orden.DataPropertyName = "orden";
            this.dgvCat_orden.FillWeight = 75F;
            this.dgvCat_orden.HeaderText = "ORDEN";
            this.dgvCat_orden.Name = "dgvCat_orden";
            this.dgvCat_orden.ReadOnly = true;
            this.dgvCat_orden.Width = 75;
            // 
            // dgvCat_codInterno
            // 
            this.dgvCat_codInterno.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCat_codInterno.DataPropertyName = "codInterno";
            this.dgvCat_codInterno.FillWeight = 75F;
            this.dgvCat_codInterno.HeaderText = "CÓDIGO";
            this.dgvCat_codInterno.Name = "dgvCat_codInterno";
            this.dgvCat_codInterno.ReadOnly = true;
            this.dgvCat_codInterno.Width = 75;
            // 
            // dgvCat_nomCategoria
            // 
            this.dgvCat_nomCategoria.DataPropertyName = "nomCategoria";
            this.dgvCat_nomCategoria.HeaderText = "NOMBRE CATEGORÍA";
            this.dgvCat_nomCategoria.Name = "dgvCat_nomCategoria";
            this.dgvCat_nomCategoria.ReadOnly = true;
            // 
            // dgvCat_nombreClaseX
            // 
            this.dgvCat_nombreClaseX.DataPropertyName = "nomClaseSunatX";
            this.dgvCat_nombreClaseX.HeaderText = "NOMBRE CLASE SUNAT";
            this.dgvCat_nombreClaseX.Name = "dgvCat_nombreClaseX";
            this.dgvCat_nombreClaseX.ReadOnly = true;
            // 
            // UcCategorias
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Name = "UcCategorias";
            this.Load += new System.EventHandler(this.UcCategoria_Load);
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlBody.ResumeLayout(false);
            this.pnlBody.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCategoria)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Label label27;
        private Krypton.Toolkit.KryptonButton btnEdit;
        private Krypton.Toolkit.KryptonButton btnNew;
        private Krypton.Toolkit.KryptonDataGridView dgvCategoria;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCat_idCategoria;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCat_orden;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCat_codInterno;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCat_nomCategoria;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCat_nombreClaseX;
    }
}
