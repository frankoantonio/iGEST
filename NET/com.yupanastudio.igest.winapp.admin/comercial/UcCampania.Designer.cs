using System;

namespace com.yupanastudio.igest.winapp
{
    partial class UcCampania
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UcCampania));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.btnEdit = new Krypton.Toolkit.KryptonButton();
            this.label27 = new System.Windows.Forms.Label();
            this.dgvCampanias = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvCamp_idCampania = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCamp_codSede = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCamp_idProdProy = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvCamp_anio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCamp_frecuencia = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCamp_feIni = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCamp_feFin = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCamp_nomCampania = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCamp_activo = new Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn();
            this.dgvCamp_idTipoPeriodo = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvCamp_idTipoModEst = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvCamp_idTipoTurno = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.btnNew = new Krypton.Toolkit.KryptonButton();
            this.label1 = new System.Windows.Forms.Label();
            this.nudAnio = new Krypton.Toolkit.KryptonNumericUpDown();
            this.label17 = new System.Windows.Forms.Label();
            this.dgvCronograma = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvCron_idCronPlant = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCron_selX = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dgvCron_orden = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCron_nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCron_periodo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvCron_fePago = new Krypton.Toolkit.KryptonDataGridViewDateTimePickerColumn();
            this.txtNomCampania = new Krypton.Toolkit.KryptonTextBox();
            this.btnGuardar = new Krypton.Toolkit.KryptonButton();
            this.dtpIniCuota = new System.Windows.Forms.DateTimePicker();
            this.label5 = new System.Windows.Forms.Label();
            this.kryptonGroupBox1 = new Krypton.Toolkit.KryptonGroupBox();
            this.lblDataOK = new System.Windows.Forms.Label();
            this.nudCuotas = new Krypton.Toolkit.KryptonNumericUpDown();
            this.label10 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.chbSetCuotas = new Krypton.Toolkit.KryptonCheckBox();
            this.label6 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.pnlHeader.SuspendLayout();
            this.pnlBody.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCampanias)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCronograma)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox1.Panel)).BeginInit();
            this.kryptonGroupBox1.Panel.SuspendLayout();
            this.kryptonGroupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(1100, 27);
            // 
            // pnlBody
            // 
            this.pnlBody.Controls.Add(this.panel2);
            this.pnlBody.Controls.Add(this.label6);
            this.pnlBody.Controls.Add(this.kryptonGroupBox1);
            this.pnlBody.Controls.Add(this.dgvCronograma);
            this.pnlBody.Controls.Add(this.label17);
            this.pnlBody.Controls.Add(this.nudAnio);
            this.pnlBody.Controls.Add(this.label1);
            this.pnlBody.Controls.Add(this.btnNew);
            this.pnlBody.Controls.Add(this.dgvCampanias);
            this.pnlBody.Controls.Add(this.btnEdit);
            this.pnlBody.Controls.Add(this.label27);
            this.pnlBody.TabIndex = 0;
            this.pnlBody.Controls.SetChildIndex(this.label27, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEdit, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvCampanias, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnNew, 0);
            this.pnlBody.Controls.SetChildIndex(this.label1, 0);
            this.pnlBody.Controls.SetChildIndex(this.nudAnio, 0);
            this.pnlBody.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlBody.Controls.SetChildIndex(this.label17, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvCronograma, 0);
            this.pnlBody.Controls.SetChildIndex(this.kryptonGroupBox1, 0);
            this.pnlBody.Controls.SetChildIndex(this.label6, 0);
            this.pnlBody.Controls.SetChildIndex(this.panel2, 0);
            // 
            // lblSubtitle
            // 
            this.lblSubtitle.Location = new System.Drawing.Point(846, 4);
            // 
            // btnEdit
            // 
            this.btnEdit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnEdit.Location = new System.Drawing.Point(1046, 35);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(40, 25);
            this.btnEdit.TabIndex = 2;
            this.btnEdit.Tag = "";
            this.toolTip.SetToolTip(this.btnEdit, "Modificar \"Campaña\".");
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
            this.label27.Size = new System.Drawing.Size(119, 16);
            this.label27.TabIndex = 94;
            this.label27.Text = "Lista de Campañas";
            this.label27.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // dgvCampanias
            // 
            this.dgvCampanias.AllowUserToAddRows = false;
            this.dgvCampanias.AllowUserToDeleteRows = false;
            this.dgvCampanias.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvCampanias.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvCampanias.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dgvCampanias.ColumnHeadersHeight = 22;
            this.dgvCampanias.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvCamp_idCampania,
            this.dgvCamp_codSede,
            this.dgvCamp_idProdProy,
            this.dgvCamp_anio,
            this.dgvCamp_frecuencia,
            this.dgvCamp_feIni,
            this.dgvCamp_feFin,
            this.dgvCamp_nomCampania,
            this.dgvCamp_activo,
            this.dgvCamp_idTipoPeriodo,
            this.dgvCamp_idTipoModEst,
            this.dgvCamp_idTipoTurno});
            this.dgvCampanias.Location = new System.Drawing.Point(10, 65);
            this.dgvCampanias.MultiSelect = false;
            this.dgvCampanias.Name = "dgvCampanias";
            this.dgvCampanias.ReadOnly = true;
            this.dgvCampanias.RowHeadersWidth = 22;
            dataGridViewCellStyle5.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle5.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvCampanias.RowsDefaultCellStyle = dataGridViewCellStyle5;
            this.dgvCampanias.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvCampanias.Size = new System.Drawing.Size(1076, 198);
            this.dgvCampanias.StandardTab = true;
            this.dgvCampanias.TabIndex = 3;
            this.dgvCampanias.SelectionChanged += new System.EventHandler(this.dgvCampanias_SelectionChanged);
            // 
            // dgvCamp_idCampania
            // 
            this.dgvCamp_idCampania.DataPropertyName = "idCampania";
            this.dgvCamp_idCampania.HeaderText = "idCampania";
            this.dgvCamp_idCampania.Name = "dgvCamp_idCampania";
            this.dgvCamp_idCampania.ReadOnly = true;
            this.dgvCamp_idCampania.Visible = false;
            // 
            // dgvCamp_codSede
            // 
            this.dgvCamp_codSede.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCamp_codSede.DataPropertyName = "codSede";
            this.dgvCamp_codSede.FillWeight = 60F;
            this.dgvCamp_codSede.HeaderText = "SEDE";
            this.dgvCamp_codSede.Name = "dgvCamp_codSede";
            this.dgvCamp_codSede.ReadOnly = true;
            this.dgvCamp_codSede.Width = 60;
            // 
            // dgvCamp_idProdProy
            // 
            this.dgvCamp_idProdProy.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCamp_idProdProy.DataPropertyName = "idProdProy";
            this.dgvCamp_idProdProy.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvCamp_idProdProy.FillWeight = 125F;
            this.dgvCamp_idProdProy.HeaderText = "UND. PRODUCCIÓN";
            this.dgvCamp_idProdProy.Name = "dgvCamp_idProdProy";
            this.dgvCamp_idProdProy.ReadOnly = true;
            this.dgvCamp_idProdProy.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvCamp_idProdProy.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvCamp_idProdProy.Width = 125;
            // 
            // dgvCamp_anio
            // 
            this.dgvCamp_anio.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCamp_anio.DataPropertyName = "anio";
            this.dgvCamp_anio.FillWeight = 50F;
            this.dgvCamp_anio.HeaderText = "AÑO";
            this.dgvCamp_anio.Name = "dgvCamp_anio";
            this.dgvCamp_anio.ReadOnly = true;
            this.dgvCamp_anio.Width = 50;
            // 
            // dgvCamp_frecuencia
            // 
            this.dgvCamp_frecuencia.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCamp_frecuencia.DataPropertyName = "frecuencia";
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dgvCamp_frecuencia.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvCamp_frecuencia.FillWeight = 40F;
            this.dgvCamp_frecuencia.HeaderText = "FRECUENCIA";
            this.dgvCamp_frecuencia.Name = "dgvCamp_frecuencia";
            this.dgvCamp_frecuencia.ReadOnly = true;
            this.dgvCamp_frecuencia.Width = 40;
            // 
            // dgvCamp_feIni
            // 
            this.dgvCamp_feIni.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCamp_feIni.DataPropertyName = "feIni";
            this.dgvCamp_feIni.FillWeight = 75F;
            this.dgvCamp_feIni.HeaderText = "INICIO CAMPAÑA";
            this.dgvCamp_feIni.Name = "dgvCamp_feIni";
            this.dgvCamp_feIni.ReadOnly = true;
            this.dgvCamp_feIni.Width = 75;
            // 
            // dgvCamp_feFin
            // 
            this.dgvCamp_feFin.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCamp_feFin.DataPropertyName = "feFin";
            this.dgvCamp_feFin.FillWeight = 75F;
            this.dgvCamp_feFin.HeaderText = "FIN";
            this.dgvCamp_feFin.Name = "dgvCamp_feFin";
            this.dgvCamp_feFin.ReadOnly = true;
            this.dgvCamp_feFin.Width = 75;
            // 
            // dgvCamp_nomCampania
            // 
            this.dgvCamp_nomCampania.DataPropertyName = "nomCampania";
            this.dgvCamp_nomCampania.HeaderText = "NOMBRE";
            this.dgvCamp_nomCampania.Name = "dgvCamp_nomCampania";
            this.dgvCamp_nomCampania.ReadOnly = true;
            // 
            // dgvCamp_activo
            // 
            this.dgvCamp_activo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCamp_activo.DataPropertyName = "activo";
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle4.NullValue = false;
            this.dgvCamp_activo.DefaultCellStyle = dataGridViewCellStyle4;
            this.dgvCamp_activo.FalseValue = null;
            this.dgvCamp_activo.FillWeight = 50F;
            this.dgvCamp_activo.HeaderText = "ACTIVO";
            this.dgvCamp_activo.IndeterminateValue = null;
            this.dgvCamp_activo.Name = "dgvCamp_activo";
            this.dgvCamp_activo.ReadOnly = true;
            this.dgvCamp_activo.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvCamp_activo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvCamp_activo.TrueValue = null;
            this.dgvCamp_activo.Width = 50;
            // 
            // dgvCamp_idTipoPeriodo
            // 
            this.dgvCamp_idTipoPeriodo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCamp_idTipoPeriodo.DataPropertyName = "idTipoPeriodo";
            this.dgvCamp_idTipoPeriodo.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvCamp_idTipoPeriodo.FillWeight = 75F;
            this.dgvCamp_idTipoPeriodo.HeaderText = "PERIODICIDAD PAGO";
            this.dgvCamp_idTipoPeriodo.Name = "dgvCamp_idTipoPeriodo";
            this.dgvCamp_idTipoPeriodo.ReadOnly = true;
            this.dgvCamp_idTipoPeriodo.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvCamp_idTipoPeriodo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvCamp_idTipoPeriodo.Width = 75;
            // 
            // dgvCamp_idTipoModEst
            // 
            this.dgvCamp_idTipoModEst.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCamp_idTipoModEst.DataPropertyName = "idTipoModEst";
            this.dgvCamp_idTipoModEst.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvCamp_idTipoModEst.FillWeight = 75F;
            this.dgvCamp_idTipoModEst.HeaderText = "MOD. ESTUDIO";
            this.dgvCamp_idTipoModEst.Name = "dgvCamp_idTipoModEst";
            this.dgvCamp_idTipoModEst.ReadOnly = true;
            this.dgvCamp_idTipoModEst.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvCamp_idTipoModEst.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvCamp_idTipoModEst.Width = 75;
            // 
            // dgvCamp_idTipoTurno
            // 
            this.dgvCamp_idTipoTurno.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCamp_idTipoTurno.DataPropertyName = "idTipoTurno";
            this.dgvCamp_idTipoTurno.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvCamp_idTipoTurno.FillWeight = 75F;
            this.dgvCamp_idTipoTurno.HeaderText = "TURNO";
            this.dgvCamp_idTipoTurno.Name = "dgvCamp_idTipoTurno";
            this.dgvCamp_idTipoTurno.ReadOnly = true;
            this.dgvCamp_idTipoTurno.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvCamp_idTipoTurno.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvCamp_idTipoTurno.Width = 75;
            // 
            // btnNew
            // 
            this.btnNew.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnNew.Location = new System.Drawing.Point(1005, 35);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(40, 25);
            this.btnNew.TabIndex = 1;
            this.btnNew.Tag = "";
            this.toolTip.SetToolTip(this.btnNew, "Crear nueva \"Campaña\".");
            this.btnNew.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnNew.Values.Image")));
            this.btnNew.Values.Text = "";
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(836, 35);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(88, 16);
            this.label1.TabIndex = 205;
            this.label1.Text = "Filtrar por Año";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // nudAnio
            // 
            this.nudAnio.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.nudAnio.Increment = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.nudAnio.Location = new System.Drawing.Point(927, 35);
            this.nudAnio.Maximum = new decimal(new int[] {
            2500,
            0,
            0,
            0});
            this.nudAnio.Minimum = new decimal(new int[] {
            2010,
            0,
            0,
            0});
            this.nudAnio.Name = "nudAnio";
            this.nudAnio.Size = new System.Drawing.Size(51, 22);
            this.nudAnio.TabIndex = 0;
            this.toolTip.SetToolTip(this.nudAnio, "Filtrar campañas por año.");
            this.nudAnio.Value = new decimal(new int[] {
            2010,
            0,
            0,
            0});
            this.nudAnio.ValueChanged += new System.EventHandler(this.nudAnio_ValueChanged);
            this.nudAnio.Enter += new System.EventHandler(this.nudAnio_Enter);
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.BackColor = System.Drawing.Color.Transparent;
            this.label17.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label17.Location = new System.Drawing.Point(405, 290);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(186, 16);
            this.label17.TabIndex = 207;
            this.label17.Text = "Plantilla Cronograma de Pagos";
            this.label17.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // dgvCronograma
            // 
            this.dgvCronograma.AllowUserToAddRows = false;
            this.dgvCronograma.AllowUserToDeleteRows = false;
            this.dgvCronograma.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvCronograma.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvCronograma.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dgvCronograma.ColumnHeadersHeight = 22;
            this.dgvCronograma.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvCron_idCronPlant,
            this.dgvCron_selX,
            this.dgvCron_orden,
            this.dgvCron_nombre,
            this.dgvCron_periodo,
            this.dgvCron_fePago});
            this.dgvCronograma.Location = new System.Drawing.Point(408, 310);
            this.dgvCronograma.MultiSelect = false;
            this.dgvCronograma.Name = "dgvCronograma";
            this.dgvCronograma.RowHeadersWidth = 22;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvCronograma.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvCronograma.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvCronograma.Size = new System.Drawing.Size(678, 280);
            this.dgvCronograma.StandardTab = true;
            this.dgvCronograma.TabIndex = 4;
            this.dgvCronograma.CellValueChanged += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvCronograma_CellValueChanged);
            this.dgvCronograma.CurrentCellDirtyStateChanged += new System.EventHandler(this.dgvCronograma_CurrentCellDirtyStateChanged);
            // 
            // dgvCron_idCronPlant
            // 
            this.dgvCron_idCronPlant.DataPropertyName = "idCronPlant";
            this.dgvCron_idCronPlant.HeaderText = "idCronPlant";
            this.dgvCron_idCronPlant.Name = "dgvCron_idCronPlant";
            this.dgvCron_idCronPlant.Visible = false;
            // 
            // dgvCron_selX
            // 
            this.dgvCron_selX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCron_selX.DataPropertyName = "selX";
            this.dgvCron_selX.FillWeight = 48F;
            this.dgvCron_selX.HeaderText = "MODIFICADO";
            this.dgvCron_selX.Name = "dgvCron_selX";
            this.dgvCron_selX.ReadOnly = true;
            this.dgvCron_selX.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvCron_selX.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvCron_selX.Width = 48;
            // 
            // dgvCron_orden
            // 
            this.dgvCron_orden.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCron_orden.DataPropertyName = "orden";
            this.dgvCron_orden.FillWeight = 70F;
            this.dgvCron_orden.HeaderText = "ORDEN";
            this.dgvCron_orden.Name = "dgvCron_orden";
            this.dgvCron_orden.ReadOnly = true;
            this.dgvCron_orden.Width = 70;
            // 
            // dgvCron_nombre
            // 
            this.dgvCron_nombre.DataPropertyName = "nombre";
            this.dgvCron_nombre.HeaderText = "NOMBRE";
            this.dgvCron_nombre.Name = "dgvCron_nombre";
            this.dgvCron_nombre.ReadOnly = true;
            // 
            // dgvCron_periodo
            // 
            this.dgvCron_periodo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCron_periodo.DataPropertyName = "periodo";
            this.dgvCron_periodo.FillWeight = 90F;
            this.dgvCron_periodo.HeaderText = "PERIODO";
            this.dgvCron_periodo.Name = "dgvCron_periodo";
            this.dgvCron_periodo.ReadOnly = true;
            this.dgvCron_periodo.Width = 90;
            // 
            // dgvCron_fePago
            // 
            this.dgvCron_fePago.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvCron_fePago.Checked = false;
            this.dgvCron_fePago.DataPropertyName = "fePago";
            dataGridViewCellStyle1.Format = "D";
            this.dgvCron_fePago.DefaultCellStyle = dataGridViewCellStyle1;
            this.dgvCron_fePago.FillWeight = 220F;
            this.dgvCron_fePago.HeaderText = "FECHA DE PAGO";
            this.dgvCron_fePago.Name = "dgvCron_fePago";
            this.dgvCron_fePago.ReadOnly = true;
            this.dgvCron_fePago.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvCron_fePago.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvCron_fePago.Width = 220;
            // 
            // txtNomCampania
            // 
            this.txtNomCampania.Enabled = false;
            this.txtNomCampania.Location = new System.Drawing.Point(75, 15);
            this.txtNomCampania.Name = "txtNomCampania";
            this.txtNomCampania.ReadOnly = true;
            this.txtNomCampania.Size = new System.Drawing.Size(290, 23);
            this.txtNomCampania.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtNomCampania.TabIndex = 0;
            // 
            // btnGuardar
            // 
            this.btnGuardar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnGuardar.Enabled = false;
            this.btnGuardar.Location = new System.Drawing.Point(245, 240);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(120, 25);
            this.btnGuardar.TabIndex = 5;
            this.btnGuardar.Tag = "btnOK";
            this.btnGuardar.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_save;
            this.btnGuardar.Values.Text = "&Guardar";
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);
            // 
            // dtpIniCuota
            // 
            this.dtpIniCuota.Enabled = false;
            this.dtpIniCuota.Location = new System.Drawing.Point(75, 105);
            this.dtpIniCuota.Name = "dtpIniCuota";
            this.dtpIniCuota.Size = new System.Drawing.Size(290, 20);
            this.dtpIniCuota.TabIndex = 3;
            this.dtpIniCuota.ValueChanged += new System.EventHandler(this.dtpIniCuota_ValueChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.BackColor = System.Drawing.Color.Transparent;
            this.label5.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label5.Location = new System.Drawing.Point(72, 87);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(87, 15);
            this.label5.TabIndex = 229;
            this.label5.Text = "Primera Cuota";
            this.label5.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // kryptonGroupBox1
            // 
            this.kryptonGroupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.kryptonGroupBox1.CaptionStyle = Krypton.Toolkit.LabelStyle.BoldControl;
            this.kryptonGroupBox1.Location = new System.Drawing.Point(10, 310);
            this.kryptonGroupBox1.Name = "kryptonGroupBox1";
            // 
            // kryptonGroupBox1.Panel
            // 
            this.kryptonGroupBox1.Panel.Controls.Add(this.lblDataOK);
            this.kryptonGroupBox1.Panel.Controls.Add(this.nudCuotas);
            this.kryptonGroupBox1.Panel.Controls.Add(this.label10);
            this.kryptonGroupBox1.Panel.Controls.Add(this.label7);
            this.kryptonGroupBox1.Panel.Controls.Add(this.txtNomCampania);
            this.kryptonGroupBox1.Panel.Controls.Add(this.chbSetCuotas);
            this.kryptonGroupBox1.Panel.Controls.Add(this.btnGuardar);
            this.kryptonGroupBox1.Panel.Controls.Add(this.label5);
            this.kryptonGroupBox1.Panel.Controls.Add(this.dtpIniCuota);
            this.kryptonGroupBox1.Size = new System.Drawing.Size(380, 280);
            this.kryptonGroupBox1.StateCommon.Back.Color1 = System.Drawing.Color.PaleTurquoise;
            this.kryptonGroupBox1.StateCommon.Content.ShortText.Color1 = System.Drawing.Color.Black;
            this.kryptonGroupBox1.StateCommon.Content.ShortText.Font = new System.Drawing.Font("Arial", 10F);
            this.kryptonGroupBox1.TabIndex = 4;
            this.kryptonGroupBox1.Values.Heading = "";
            // 
            // lblDataOK
            // 
            this.lblDataOK.BackColor = System.Drawing.Color.Transparent;
            this.lblDataOK.Font = new System.Drawing.Font("Arial", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDataOK.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblDataOK.Location = new System.Drawing.Point(72, 196);
            this.lblDataOK.Name = "lblDataOK";
            this.lblDataOK.Size = new System.Drawing.Size(282, 29);
            this.lblDataOK.TabIndex = 252;
            this.lblDataOK.Text = "* Puede modificar la fecha de pago, seleccionando la cuota, luego dando doble cli" +
    "c en la fecha.";
            // 
            // nudCuotas
            // 
            this.nudCuotas.Enabled = false;
            this.nudCuotas.Increment = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.nudCuotas.Location = new System.Drawing.Point(75, 155);
            this.nudCuotas.Maximum = new decimal(new int[] {
            100,
            0,
            0,
            0});
            this.nudCuotas.Minimum = new decimal(new int[] {
            0,
            0,
            0,
            0});
            this.nudCuotas.Name = "nudCuotas";
            this.nudCuotas.Size = new System.Drawing.Size(45, 22);
            this.nudCuotas.TabIndex = 4;
            this.toolTip.SetToolTip(this.nudCuotas, "Filtrar campañas por año.");
            this.nudCuotas.Value = new decimal(new int[] {
            0,
            0,
            0,
            0});
            this.nudCuotas.ValueChanged += new System.EventHandler(this.nudCuotas_ValueChanged);
            this.nudCuotas.Enter += new System.EventHandler(this.nudAnio_Enter);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.BackColor = System.Drawing.Color.Transparent;
            this.label10.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label10.Location = new System.Drawing.Point(72, 137);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(95, 15);
            this.label10.TabIndex = 247;
            this.label10.Text = "Número Cuotas";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.BackColor = System.Drawing.Color.Transparent;
            this.label7.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label7.Location = new System.Drawing.Point(10, 15);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(62, 15);
            this.label7.TabIndex = 244;
            this.label7.Text = "Campaña";
            this.label7.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // chbSetCuotas
            // 
            this.chbSetCuotas.Location = new System.Drawing.Point(75, 57);
            this.chbSetCuotas.Name = "chbSetCuotas";
            this.chbSetCuotas.Size = new System.Drawing.Size(183, 20);
            this.chbSetCuotas.StateNormal.ShortText.Color1 = System.Drawing.Color.MidnightBlue;
            this.chbSetCuotas.TabIndex = 2;
            this.chbSetCuotas.Values.Text = "Establecer / Modificar Cuotas";
            this.chbSetCuotas.CheckedChanged += new System.EventHandler(this.chbSetCuotas_CheckedChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.BackColor = System.Drawing.Color.Transparent;
            this.label6.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(7, 290);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(48, 16);
            this.label6.TabIndex = 233;
            this.label6.Text = "Cuotas";
            this.label6.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // panel2
            // 
            this.panel2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.panel2.BackColor = System.Drawing.Color.Yellow;
            this.panel2.Location = new System.Drawing.Point(999, 528);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(100, 77);
            this.panel2.TabIndex = 235;
            // 
            // UcCampania
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Name = "UcCampania";
            this.Load += new System.EventHandler(this.UcCampania_Load);
            this.pnlHeader.ResumeLayout(false);
            this.pnlBody.ResumeLayout(false);
            this.pnlBody.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCampanias)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCronograma)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox1.Panel)).EndInit();
            this.kryptonGroupBox1.Panel.ResumeLayout(false);
            this.kryptonGroupBox1.Panel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox1)).EndInit();
            this.kryptonGroupBox1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Label label27;
        private Krypton.Toolkit.KryptonButton btnEdit;
        private Krypton.Toolkit.KryptonDataGridView dgvCampanias;
        private Krypton.Toolkit.KryptonButton btnNew;
        private System.Windows.Forms.Label label1;
        private Krypton.Toolkit.KryptonNumericUpDown nudAnio;
        private System.Windows.Forms.Label label17;
        private Krypton.Toolkit.KryptonDataGridView dgvCronograma;
        private Krypton.Toolkit.KryptonTextBox txtNomCampania;
        private Krypton.Toolkit.KryptonButton btnGuardar;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.DateTimePicker dtpIniCuota;
        private Krypton.Toolkit.KryptonGroupBox kryptonGroupBox1;
        private System.Windows.Forms.Label label6;
        private Krypton.Toolkit.KryptonCheckBox chbSetCuotas;
        private System.Windows.Forms.Label label7;
        private Krypton.Toolkit.KryptonNumericUpDown nudCuotas;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label lblDataOK;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCamp_idCampania;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCamp_codSede;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvCamp_idProdProy;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCamp_anio;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCamp_frecuencia;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCamp_feIni;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCamp_feFin;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCamp_nomCampania;
        private Krypton.Toolkit.KryptonDataGridViewCheckBoxColumn dgvCamp_activo;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvCamp_idTipoPeriodo;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvCamp_idTipoModEst;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvCamp_idTipoTurno;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCron_idCronPlant;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvCron_selX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCron_orden;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCron_nombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvCron_periodo;
        private Krypton.Toolkit.KryptonDataGridViewDateTimePickerColumn dgvCron_fePago;
        private System.Windows.Forms.Panel panel2;
    }
}
