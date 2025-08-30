namespace com.yupanastudio.polariss.app
{
    partial class UcTipos
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvTipos = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvTip_idTipo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTip_nomTipo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTip_nomCorto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTip_codOficial = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTip_grupo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTip_orden = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTip_activo = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlBody.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTipos)).BeginInit();
            this.SuspendLayout();
            // 
            // lblSubtitle
            // 
            this.lblSubtitle.Location = new System.Drawing.Point(596, 4);
            this.lblSubtitle.Text = "Control de datos \"Tipo\"";
            // 
            // pnlBody
            // 
            this.pnlBody.Controls.Add(this.label1);
            this.pnlBody.Controls.Add(this.dgvTipos);
            this.pnlBody.Controls.SetChildIndex(this.dgvTipos, 0);
            this.pnlBody.Controls.SetChildIndex(this.label1, 0);
            this.pnlBody.Controls.SetChildIndex(this.pnlHeader, 0);
            // 
            // dgvTipos
            // 
            this.dgvTipos.AllowUserToAddRows = false;
            this.dgvTipos.AllowUserToDeleteRows = false;
            this.dgvTipos.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvTipos.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvTip_idTipo,
            this.dgvTip_nomTipo,
            this.dgvTip_nomCorto,
            this.dgvTip_codOficial,
            this.dgvTip_grupo,
            this.dgvTip_orden,
            this.dgvTip_activo});
            this.dgvTipos.Location = new System.Drawing.Point(10, 60);
            this.dgvTipos.MultiSelect = false;
            this.dgvTipos.Name = "dgvTipos";
            this.dgvTipos.ReadOnly = true;
            this.dgvTipos.RowHeadersWidth = 22;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvTipos.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvTipos.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvTipos.Size = new System.Drawing.Size(980, 550);
            this.dgvTipos.TabIndex = 0;
            // 
            // dgvTip_idTipo
            // 
            this.dgvTip_idTipo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvTip_idTipo.DataPropertyName = "idTipo";
            this.dgvTip_idTipo.FillWeight = 80F;
            this.dgvTip_idTipo.HeaderText = "ID. TIPO";
            this.dgvTip_idTipo.Name = "dgvTip_idTipo";
            this.dgvTip_idTipo.ReadOnly = true;
            this.dgvTip_idTipo.Width = 80;
            // 
            // dgvTip_nomTipo
            // 
            this.dgvTip_nomTipo.DataPropertyName = "nomTipo";
            this.dgvTip_nomTipo.HeaderText = "NOMBRE TIPO";
            this.dgvTip_nomTipo.Name = "dgvTip_nomTipo";
            this.dgvTip_nomTipo.ReadOnly = true;
            // 
            // dgvTip_nomCorto
            // 
            this.dgvTip_nomCorto.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvTip_nomCorto.DataPropertyName = "nomCorto";
            this.dgvTip_nomCorto.FillWeight = 120F;
            this.dgvTip_nomCorto.HeaderText = "NOMBRE CORTO";
            this.dgvTip_nomCorto.Name = "dgvTip_nomCorto";
            this.dgvTip_nomCorto.ReadOnly = true;
            this.dgvTip_nomCorto.Width = 120;
            // 
            // dgvTip_codOficial
            // 
            this.dgvTip_codOficial.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvTip_codOficial.DataPropertyName = "codOficial";
            this.dgvTip_codOficial.FillWeight = 95F;
            this.dgvTip_codOficial.HeaderText = "COD. OFICIAL";
            this.dgvTip_codOficial.Name = "dgvTip_codOficial";
            this.dgvTip_codOficial.ReadOnly = true;
            this.dgvTip_codOficial.Width = 95;
            // 
            // dgvTip_grupo
            // 
            this.dgvTip_grupo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvTip_grupo.DataPropertyName = "grupo";
            this.dgvTip_grupo.FillWeight = 95F;
            this.dgvTip_grupo.HeaderText = "GRUPO";
            this.dgvTip_grupo.Name = "dgvTip_grupo";
            this.dgvTip_grupo.ReadOnly = true;
            this.dgvTip_grupo.Width = 95;
            // 
            // dgvTip_orden
            // 
            this.dgvTip_orden.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvTip_orden.DataPropertyName = "orden";
            this.dgvTip_orden.FillWeight = 70F;
            this.dgvTip_orden.HeaderText = "ORDEN";
            this.dgvTip_orden.Name = "dgvTip_orden";
            this.dgvTip_orden.ReadOnly = true;
            this.dgvTip_orden.Width = 70;
            // 
            // dgvTip_activo
            // 
            this.dgvTip_activo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvTip_activo.DataPropertyName = "activo";
            this.dgvTip_activo.FillWeight = 70F;
            this.dgvTip_activo.HeaderText = "ACTIVO";
            this.dgvTip_activo.Name = "dgvTip_activo";
            this.dgvTip_activo.ReadOnly = true;
            this.dgvTip_activo.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvTip_activo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvTip_activo.Width = 70;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(7, 40);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(98, 16);
            this.label1.TabIndex = 15;
            this.label1.Text = "Lista de \"Tipos\"";
            // 
            // UcTipos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Name = "UcTipos";
            this.Load += new System.EventHandler(this.UcTipos_Load);
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlBody.ResumeLayout(false);
            this.pnlBody.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTipos)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private Krypton.Toolkit.KryptonDataGridView dgvTipos;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTip_idTipo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTip_nomTipo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTip_nomCorto;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTip_codOficial;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTip_grupo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTip_orden;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvTip_activo;
    }
}
