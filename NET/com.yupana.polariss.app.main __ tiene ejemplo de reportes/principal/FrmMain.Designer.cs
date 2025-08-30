namespace com.yupanastudio.polariss.app.principal
{
    partial class FrmMain
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmMain));
            this.imageList = new System.Windows.Forms.ImageList(this.components);
            this.pnlWork = new System.Windows.Forms.Panel();
            //this.imgUser = new com.yupana.polariss.app.main.principal.OvalPictureBox();
            this.cmbSistema = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.btnAcademico = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.imgClose = new System.Windows.Forms.PictureBox();
            this.imgMin = new System.Windows.Forms.PictureBox();
            this.pnlHead = new System.Windows.Forms.Panel();
            this.pictureBox3 = new System.Windows.Forms.PictureBox();
            this.imgHead = new System.Windows.Forms.PictureBox();
            this.timerReloj = new System.Windows.Forms.Timer(this.components);
            this.timerHora = new System.Windows.Forms.Timer(this.components);
            this.timerCambioFecha = new System.Windows.Forms.Timer(this.components);
            this.kryptonContextMenuItems6 = new ComponentFactory.Krypton.Toolkit.KryptonContextMenuItems();
            this.pnlSistema = new ComponentFactory.Krypton.Toolkit.KryptonPanel();
            this.btnFinanciero = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnLogistico = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnPrincipal = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnComercial = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnLaboral = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.headSistema = new ComponentFactory.Krypton.Toolkit.KryptonHeaderGroup();
            this.treeOpcion = new ComponentFactory.Krypton.Toolkit.KryptonTreeView();
            this.headUsuario = new ComponentFactory.Krypton.Toolkit.KryptonHeaderGroup();
            this.label4 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.kryptonGroupBox1 = new ComponentFactory.Krypton.Toolkit.KryptonGroupBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.lblContador = new System.Windows.Forms.Label();
            this.lblUsuario = new System.Windows.Forms.Label();
            this.lblHost = new System.Windows.Forms.Label();
            this.lblFeOper = new System.Windows.Forms.Label();
            this.lblTime = new System.Windows.Forms.Label();
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.pnlWork.SuspendLayout();
            //((System.ComponentModel.ISupportInitialize)(this.imgUser)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbSistema)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgClose)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgMin)).BeginInit();
            this.pnlHead.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgHead)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pnlSistema)).BeginInit();
            this.pnlSistema.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.headSistema)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.headSistema.Panel)).BeginInit();
            this.headSistema.Panel.SuspendLayout();
            this.headSistema.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.headUsuario)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.headUsuario.Panel)).BeginInit();
            this.headUsuario.Panel.SuspendLayout();
            this.headUsuario.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox1.Panel)).BeginInit();
            this.kryptonGroupBox1.Panel.SuspendLayout();
            this.kryptonGroupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.pnlMenu.SuspendLayout();
            this.SuspendLayout();
            // 
            // imageList
            // 
            this.imageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList.ImageStream")));
            this.imageList.TransparentColor = System.Drawing.Color.Transparent;
            this.imageList.Images.SetKeyName(0, "node.png");
            this.imageList.Images.SetKeyName(1, "node1.png");
            // 
            // pnlWork
            // 
            this.pnlWork.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlWork.BackColor = System.Drawing.Color.DarkGreen;
            //this.pnlWork.Controls.Add(this.imgUser);
            this.pnlWork.Controls.Add(this.cmbSistema);
            this.pnlWork.Controls.Add(this.btnAcademico);
            this.pnlWork.Controls.Add(this.imgClose);
            this.pnlWork.Controls.Add(this.imgMin);
            this.pnlWork.Location = new System.Drawing.Point(0, 80);
            this.pnlWork.Name = "pnlWork";
            this.pnlWork.Size = new System.Drawing.Size(800, 600);
            this.pnlWork.TabIndex = 2;
            // 
            // imgUser
            // 
            //this.imgUser.BackColor = System.Drawing.Color.Lavender;
            //this.imgUser.Location = new System.Drawing.Point(551, 136);
            //this.imgUser.Name = "imgUser";
            //this.imgUser.Size = new System.Drawing.Size(65, 62);
            //this.imgUser.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            //this.imgUser.TabIndex = 7;
            //this.imgUser.TabStop = false;
            //this.imgUser.Visible = false;
            // 
            // cmbSistema
            // 
            this.cmbSistema.DisplayMember = "nomSistema";
            this.cmbSistema.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSistema.DropDownWidth = 190;
            this.cmbSistema.Location = new System.Drawing.Point(687, 177);
            this.cmbSistema.Name = "cmbSistema";
            this.cmbSistema.Size = new System.Drawing.Size(50, 21);
            this.cmbSistema.TabIndex = 3;
            this.cmbSistema.ValueMember = "idSistema";
            this.cmbSistema.Visible = false;
            this.cmbSistema.SelectedIndexChanged += new System.EventHandler(this.CmbSistema_SelectedIndexChanged);
            // 
            // btnAcademico
            // 
            this.btnAcademico.Location = new System.Drawing.Point(652, 450);
            this.btnAcademico.Name = "btnAcademico";
            this.btnAcademico.Size = new System.Drawing.Size(33, 30);
            this.btnAcademico.TabIndex = 13;
            this.btnAcademico.Values.Text = "";
            this.btnAcademico.Visible = false;
            // 
            // imgClose
            // 
            this.imgClose.Location = new System.Drawing.Point(687, 69);
            this.imgClose.Name = "imgClose";
            this.imgClose.Size = new System.Drawing.Size(24, 24);
            this.imgClose.TabIndex = 0;
            this.imgClose.TabStop = false;
            this.imgClose.Visible = false;
            this.imgClose.Click += new System.EventHandler(this.ImgClose_Click);
            this.imgClose.MouseLeave += new System.EventHandler(this.ImgClose_MouseLeave);
            this.imgClose.MouseHover += new System.EventHandler(this.ImgClose_MouseHover);
            // 
            // imgMin
            // 
            this.imgMin.Location = new System.Drawing.Point(687, 125);
            this.imgMin.Name = "imgMin";
            this.imgMin.Size = new System.Drawing.Size(24, 24);
            this.imgMin.TabIndex = 1;
            this.imgMin.TabStop = false;
            this.imgMin.Visible = false;
            this.imgMin.Click += new System.EventHandler(this.ImgMin_Click);
            this.imgMin.MouseLeave += new System.EventHandler(this.ImgMin_MouseLeave);
            this.imgMin.MouseHover += new System.EventHandler(this.ImgMin_MouseHover);
            // 
            // pnlHead
            // 
            this.pnlHead.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlHead.BackColor = System.Drawing.Color.SkyBlue;
            this.pnlHead.Controls.Add(this.pictureBox3);
            this.pnlHead.Controls.Add(this.imgHead);
            this.pnlHead.Location = new System.Drawing.Point(0, 0);
            this.pnlHead.Name = "pnlHead";
            this.pnlHead.Size = new System.Drawing.Size(1008, 80);
            this.pnlHead.TabIndex = 1;
            // 
            // pictureBox3
            // 
            this.pictureBox3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pictureBox3.Image = global::com.yupanastudio.polariss.app.Properties.Resources.banner_right;
            this.pictureBox3.Location = new System.Drawing.Point(800, 0);
            this.pictureBox3.Name = "pictureBox3";
            this.pictureBox3.Size = new System.Drawing.Size(207, 80);
            this.pictureBox3.TabIndex = 2;
            this.pictureBox3.TabStop = false;
            // 
            // imgHead
            // 
            this.imgHead.Image = global::com.yupanastudio.polariss.app.Properties.Resources.banner_left;
            this.imgHead.Location = new System.Drawing.Point(0, 0);
            this.imgHead.Name = "imgHead";
            this.imgHead.Size = new System.Drawing.Size(769, 80);
            this.imgHead.TabIndex = 0;
            this.imgHead.TabStop = false;
            this.imgHead.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pnlHead_MouseDown);
            this.imgHead.MouseMove += new System.Windows.Forms.MouseEventHandler(this.pnlHead_MouseMove);
            this.imgHead.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pnlHead_MouseUp);
            // 
            // timerReloj
            // 
            this.timerReloj.Enabled = true;
            this.timerReloj.Tick += new System.EventHandler(this.TimerReloj_Tick);
            // 
            // timerHora
            // 
            this.timerHora.Interval = 360000;
            this.timerHora.Tick += new System.EventHandler(this.TimerHora_Tick);
            // 
            // timerCambioFecha
            // 
            this.timerCambioFecha.Tick += new System.EventHandler(this.TimerCambioFecha_Tick);
            // 
            // pnlSistema
            // 
            this.pnlSistema.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlSistema.Controls.Add(this.btnFinanciero);
            this.pnlSistema.Controls.Add(this.btnLogistico);
            this.pnlSistema.Controls.Add(this.btnPrincipal);
            this.pnlSistema.Controls.Add(this.btnComercial);
            this.pnlSistema.Controls.Add(this.btnLaboral);
            this.pnlSistema.Location = new System.Drawing.Point(0, 567);
            this.pnlSistema.Name = "pnlSistema";
            this.pnlSistema.Size = new System.Drawing.Size(208, 33);
            this.pnlSistema.TabIndex = 5;
            // 
            // btnFinanciero
            // 
            this.btnFinanciero.Location = new System.Drawing.Point(165, 2);
            this.btnFinanciero.Name = "btnFinanciero";
            this.btnFinanciero.Size = new System.Drawing.Size(41, 30);
            this.btnFinanciero.TabIndex = 12;
            this.toolTip1.SetToolTip(this.btnFinanciero, "Sistema Financiero");
            this.btnFinanciero.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysFIN;
            this.btnFinanciero.Values.Text = "";
            // 
            // btnLogistico
            // 
            this.btnLogistico.Location = new System.Drawing.Point(83, 2);
            this.btnLogistico.Name = "btnLogistico";
            this.btnLogistico.Size = new System.Drawing.Size(41, 30);
            this.btnLogistico.TabIndex = 10;
            this.toolTip1.SetToolTip(this.btnLogistico, "Sistema Logístico");
            this.btnLogistico.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysLGT;
            this.btnLogistico.Values.Text = "";
            // 
            // btnPrincipal
            // 
            this.btnPrincipal.Location = new System.Drawing.Point(1, 2);
            this.btnPrincipal.Name = "btnPrincipal";
            this.btnPrincipal.Size = new System.Drawing.Size(41, 30);
            this.btnPrincipal.TabIndex = 8;
            this.toolTip1.SetToolTip(this.btnPrincipal, "Sistema Genérico");
            this.btnPrincipal.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysGEN;
            this.btnPrincipal.Values.Text = "";
            // 
            // btnComercial
            // 
            this.btnComercial.Location = new System.Drawing.Point(42, 2);
            this.btnComercial.Name = "btnComercial";
            this.btnComercial.Size = new System.Drawing.Size(41, 30);
            this.btnComercial.TabIndex = 9;
            this.toolTip1.SetToolTip(this.btnComercial, "Sistema Comercial");
            this.btnComercial.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysCOM;
            this.btnComercial.Values.Text = "";
            // 
            // btnLaboral
            // 
            this.btnLaboral.Location = new System.Drawing.Point(124, 2);
            this.btnLaboral.Name = "btnLaboral";
            this.btnLaboral.Size = new System.Drawing.Size(41, 30);
            this.btnLaboral.TabIndex = 11;
            this.toolTip1.SetToolTip(this.btnLaboral, "Sistema Laboral");
            this.btnLaboral.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysLAB;
            this.btnLaboral.Values.Text = "";
            // 
            // headSistema
            // 
            this.headSistema.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.headSistema.HeaderStylePrimary = ComponentFactory.Krypton.Toolkit.HeaderStyle.DockInactive;
            this.headSistema.HeaderVisibleSecondary = false;
            this.headSistema.Location = new System.Drawing.Point(-1, 183);
            this.headSistema.Name = "headSistema";
            // 
            // headSistema.Panel
            // 
            this.headSistema.Panel.Controls.Add(this.treeOpcion);
            this.headSistema.Size = new System.Drawing.Size(208, 384);
            this.headSistema.TabIndex = 7;
            this.headSistema.ValuesPrimary.Heading = "SISTEMA LOGÍSTICO";
            this.headSistema.ValuesPrimary.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysACD;
            this.headSistema.ValuesSecondary.Heading = "";
            // 
            // treeOpcion
            // 
            this.treeOpcion.Dock = System.Windows.Forms.DockStyle.Fill;
            this.treeOpcion.ImageIndex = 0;
            this.treeOpcion.ImageList = this.imageList;
            this.treeOpcion.Location = new System.Drawing.Point(0, 0);
            this.treeOpcion.Name = "treeOpcion";
            this.treeOpcion.SelectedImageKey = "node1.png";
            this.treeOpcion.Size = new System.Drawing.Size(206, 354);
            this.treeOpcion.TabIndex = 1;
            this.treeOpcion.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.TreeOpcion_AfterSelect);
            this.treeOpcion.BeforeCollapse += new System.Windows.Forms.TreeViewCancelEventHandler(this.TreeOpcion_BeforeCollapse);
            // 
            // headUsuario
            // 
            this.headUsuario.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.headUsuario.HeaderStylePrimary = ComponentFactory.Krypton.Toolkit.HeaderStyle.DockInactive;
            this.headUsuario.HeaderVisibleSecondary = false;
            this.headUsuario.Location = new System.Drawing.Point(-1, 0);
            this.headUsuario.Name = "headUsuario";
            // 
            // headUsuario.Panel
            // 
            this.headUsuario.Panel.Controls.Add(this.label4);
            this.headUsuario.Panel.Controls.Add(this.label1);
            this.headUsuario.Panel.Controls.Add(this.kryptonGroupBox1);
            this.headUsuario.Panel.Controls.Add(this.lblContador);
            this.headUsuario.Panel.Controls.Add(this.lblUsuario);
            this.headUsuario.Panel.Controls.Add(this.lblHost);
            this.headUsuario.Panel.Controls.Add(this.lblFeOper);
            this.headUsuario.Panel.Controls.Add(this.lblTime);
            this.headUsuario.Size = new System.Drawing.Size(208, 183);
            this.headUsuario.StateNormal.Back.Color1 = System.Drawing.Color.GhostWhite;
            this.headUsuario.TabIndex = 6;
            this.headUsuario.ValuesPrimary.Heading = "BARZOLA OLIVARES, FRANKLIN";
            this.headUsuario.ValuesPrimary.Image = global::com.yupanastudio.polariss.app.Properties.Resources.person;
            this.headUsuario.ValuesSecondary.Heading = "";
            // 
            // label4
            // 
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Location = new System.Drawing.Point(101, 98);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(97, 13);
            this.label4.TabIndex = 13;
            this.label4.Text = "Usuario";
            // 
            // label1
            // 
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Location = new System.Drawing.Point(101, 63);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(97, 13);
            this.label1.TabIndex = 12;
            this.label1.Text = "Computador";
            // 
            // kryptonGroupBox1
            // 
            this.kryptonGroupBox1.Location = new System.Drawing.Point(5, 7);
            this.kryptonGroupBox1.Name = "kryptonGroupBox1";
            // 
            // kryptonGroupBox1.Panel
            // 
            this.kryptonGroupBox1.Panel.Controls.Add(this.pictureBox1);
            this.kryptonGroupBox1.Size = new System.Drawing.Size(94, 121);
            this.kryptonGroupBox1.TabIndex = 8;
            this.kryptonGroupBox1.Values.Heading = "";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pictureBox1.Location = new System.Drawing.Point(0, 0);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(90, 115);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // lblContador
            // 
            this.lblContador.BackColor = System.Drawing.Color.Transparent;
            this.lblContador.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblContador.ForeColor = System.Drawing.Color.Red;
            this.lblContador.Location = new System.Drawing.Point(5, 129);
            this.lblContador.Name = "lblContador";
            this.lblContador.Size = new System.Drawing.Size(195, 20);
            this.lblContador.TabIndex = 11;
            this.lblContador.Text = "...";
            this.lblContador.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // lblUsuario
            // 
            this.lblUsuario.BackColor = System.Drawing.Color.Transparent;
            this.lblUsuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUsuario.ForeColor = System.Drawing.Color.DarkSlateBlue;
            this.lblUsuario.Location = new System.Drawing.Point(102, 76);
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(97, 20);
            this.lblUsuario.TabIndex = 6;
            this.lblUsuario.Text = "fbarzola";
            // 
            // lblHost
            // 
            this.lblHost.BackColor = System.Drawing.Color.Transparent;
            this.lblHost.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHost.ForeColor = System.Drawing.Color.DarkSlateBlue;
            this.lblHost.Location = new System.Drawing.Point(102, 111);
            this.lblHost.Name = "lblHost";
            this.lblHost.Size = new System.Drawing.Size(97, 20);
            this.lblHost.TabIndex = 5;
            this.lblHost.Text = "sjbsistemas01";
            // 
            // lblFeOper
            // 
            this.lblFeOper.BackColor = System.Drawing.Color.Transparent;
            this.lblFeOper.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFeOper.Location = new System.Drawing.Point(102, 10);
            this.lblFeOper.Name = "lblFeOper";
            this.lblFeOper.Size = new System.Drawing.Size(97, 20);
            this.lblFeOper.TabIndex = 4;
            this.lblFeOper.Text = "01/ENE/1900";
            this.lblFeOper.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // lblTime
            // 
            this.lblTime.BackColor = System.Drawing.Color.Transparent;
            this.lblTime.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTime.ForeColor = System.Drawing.Color.DarkSlateBlue;
            this.lblTime.Location = new System.Drawing.Point(102, 35);
            this.lblTime.Name = "lblTime";
            this.lblTime.Size = new System.Drawing.Size(97, 20);
            this.lblTime.TabIndex = 3;
            this.lblTime.Text = "00:00:00";
            this.lblTime.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // pnlMenu
            // 
            this.pnlMenu.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlMenu.BackColor = System.Drawing.Color.Yellow;
            this.pnlMenu.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlMenu.Controls.Add(this.headUsuario);
            this.pnlMenu.Controls.Add(this.headSistema);
            this.pnlMenu.Controls.Add(this.pnlSistema);
            this.pnlMenu.Location = new System.Drawing.Point(800, 79);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(209, 602);
            this.pnlMenu.TabIndex = 3;
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Blue;
            this.ClientSize = new System.Drawing.Size(1008, 680);
            this.Controls.Add(this.pnlHead);
            this.Controls.Add(this.pnlWork);
            this.Controls.Add(this.pnlMenu);
            this.Name = "FrmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "POLARIS - SISTEMA INTEGRADO DE GESTIÓN";
            this.Activated += new System.EventHandler(this.FrmMain_Activated);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmMain_FormClosing);
            this.Load += new System.EventHandler(this.FrmMain_Load);
            this.pnlWork.ResumeLayout(false);
            //((System.ComponentModel.ISupportInitialize)(this.imgUser)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbSistema)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgClose)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgMin)).EndInit();
            this.pnlHead.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgHead)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pnlSistema)).EndInit();
            this.pnlSistema.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.headSistema.Panel)).EndInit();
            this.headSistema.Panel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.headSistema)).EndInit();
            this.headSistema.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.headUsuario.Panel)).EndInit();
            this.headUsuario.Panel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.headUsuario)).EndInit();
            this.headUsuario.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox1.Panel)).EndInit();
            this.kryptonGroupBox1.Panel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox1)).EndInit();
            this.kryptonGroupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.pnlMenu.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Panel pnlWork;
        private System.Windows.Forms.PictureBox imgHead;
        private System.Windows.Forms.Panel pnlHead;
        private System.Windows.Forms.ImageList imageList;
        private System.Windows.Forms.Timer timerReloj;
        private System.Windows.Forms.Timer timerHora;
        private System.Windows.Forms.Timer timerCambioFecha;
        private ComponentFactory.Krypton.Toolkit.KryptonContextMenuItems kryptonContextMenuItems6;
        private System.Windows.Forms.PictureBox pictureBox3;
        private ComponentFactory.Krypton.Toolkit.KryptonPanel pnlSistema;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnFinanciero;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnLogistico;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnPrincipal;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnComercial;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnLaboral;
        private ComponentFactory.Krypton.Toolkit.KryptonHeaderGroup headSistema;
        private ComponentFactory.Krypton.Toolkit.KryptonTreeView treeOpcion;
        private ComponentFactory.Krypton.Toolkit.KryptonHeaderGroup headUsuario;
        //private yupana.polariss.app.main.principal.OvalPictureBox imgUser;
        private ComponentFactory.Krypton.Toolkit.KryptonGroupBox kryptonGroupBox1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lblContador;
        private System.Windows.Forms.Label lblUsuario;
        private System.Windows.Forms.Label lblHost;
        private System.Windows.Forms.Label lblFeOper;
        private System.Windows.Forms.Label lblTime;
        private System.Windows.Forms.PictureBox imgMin;
        private System.Windows.Forms.PictureBox imgClose;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbSistema;
        private System.Windows.Forms.Panel pnlMenu;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnAcademico;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label4;
    }
}