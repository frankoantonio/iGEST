namespace com.yupanastudio.igest.winapp
{
    partial class UcInformes
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UcInformes));
            this.label35 = new System.Windows.Forms.Label();
            this.dgvInforme = new Krypton.Toolkit.KryptonDataGridView();
            this.label30 = new System.Windows.Forms.Label();
            this.kryptonGroupBox2 = new Krypton.Toolkit.KryptonGroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtProxHora = new Krypton.Toolkit.KryptonMaskedTextBox();
            this.txtProxFecha = new Krypton.Toolkit.KryptonMaskedTextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cmbTipoGdoInteres = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.label10 = new System.Windows.Forms.Label();
            this.txtObs = new Krypton.Toolkit.KryptonTextBox();
            this.cmbTipoAtencion = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.dtpAtencion = new Krypton.Toolkit.KryptonDateTimePicker();
            this.label9 = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
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
            this.lsbContacto = new Krypton.Toolkit.KryptonListBox();
            this.label3 = new System.Windows.Forms.Label();
            this.btnContacto = new Krypton.Toolkit.KryptonButton();
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
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlBody.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvInforme)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox2.Panel)).BeginInit();
            this.kryptonGroupBox2.Panel.SuspendLayout();
            this.kryptonGroupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAtencion)).BeginInit();
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
            this.pnlBody.Controls.Add(this.btnContacto);
            this.pnlBody.Controls.Add(this.label3);
            this.pnlBody.Controls.Add(this.lsbContacto);
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
            this.pnlBody.Controls.Add(this.kryptonGroupBox2);
            this.pnlBody.Controls.Add(this.label30);
            this.pnlBody.Controls.Add(this.dgvInforme);
            this.pnlBody.Controls.Add(this.label35);
            this.pnlBody.Controls.Add(this.lblRwInf);
            this.pnlBody.TabIndex = 0;
            this.pnlBody.Controls.SetChildIndex(this.lblRwInf, 0);
            this.pnlBody.Controls.SetChildIndex(this.label35, 0);
            this.pnlBody.Controls.SetChildIndex(this.dgvInforme, 0);
            this.pnlBody.Controls.SetChildIndex(this.label30, 0);
            this.pnlBody.Controls.SetChildIndex(this.kryptonGroupBox2, 0);
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
            this.pnlBody.Controls.SetChildIndex(this.lsbContacto, 0);
            this.pnlBody.Controls.SetChildIndex(this.label3, 0);
            this.pnlBody.Controls.SetChildIndex(this.btnContacto, 0);
            // 
            // label35
            // 
            this.label35.AutoSize = true;
            this.label35.BackColor = System.Drawing.Color.Transparent;
            this.label35.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label35.Location = new System.Drawing.Point(8, 40);
            this.label35.Name = "label35";
            this.label35.Size = new System.Drawing.Size(56, 16);
            this.label35.TabIndex = 104;
            this.label35.Text = "Informes";
            this.label35.TextAlign = System.Drawing.ContentAlignment.TopRight;
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
            this.dgvInforme.Location = new System.Drawing.Point(10, 60);
            this.dgvInforme.MultiSelect = false;
            this.dgvInforme.Name = "dgvInforme";
            this.dgvInforme.ReadOnly = true;
            this.dgvInforme.RowHeadersWidth = 22;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvInforme.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvInforme.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvInforme.Size = new System.Drawing.Size(980, 310);
            this.dgvInforme.StandardTab = true;
            this.dgvInforme.TabIndex = 5;
            this.dgvInforme.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvInforme_CellDoubleClick);
            this.dgvInforme.SelectionChanged += new System.EventHandler(this.dgvInforme_SelectionChanged);
            // 
            // label30
            // 
            this.label30.AutoSize = true;
            this.label30.BackColor = System.Drawing.Color.Transparent;
            this.label30.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label30.Location = new System.Drawing.Point(268, 410);
            this.label30.Name = "label30";
            this.label30.Size = new System.Drawing.Size(174, 16);
            this.label30.TabIndex = 147;
            this.label30.Text = "Detalles - Atención al Cliente";
            this.label30.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // kryptonGroupBox2
            // 
            this.kryptonGroupBox2.CaptionStyle = Krypton.Toolkit.LabelStyle.NormalControl;
            this.kryptonGroupBox2.Location = new System.Drawing.Point(270, 430);
            this.kryptonGroupBox2.Name = "kryptonGroupBox2";
            // 
            // kryptonGroupBox2.Panel
            // 
            this.kryptonGroupBox2.Panel.Controls.Add(this.label2);
            this.kryptonGroupBox2.Panel.Controls.Add(this.txtProxHora);
            this.kryptonGroupBox2.Panel.Controls.Add(this.txtProxFecha);
            this.kryptonGroupBox2.Panel.Controls.Add(this.label4);
            this.kryptonGroupBox2.Panel.Controls.Add(this.cmbTipoGdoInteres);
            this.kryptonGroupBox2.Panel.Controls.Add(this.label10);
            this.kryptonGroupBox2.Panel.Controls.Add(this.txtObs);
            this.kryptonGroupBox2.Panel.Controls.Add(this.cmbTipoAtencion);
            this.kryptonGroupBox2.Panel.Controls.Add(this.dtpAtencion);
            this.kryptonGroupBox2.Panel.Controls.Add(this.label9);
            this.kryptonGroupBox2.Panel.Controls.Add(this.label17);
            this.kryptonGroupBox2.Size = new System.Drawing.Size(460, 178);
            this.kryptonGroupBox2.StateCommon.Back.Color1 = System.Drawing.Color.PaleTurquoise;
            this.kryptonGroupBox2.StateCommon.Content.ShortText.Color1 = System.Drawing.Color.Navy;
            this.kryptonGroupBox2.StateCommon.Content.ShortText.Font = new System.Drawing.Font("Arial", 9F);
            this.kryptonGroupBox2.TabIndex = 11;
            this.kryptonGroupBox2.Values.Heading = "";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label2.Location = new System.Drawing.Point(245, 123);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(77, 15);
            this.label2.TabIndex = 176;
            this.label2.Text = "Próxima Cita";
            this.label2.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtProxHora
            // 
            this.txtProxHora.Enabled = false;
            this.txtProxHora.Location = new System.Drawing.Point(377, 140);
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
            this.txtProxFecha.Location = new System.Drawing.Point(247, 140);
            this.txtProxFecha.Mask = "00/00/0000";
            this.txtProxFecha.Name = "txtProxFecha";
            this.txtProxFecha.Size = new System.Drawing.Size(125, 23);
            this.txtProxFecha.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtProxFecha.TabIndex = 4;
            this.txtProxFecha.Text = "  /  /";
            this.txtProxFecha.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label4.Location = new System.Drawing.Point(8, 123);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(82, 15);
            this.label4.TabIndex = 167;
            this.label4.Text = "Grado Interés";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbTipoGdoInteres
            // 
            this.cmbTipoGdoInteres.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbTipoGdoInteres.DisplayMember = "nomTipo";
            this.cmbTipoGdoInteres.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTipoGdoInteres.Enabled = false;
            this.cmbTipoGdoInteres.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbTipoGdoInteres.FormattingEnabled = true;
            this.cmbTipoGdoInteres.Location = new System.Drawing.Point(10, 140);
            this.cmbTipoGdoInteres.Name = "cmbTipoGdoInteres";
            this.cmbTipoGdoInteres.Size = new System.Drawing.Size(200, 21);
            this.cmbTipoGdoInteres.TabIndex = 3;
            this.cmbTipoGdoInteres.ValueMember = "idTipo";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.BackColor = System.Drawing.Color.Transparent;
            this.label10.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label10.Location = new System.Drawing.Point(8, 15);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(90, 15);
            this.label10.TabIndex = 155;
            this.label10.Text = "Fecha Atención";
            this.label10.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtObs
            // 
            this.txtObs.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtObs.Enabled = false;
            this.txtObs.Location = new System.Drawing.Point(10, 79);
            this.txtObs.MaxLength = 100;
            this.txtObs.Multiline = true;
            this.txtObs.Name = "txtObs";
            this.txtObs.Size = new System.Drawing.Size(437, 36);
            this.txtObs.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtObs.TabIndex = 2;
            // 
            // cmbTipoAtencion
            // 
            this.cmbTipoAtencion.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbTipoAtencion.DisplayMember = "nomTipo";
            this.cmbTipoAtencion.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTipoAtencion.Enabled = false;
            this.cmbTipoAtencion.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbTipoAtencion.FormattingEnabled = true;
            this.cmbTipoAtencion.Location = new System.Drawing.Point(247, 32);
            this.cmbTipoAtencion.Name = "cmbTipoAtencion";
            this.cmbTipoAtencion.Size = new System.Drawing.Size(200, 21);
            this.cmbTipoAtencion.TabIndex = 1;
            this.cmbTipoAtencion.ValueMember = "idTipo";
            // 
            // dtpAtencion
            // 
            this.dtpAtencion.CalendarTodayDate = new System.DateTime(2021, 6, 29, 0, 0, 0, 0);
            this.dtpAtencion.CalendarTodayFormat = "";
            this.dtpAtencion.CustomFormat = "dd/MMM/yyyy hh:mm:ss t\'m\'";
            this.dtpAtencion.Enabled = false;
            this.dtpAtencion.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpAtencion.Location = new System.Drawing.Point(10, 32);
            this.dtpAtencion.Name = "dtpAtencion";
            this.dtpAtencion.Size = new System.Drawing.Size(200, 21);
            this.dtpAtencion.TabIndex = 0;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.BackColor = System.Drawing.Color.Transparent;
            this.label9.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label9.Location = new System.Drawing.Point(245, 15);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(100, 15);
            this.label9.TabIndex = 143;
            this.label9.Text = "Tipo de Contacto";
            this.label9.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.BackColor = System.Drawing.Color.Transparent;
            this.label17.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label17.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label17.Location = new System.Drawing.Point(8, 62);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(76, 15);
            this.label17.TabIndex = 131;
            this.label17.Text = "Observación";
            this.label17.TextAlign = System.Drawing.ContentAlignment.TopRight;
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
            this.label14.Location = new System.Drawing.Point(8, 410);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(116, 16);
            this.label14.TabIndex = 149;
            this.label14.Text = "Atención al Cliente";
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
            this.dgvAtencion.Location = new System.Drawing.Point(10, 430);
            this.dgvAtencion.MultiSelect = false;
            this.dgvAtencion.Name = "dgvAtencion";
            this.dgvAtencion.ReadOnly = true;
            this.dgvAtencion.RowHeadersWidth = 22;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.LemonChiffon;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.DarkSlateBlue;
            this.dgvAtencion.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvAtencion.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvAtencion.Size = new System.Drawing.Size(250, 178);
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
            this.btnEditInforme.Location = new System.Drawing.Point(950, 31);
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
            this.btnNewInforme.Location = new System.Drawing.Point(909, 31);
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
            this.btnNewAt.Location = new System.Drawing.Point(649, 401);
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
            this.btnEditAt.Location = new System.Drawing.Point(690, 401);
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
            this.btnSaveAt.Location = new System.Drawing.Point(649, 401);
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
            this.btnCancelAt.Location = new System.Drawing.Point(690, 401);
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
            this.cmbTipoEstado.Location = new System.Drawing.Point(693, 31);
            this.cmbTipoEstado.Name = "cmbTipoEstado";
            this.cmbTipoEstado.Size = new System.Drawing.Size(165, 21);
            this.cmbTipoEstado.TabIndex = 1;
            this.cmbTipoEstado.ValueMember = "idTipo";
            this.cmbTipoEstado.SelectedIndexChanged += new System.EventHandler(this.cmbTipoEstado_SelectedIndexChanged);
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(868, 31);
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
            this.lblAlumno.Location = new System.Drawing.Point(63, 41);
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
            this.cmbSede.Location = new System.Drawing.Point(469, 31);
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
            this.label5.Location = new System.Drawing.Point(645, 31);
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
            this.label1.Location = new System.Drawing.Point(431, 31);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(36, 15);
            this.label1.TabIndex = 178;
            this.label1.Text = "Sede";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // lsbContacto
            // 
            this.lsbContacto.Location = new System.Drawing.Point(740, 430);
            this.lsbContacto.Name = "lsbContacto";
            this.lsbContacto.Size = new System.Drawing.Size(250, 149);
            this.lsbContacto.StateDisabled.Item.Content.LongText.Color1 = System.Drawing.Color.Brown;
            this.lsbContacto.StateDisabled.Item.Content.ShortText.Color1 = System.Drawing.Color.Brown;
            this.lsbContacto.TabIndex = 182;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(738, 410);
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
            // UcInformes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Name = "UcInformes";
            this.Load += new System.EventHandler(this.UcInforme_Load);
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlBody.ResumeLayout(false);
            this.pnlBody.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvInforme)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox2.Panel)).EndInit();
            this.kryptonGroupBox2.Panel.ResumeLayout(false);
            this.kryptonGroupBox2.Panel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox2)).EndInit();
            this.kryptonGroupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvAtencion)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Label label35;
        private Krypton.Toolkit.KryptonDataGridView dgvInforme;
        private System.Windows.Forms.Label label30;
        private Krypton.Toolkit.KryptonGroupBox kryptonGroupBox2;
        private ComboBoxMy cmbTipoAtencion;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.Label label14;
        private Krypton.Toolkit.KryptonTextBox txtObs;
        private Krypton.Toolkit.KryptonDataGridView dgvAtencion;
        private Krypton.Toolkit.KryptonButton btnDescalifica;
        private Krypton.Toolkit.KryptonButton btnPreMat;
        private System.Windows.Forms.Label label10;
        private Krypton.Toolkit.KryptonDateTimePicker dtpAtencion;
        private Krypton.Toolkit.KryptonButton btnNewInforme;
        private Krypton.Toolkit.KryptonButton btnEditInforme;
        private Krypton.Toolkit.KryptonButton btnNewAt;
        private Krypton.Toolkit.KryptonButton btnEditAt;
        private Krypton.Toolkit.KryptonButton btnSaveAt;
        private Krypton.Toolkit.KryptonButton btnCancelAt;
        private System.Windows.Forms.Label label4;
        private ComboBoxMy cmbTipoGdoInteres;
        private Krypton.Toolkit.KryptonMaskedTextBox txtProxFecha;
        private Krypton.Toolkit.KryptonMaskedTextBox txtProxHora;
        private System.Windows.Forms.Label label2;
        private ComboBoxMy cmbTipoEstado;
        private Krypton.Toolkit.KryptonButton btnFind;
        private System.Windows.Forms.Label lblAlumno;
        private ComboBoxMy cmbSede;
        private System.Windows.Forms.Label lblRwInf;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label5;
        private Krypton.Toolkit.KryptonListBox lsbContacto;
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
    }
}
