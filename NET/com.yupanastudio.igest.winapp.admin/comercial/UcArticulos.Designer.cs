namespace com.yupanastudio.igest.winapp
{
    partial class UcArticulos
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UcArticulos));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            this.btnFind = new Krypton.Toolkit.KryptonButton();
            this.btnEdit = new Krypton.Toolkit.KryptonButton();
            this.label27 = new System.Windows.Forms.Label();
            this.dgvArticulos = new Krypton.Toolkit.KryptonDataGridView();
            this.btnNew = new Krypton.Toolkit.KryptonButton();
            this.txtFind = new Krypton.Toolkit.KryptonTextBox();
            this.cmbCategoria = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.dgvArt_idArticulo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_tipo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_idCategoria = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvArt_subCategoria = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_fullNameX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_undMed = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_fraccion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_precioConIgv = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_precioConIgvFr = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_stock = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_stockFr = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArt_idAfectacion = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvArt_venta = new Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.dgvArt_compra = new Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.dgvArt_editPrecio = new Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.dgvArt_activo = new Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.dgvArt_patrimonio = new Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlBody.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvArticulos)).BeginInit();
            this.SuspendLayout();
            // 
            // lblSubtitle
            // 
            this.lblSubtitle.ImageAlign = System.Drawing.ContentAlignment.TopRight;
            this.lblSubtitle.Location = new System.Drawing.Point(579, 4);
            this.lblSubtitle.Size = new System.Drawing.Size(413, 18);
            this.lblSubtitle.Text = "";
            // 
            // pnlBody
            // 
            this.pnlBody.Controls.Add(this.label1);
            this.pnlBody.Controls.Add(this.cmbCategoria);
            this.pnlBody.Controls.Add(this.label3);
            this.pnlBody.Controls.Add(this.txtFind);
            this.pnlBody.Controls.Add(this.btnNew);
            this.pnlBody.Controls.Add(this.dgvArticulos);
            this.pnlBody.Controls.Add(this.btnFind);
            this.pnlBody.Controls.Add(this.btnEdit);
            this.pnlBody.Controls.Add(this.label27);
            this.pnlBody.TabIndex = 0;
            this.pnlBody.Controls.SetChildIndex(this.label27, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEdit, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnFind, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvArticulos, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnNew, 0);
            this.pnlBody.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlBody.Controls.SetChildIndex(this.txtFind, 0);
            this.pnlBody.Controls.SetChildIndex(this.label3, 0);
            this.pnlBody.Controls.SetChildIndex(this.cmbCategoria, 0);
            this.pnlBody.Controls.SetChildIndex(this.label1, 0);
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(868, 33);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(40, 25);
            this.btnFind.TabIndex = 2;
            this.toolTip.SetToolTip(this.btnFind, "Buscar \"Bien\" o \"Servicio\".");
            this.btnFind.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_find;
            this.btnFind.Values.Text = "";
            this.btnFind.Click += new System.EventHandler(this.btnFind_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(950, 33);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(40, 25);
            this.btnEdit.TabIndex = 5;
            this.toolTip.SetToolTip(this.btnEdit, "Modificar \"Bien\" o \"Servicio\".");
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
            this.label27.Size = new System.Drawing.Size(164, 16);
            this.label27.TabIndex = 94;
            this.label27.Text = "Lista de Bienes y Servicios";
            this.label27.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // dgvArticulos
            // 
            this.dgvArticulos.AllowUserToAddRows = false;
            this.dgvArticulos.AllowUserToDeleteRows = false;
            this.dgvArticulos.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvArticulos.ColumnHeadersHeight = 22;
            this.dgvArticulos.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvArt_idArticulo,
            this.dgvArt_tipo,
            this.dgvArt_idCategoria,
            this.dgvArt_subCategoria,
            this.dgvArt_fullNameX,
            this.dgvArt_undMed,
            this.dgvArt_fraccion,
            this.dgvArt_precioConIgv,
            this.dgvArt_precioConIgvFr,
            this.dgvArt_stock,
            this.dgvArt_stockFr,
            this.dgvArt_idAfectacion,
            this.dgvArt_venta,
            this.dgvArt_compra,
            this.dgvArt_editPrecio,
            this.dgvArt_activo,
            this.dgvArt_patrimonio});
            this.dgvArticulos.Location = new System.Drawing.Point(10, 60);
            this.dgvArticulos.MultiSelect = false;
            this.dgvArticulos.Name = "dgvArticulos";
            this.dgvArticulos.ReadOnly = true;
            this.dgvArticulos.RowHeadersWidth = 22;
            dataGridViewCellStyle9.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle9.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvArticulos.RowsDefaultCellStyle = dataGridViewCellStyle9;
            this.dgvArticulos.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvArticulos.Size = new System.Drawing.Size(980, 550);
            this.dgvArticulos.StandardTab = true;
            this.dgvArticulos.TabIndex = 3;
            this.dgvArticulos.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvArticulos_KeyDown);
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(909, 33);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(40, 25);
            this.btnNew.TabIndex = 4;
            this.toolTip.SetToolTip(this.btnNew, "Crear nuevo \"Bien\" o \"Servicio\".");
            this.btnNew.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnNew.Values.Image")));
            this.btnNew.Values.Text = "";
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // txtFind
            // 
            this.txtFind.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtFind.Location = new System.Drawing.Point(667, 33);
            this.txtFind.MaxLength = 30;
            this.txtFind.Name = "txtFind";
            this.txtFind.Size = new System.Drawing.Size(200, 23);
            this.txtFind.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtFind.TabIndex = 1;
            this.txtFind.Enter += new System.EventHandler(this.txtFind_Enter);
            this.txtFind.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtFind_KeyDown);
            this.txtFind.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtFind_KeyPress);
            // 
            // cmbCategoria
            // 
            this.cmbCategoria.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbCategoria.DisplayMember = "nomCategoria";
            this.cmbCategoria.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCategoria.DropDownWidth = 450;
            this.cmbCategoria.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbCategoria.FormattingEnabled = true;
            this.cmbCategoria.Location = new System.Drawing.Point(400, 33);
            this.cmbCategoria.Name = "cmbCategoria";
            this.cmbCategoria.Size = new System.Drawing.Size(200, 21);
            this.cmbCategoria.TabIndex = 0;
            this.cmbCategoria.ValueMember = "idCategoria";
            this.cmbCategoria.SelectedIndexChanged += new System.EventHandler(this.cmbCategoria_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label3.Location = new System.Drawing.Point(276, 33);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(121, 16);
            this.label3.TabIndex = 204;
            this.label3.Text = "Filtrar por Categoría";
            this.label3.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(616, 33);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(48, 16);
            this.label1.TabIndex = 205;
            this.label1.Text = "Buscar";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // dgvArt_idArticulo
            // 
            this.dgvArt_idArticulo.DataPropertyName = "idArticulo";
            this.dgvArt_idArticulo.HeaderText = "idArticulo";
            this.dgvArt_idArticulo.Name = "dgvArt_idArticulo";
            this.dgvArt_idArticulo.ReadOnly = true;
            this.dgvArt_idArticulo.Visible = false;
            // 
            // dgvArt_tipo
            // 
            this.dgvArt_tipo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_tipo.DataPropertyName = "tipo";
            this.dgvArt_tipo.FillWeight = 35F;
            this.dgvArt_tipo.HeaderText = "TIPO";
            this.dgvArt_tipo.Name = "dgvArt_tipo";
            this.dgvArt_tipo.ReadOnly = true;
            this.dgvArt_tipo.Width = 35;
            // 
            // dgvArt_idCategoria
            // 
            this.dgvArt_idCategoria.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_idCategoria.DataPropertyName = "idCategoria";
            this.dgvArt_idCategoria.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvArt_idCategoria.FillWeight = 60F;
            this.dgvArt_idCategoria.HeaderText = "CATEGORÍA";
            this.dgvArt_idCategoria.Name = "dgvArt_idCategoria";
            this.dgvArt_idCategoria.ReadOnly = true;
            this.dgvArt_idCategoria.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvArt_idCategoria.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvArt_idCategoria.Width = 60;
            // 
            // dgvArt_subCategoria
            // 
            this.dgvArt_subCategoria.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_subCategoria.DataPropertyName = "subCategoria";
            this.dgvArt_subCategoria.FillWeight = 60F;
            this.dgvArt_subCategoria.HeaderText = "SUBCATEGORÍA";
            this.dgvArt_subCategoria.Name = "dgvArt_subCategoria";
            this.dgvArt_subCategoria.ReadOnly = true;
            this.dgvArt_subCategoria.Width = 60;
            // 
            // dgvArt_fullNameX
            // 
            this.dgvArt_fullNameX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_fullNameX.DataPropertyName = "fullNameX";
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            this.dgvArt_fullNameX.DefaultCellStyle = dataGridViewCellStyle1;
            this.dgvArt_fullNameX.FillWeight = 205F;
            this.dgvArt_fullNameX.HeaderText = "NOMBRE B/S";
            this.dgvArt_fullNameX.Name = "dgvArt_fullNameX";
            this.dgvArt_fullNameX.ReadOnly = true;
            this.dgvArt_fullNameX.Width = 205;
            // 
            // dgvArt_undMed
            // 
            this.dgvArt_undMed.DataPropertyName = "undMed";
            this.dgvArt_undMed.HeaderText = "UND. MED.";
            this.dgvArt_undMed.Name = "dgvArt_undMed";
            this.dgvArt_undMed.ReadOnly = true;
            // 
            // dgvArt_fraccion
            // 
            this.dgvArt_fraccion.DataPropertyName = "fraccion";
            this.dgvArt_fraccion.HeaderText = "FRACCIÓN";
            this.dgvArt_fraccion.Name = "dgvArt_fraccion";
            this.dgvArt_fraccion.ReadOnly = true;
            // 
            // dgvArt_precioConIgv
            // 
            this.dgvArt_precioConIgv.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_precioConIgv.DataPropertyName = "precioConIgv";
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            dataGridViewCellStyle2.Format = "C4";
            this.dgvArt_precioConIgv.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvArt_precioConIgv.FillWeight = 85F;
            this.dgvArt_precioConIgv.HeaderText = "P. V. con IGV";
            this.dgvArt_precioConIgv.Name = "dgvArt_precioConIgv";
            this.dgvArt_precioConIgv.ReadOnly = true;
            this.dgvArt_precioConIgv.Width = 85;
            // 
            // dgvArt_precioConIgvFr
            // 
            this.dgvArt_precioConIgvFr.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_precioConIgvFr.DataPropertyName = "precioConIgvFr";
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.TopRight;
            dataGridViewCellStyle3.Format = "C4";
            this.dgvArt_precioConIgvFr.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvArt_precioConIgvFr.FillWeight = 85F;
            this.dgvArt_precioConIgvFr.HeaderText = "P. V. con IGV - FRACCIÓN";
            this.dgvArt_precioConIgvFr.Name = "dgvArt_precioConIgvFr";
            this.dgvArt_precioConIgvFr.ReadOnly = true;
            this.dgvArt_precioConIgvFr.Width = 85;
            // 
            // dgvArt_stock
            // 
            this.dgvArt_stock.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_stock.DataPropertyName = "stock";
            this.dgvArt_stock.FillWeight = 50F;
            this.dgvArt_stock.HeaderText = "STOCK";
            this.dgvArt_stock.Name = "dgvArt_stock";
            this.dgvArt_stock.ReadOnly = true;
            this.dgvArt_stock.Width = 50;
            // 
            // dgvArt_stockFr
            // 
            this.dgvArt_stockFr.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArt_stockFr.DataPropertyName = "stockFr";
            this.dgvArt_stockFr.FillWeight = 50F;
            this.dgvArt_stockFr.HeaderText = "STOCK FRACCIÓN";
            this.dgvArt_stockFr.Name = "dgvArt_stockFr";
            this.dgvArt_stockFr.ReadOnly = true;
            this.dgvArt_stockFr.Width = 50;
            // 
            // dgvArt_idAfectacion
            // 
            this.dgvArt_idAfectacion.DataPropertyName = "idAfectacion";
            this.dgvArt_idAfectacion.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvArt_idAfectacion.HeaderText = "AFECTACIÓN";
            this.dgvArt_idAfectacion.Name = "dgvArt_idAfectacion";
            this.dgvArt_idAfectacion.ReadOnly = true;
            this.dgvArt_idAfectacion.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvArt_idAfectacion.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // dgvArt_venta
            // 
            this.dgvArt_venta.DataPropertyName = "venta";
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle4.NullValue = false;
            this.dgvArt_venta.DefaultCellStyle = dataGridViewCellStyle4;
            this.dgvArt_venta.FalseValue = null;
            this.dgvArt_venta.HeaderText = "VENTA";
            this.dgvArt_venta.IndeterminateValue = null;
            this.dgvArt_venta.Name = "dgvArt_venta";
            this.dgvArt_venta.ReadOnly = true;
            this.dgvArt_venta.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvArt_venta.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvArt_venta.TrueValue = null;
            // 
            // dgvArt_compra
            // 
            this.dgvArt_compra.DataPropertyName = "compra";
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle5.NullValue = false;
            this.dgvArt_compra.DefaultCellStyle = dataGridViewCellStyle5;
            this.dgvArt_compra.FalseValue = null;
            this.dgvArt_compra.HeaderText = "COMPRA";
            this.dgvArt_compra.IndeterminateValue = null;
            this.dgvArt_compra.Name = "dgvArt_compra";
            this.dgvArt_compra.ReadOnly = true;
            this.dgvArt_compra.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvArt_compra.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvArt_compra.TrueValue = null;
            // 
            // dgvArt_editPrecio
            // 
            this.dgvArt_editPrecio.DataPropertyName = "editPrecio";
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle6.NullValue = false;
            this.dgvArt_editPrecio.DefaultCellStyle = dataGridViewCellStyle6;
            this.dgvArt_editPrecio.FalseValue = null;
            this.dgvArt_editPrecio.HeaderText = "MODIFICAR PRECIO";
            this.dgvArt_editPrecio.IndeterminateValue = null;
            this.dgvArt_editPrecio.Name = "dgvArt_editPrecio";
            this.dgvArt_editPrecio.ReadOnly = true;
            this.dgvArt_editPrecio.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvArt_editPrecio.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvArt_editPrecio.TrueValue = null;
            // 
            // dgvArt_activo
            // 
            this.dgvArt_activo.DataPropertyName = "activo";
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle7.NullValue = false;
            this.dgvArt_activo.DefaultCellStyle = dataGridViewCellStyle7;
            this.dgvArt_activo.FalseValue = null;
            this.dgvArt_activo.HeaderText = "ACTIVO";
            this.dgvArt_activo.IndeterminateValue = null;
            this.dgvArt_activo.Name = "dgvArt_activo";
            this.dgvArt_activo.ReadOnly = true;
            this.dgvArt_activo.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvArt_activo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvArt_activo.TrueValue = null;
            // 
            // dgvArt_patrimonio
            // 
            this.dgvArt_patrimonio.DataPropertyName = "patrimonio";
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle8.NullValue = false;
            this.dgvArt_patrimonio.DefaultCellStyle = dataGridViewCellStyle8;
            this.dgvArt_patrimonio.FalseValue = null;
            this.dgvArt_patrimonio.HeaderText = "PATRIMONIO";
            this.dgvArt_patrimonio.IndeterminateValue = null;
            this.dgvArt_patrimonio.Name = "dgvArt_patrimonio";
            this.dgvArt_patrimonio.ReadOnly = true;
            this.dgvArt_patrimonio.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvArt_patrimonio.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvArt_patrimonio.TrueValue = null;
            // 
            // UcArticulos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Name = "UcArticulos";
            this.Load += new System.EventHandler(this.UcArticulos_Load);
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlBody.ResumeLayout(false);
            this.pnlBody.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvArticulos)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private Krypton.Toolkit.KryptonButton btnFind;
        private System.Windows.Forms.Label label27;
        private Krypton.Toolkit.KryptonButton btnEdit;
        private Krypton.Toolkit.KryptonDataGridView dgvArticulos;
        private Krypton.Toolkit.KryptonButton btnNew;
        private ComboBoxMy cmbCategoria;
        private System.Windows.Forms.Label label3;
        private Krypton.Toolkit.KryptonTextBox txtFind;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_idArticulo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_tipo;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvArt_idCategoria;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_subCategoria;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_fullNameX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_undMed;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_fraccion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_precioConIgv;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_precioConIgvFr;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_stock;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArt_stockFr;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvArt_idAfectacion;
        private Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn dgvArt_venta;
        private Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn dgvArt_compra;
        private Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn dgvArt_editPrecio;
        private Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn dgvArt_activo;
        private Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn dgvArt_patrimonio;
    }
}
