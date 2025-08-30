namespace com.yupanastudio.polariss.app.principal
{
    partial class FrmBuscarArticulo
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmBuscarArticulo));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.gbx1 = new ComponentFactory.Krypton.Toolkit.KryptonGroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtFind = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.btnFind = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.dgvArticulos = new ComponentFactory.Krypton.Toolkit.KryptonDataGridView();
            this.dgvArticulos_selX = new ComponentFactory.Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.dgvArticulos_idArticulo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArticulos_idAfectacion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArticulos_codInterno = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArticulos_nomArticulo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArticulos_undMed = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArticulos_fraccion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArticulos_idMonedaX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArticulos_impTotX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvArticulos_impFracTotX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblCantArticulo = new System.Windows.Forms.Label();
            this.lnkSel = new ComponentFactory.Krypton.Toolkit.KryptonLinkLabel();
            this.dgvAlmArt = new ComponentFactory.Krypton.Toolkit.KryptonDataGridView();
            this.kryptonDataGridViewCheckBoxColumn1 = new ComponentFactory.Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.dgvAlmArt_nomAlmacenX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvAlmArt_idAlmArt = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvAlmArt_idAlmacen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvAlmArt_idArticulo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvAlmArt_stock = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvAlmArt_stockFracc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvAlmArt_actAlmacenX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sel1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sel2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kryptonDataGridView1 = new ComponentFactory.Krypton.Toolkit.KryptonDataGridView();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kryptonCheckBox1 = new ComponentFactory.Krypton.Toolkit.KryptonCheckBox();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1.Panel)).BeginInit();
            this.gbx1.Panel.SuspendLayout();
            this.gbx1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvArticulos)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlmArt)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonDataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.kryptonDataGridView1);
            this.pnlMain.Controls.Add(this.dgvAlmArt);
            this.pnlMain.Controls.Add(this.dgvArticulos);
            this.pnlMain.Controls.Add(this.gbx1);
            this.pnlMain.Size = new System.Drawing.Size(990, 475);
            this.pnlMain.TabIndex = 0;
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.gbx1, 0);
            this.pnlMain.Controls.SetChildIndex(this.dgvArticulos, 0);
            this.pnlMain.Controls.SetChildIndex(this.dgvAlmArt, 0);
            this.pnlMain.Controls.SetChildIndex(this.kryptonDataGridView1, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(990, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(110, 15);
            this.lblTitle.Text = "Buscar artículos";
            // 
            // imgTitle
            // 
            this.imgTitle.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_find;
            // 
            // pnlFooter
            // 
            this.pnlFooter.Controls.Add(this.lnkSel);
            this.pnlFooter.Controls.Add(this.lblCantArticulo);
            this.pnlFooter.Location = new System.Drawing.Point(0, 435);
            this.pnlFooter.Size = new System.Drawing.Size(990, 40);
            this.pnlFooter.TabIndex = 4;
            this.pnlFooter.Controls.SetChildIndex(this.lblCantArticulo, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnOk, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnCancel, 0);
            this.pnlFooter.Controls.SetChildIndex(this.lnkSel, 0);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(498, 6);
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(383, 6);
            this.btnOk.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnOk.Values.Image")));
            this.btnOk.Values.Text = "&Aceptar";
            this.btnOk.Click += new System.EventHandler(this.BtnOk_Click);
            // 
            // gbx1
            // 
            this.gbx1.CaptionStyle = ComponentFactory.Krypton.Toolkit.LabelStyle.BoldPanel;
            this.gbx1.GroupBackStyle = ComponentFactory.Krypton.Toolkit.PaletteBackStyle.GridHeaderColumnList;
            this.gbx1.Location = new System.Drawing.Point(10, 40);
            this.gbx1.Name = "gbx1";
            // 
            // gbx1.Panel
            // 
            this.gbx1.Panel.Controls.Add(this.kryptonCheckBox1);
            this.gbx1.Panel.Controls.Add(this.label2);
            this.gbx1.Panel.Controls.Add(this.txtFind);
            this.gbx1.Panel.Controls.Add(this.btnFind);
            this.gbx1.Size = new System.Drawing.Size(625, 48);
            this.gbx1.TabIndex = 0;
            this.gbx1.Values.Heading = "";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Navy;
            this.label2.Location = new System.Drawing.Point(10, 10);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(77, 13);
            this.label2.TabIndex = 15;
            this.label2.Text = "Bien / Servicio";
            // 
            // txtFind
            // 
            this.txtFind.Location = new System.Drawing.Point(93, 10);
            this.txtFind.Name = "txtFind";
            this.txtFind.Size = new System.Drawing.Size(239, 23);
            this.txtFind.TabIndex = 0;
            this.txtFind.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtFind.TextChanged += new System.EventHandler(this.TxtFind_TextChanged);
            this.txtFind.KeyDown += new System.Windows.Forms.KeyEventHandler(this.TxtFind_KeyDown);
            this.txtFind.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtFind_KeyPress);
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(344, 10);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(30, 25);
            this.btnFind.TabIndex = 1;
            this.btnFind.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_find;
            this.btnFind.Values.Text = "";
            this.btnFind.Click += new System.EventHandler(this.BtnFind_Click);
            // 
            // dgvArticulos
            // 
            this.dgvArticulos.AllowUserToAddRows = false;
            this.dgvArticulos.AllowUserToDeleteRows = false;
            this.dgvArticulos.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvArticulos.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvArticulos_selX,
            this.dgvArticulos_idArticulo,
            this.dgvArticulos_idAfectacion,
            this.dgvArticulos_codInterno,
            this.dgvArticulos_nomArticulo,
            this.dgvArticulos_undMed,
            this.dgvArticulos_fraccion,
            this.dgvArticulos_idMonedaX,
            this.dgvArticulos_impTotX,
            this.dgvArticulos_impFracTotX});
            this.dgvArticulos.Location = new System.Drawing.Point(10, 100);
            this.dgvArticulos.MultiSelect = false;
            this.dgvArticulos.Name = "dgvArticulos";
            this.dgvArticulos.RowHeadersWidth = 20;
            dataGridViewCellStyle5.SelectionBackColor = System.Drawing.Color.CornflowerBlue;
            dataGridViewCellStyle5.SelectionForeColor = System.Drawing.Color.White;
            this.dgvArticulos.RowsDefaultCellStyle = dataGridViewCellStyle5;
            this.dgvArticulos.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvArticulos.Size = new System.Drawing.Size(625, 177);
            this.dgvArticulos.TabIndex = 1;
            this.dgvArticulos.CellValueChanged += new System.Windows.Forms.DataGridViewCellEventHandler(this.DgvArticulos_CellValueChanged);
            this.dgvArticulos.CurrentCellDirtyStateChanged += new System.EventHandler(this.DgvArticulos_CurrentCellDirtyStateChanged);
            this.dgvArticulos.SelectionChanged += new System.EventHandler(this.DgvArticulos_SelectionChanged);
            this.dgvArticulos.KeyDown += new System.Windows.Forms.KeyEventHandler(this.DgvArticulos_KeyDown);
            // 
            // dgvArticulos_selX
            // 
            this.dgvArticulos_selX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArticulos_selX.DataPropertyName = "selX";
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle4.NullValue = false;
            this.dgvArticulos_selX.DefaultCellStyle = dataGridViewCellStyle4;
            this.dgvArticulos_selX.FalseValue = null;
            this.dgvArticulos_selX.FillWeight = 35F;
            this.dgvArticulos_selX.HeaderText = "SEL.";
            this.dgvArticulos_selX.IndeterminateValue = null;
            this.dgvArticulos_selX.Name = "dgvArticulos_selX";
            this.dgvArticulos_selX.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvArticulos_selX.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvArticulos_selX.TrueValue = null;
            this.dgvArticulos_selX.Width = 35;
            // 
            // dgvArticulos_idArticulo
            // 
            this.dgvArticulos_idArticulo.DataPropertyName = "idArticulo";
            this.dgvArticulos_idArticulo.HeaderText = "idArticulo";
            this.dgvArticulos_idArticulo.Name = "dgvArticulos_idArticulo";
            this.dgvArticulos_idArticulo.ReadOnly = true;
            this.dgvArticulos_idArticulo.Visible = false;
            // 
            // dgvArticulos_idAfectacion
            // 
            this.dgvArticulos_idAfectacion.DataPropertyName = "idAfectacion";
            this.dgvArticulos_idAfectacion.HeaderText = "idAfectacion";
            this.dgvArticulos_idAfectacion.Name = "dgvArticulos_idAfectacion";
            this.dgvArticulos_idAfectacion.ReadOnly = true;
            this.dgvArticulos_idAfectacion.Visible = false;
            // 
            // dgvArticulos_codInterno
            // 
            this.dgvArticulos_codInterno.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArticulos_codInterno.DataPropertyName = "codInterno";
            this.dgvArticulos_codInterno.FillWeight = 60F;
            this.dgvArticulos_codInterno.HeaderText = "COD.";
            this.dgvArticulos_codInterno.Name = "dgvArticulos_codInterno";
            this.dgvArticulos_codInterno.ReadOnly = true;
            this.dgvArticulos_codInterno.Width = 60;
            // 
            // dgvArticulos_nomArticulo
            // 
            this.dgvArticulos_nomArticulo.DataPropertyName = "nomArticulo";
            this.dgvArticulos_nomArticulo.HeaderText = "BIEN | SERVICIO";
            this.dgvArticulos_nomArticulo.Name = "dgvArticulos_nomArticulo";
            this.dgvArticulos_nomArticulo.ReadOnly = true;
            // 
            // dgvArticulos_undMed
            // 
            this.dgvArticulos_undMed.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArticulos_undMed.DataPropertyName = "undMed";
            this.dgvArticulos_undMed.FillWeight = 45F;
            this.dgvArticulos_undMed.HeaderText = "UN. MED.";
            this.dgvArticulos_undMed.Name = "dgvArticulos_undMed";
            this.dgvArticulos_undMed.ReadOnly = true;
            this.dgvArticulos_undMed.Width = 45;
            // 
            // dgvArticulos_fraccion
            // 
            this.dgvArticulos_fraccion.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArticulos_fraccion.DataPropertyName = "fraccion";
            this.dgvArticulos_fraccion.FillWeight = 50F;
            this.dgvArticulos_fraccion.HeaderText = "FRACCIÓN";
            this.dgvArticulos_fraccion.Name = "dgvArticulos_fraccion";
            this.dgvArticulos_fraccion.ReadOnly = true;
            this.dgvArticulos_fraccion.Width = 50;
            // 
            // dgvArticulos_idMonedaX
            // 
            this.dgvArticulos_idMonedaX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArticulos_idMonedaX.DataPropertyName = "idMonedaX";
            this.dgvArticulos_idMonedaX.FillWeight = 50F;
            this.dgvArticulos_idMonedaX.HeaderText = "MONEDA";
            this.dgvArticulos_idMonedaX.Name = "dgvArticulos_idMonedaX";
            this.dgvArticulos_idMonedaX.ReadOnly = true;
            this.dgvArticulos_idMonedaX.Width = 50;
            // 
            // dgvArticulos_impTotX
            // 
            this.dgvArticulos_impTotX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArticulos_impTotX.DataPropertyName = "impTotX";
            this.dgvArticulos_impTotX.FillWeight = 60F;
            this.dgvArticulos_impTotX.HeaderText = "IMPORTE";
            this.dgvArticulos_impTotX.Name = "dgvArticulos_impTotX";
            this.dgvArticulos_impTotX.ReadOnly = true;
            this.dgvArticulos_impTotX.Width = 60;
            // 
            // dgvArticulos_impFracTotX
            // 
            this.dgvArticulos_impFracTotX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvArticulos_impFracTotX.DataPropertyName = "impFracTotX";
            this.dgvArticulos_impFracTotX.FillWeight = 60F;
            this.dgvArticulos_impFracTotX.HeaderText = "IMPORTE FRACCIÓN";
            this.dgvArticulos_impFracTotX.Name = "dgvArticulos_impFracTotX";
            this.dgvArticulos_impFracTotX.ReadOnly = true;
            this.dgvArticulos_impFracTotX.Width = 60;
            // 
            // lblCantArticulo
            // 
            this.lblCantArticulo.BackColor = System.Drawing.Color.Transparent;
            this.lblCantArticulo.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCantArticulo.ForeColor = System.Drawing.Color.Navy;
            this.lblCantArticulo.Location = new System.Drawing.Point(12, 11);
            this.lblCantArticulo.Name = "lblCantArticulo";
            this.lblCantArticulo.Size = new System.Drawing.Size(174, 20);
            this.lblCantArticulo.TabIndex = 2;
            this.lblCantArticulo.Text = "Seleccionados: 0";
            this.lblCantArticulo.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lnkSel
            // 
            this.lnkSel.AutoSize = false;
            this.lnkSel.Location = new System.Drawing.Point(105, 14);
            this.lnkSel.Name = "lnkSel";
            this.lnkSel.Size = new System.Drawing.Size(133, 20);
            this.lnkSel.TabIndex = 2;
            this.lnkSel.Values.Text = "Ver seleccionados";
            this.lnkSel.LinkClicked += new System.EventHandler(this.LnkSel_LinkClicked);
            // 
            // dgvAlmArt
            // 
            this.dgvAlmArt.AllowUserToAddRows = false;
            this.dgvAlmArt.AllowUserToDeleteRows = false;
            this.dgvAlmArt.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvAlmArt.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.kryptonDataGridViewCheckBoxColumn1,
            this.dgvAlmArt_nomAlmacenX,
            this.dgvAlmArt_idAlmArt,
            this.dgvAlmArt_idAlmacen,
            this.dgvAlmArt_idArticulo,
            this.dgvAlmArt_stock,
            this.dgvAlmArt_stockFracc,
            this.dgvAlmArt_actAlmacenX,
            this.sel1,
            this.sel2});
            this.dgvAlmArt.Location = new System.Drawing.Point(10, 290);
            this.dgvAlmArt.MultiSelect = false;
            this.dgvAlmArt.Name = "dgvAlmArt";
            this.dgvAlmArt.RowHeadersWidth = 20;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.CornflowerBlue;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.White;
            this.dgvAlmArt.RowsDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvAlmArt.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvAlmArt.Size = new System.Drawing.Size(625, 136);
            this.dgvAlmArt.TabIndex = 2;
            // 
            // kryptonDataGridViewCheckBoxColumn1
            // 
            this.kryptonDataGridViewCheckBoxColumn1.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.kryptonDataGridViewCheckBoxColumn1.DataPropertyName = "selX";
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.NullValue = false;
            this.kryptonDataGridViewCheckBoxColumn1.DefaultCellStyle = dataGridViewCellStyle2;
            this.kryptonDataGridViewCheckBoxColumn1.FalseValue = null;
            this.kryptonDataGridViewCheckBoxColumn1.FillWeight = 35F;
            this.kryptonDataGridViewCheckBoxColumn1.HeaderText = "SEL.";
            this.kryptonDataGridViewCheckBoxColumn1.IndeterminateValue = null;
            this.kryptonDataGridViewCheckBoxColumn1.Name = "kryptonDataGridViewCheckBoxColumn1";
            this.kryptonDataGridViewCheckBoxColumn1.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.kryptonDataGridViewCheckBoxColumn1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.kryptonDataGridViewCheckBoxColumn1.TrueValue = null;
            this.kryptonDataGridViewCheckBoxColumn1.Width = 35;
            // 
            // dgvAlmArt_nomAlmacenX
            // 
            this.dgvAlmArt_nomAlmacenX.DataPropertyName = "nomAlmacenX";
            this.dgvAlmArt_nomAlmacenX.HeaderText = "ALMACÉN";
            this.dgvAlmArt_nomAlmacenX.Name = "dgvAlmArt_nomAlmacenX";
            // 
            // dgvAlmArt_idAlmArt
            // 
            this.dgvAlmArt_idAlmArt.DataPropertyName = "idAlmArt";
            this.dgvAlmArt_idAlmArt.HeaderText = "idAlmArt";
            this.dgvAlmArt_idAlmArt.Name = "dgvAlmArt_idAlmArt";
            this.dgvAlmArt_idAlmArt.Visible = false;
            // 
            // dgvAlmArt_idAlmacen
            // 
            this.dgvAlmArt_idAlmacen.DataPropertyName = "idAlmacen";
            this.dgvAlmArt_idAlmacen.HeaderText = "idAlmacen";
            this.dgvAlmArt_idAlmacen.Name = "dgvAlmArt_idAlmacen";
            this.dgvAlmArt_idAlmacen.Visible = false;
            // 
            // dgvAlmArt_idArticulo
            // 
            this.dgvAlmArt_idArticulo.DataPropertyName = "idArticulo";
            this.dgvAlmArt_idArticulo.HeaderText = "idArticulo";
            this.dgvAlmArt_idArticulo.Name = "dgvAlmArt_idArticulo";
            this.dgvAlmArt_idArticulo.Visible = false;
            // 
            // dgvAlmArt_stock
            // 
            this.dgvAlmArt_stock.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvAlmArt_stock.DataPropertyName = "stock";
            this.dgvAlmArt_stock.FillWeight = 60F;
            this.dgvAlmArt_stock.HeaderText = "STOCK";
            this.dgvAlmArt_stock.Name = "dgvAlmArt_stock";
            this.dgvAlmArt_stock.Width = 60;
            // 
            // dgvAlmArt_stockFracc
            // 
            this.dgvAlmArt_stockFracc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvAlmArt_stockFracc.DataPropertyName = "stockFracc";
            this.dgvAlmArt_stockFracc.FillWeight = 60F;
            this.dgvAlmArt_stockFracc.HeaderText = "STOCK. FRACCIÓN";
            this.dgvAlmArt_stockFracc.Name = "dgvAlmArt_stockFracc";
            this.dgvAlmArt_stockFracc.Width = 60;
            // 
            // dgvAlmArt_actAlmacenX
            // 
            this.dgvAlmArt_actAlmacenX.DataPropertyName = "actAlmacenX";
            this.dgvAlmArt_actAlmacenX.HeaderText = "actAlmacenX";
            this.dgvAlmArt_actAlmacenX.Name = "dgvAlmArt_actAlmacenX";
            this.dgvAlmArt_actAlmacenX.Visible = false;
            // 
            // sel1
            // 
            this.sel1.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.sel1.FillWeight = 60F;
            this.sel1.HeaderText = "Sel. Cantidad";
            this.sel1.Name = "sel1";
            this.sel1.Width = 60;
            // 
            // sel2
            // 
            this.sel2.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.sel2.FillWeight = 60F;
            this.sel2.HeaderText = "Sel. Fracción";
            this.sel2.Name = "sel2";
            this.sel2.Width = 60;
            // 
            // kryptonDataGridView1
            // 
            this.kryptonDataGridView1.AllowUserToAddRows = false;
            this.kryptonDataGridView1.AllowUserToDeleteRows = false;
            this.kryptonDataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.kryptonDataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn1,
            this.dataGridViewTextBoxColumn4,
            this.dataGridViewTextBoxColumn5,
            this.dataGridViewTextBoxColumn6});
            this.kryptonDataGridView1.Location = new System.Drawing.Point(645, 40);
            this.kryptonDataGridView1.MultiSelect = false;
            this.kryptonDataGridView1.Name = "kryptonDataGridView1";
            this.kryptonDataGridView1.RowHeadersWidth = 20;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.CornflowerBlue;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.White;
            this.kryptonDataGridView1.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.kryptonDataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.kryptonDataGridView1.Size = new System.Drawing.Size(335, 386);
            this.kryptonDataGridView1.TabIndex = 3;
            this.kryptonDataGridView1.TabStop = false;
            // 
            // dataGridViewTextBoxColumn1
            // 
            this.dataGridViewTextBoxColumn1.DataPropertyName = "nomAlmacenX";
            this.dataGridViewTextBoxColumn1.HeaderText = "ALMACÉN";
            this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
            // 
            // dataGridViewTextBoxColumn4
            // 
            this.dataGridViewTextBoxColumn4.DataPropertyName = "idArticulo";
            this.dataGridViewTextBoxColumn4.HeaderText = "ARTICULO";
            this.dataGridViewTextBoxColumn4.Name = "dataGridViewTextBoxColumn4";
            // 
            // dataGridViewTextBoxColumn5
            // 
            this.dataGridViewTextBoxColumn5.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dataGridViewTextBoxColumn5.DataPropertyName = "stock";
            this.dataGridViewTextBoxColumn5.FillWeight = 60F;
            this.dataGridViewTextBoxColumn5.HeaderText = "STOCK";
            this.dataGridViewTextBoxColumn5.Name = "dataGridViewTextBoxColumn5";
            this.dataGridViewTextBoxColumn5.Width = 60;
            // 
            // dataGridViewTextBoxColumn6
            // 
            this.dataGridViewTextBoxColumn6.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dataGridViewTextBoxColumn6.DataPropertyName = "stockFracc";
            this.dataGridViewTextBoxColumn6.FillWeight = 60F;
            this.dataGridViewTextBoxColumn6.HeaderText = "STOCK. FRACCIÓN";
            this.dataGridViewTextBoxColumn6.Name = "dataGridViewTextBoxColumn6";
            this.dataGridViewTextBoxColumn6.Width = 60;
            // 
            // kryptonCheckBox1
            // 
            this.kryptonCheckBox1.Location = new System.Drawing.Point(421, 10);
            this.kryptonCheckBox1.Name = "kryptonCheckBox1";
            this.kryptonCheckBox1.Size = new System.Drawing.Size(190, 20);
            this.kryptonCheckBox1.TabIndex = 16;
            this.kryptonCheckBox1.TabStop = false;
            this.kryptonCheckBox1.Values.Text = "Buscar en todos los almacenes";
            // 
            // FrmBuscarArticulo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(990, 475);
            this.Name = "FrmBuscarArticulo";
            this.Text = "Búsqueda";
            this.pnlMain.ResumeLayout(false);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gbx1.Panel)).EndInit();
            this.gbx1.Panel.ResumeLayout(false);
            this.gbx1.Panel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1)).EndInit();
            this.gbx1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvArticulos)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlmArt)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonDataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private ComponentFactory.Krypton.Toolkit.KryptonGroupBox gbx1;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnFind;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtFind;
        private System.Windows.Forms.Label label2;
        private ComponentFactory.Krypton.Toolkit.KryptonDataGridView dgvArticulos;
        private ComponentFactory.Krypton.Toolkit.KryptonLinkLabel lnkSel;
        private System.Windows.Forms.Label lblCantArticulo;
        private ComponentFactory.Krypton.Toolkit.KryptonDataGridView dgvAlmArt;
        private ComponentFactory.Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn dgvArticulos_selX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArticulos_idArticulo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArticulos_idAfectacion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArticulos_codInterno;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArticulos_nomArticulo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArticulos_undMed;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArticulos_fraccion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArticulos_idMonedaX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArticulos_impTotX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvArticulos_impFracTotX;
        private ComponentFactory.Krypton.Toolkit.KryptonDataGridView kryptonDataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn4;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn5;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn6;
        private ComponentFactory.Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn kryptonDataGridViewCheckBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvAlmArt_nomAlmacenX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvAlmArt_idAlmArt;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvAlmArt_idAlmacen;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvAlmArt_idArticulo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvAlmArt_stock;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvAlmArt_stockFracc;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvAlmArt_actAlmacenX;
        private System.Windows.Forms.DataGridViewTextBoxColumn sel1;
        private System.Windows.Forms.DataGridViewTextBoxColumn sel2;
        private ComponentFactory.Krypton.Toolkit.KryptonCheckBox kryptonCheckBox1;
    }
}