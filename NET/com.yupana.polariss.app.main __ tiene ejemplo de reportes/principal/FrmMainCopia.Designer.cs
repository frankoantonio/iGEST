using com.yupana.polariss.app.main.principal;

namespace com.yupanastudio.polariss.app.principal
{
    partial class FrmMainCopia
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
            this.treeOpcion = new ComponentFactory.Krypton.Toolkit.KryptonTreeView();
            this.imageList = new System.Windows.Forms.ImageList(this.components);
            this.pnlSistema = new ComponentFactory.Krypton.Toolkit.KryptonPanel();
            this.cmbSistema = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.headUsuario = new ComponentFactory.Krypton.Toolkit.KryptonHeaderGroup();
            this.lblContador = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.lblUsuario = new System.Windows.Forms.Label();
            this.lblHost = new System.Windows.Forms.Label();
            this.lblFeOper = new System.Windows.Forms.Label();
            this.lblTime = new System.Windows.Forms.Label();
            this.headSistema = new ComponentFactory.Krypton.Toolkit.KryptonHeaderGroup();
            this.pnlWork = new System.Windows.Forms.Panel();
            this.pnlHead = new System.Windows.Forms.Panel();
            this.timerReloj = new System.Windows.Forms.Timer(this.components);
            this.timerHora = new System.Windows.Forms.Timer(this.components);
            this.timerCambioFecha = new System.Windows.Forms.Timer(this.components);
            this.btnPrincipal = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnComercial = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnLogistico = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnLaboral = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnFinanciero = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnAcademico = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.kryptonContextMenuItems6 = new ComponentFactory.Krypton.Toolkit.KryptonContextMenuItems();
            this.kryptonGroupBox1 = new ComponentFactory.Krypton.Toolkit.KryptonGroupBox();
            this.imgHead = new System.Windows.Forms.PictureBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.imgMin = new System.Windows.Forms.PictureBox();
            this.imgClose = new System.Windows.Forms.PictureBox();
            //this.imgUser = new OvalPictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pnlSistema)).BeginInit();
            this.pnlSistema.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cmbSistema)).BeginInit();
            this.pnlMenu.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.headUsuario)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.headUsuario.Panel)).BeginInit();
            this.headUsuario.Panel.SuspendLayout();
            this.headUsuario.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.headSistema)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.headSistema.Panel)).BeginInit();
            this.headSistema.Panel.SuspendLayout();
            this.headSistema.SuspendLayout();
            this.pnlHead.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox1.Panel)).BeginInit();
            this.kryptonGroupBox1.Panel.SuspendLayout();
            this.kryptonGroupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgHead)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgMin)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgClose)).BeginInit();
            //((System.ComponentModel.ISupportInitialize)(this.imgUser)).BeginInit();
            this.SuspendLayout();
            // 
            // treeOpcion
            // 
            this.treeOpcion.Dock = System.Windows.Forms.DockStyle.Fill;
            this.treeOpcion.ImageIndex = 0;
            this.treeOpcion.ImageList = this.imageList;
            this.treeOpcion.Location = new System.Drawing.Point(0, 0);
            this.treeOpcion.Name = "treeOpcion";
            this.treeOpcion.SelectedImageKey = "node1.png";
            this.treeOpcion.Size = new System.Drawing.Size(199, 247);
            this.treeOpcion.TabIndex = 1;
            this.treeOpcion.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.TreeOpcion_AfterSelect);
            this.treeOpcion.BeforeCollapse += new System.Windows.Forms.TreeViewCancelEventHandler(this.TreeOpcion_BeforeCollapse);
            // 
            // imageList
            // 
            this.imageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList.ImageStream")));
            this.imageList.TransparentColor = System.Drawing.Color.Transparent;
            this.imageList.Images.SetKeyName(0, "node.png");
            this.imageList.Images.SetKeyName(1, "node1.png");
            // 
            // pnlSistema
            // 
            this.pnlSistema.Controls.Add(this.btnAcademico);
            this.pnlSistema.Controls.Add(this.btnFinanciero);
            this.pnlSistema.Controls.Add(this.btnLogistico);
            this.pnlSistema.Controls.Add(this.btnPrincipal);
            this.pnlSistema.Controls.Add(this.btnComercial);
            this.pnlSistema.Controls.Add(this.btnLaboral);
            this.pnlSistema.Location = new System.Drawing.Point(0, 585);
            this.pnlSistema.Name = "pnlSistema";
            this.pnlSistema.Size = new System.Drawing.Size(200, 33);
            this.pnlSistema.TabIndex = 5;
            // 
            // cmbSistema
            // 
            this.cmbSistema.DisplayMember = "nomSistema";
            this.cmbSistema.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSistema.DropDownWidth = 190;
            this.cmbSistema.Location = new System.Drawing.Point(3, 558);
            this.cmbSistema.Name = "cmbSistema";
            this.cmbSistema.Size = new System.Drawing.Size(192, 21);
            this.cmbSistema.TabIndex = 3;
            this.cmbSistema.ValueMember = "idSistema";
            this.cmbSistema.SelectedIndexChanged += new System.EventHandler(this.CmbSistema_SelectedIndexChanged);
            // 
            // pnlMenu
            // 
            this.pnlMenu.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlMenu.Controls.Add(this.cmbSistema);
            this.pnlMenu.Controls.Add(this.headUsuario);
            this.pnlMenu.Controls.Add(this.headSistema);
            this.pnlMenu.Controls.Add(this.pnlSistema);
            this.pnlMenu.Location = new System.Drawing.Point(1000, 80);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(200, 620);
            this.pnlMenu.TabIndex = 3;
            // 
            // headUsuario
            // 
            this.headUsuario.HeaderStylePrimary = ComponentFactory.Krypton.Toolkit.HeaderStyle.DockInactive;
            this.headUsuario.HeaderVisibleSecondary = false;
            this.headUsuario.Location = new System.Drawing.Point(-1, 0);
            this.headUsuario.Name = "headUsuario";
            // 
            // headUsuario.Panel
            // 
            //this.headUsuario.Panel.Controls.Add(this.imgUser);
            this.headUsuario.Panel.Controls.Add(this.kryptonGroupBox1);
            this.headUsuario.Panel.Controls.Add(this.lblContador);
            this.headUsuario.Panel.Controls.Add(this.label3);
            this.headUsuario.Panel.Controls.Add(this.label2);
            this.headUsuario.Panel.Controls.Add(this.label1);
            this.headUsuario.Panel.Controls.Add(this.lblUsuario);
            this.headUsuario.Panel.Controls.Add(this.lblHost);
            this.headUsuario.Panel.Controls.Add(this.lblFeOper);
            this.headUsuario.Panel.Controls.Add(this.lblTime);
            this.headUsuario.Panel.Controls.Add(this.imgMin);
            this.headUsuario.Panel.Controls.Add(this.imgClose);
            this.headUsuario.Size = new System.Drawing.Size(201, 250);
            this.headUsuario.StateNormal.Back.Color1 = System.Drawing.Color.GhostWhite;
            this.headUsuario.TabIndex = 6;
            this.headUsuario.ValuesPrimary.Heading = "BARZOLA OLIVARES, FRANKLIN";
            this.headUsuario.ValuesPrimary.Image = global::com.yupanastudio.polariss.app.Properties.Resources.person;
            this.headUsuario.ValuesSecondary.Heading = "";
            // 
            // lblContador
            // 
            this.lblContador.BackColor = System.Drawing.Color.Transparent;
            this.lblContador.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblContador.ForeColor = System.Drawing.Color.Red;
            this.lblContador.Location = new System.Drawing.Point(10, 125);
            this.lblContador.Name = "lblContador";
            this.lblContador.Size = new System.Drawing.Size(180, 20);
            this.lblContador.TabIndex = 11;
            this.lblContador.Text = "00:00:00";
            this.lblContador.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.lblContador.Visible = false;
            // 
            // label3
            // 
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Location = new System.Drawing.Point(10, 195);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(90, 13);
            this.label3.TabIndex = 10;
            this.label3.Text = "Usuario:";
            this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label2
            // 
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Location = new System.Drawing.Point(10, 174);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(90, 13);
            this.label2.TabIndex = 9;
            this.label2.Text = "Computador:";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label1
            // 
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Location = new System.Drawing.Point(10, 154);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(90, 17);
            this.label1.TabIndex = 8;
            this.label1.Text = "Fe. Operación:";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lblUsuario
            // 
            this.lblUsuario.BackColor = System.Drawing.Color.Transparent;
            this.lblUsuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUsuario.ForeColor = System.Drawing.Color.DarkSlateBlue;
            this.lblUsuario.Location = new System.Drawing.Point(100, 195);
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(90, 13);
            this.lblUsuario.TabIndex = 6;
            this.lblUsuario.Text = "fbarzola";
            this.lblUsuario.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // lblHost
            // 
            this.lblHost.BackColor = System.Drawing.Color.Transparent;
            this.lblHost.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHost.ForeColor = System.Drawing.Color.DarkSlateBlue;
            this.lblHost.Location = new System.Drawing.Point(100, 174);
            this.lblHost.Name = "lblHost";
            this.lblHost.Size = new System.Drawing.Size(90, 13);
            this.lblHost.TabIndex = 5;
            this.lblHost.Text = "sjbsistemas01";
            this.lblHost.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // lblFeOper
            // 
            this.lblFeOper.BackColor = System.Drawing.Color.Transparent;
            this.lblFeOper.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFeOper.ForeColor = System.Drawing.Color.DarkSlateBlue;
            this.lblFeOper.Location = new System.Drawing.Point(100, 154);
            this.lblFeOper.Name = "lblFeOper";
            this.lblFeOper.Size = new System.Drawing.Size(90, 17);
            this.lblFeOper.TabIndex = 4;
            this.lblFeOper.Text = "01/ENE/1900";
            this.lblFeOper.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // lblTime
            // 
            this.lblTime.BackColor = System.Drawing.Color.Transparent;
            this.lblTime.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTime.ForeColor = System.Drawing.Color.DarkSlateBlue;
            this.lblTime.Location = new System.Drawing.Point(10, 130);
            this.lblTime.Name = "lblTime";
            this.lblTime.Size = new System.Drawing.Size(180, 20);
            this.lblTime.TabIndex = 3;
            this.lblTime.Text = "00:00:00";
            this.lblTime.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // headSistema
            // 
            this.headSistema.HeaderStylePrimary = ComponentFactory.Krypton.Toolkit.HeaderStyle.DockInactive;
            this.headSistema.HeaderVisibleSecondary = false;
            this.headSistema.Location = new System.Drawing.Point(-1, 250);
            this.headSistema.Name = "headSistema";
            // 
            // headSistema.Panel
            // 
            this.headSistema.Panel.Controls.Add(this.treeOpcion);
            this.headSistema.Size = new System.Drawing.Size(201, 277);
            this.headSistema.TabIndex = 7;
            this.headSistema.ValuesPrimary.Heading = "SISTEMA LOGÍSTICO";
            this.headSistema.ValuesPrimary.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysACD;
            this.headSistema.ValuesSecondary.Heading = "";
            // 
            // pnlWork
            // 
            this.pnlWork.Location = new System.Drawing.Point(0, 80);
            this.pnlWork.Name = "pnlWork";
            this.pnlWork.Size = new System.Drawing.Size(1000, 620);
            this.pnlWork.TabIndex = 2;
            // 
            // pnlHead
            // 
            this.pnlHead.Controls.Add(this.imgHead);
            this.pnlHead.Location = new System.Drawing.Point(0, 0);
            this.pnlHead.Name = "pnlHead";
            this.pnlHead.Size = new System.Drawing.Size(1200, 80);
            this.pnlHead.TabIndex = 1;
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
            // btnPrincipal
            // 
            this.btnPrincipal.Location = new System.Drawing.Point(2, 2);
            this.btnPrincipal.Name = "btnPrincipal";
            this.btnPrincipal.Size = new System.Drawing.Size(39, 30);
            this.btnPrincipal.TabIndex = 8;
            this.btnPrincipal.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysGEN;
            this.btnPrincipal.Values.Text = "";
            // 
            // btnComercial
            // 
            this.btnComercial.Location = new System.Drawing.Point(41, 2);
            this.btnComercial.Name = "btnComercial";
            this.btnComercial.Size = new System.Drawing.Size(39, 30);
            this.btnComercial.TabIndex = 9;
            this.btnComercial.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysCOM;
            this.btnComercial.Values.Text = "";
            // 
            // btnLogistico
            // 
            this.btnLogistico.Location = new System.Drawing.Point(80, 2);
            this.btnLogistico.Name = "btnLogistico";
            this.btnLogistico.Size = new System.Drawing.Size(39, 30);
            this.btnLogistico.TabIndex = 10;
            this.btnLogistico.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysLGT;
            this.btnLogistico.Values.Text = "";
            // 
            // btnLaboral
            // 
            this.btnLaboral.Location = new System.Drawing.Point(119, 2);
            this.btnLaboral.Name = "btnLaboral";
            this.btnLaboral.Size = new System.Drawing.Size(39, 30);
            this.btnLaboral.TabIndex = 11;
            this.btnLaboral.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysLAB;
            this.btnLaboral.Values.Text = "";
            // 
            // btnFinanciero
            // 
            this.btnFinanciero.Location = new System.Drawing.Point(158, 2);
            this.btnFinanciero.Name = "btnFinanciero";
            this.btnFinanciero.Size = new System.Drawing.Size(39, 30);
            this.btnFinanciero.TabIndex = 12;
            this.btnFinanciero.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysFIN;
            this.btnFinanciero.Values.Text = "";
            // 
            // btnAcademico
            // 
            this.btnAcademico.Location = new System.Drawing.Point(140, 2);
            this.btnAcademico.Name = "btnAcademico";
            this.btnAcademico.Size = new System.Drawing.Size(33, 30);
            this.btnAcademico.TabIndex = 13;
            this.btnAcademico.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.icoSysACD;
            this.btnAcademico.Values.Text = "";
            this.btnAcademico.Visible = false;
            // 
            // kryptonGroupBox1
            // 
            this.kryptonGroupBox1.Location = new System.Drawing.Point(13, 6);
            this.kryptonGroupBox1.Name = "kryptonGroupBox1";
            // 
            // kryptonGroupBox1.Panel
            // 
            this.kryptonGroupBox1.Panel.Controls.Add(this.pictureBox1);
            this.kryptonGroupBox1.Size = new System.Drawing.Size(94, 121);
            this.kryptonGroupBox1.TabIndex = 8;
            this.kryptonGroupBox1.Values.Heading = "";
            // 
            // imgHead
            // 
            this.imgHead.Image = global::com.yupanastudio.polariss.app.Properties.Resources.head;
            this.imgHead.Location = new System.Drawing.Point(0, 0);
            this.imgHead.Name = "imgHead";
            this.imgHead.Size = new System.Drawing.Size(1200, 80);
            this.imgHead.TabIndex = 0;
            this.imgHead.TabStop = false;
            this.imgHead.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pnlHead_MouseDown);
            this.imgHead.MouseMove += new System.Windows.Forms.MouseEventHandler(this.pnlHead_MouseMove);
            this.imgHead.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pnlHead_MouseUp);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pictureBox1.Image = global::com.yupanastudio.polariss.app.Properties.Resources.usuario;
            this.pictureBox1.Location = new System.Drawing.Point(0, 0);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(90, 115);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // imgMin
            // 
            this.imgMin.Image = global::com.yupanastudio.polariss.app.Properties.Resources.form_min;
            this.imgMin.Location = new System.Drawing.Point(170, 30);
            this.imgMin.Name = "imgMin";
            this.imgMin.Size = new System.Drawing.Size(24, 24);
            this.imgMin.TabIndex = 1;
            this.imgMin.TabStop = false;
            this.imgMin.Click += new System.EventHandler(this.ImgMin_Click);
            this.imgMin.MouseLeave += new System.EventHandler(this.ImgMin_MouseLeave);
            this.imgMin.MouseHover += new System.EventHandler(this.ImgMin_MouseHover);
            // 
            // imgClose
            // 
            this.imgClose.Image = global::com.yupanastudio.polariss.app.Properties.Resources.form_close;
            this.imgClose.Location = new System.Drawing.Point(170, 5);
            this.imgClose.Name = "imgClose";
            this.imgClose.Size = new System.Drawing.Size(24, 24);
            this.imgClose.TabIndex = 0;
            this.imgClose.TabStop = false;
            this.imgClose.Click += new System.EventHandler(this.ImgClose_Click);
            this.imgClose.MouseLeave += new System.EventHandler(this.ImgClose_MouseLeave);
            this.imgClose.MouseHover += new System.EventHandler(this.ImgClose_MouseHover);
            // 
            // imgUser
            // 
            //this.imgUser.BackColor = System.Drawing.Color.Lavender;
            //this.imgUser.InitialImage = global::com.yupanastudio.polariss.app.Properties.Resources.usuario;
            //this.imgUser.Location = new System.Drawing.Point(113, 63);
            //this.imgUser.Name = "imgUser";
            //this.imgUser.Size = new System.Drawing.Size(65, 62);
            //this.imgUser.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            //this.imgUser.TabIndex = 7;
            //this.imgUser.TabStop = false;
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1200, 700);
            this.ControlBox = false;
            this.Controls.Add(this.pnlHead);
            this.Controls.Add(this.pnlWork);
            this.Controls.Add(this.pnlMenu);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.IsMdiContainer = true;
            this.Name = "FrmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FrmMain";
            this.Activated += new System.EventHandler(this.FrmMain_Activated);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmMain_FormClosing);
            this.Load += new System.EventHandler(this.FrmMain_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pnlSistema)).EndInit();
            this.pnlSistema.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.cmbSistema)).EndInit();
            this.pnlMenu.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.headUsuario.Panel)).EndInit();
            this.headUsuario.Panel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.headUsuario)).EndInit();
            this.headUsuario.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.headSistema.Panel)).EndInit();
            this.headSistema.Panel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.headSistema)).EndInit();
            this.headSistema.ResumeLayout(false);
            this.pnlHead.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox1.Panel)).EndInit();
            this.kryptonGroupBox1.Panel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.kryptonGroupBox1)).EndInit();
            this.kryptonGroupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgHead)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgMin)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgClose)).EndInit();
            //((System.ComponentModel.ISupportInitialize)(this.imgUser)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private ComponentFactory.Krypton.Toolkit.KryptonTreeView treeOpcion;
        private ComponentFactory.Krypton.Toolkit.KryptonPanel pnlSistema;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbSistema;
        private System.Windows.Forms.Panel pnlMenu;
        private ComponentFactory.Krypton.Toolkit.KryptonHeaderGroup headSistema;
        private ComponentFactory.Krypton.Toolkit.KryptonHeaderGroup headUsuario;
        private System.Windows.Forms.Panel pnlWork;
        private System.Windows.Forms.PictureBox imgHead;
        private System.Windows.Forms.Panel pnlHead;
        private System.Windows.Forms.PictureBox imgClose;
        private System.Windows.Forms.PictureBox imgMin;
        private System.Windows.Forms.Label lblUsuario;
        private System.Windows.Forms.Label lblHost;
        private System.Windows.Forms.Label lblFeOper;
        private System.Windows.Forms.Label lblTime;
        private System.Windows.Forms.ImageList imageList;
        //private OvalPictureBox imgUser;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Timer timerReloj;
        private System.Windows.Forms.Timer timerHora;
        private System.Windows.Forms.Timer timerCambioFecha;
        private System.Windows.Forms.Label lblContador;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnAcademico;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnFinanciero;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnLogistico;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnPrincipal;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnComercial;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnLaboral;
        private ComponentFactory.Krypton.Toolkit.KryptonContextMenuItems kryptonContextMenuItems6;
        private ComponentFactory.Krypton.Toolkit.KryptonGroupBox kryptonGroupBox1;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}