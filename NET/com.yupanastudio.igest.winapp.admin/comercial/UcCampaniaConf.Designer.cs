namespace com.yupanastudio.igest.winapp
{
    partial class UcCampaniaConf
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UcCampaniaConf));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvInforme = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvInforme_idInforme = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvInforme_nomSedeX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvInforme_idTipoModEstX = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvInforme_nomCampaniaX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvInforme_nomGrado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvInforme_nomPersonaX = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.vendedor = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvInforme_feIni = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvInforme_idTipoEstado = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dgvInforme_cerrado = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.txtProxHora = new Krypton.Toolkit.KryptonMaskedTextBox();
            this.txtProxFecha = new Krypton.Toolkit.KryptonMaskedTextBox();
            this.dtpAtencion = new Krypton.Toolkit.KryptonDateTimePicker();
            this.btnDescalifica = new Krypton.Toolkit.KryptonButton();
            this.btnPreMat = new Krypton.Toolkit.KryptonButton();
            this.label14 = new System.Windows.Forms.Label();
            this.dgvAtencion = new Krypton.Toolkit.KryptonDataGridView();
            this.dgvAtencion_idAtencion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvAtencion_fecha = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvAtencion_obs = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvAtencion_idTipoAtencion = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.btnEditInforme = new Krypton.Toolkit.KryptonButton();
            this.btnNewInforme = new Krypton.Toolkit.KryptonButton();
            this.btnNewAt = new Krypton.Toolkit.KryptonButton();
            this.btnEditAt = new Krypton.Toolkit.KryptonButton();
            this.btnSaveAt = new Krypton.Toolkit.KryptonButton();
            this.btnCancelAt = new Krypton.Toolkit.KryptonButton();
            this.cmbTipoEstado = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.btnFind = new Krypton.Toolkit.KryptonButton();
            this.lblAlumno = new System.Windows.Forms.Label();
            this.cmbSede = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.lblRwInf = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.btnContacto = new Krypton.Toolkit.KryptonButton();
            this.dgvArticulos = new Krypton.Toolkit.KryptonDataGridView();
            this.label6 = new System.Windows.Forms.Label();
            this.cmbCampania = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.btnAddArticulos = new Krypton.Toolkit.KryptonButton();
            this.kryptonDataGridView1 = new Krypton.Toolkit.KryptonDataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.kryptonButton1 = new Krypton.Toolkit.KryptonButton();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlBody.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvInforme)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAtencion)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvArticulos)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonDataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // lblSubtitle
            // 
            this.lblSubtitle.ImageAlign = System.Drawing.ContentAlignment.TopRight;
            this.lblSubtitle.Location = new System.Drawing.Point(579, 4);
            this.lblSubtitle.Size = new System.Drawing.Size(413, 18);
            this.lblSubtitle.Text = "Registro de informes y contactos";
            // 
            // pnlBody
            // 
            this.pnlBody.Controls.Add(this.kryptonButton1);
            this.pnlBody.Controls.Add(this.label7);
            this.pnlBody.Controls.Add(this.label4);
            this.pnlBody.Controls.Add(this.label2);
            this.pnlBody.Controls.Add(this.kryptonDataGridView1);
            this.pnlBody.Controls.Add(this.txtProxHora);
            this.pnlBody.Controls.Add(this.btnAddArticulos);
            this.pnlBody.Controls.Add(this.txtProxFecha);
            this.pnlBody.Controls.Add(this.label6);
            this.pnlBody.Controls.Add(this.cmbCampania);
            this.pnlBody.Controls.Add(this.dtpAtencion);
            this.pnlBody.Controls.Add(this.dgvArticulos);
            this.pnlBody.Controls.Add(this.btnContacto);
            this.pnlBody.Controls.Add(this.label3);
            this.pnlBody.Controls.Add(this.label1);
            this.pnlBody.Controls.Add(this.cmbSede);
            this.pnlBody.Controls.Add(this.lblAlumno);
            this.pnlBody.Controls.Add(this.btnFind);
            this.pnlBody.Controls.Add(this.label5);
            this.pnlBody.Controls.Add(this.cmbTipoEstado);
            this.pnlBody.Controls.Add(this.btnDescalifica);
            this.pnlBody.Controls.Add(this.btnPreMat);
            this.pnlBody.Controls.Add(this.btnNewAt);
            this.pnlBody.Controls.Add(this.btnEditAt);
            this.pnlBody.Controls.Add(this.btnSaveAt);
            this.pnlBody.Controls.Add(this.btnCancelAt);
            this.pnlBody.Controls.Add(this.btnNewInforme);
            this.pnlBody.Controls.Add(this.btnEditInforme);
            this.pnlBody.Controls.Add(this.dgvAtencion);
            this.pnlBody.Controls.Add(this.label14);
            this.pnlBody.Controls.Add(this.dgvInforme);
            this.pnlBody.Controls.Add(this.lblRwInf);
            this.pnlBody.TabIndex = 0;
            this.pnlBody.Controls.SetChildIndex(this.lblRwInf, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvInforme, 0);
            this.pnlBody.Controls.SetChildIndex(this.label14, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvAtencion, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEditInforme, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnNewInforme, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnCancelAt, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnSaveAt, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnEditAt, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnNewAt, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnPreMat, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnDescalifica, 0);
            this.pnlBody.Controls.SetChildIndex(this.cmbTipoEstado, 0);
            this.pnlBody.Controls.SetChildIndex(this.label5, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnFind, 0);
            this.pnlBody.Controls.SetChildIndex(this.lblAlumno, 0);
            this.pnlBody.Controls.SetChildIndex(this.cmbSede, 0);
            this.pnlBody.Controls.SetChildIndex(this.label1, 0);
            this.pnlBody.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlBody.Controls.SetChildIndex(this.label3, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnContacto, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvArticulos, 0);
            this.pnlBody.Controls.SetChildIndex(this.dtpAtencion, 0);
            this.pnlBody.Controls.SetChildIndex(this.cmbCampania, 0);
            this.pnlBody.Controls.SetChildIndex(this.label6, 0);
            this.pnlBody.Controls.SetChildIndex(this.txtProxFecha, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnAddArticulos, 0);
            this.pnlBody.Controls.SetChildIndex(this.txtProxHora, 0);
            this.pnlBody.Controls.SetChildIndex(this.kryptonDataGridView1, 0);
            this.pnlBody.Controls.SetChildIndex(this.label2, 0);
            this.pnlBody.Controls.SetChildIndex(this.label4, 0);
            this.pnlBody.Controls.SetChildIndex(this.label7, 0);
            this.pnlBody.Controls.SetChildIndex(this.kryptonButton1, 0);
            // 
            // dgvInforme
            // 
            this.dgvInforme.AllowUserToAddRows = false;
            this.dgvInforme.AllowUserToDeleteRows = false;
            this.dgvInforme.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvInforme.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvInforme_idInforme,
            this.dgvInforme_nomSedeX,
            this.dgvInforme_idTipoModEstX,
            this.dgvInforme_nomCampaniaX,
            this.dgvInforme_nomGrado,
            this.dgvInforme_nomPersonaX,
            this.vendedor,
            this.dgvInforme_feIni,
            this.dgvInforme_idTipoEstado,
            this.dgvInforme_cerrado});
            this.dgvInforme.Location = new System.Drawing.Point(705, 232);
            this.dgvInforme.MultiSelect = false;
            this.dgvInforme.Name = "dgvInforme";
            this.dgvInforme.ReadOnly = true;
            this.dgvInforme.RowHeadersWidth = 22;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvInforme.RowsDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvInforme.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvInforme.Size = new System.Drawing.Size(285, 138);
            this.dgvInforme.StandardTab = true;
            this.dgvInforme.TabIndex = 5;
            this.dgvInforme.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvInforme_CellDoubleClick);
            this.dgvInforme.SelectionChanged += new System.EventHandler(this.dgvInforme_SelectionChanged);
            // 
            // dgvInforme_idInforme
            // 
            this.dgvInforme_idInforme.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.dgvInforme_idInforme.DataPropertyName = "idInforme";
            this.dgvInforme_idInforme.HeaderText = "idInforme";
            this.dgvInforme_idInforme.Name = "dgvInforme_idInforme";
            this.dgvInforme_idInforme.ReadOnly = true;
            this.dgvInforme_idInforme.Visible = false;
            this.dgvInforme_idInforme.Width = 88;
            // 
            // dgvInforme_nomSedeX
            // 
            this.dgvInforme_nomSedeX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvInforme_nomSedeX.DataPropertyName = "nomSedeX";
            this.dgvInforme_nomSedeX.FillWeight = 50F;
            this.dgvInforme_nomSedeX.HeaderText = "SEDE";
            this.dgvInforme_nomSedeX.Name = "dgvInforme_nomSedeX";
            this.dgvInforme_nomSedeX.ReadOnly = true;
            this.dgvInforme_nomSedeX.Width = 50;
            // 
            // dgvInforme_idTipoModEstX
            // 
            this.dgvInforme_idTipoModEstX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvInforme_idTipoModEstX.DataPropertyName = "idTipoModEstX";
            this.dgvInforme_idTipoModEstX.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvInforme_idTipoModEstX.FillWeight = 80F;
            this.dgvInforme_idTipoModEstX.HeaderText = "MODALIDAD";
            this.dgvInforme_idTipoModEstX.Name = "dgvInforme_idTipoModEstX";
            this.dgvInforme_idTipoModEstX.ReadOnly = true;
            this.dgvInforme_idTipoModEstX.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvInforme_idTipoModEstX.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvInforme_idTipoModEstX.Width = 80;
            // 
            // dgvInforme_nomCampaniaX
            // 
            this.dgvInforme_nomCampaniaX.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvInforme_nomCampaniaX.DataPropertyName = "nomCampaniaX";
            this.dgvInforme_nomCampaniaX.FillWeight = 200F;
            this.dgvInforme_nomCampaniaX.HeaderText = "CAMPAÑA";
            this.dgvInforme_nomCampaniaX.Name = "dgvInforme_nomCampaniaX";
            this.dgvInforme_nomCampaniaX.ReadOnly = true;
            this.dgvInforme_nomCampaniaX.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvInforme_nomCampaniaX.Width = 200;
            // 
            // dgvInforme_nomGrado
            // 
            this.dgvInforme_nomGrado.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvInforme_nomGrado.DataPropertyName = "nomGrado";
            this.dgvInforme_nomGrado.FillWeight = 80F;
            this.dgvInforme_nomGrado.HeaderText = "GRADO";
            this.dgvInforme_nomGrado.Name = "dgvInforme_nomGrado";
            this.dgvInforme_nomGrado.ReadOnly = true;
            this.dgvInforme_nomGrado.Width = 80;
            // 
            // dgvInforme_nomPersonaX
            // 
            this.dgvInforme_nomPersonaX.DataPropertyName = "nomPersonaX";
            this.dgvInforme_nomPersonaX.HeaderText = "ESTUDIANTE";
            this.dgvInforme_nomPersonaX.Name = "dgvInforme_nomPersonaX";
            this.dgvInforme_nomPersonaX.ReadOnly = true;
            // 
            // vendedor
            // 
            this.vendedor.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.vendedor.DataPropertyName = "vendedor";
            this.vendedor.FillWeight = 80F;
            this.vendedor.HeaderText = "EJ. VENTA";
            this.vendedor.Name = "vendedor";
            this.vendedor.ReadOnly = true;
            this.vendedor.Width = 80;
            // 
            // dgvInforme_feIni
            // 
            this.dgvInforme_feIni.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvInforme_feIni.DataPropertyName = "feIni";
            this.dgvInforme_feIni.FillWeight = 105F;
            this.dgvInforme_feIni.HeaderText = "FE. INI.";
            this.dgvInforme_feIni.Name = "dgvInforme_feIni";
            this.dgvInforme_feIni.ReadOnly = true;
            this.dgvInforme_feIni.Width = 105;
            // 
            // dgvInforme_idTipoEstado
            // 
            this.dgvInforme_idTipoEstado.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvInforme_idTipoEstado.DataPropertyName = "idTipoEstado";
            this.dgvInforme_idTipoEstado.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvInforme_idTipoEstado.FillWeight = 80F;
            this.dgvInforme_idTipoEstado.HeaderText = "ESTADO";
            this.dgvInforme_idTipoEstado.Name = "dgvInforme_idTipoEstado";
            this.dgvInforme_idTipoEstado.ReadOnly = true;
            this.dgvInforme_idTipoEstado.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvInforme_idTipoEstado.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvInforme_idTipoEstado.Width = 80;
            // 
            // dgvInforme_cerrado
            // 
            this.dgvInforme_cerrado.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.dgvInforme_cerrado.DataPropertyName = "cerrado";
            this.dgvInforme_cerrado.FillWeight = 35F;
            this.dgvInforme_cerrado.HeaderText = "FIN";
            this.dgvInforme_cerrado.Name = "dgvInforme_cerrado";
            this.dgvInforme_cerrado.ReadOnly = true;
            this.dgvInforme_cerrado.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvInforme_cerrado.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvInforme_cerrado.Width = 35;
            // 
            // txtProxHora
            // 
            this.txtProxHora.Enabled = false;
            this.txtProxHora.Location = new System.Drawing.Point(886, 547);
            this.txtProxHora.Mask = "00:00";
            this.txtProxHora.Name = "txtProxHora";
            this.txtProxHora.Size = new System.Drawing.Size(70, 23);
            this.txtProxHora.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtProxHora.TabIndex = 5;
            this.txtProxHora.Text = "  :";
            this.txtProxHora.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtProxFecha
            // 
            this.txtProxFecha.Enabled = false;
            this.txtProxFecha.Location = new System.Drawing.Point(755, 547);
            this.txtProxFecha.Mask = "00/00/0000";
            this.txtProxFecha.Name = "txtProxFecha";
            this.txtProxFecha.Size = new System.Drawing.Size(125, 23);
            this.txtProxFecha.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtProxFecha.TabIndex = 4;
            this.txtProxFecha.Text = "  /  /";
            this.txtProxFecha.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // dtpAtencion
            // 
            this.dtpAtencion.CalendarTodayDate = new System.DateTime(2021, 6, 29, 0, 0, 0, 0);
            this.dtpAtencion.CalendarTodayFormat = "";
            this.dtpAtencion.CustomFormat = "dd/MMM/yyyy hh:mm:ss t\'m\'";
            this.dtpAtencion.Enabled = false;
            this.dtpAtencion.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpAtencion.Location = new System.Drawing.Point(741, 488);
            this.dtpAtencion.Name = "dtpAtencion";
            this.dtpAtencion.Size = new System.Drawing.Size(200, 21);
            this.dtpAtencion.TabIndex = 0;
            // 
            // btnDescalifica
            // 
            this.btnDescalifica.Location = new System.Drawing.Point(870, 583);
            this.btnDescalifica.Name = "btnDescalifica";
            this.btnDescalifica.Size = new System.Drawing.Size(120, 25);
            this.btnDescalifica.TabIndex = 13;
            this.toolTip.SetToolTip(this.btnDescalifica, "Buscar \"Estudiante\".");
            this.btnDescalifica.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_delete;
            this.btnDescalifica.Values.Text = "DESCALIFICAR";
            this.btnDescalifica.Click += new System.EventHandler(this.btnDescalifica_Click);
            // 
            // btnPreMat
            // 
            this.btnPreMat.Location = new System.Drawing.Point(740, 583);
            this.btnPreMat.Name = "btnPreMat";
            this.btnPreMat.Size = new System.Drawing.Size(120, 25);
            this.btnPreMat.TabIndex = 12;
            this.toolTip.SetToolTip(this.btnPreMat, "Buscar \"Estudiante\".");
            this.btnPreMat.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnPreMat.Values.Image")));
            this.btnPreMat.Values.Text = "INSCRIBIR";
            this.btnPreMat.Click += new System.EventHandler(this.btnPreMat_Click);
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.BackColor = System.Drawing.Color.Transparent;
            this.label14.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.Location = new System.Drawing.Point(8, 386);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(161, 16);
            this.label14.TabIndex = 149;
            this.label14.Text = "Lista de B/S y descuentos";
            this.label14.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // dgvAtencion
            // 
            this.dgvAtencion.AllowUserToAddRows = false;
            this.dgvAtencion.AllowUserToDeleteRows = false;
            this.dgvAtencion.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvAtencion.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvAtencion_idAtencion,
            this.dgvAtencion_fecha,
            this.dgvAtencion_obs,
            this.dgvAtencion_idTipoAtencion});
            this.dgvAtencion.Location = new System.Drawing.Point(10, 405);
            this.dgvAtencion.MultiSelect = false;
            this.dgvAtencion.Name = "dgvAtencion";
            this.dgvAtencion.ReadOnly = true;
            this.dgvAtencion.RowHeadersWidth = 22;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvAtencion.RowsDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvAtencion.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvAtencion.Size = new System.Drawing.Size(689, 203);
            this.dgvAtencion.StandardTab = true;
            this.dgvAtencion.TabIndex = 6;
            this.dgvAtencion.SelectionChanged += new System.EventHandler(this.dgvAtencion_SelectionChanged);
            // 
            // dgvAtencion_idAtencion
            // 
            this.dgvAtencion_idAtencion.DataPropertyName = "idAtencion";
            this.dgvAtencion_idAtencion.HeaderText = "idAtencion";
            this.dgvAtencion_idAtencion.Name = "dgvAtencion_idAtencion";
            this.dgvAtencion_idAtencion.ReadOnly = true;
            this.dgvAtencion_idAtencion.Visible = false;
            // 
            // dgvAtencion_fecha
            // 
            this.dgvAtencion_fecha.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.dgvAtencion_fecha.DataPropertyName = "fecha";
            this.dgvAtencion_fecha.FillWeight = 80F;
            this.dgvAtencion_fecha.HeaderText = "FECHA";
            this.dgvAtencion_fecha.Name = "dgvAtencion_fecha";
            this.dgvAtencion_fecha.ReadOnly = true;
            this.dgvAtencion_fecha.Width = 73;
            // 
            // dgvAtencion_obs
            // 
            this.dgvAtencion_obs.DataPropertyName = "obs";
            this.dgvAtencion_obs.HeaderText = "OBS.";
            this.dgvAtencion_obs.Name = "dgvAtencion_obs";
            this.dgvAtencion_obs.ReadOnly = true;
            // 
            // dgvAtencion_idTipoAtencion
            // 
            this.dgvAtencion_idTipoAtencion.DataPropertyName = "idTipoAtencion";
            this.dgvAtencion_idTipoAtencion.DisplayStyle = System.Windows.Forms.DataGridViewComboBoxDisplayStyle.Nothing;
            this.dgvAtencion_idTipoAtencion.HeaderText = "TIPO ATENCIÓN";
            this.dgvAtencion_idTipoAtencion.Name = "dgvAtencion_idTipoAtencion";
            this.dgvAtencion_idTipoAtencion.ReadOnly = true;
            this.dgvAtencion_idTipoAtencion.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvAtencion_idTipoAtencion.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dgvAtencion_idTipoAtencion.Visible = false;
            // 
            // btnEditInforme
            // 
            this.btnEditInforme.Location = new System.Drawing.Point(947, 31);
            this.btnEditInforme.Name = "btnEditInforme";
            this.btnEditInforme.Size = new System.Drawing.Size(40, 25);
            this.btnEditInforme.TabIndex = 4;
            this.toolTip.SetToolTip(this.btnEditInforme, "Modificar \"Informe\".");
            this.btnEditInforme.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnEditInforme.Values.Image")));
            this.btnEditInforme.Values.Text = "";
            this.btnEditInforme.Click += new System.EventHandler(this.btnEditInforme_Click);
            // 
            // btnNewInforme
            // 
            this.btnNewInforme.Location = new System.Drawing.Point(948, 430);
            this.btnNewInforme.Name = "btnNewInforme";
            this.btnNewInforme.Size = new System.Drawing.Size(40, 25);
            this.btnNewInforme.TabIndex = 3;
            this.toolTip.SetToolTip(this.btnNewInforme, "Agregar nuevo \"Informe\".");
            this.btnNewInforme.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnNewInforme.Values.Image")));
            this.btnNewInforme.Values.Text = "";
            this.btnNewInforme.Click += new System.EventHandler(this.btnNewInforme_Click);
            // 
            // btnNewAt
            // 
            this.btnNewAt.Location = new System.Drawing.Point(855, 401);
            this.btnNewAt.Name = "btnNewAt";
            this.btnNewAt.Size = new System.Drawing.Size(40, 25);
            this.btnNewAt.TabIndex = 7;
            this.toolTip.SetToolTip(this.btnNewAt, "Agregar nuevo \"Atención al Cliente\".");
            this.btnNewAt.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnNewAt.Values.Image")));
            this.btnNewAt.Values.Text = "";
            this.btnNewAt.Click += new System.EventHandler(this.btnNewAt_Click);
            // 
            // btnEditAt
            // 
            this.btnEditAt.Location = new System.Drawing.Point(896, 401);
            this.btnEditAt.Name = "btnEditAt";
            this.btnEditAt.Size = new System.Drawing.Size(40, 25);
            this.btnEditAt.TabIndex = 8;
            this.toolTip.SetToolTip(this.btnEditAt, "Modificar \"Atención al Cliente\".");
            this.btnEditAt.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnEditAt.Values.Image")));
            this.btnEditAt.Values.Text = "";
            this.btnEditAt.Click += new System.EventHandler(this.btnEditAt_Click);
            // 
            // btnSaveAt
            // 
            this.btnSaveAt.Location = new System.Drawing.Point(855, 401);
            this.btnSaveAt.Name = "btnSaveAt";
            this.btnSaveAt.Size = new System.Drawing.Size(40, 25);
            this.btnSaveAt.TabIndex = 9;
            this.toolTip.SetToolTip(this.btnSaveAt, "Guardar los cambios.");
            this.btnSaveAt.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnSaveAt.Values.Image")));
            this.btnSaveAt.Values.Text = "";
            this.btnSaveAt.Visible = false;
            this.btnSaveAt.Click += new System.EventHandler(this.btnSaveAt_Click);
            // 
            // btnCancelAt
            // 
            this.btnCancelAt.Location = new System.Drawing.Point(896, 401);
            this.btnCancelAt.Name = "btnCancelAt";
            this.btnCancelAt.Size = new System.Drawing.Size(40, 25);
            this.btnCancelAt.TabIndex = 10;
            this.toolTip.SetToolTip(this.btnCancelAt, "Cancelar la operación.");
            this.btnCancelAt.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancelAt.Values.Image")));
            this.btnCancelAt.Values.Text = "";
            this.btnCancelAt.Visible = false;
            this.btnCancelAt.Click += new System.EventHandler(this.btnCancelAt_Click);
            // 
            // cmbTipoEstado
            // 
            this.cmbTipoEstado.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbTipoEstado.DisplayMember = "nomTipo";
            this.cmbTipoEstado.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTipoEstado.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbTipoEstado.FormattingEnabled = true;
            this.cmbTipoEstado.Location = new System.Drawing.Point(776, 445);
            this.cmbTipoEstado.Name = "cmbTipoEstado";
            this.cmbTipoEstado.Size = new System.Drawing.Size(165, 21);
            this.cmbTipoEstado.TabIndex = 1;
            this.cmbTipoEstado.ValueMember = "idTipo";
            this.cmbTipoEstado.SelectedIndexChanged += new System.EventHandler(this.cmbTipoEstado_SelectedIndexChanged);
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(907, 430);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(40, 25);
            this.btnFind.TabIndex = 2;
            this.toolTip.SetToolTip(this.btnFind, "Buscar \"Estudiante\".");
            this.btnFind.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnFind.Values.Image")));
            this.btnFind.Values.Text = "";
            this.btnFind.Click += new System.EventHandler(this.btnFind_Click);
            // 
            // lblAlumno
            // 
            this.lblAlumno.AutoSize = true;
            this.lblAlumno.BackColor = System.Drawing.Color.Transparent;
            this.lblAlumno.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAlumno.ForeColor = System.Drawing.Color.MidnightBlue;
            this.lblAlumno.Location = new System.Drawing.Point(883, 213);
            this.lblAlumno.Name = "lblAlumno";
            this.lblAlumno.Size = new System.Drawing.Size(104, 15);
            this.lblAlumno.TabIndex = 172;
            this.lblAlumno.Text = "IVANNA BARZOLA";
            this.lblAlumno.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbSede
            // 
            this.cmbSede.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbSede.DisplayMember = "dirSede";
            this.cmbSede.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSede.DropDownWidth = 195;
            this.cmbSede.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbSede.FormattingEnabled = true;
            this.cmbSede.Location = new System.Drawing.Point(208, 33);
            this.cmbSede.Name = "cmbSede";
            this.cmbSede.Size = new System.Drawing.Size(165, 21);
            this.cmbSede.TabIndex = 0;
            this.cmbSede.ValueMember = "idSede";
            this.cmbSede.SelectedIndexChanged += new System.EventHandler(this.cmbSede_SelectedIndexChanged);
            // 
            // lblRwInf
            // 
            this.lblRwInf.BackColor = System.Drawing.Color.Transparent;
            this.lblRwInf.Font = new System.Drawing.Font("Arial", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRwInf.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblRwInf.Location = new System.Drawing.Point(852, 372);
            this.lblRwInf.Name = "lblRwInf";
            this.lblRwInf.Size = new System.Drawing.Size(141, 15);
            this.lblRwInf.TabIndex = 177;
            this.lblRwInf.Text = "999 Registro(s)";
            this.lblRwInf.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.BackColor = System.Drawing.Color.Transparent;
            this.label5.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label5.Location = new System.Drawing.Point(728, 445);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(46, 15);
            this.label5.TabIndex = 168;
            this.label5.Text = "Estado";
            this.label5.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(166, 30);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(36, 15);
            this.label1.TabIndex = 178;
            this.label1.Text = "Sede";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(746, 469);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(59, 16);
            this.label3.TabIndex = 183;
            this.label3.Text = "Contacto";
            this.label3.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // btnContacto
            // 
            this.btnContacto.Location = new System.Drawing.Point(950, 401);
            this.btnContacto.Name = "btnContacto";
            this.btnContacto.Size = new System.Drawing.Size(40, 25);
            this.btnContacto.TabIndex = 184;
            this.toolTip.SetToolTip(this.btnContacto, "Mostrar \"Datos de Contacto\".\r\nTambién puede dar doble clic en el \"Informe\".");
            this.btnContacto.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_find;
            this.btnContacto.Values.Text = "";
            this.btnContacto.Click += new System.EventHandler(this.btnContacto_Click);
            // 
            // dgvArticulos
            // 
            this.dgvArticulos.AllowUserToAddRows = false;
            this.dgvArticulos.AllowUserToDeleteRows = false;
            this.dgvArticulos.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvArticulos.Location = new System.Drawing.Point(10, 59);
            this.dgvArticulos.MultiSelect = false;
            this.dgvArticulos.Name = "dgvArticulos";
            this.dgvArticulos.ReadOnly = true;
            this.dgvArticulos.RowHeadersWidth = 22;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvArticulos.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvArticulos.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvArticulos.Size = new System.Drawing.Size(690, 311);
            this.dgvArticulos.StandardTab = true;
            this.dgvArticulos.TabIndex = 185;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.BackColor = System.Drawing.Color.Transparent;
            this.label6.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label6.Location = new System.Drawing.Point(380, 35);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(62, 15);
            this.label6.TabIndex = 187;
            this.label6.Text = "Campaña";
            this.label6.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbCampania
            // 
            this.cmbCampania.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbCampania.DisplayMember = "dirSede";
            this.cmbCampania.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCampania.DropDownWidth = 195;
            this.cmbCampania.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbCampania.FormattingEnabled = true;
            this.cmbCampania.Location = new System.Drawing.Point(448, 33);
            this.cmbCampania.Name = "cmbCampania";
            this.cmbCampania.Size = new System.Drawing.Size(165, 21);
            this.cmbCampania.TabIndex = 186;
            this.cmbCampania.ValueMember = "idSede";
            this.cmbCampania.SelectedIndexChanged += new System.EventHandler(this.cmbCampania_SelectedIndexChanged);
            // 
            // btnAddArticulos
            // 
            this.btnAddArticulos.Location = new System.Drawing.Point(617, 33);
            this.btnAddArticulos.Name = "btnAddArticulos";
            this.btnAddArticulos.Size = new System.Drawing.Size(40, 25);
            this.btnAddArticulos.TabIndex = 188;
            this.toolTip.SetToolTip(this.btnAddArticulos, "Agregar nuevo \"Atención al Cliente\".");
            this.btnAddArticulos.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnAddArticulos.Values.Image")));
            this.btnAddArticulos.Values.Text = "";
            this.btnAddArticulos.Click += new System.EventHandler(this.btnAddArticulos_Click);
            // 
            // kryptonDataGridView1
            // 
            this.kryptonDataGridView1.AllowUserToAddRows = false;
            this.kryptonDataGridView1.AllowUserToDeleteRows = false;
            this.kryptonDataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.kryptonDataGridView1.Location = new System.Drawing.Point(705, 59);
            this.kryptonDataGridView1.MultiSelect = false;
            this.kryptonDataGridView1.Name = "kryptonDataGridView1";
            this.kryptonDataGridView1.ReadOnly = true;
            this.kryptonDataGridView1.RowHeadersWidth = 22;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.kryptonDataGridView1.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.kryptonDataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.kryptonDataGridView1.Size = new System.Drawing.Size(283, 131);
            this.kryptonDataGridView1.StandardTab = true;
            this.kryptonDataGridView1.TabIndex = 189;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(705, 213);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(91, 16);
            this.label2.TabIndex = 190;
            this.label2.Text = "Bonificaciones";
            this.label2.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(705, 38);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(148, 16);
            this.label4.TabIndex = 191;
            this.label4.Text = "Beneficios / Descuentos";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.BackColor = System.Drawing.Color.Transparent;
            this.label7.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(8, 38);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(111, 16);
            this.label7.TabIndex = 192;
            this.label7.Text = "Bienes / Servicios";
            this.label7.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // kryptonButton1
            // 
            this.kryptonButton1.Location = new System.Drawing.Point(659, 31);
            this.kryptonButton1.Name = "kryptonButton1";
            this.kryptonButton1.Size = new System.Drawing.Size(40, 25);
            this.kryptonButton1.TabIndex = 193;
            this.toolTip.SetToolTip(this.kryptonButton1, "Agregar nuevo \"Atención al Cliente\".");
            this.kryptonButton1.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_remove;
            this.kryptonButton1.Values.Text = "";
            // 
            // UcCampaniaConf
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Name = "UcCampaniaConf";
            this.Load += new System.EventHandler(this.UcInforme_Load);
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlBody.ResumeLayout(false);
            this.pnlBody.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvInforme)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAtencion)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvArticulos)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonDataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private Krypton.Toolkit.KryptonDataGridView dgvInforme;
        private System.Windows.Forms.Label label14;
        private Krypton.Toolkit.KryptonDataGridView dgvAtencion;
        private Krypton.Toolkit.KryptonButton btnDescalifica;
        private Krypton.Toolkit.KryptonButton btnPreMat;
        private Krypton.Toolkit.KryptonDateTimePicker dtpAtencion;
        private Krypton.Toolkit.KryptonButton btnNewInforme;
        private Krypton.Toolkit.KryptonButton btnEditInforme;
        private Krypton.Toolkit.KryptonButton btnNewAt;
        private Krypton.Toolkit.KryptonButton btnEditAt;
        private Krypton.Toolkit.KryptonButton btnSaveAt;
        private Krypton.Toolkit.KryptonButton btnCancelAt;
        private Krypton.Toolkit.KryptonMaskedTextBox txtProxFecha;
        private Krypton.Toolkit.KryptonMaskedTextBox txtProxHora;
        private ComboBoxMy cmbTipoEstado;
        private Krypton.Toolkit.KryptonButton btnFind;
        private System.Windows.Forms.Label lblAlumno;
        private ComboBoxMy cmbSede;
        private System.Windows.Forms.Label lblRwInf;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label3;
        private Krypton.Toolkit.KryptonButton btnContacto;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvAtencion_idAtencion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvAtencion_fecha;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvAtencion_obs;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvAtencion_idTipoAtencion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvInforme_idInforme;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvInforme_nomSedeX;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvInforme_idTipoModEstX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvInforme_nomCampaniaX;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvInforme_nomGrado;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvInforme_nomPersonaX;
        private System.Windows.Forms.DataGridViewTextBoxColumn vendedor;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvInforme_feIni;
        private System.Windows.Forms.DataGridViewComboBoxColumn dgvInforme_idTipoEstado;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvInforme_cerrado;
        private Krypton.Toolkit.KryptonDataGridView dgvArticulos;
        private System.Windows.Forms.Label label6;
        private ComboBoxMy cmbCampania;
        private Krypton.Toolkit.KryptonButton btnAddArticulos;
        private Krypton.Toolkit.KryptonDataGridView kryptonDataGridView1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label7;
        private Krypton.Toolkit.KryptonButton kryptonButton1;
    }
}
