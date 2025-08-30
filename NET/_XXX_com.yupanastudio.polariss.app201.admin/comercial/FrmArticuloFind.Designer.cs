namespace com.yupanastudio.polariss.app
{
    partial class FrmArticuloFind
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmArticuloFind));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.lnkSelAll = new System.Windows.Forms.LinkLabel();
            this.lnkShowSel = new System.Windows.Forms.LinkLabel();
            this.dgvArticulos = new Krypton.Toolkit.KryptonDataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.cmbCategoria = new com.yupanastudio.polariss.app.ComboBoxMy();
            this.label3 = new System.Windows.Forms.Label();
            this.txtFind = new Krypton.Toolkit.KryptonTextBox();
            this.btnFind = new Krypton.Toolkit.KryptonButton();
            this.dgvArt_selX = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dgvArt_idArticulo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_tipo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_idCategoria = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvArt_dgvArt_fullNameX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_undMed = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_fraccion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_precioConIgv = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_precioConIgvFr = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_idAfectacion = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvArt_activo = new Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.dgvArt_undMoneda = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvArticulos)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Size = new System.Drawing.Size(720, 360);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(720, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(130, 15);
            this.lblTitle.Text = "BIEN / SERVICIO";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 320);
            this.pnlFooter.Size = new System.Drawing.Size(720, 40);
            this.pnlFooter.TabIndex = 21;
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
            this.toolTip.SetToolTip(this.btnOk, "Guardar los cambios.");
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_save;
            this.btnOk.Values.Text = "&Guardar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(583, 5);
            // 
            // lnkSelAll
            // 
            this.lnkSelAll.Font = new System.Drawing.Font("Arial", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lnkSelAll.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnPlay;
            this.lnkSelAll.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lnkSelAll.LinkBehavior = System.Windows.Forms.LinkBehavior.HoverUnderline;
            this.lnkSelAll.Location = new System.Drawing.Point(6, 299);
            this.lnkSelAll.Name = "lnkSelAll";
            this.lnkSelAll.Size = new System.Drawing.Size(125, 17);
            this.lnkSelAll.TabIndex = 216;
            this.lnkSelAll.TabStop = true;
            this.lnkSelAll.Text = "SELECCIONAR TODO";
            this.lnkSelAll.TextAlign = System.Drawing.ContentAlignment.TopRight;
            this.lnkSelAll.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lnkSelAll_LinkClicked);
            // 
            // lnkShowSel
            // 
            this.lnkShowSel.Font = new System.Drawing.Font("Arial", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lnkShowSel.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnPlay;
            this.lnkShowSel.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lnkShowSel.LinkBehavior = System.Windows.Forms.LinkBehavior.HoverUnderline;
            this.lnkShowSel.Location = new System.Drawing.Point(590, 299);
            this.lnkShowSel.Name = "lnkShowSel";
            this.lnkShowSel.Size = new System.Drawing.Size(124, 17);
            this.lnkShowSel.TabIndex = 217;
            this.lnkShowSel.TabStop = true;
            this.lnkShowSel.Text = "SELECCIONADOS: 0";
            this.lnkShowSel.TextAlign = System.Drawing.ContentAlignment.TopRight;
            this.lnkShowSel.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lnkShowSel_LinkClicked);
            // 
            // dgvArticulos
            // 
            this.dgvArticulos.AllowUserToAddRows = false;
            this.dgvArticulos.AllowUserToDeleteRows = false;
            this.dgvArticulos.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvArticulos.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvArt_selX,
            this.dgvArt_idArticulo,
            this.dgvArt_tipo,
            this.dgvArt_idCategoria,
            this.dgvArt_dgvArt_fullNameX,
            this.dgvArt_undMed,
            this.dgvArt_fraccion,
            this.dgvArt_precioConIgv,
            this.dgvArt_precioConIgvFr,
            this.dgvArt_idAfectacion,
            this.dgvArt_activo,
            this.dgvArt_undMoneda});
            this.dgvArticulos.Location = new System.Drawing.Point(10, 75);
            this.dgvArticulos.MultiSelect = false;
            this.dgvArticulos.Name = "dgvArticulos";
            this.dgvArticulos.RowHeadersWidth = 22;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvArticulos.RowsDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvArticulos.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvArticulos.Size = new System.Drawing.Size(700, 221);
            this.dgvArticulos.StandardTab = true;
            this.dgvArticulos.TabIndex = 215;
            this.dgvArticulos.CellValueChanged += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvArticulos_CellValueChanged);
            this.dgvArticulos.CurrentCellDirtyStateChanged += new System.EventHandler(this.dgvArticulos_CurrentCellDirtyStateChanged);
            this.dgvArticulos.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvArticulos_KeyDown);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(418, 45);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(48, 16);
            this.label1.TabIndex = 219;
            this.label1.Text = "Buscar";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbCategoria
            // 
            this.cmbCategoria.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbCategoria.DisplayMember = "nomCategoria";
            this.cmbCategoria.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCategoria.DropDownWidth = 450;
            this.cmbCategoria.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbCategoria.FormattingEnabled = true;
            this.cmbCategoria.Location = new System.Drawing.Point(132, 45);
            this.cmbCategoria.Name = "cmbCategoria";
            this.cmbCategoria.Size = new System.Drawing.Size(200, 21);
            this.cmbCategoria.TabIndex = 212;
            this.cmbCategoria.ValueMember = "idCategoria";
            this.cmbCategoria.SelectedIndexChanged += new System.EventHandler(this.cmbCategoria_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label3.Location = new System.Drawing.Point(8, 45);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(121, 16);
            this.label3.TabIndex = 218;
            this.label3.Text = "Filtrar por Categoría";
            this.label3.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtFind
            // 
            this.txtFind.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtFind.Location = new System.Drawing.Point(469, 45);
            this.txtFind.MaxLength = 30;
            this.txtFind.Name = "txtFind";
            this.txtFind.Size = new System.Drawing.Size(200, 23);
            this.txtFind.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtFind.TabIndex = 213;
            this.txtFind.Enter += new System.EventHandler(this.txtFind_Enter);
            this.txtFind.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtFind_KeyDown);
            this.txtFind.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtFind_KeyPress);
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(670, 45);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(40, 25);
            this.btnFind.TabIndex = 214;
            this.toolTip.SetToolTip(this.btnFind, "Buscar \"Bien\" o \"Servicio\".");
            this.btnFind.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_find;
            this.btnFind.Values.Text = "";
            this.btnFind.Click += new System.EventHandler(this.btnFind_Click);
            // 
            // dgvArt_selX
            // 
            this.dgvArt_selX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_selX.DataPropertyName = "selX";
            this.dgvArt_selX.FillWeight = 37F;
            this.dgvArt_selX.HeaderText = "SELECCIONAR";
            this.dgvArt_selX.Name = "dgvArt_selX";
            this.dgvArt_selX.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvArt_selX.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvArt_selX.Width = 37;
            // 
            // dgvArt_idArticulo
            // 
            this.dgvArt_idArticulo.DataPropertyName = "idArticulo";
            this.dgvArt_idArticulo.HeaderText = "idArticulo";
            this.dgvArt_idArticulo.Name = "dgvArt_idArticulo";
            this.dgvArt_idArticulo.Visible = false;
            // 
            // dgvArt_tipo
            // 
            this.dgvArt_tipo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_tipo.DataPropertyName = "tipo";
            this.dgvArt_tipo.FillWeight = 35F;
            this.dgvArt_tipo.HeaderText = "TIPO";
            this.dgvArt_tipo.Name = "dgvArt_tipo";
            this.dgvArt_tipo.Width = 35;
            // 
            // dgvArt_idCategoria
            // 
            this.dgvArt_idCategoria.DataPropertyName = "idCategoria";
            this.dgvArt_idCategoria.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvArt_idCategoria.HeaderText = "CATEGORÍA";
            this.dgvArt_idCategoria.Name = "dgvArt_idCategoria";
            this.dgvArt_idCategoria.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvArt_idCategoria.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // dgvArt_dgvArt_fullNameX
            // 
            this.dgvArt_dgvArt_fullNameX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_dgvArt_fullNameX.DataPropertyName = "fullNameX";
            this.dgvArt_dgvArt_fullNameX.FillWeight = 225F;
            this.dgvArt_dgvArt_fullNameX.HeaderText = "BIEN o SERVICIO";
            this.dgvArt_dgvArt_fullNameX.Name = "dgvArt_dgvArt_fullNameX";
            this.dgvArt_dgvArt_fullNameX.Width = 225;
            // 
            // dgvArt_undMed
            // 
            this.dgvArt_undMed.DataPropertyName = "undMed";
            this.dgvArt_undMed.HeaderText = "UN. MEDIDA";
            this.dgvArt_undMed.Name = "dgvArt_undMed";
            // 
            // dgvArt_fraccion
            // 
            this.dgvArt_fraccion.DataPropertyName = "fraccion";
            this.dgvArt_fraccion.HeaderText = "FRACCIÓN";
            this.dgvArt_fraccion.Name = "dgvArt_fraccion";
            // 
            // dgvArt_precioConIgv
            // 
            this.dgvArt_precioConIgv.DataPropertyName = "precioConIgv";
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            dataGridViewCellStyle1.Format = "N2";
            dataGridViewCellStyle1.NullValue = null;
            this.dgvArt_precioConIgv.DefaultCellStyle = dataGridViewCellStyle1;
            this.dgvArt_precioConIgv.HeaderText = "P.V. con IGV";
            this.dgvArt_precioConIgv.Name = "dgvArt_precioConIgv";
            // 
            // dgvArt_precioConIgvFr
            // 
            this.dgvArt_precioConIgvFr.DataPropertyName = "precioConIgvFr";
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            dataGridViewCellStyle2.Format = "N2";
            this.dgvArt_precioConIgvFr.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvArt_precioConIgvFr.HeaderText = "P.V. con IGV - FRACCIÓN";
            this.dgvArt_precioConIgvFr.Name = "dgvArt_precioConIgvFr";
            // 
            // dgvArt_idAfectacion
            // 
            this.dgvArt_idAfectacion.DataPropertyName = "idAfectacion";
            this.dgvArt_idAfectacion.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvArt_idAfectacion.HeaderText = "AFECTACIÓN";
            this.dgvArt_idAfectacion.Name = "dgvArt_idAfectacion";
            this.dgvArt_idAfectacion.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvArt_idAfectacion.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // dgvArt_activo
            // 
            this.dgvArt_activo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_activo.DataPropertyName = "activo";
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle3.NullValue = false;
            this.dgvArt_activo.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvArt_activo.FalseValue = null;
            this.dgvArt_activo.FillWeight = 35F;
            this.dgvArt_activo.HeaderText = "ACTIVO";
            this.dgvArt_activo.IndeterminateValue = null;
            this.dgvArt_activo.Name = "dgvArt_activo";
            this.dgvArt_activo.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvArt_activo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvArt_activo.TrueValue = null;
            this.dgvArt_activo.Width = 35;
            // 
            // dgvArt_undMoneda
            // 
            this.dgvArt_undMoneda.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_undMoneda.DataPropertyName = "undMoneda";
            this.dgvArt_undMoneda.FillWeight = 35F;
            this.dgvArt_undMoneda.HeaderText = "MONEDA";
            this.dgvArt_undMoneda.Name = "dgvArt_undMoneda";
            this.dgvArt_undMoneda.Width = 35;
            // 
            // FrmArticuloFind
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(720, 360);
            this.Controls.Add(this.lnkSelAll);
            this.Controls.Add(this.lnkShowSel);
            this.Controls.Add(this.dgvArticulos);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmbCategoria);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtFind);
            this.Controls.Add(this.btnFind);
            this.Name = "FrmArticuloFind";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmArticuloFind_Load);
            this.Controls.SetChildIndex(this.pnlMain, 0);
            this.Controls.SetChildIndex(this.btnFind, 0);
            this.Controls.SetChildIndex(this.txtFind, 0);
            this.Controls.SetChildIndex(this.label3, 0);
            this.Controls.SetChildIndex(this.cmbCategoria, 0);
            this.Controls.SetChildIndex(this.label1, 0);
            this.Controls.SetChildIndex(this.dgvArticulos, 0);
            this.Controls.SetChildIndex(this.lnkShowSel, 0);
            this.Controls.SetChildIndex(this.lnkSelAll, 0);
            this.pnlMain.ResumeLayout(false);
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvArticulos)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.LinkLabel lnkSelAll;
        private System.Windows.Forms.LinkLabel lnkShowSel;
        private Krypton.Toolkit.KryptonDataGridView dgvArticulos;
        private System.Windows.Forms.Label label1;
        private ComboBoxMy cmbCategoria;
        private System.Windows.Forms.Label label3;
        private Krypton.Toolkit.KryptonTextBox txtFind;
        private Krypton.Toolkit.KryptonButton btnFind;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvArt_selX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_idArticulo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_tipo;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvArt_idCategoria;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_dgvArt_fullNameX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_undMed;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_fraccion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_precioConIgv;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_precioConIgvFr;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvArt_idAfectacion;
        private Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn dgvArt_activo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_undMoneda;
    }
}