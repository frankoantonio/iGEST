namespace com.yupanastudio.igest.winapp
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
            this.treeOpcion = new Krypton.Toolkit.KryptonTreeView();
            this.imageList1 = new System.Windows.Forms.ImageList(this.components);
            this.pnlSistema = new Krypton.Toolkit.KryptonPanel();
            this.btnSisADM = new Krypton.Toolkit.KryptonButton();
            this.btnSisVAR = new Krypton.Toolkit.KryptonButton();
            this.btnSisFIN = new Krypton.Toolkit.KryptonButton();
            this.btnSisLGT = new Krypton.Toolkit.KryptonButton();
            this.btnSisCOM = new Krypton.Toolkit.KryptonButton();
            this.btnSisPER = new Krypton.Toolkit.KryptonButton();
            this.headSistema = new Krypton.Toolkit.KryptonHeaderGroup();
            this.cmbPerfil = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.headUsuario = new Krypton.Toolkit.KryptonHeaderGroup();
            this.lblTemporizador = new System.Windows.Forms.Label();
            this.grpFoto = new Krypton.Toolkit.KryptonGroupBox();
            this.picUser = new System.Windows.Forms.PictureBox();
            this.lblFeOper = new System.Windows.Forms.Label();
            this.lblHora = new System.Windows.Forms.Label();
            this.lblHost = new System.Windows.Forms.Label();
            this.lblUsuario = new System.Windows.Forms.Label();
            this.pnlWork = new System.Windows.Forms.Panel();
            this.ucFondo1 = new com.yupanastudio.igest.winapp.UcFondo();
            this.pnlHead = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.picHead2 = new System.Windows.Forms.PictureBox();
            this.picHead1 = new System.Windows.Forms.PictureBox();
            this.timerSegundos = new System.Windows.Forms.Timer(this.components);
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
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
            ((System.ComponentModel.ISupportInitialize)(this.grpFoto)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grpFoto.Panel)).BeginInit();
            this.grpFoto.Panel.SuspendLayout();
            this.grpFoto.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picUser)).BeginInit();
            this.pnlWork.SuspendLayout();
            this.pnlHead.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picHead2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picHead1)).BeginInit();
            this.SuspendLayout();
            // 
            // treeOpcion
            // 
            this.treeOpcion.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.treeOpcion.ImageIndex = 1;
            this.treeOpcion.ImageList = this.imageList1;
            this.treeOpcion.Location = new System.Drawing.Point(-1, 25);
            this.treeOpcion.Name = "treeOpcion";
            this.treeOpcion.SelectedImageKey = "tree_check.png";
            this.treeOpcion.Size = new System.Drawing.Size(265, 328);
            this.treeOpcion.TabIndex = 2;
            this.treeOpcion.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.TreeOpcion_AfterSelect);
            this.treeOpcion.BeforeCollapse += new System.Windows.Forms.TreeViewCancelEventHandler(this.TreeOpcion_BeforeCollapse);
            // 
            // imageList1
            // 
            this.imageList1.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList1.ImageStream")));
            this.imageList1.TransparentColor = System.Drawing.Color.Transparent;
            this.imageList1.Images.SetKeyName(0, "tree_check.png");
            this.imageList1.Images.SetKeyName(1, "tree_node.png");
            // 
            // pnlSistema
            // 
            this.pnlSistema.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlSistema.Controls.Add(this.btnSisADM);
            this.pnlSistema.Controls.Add(this.btnSisVAR);
            this.pnlSistema.Controls.Add(this.btnSisFIN);
            this.pnlSistema.Controls.Add(this.btnSisLGT);
            this.pnlSistema.Controls.Add(this.btnSisCOM);
            this.pnlSistema.Controls.Add(this.btnSisPER);
            this.pnlSistema.Location = new System.Drawing.Point(1075, 648);
            this.pnlSistema.Name = "pnlSistema";
            this.pnlSistema.Size = new System.Drawing.Size(265, 31);
            this.pnlSistema.TabIndex = 3;
            // 
            // btnSisADM
            // 
            this.btnSisADM.Enabled = false;
            this.btnSisADM.Location = new System.Drawing.Point(220, 0);
            this.btnSisADM.Name = "btnSisADM";
            this.btnSisADM.Size = new System.Drawing.Size(45, 32);
            this.btnSisADM.TabIndex = 5;
            this.btnSisADM.Tag = "ADM";
            this.toolTip1.SetToolTip(this.btnSisADM, "CONTROL Y ACCESO");
            this.btnSisADM.Values.DropDownArrowColor = System.Drawing.Color.Empty;
            this.btnSisADM.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnSysADM;
            this.btnSisADM.Values.Text = "";
            this.btnSisADM.Click += new System.EventHandler(this.btnSisPrincipal_Click);
            // 
            // btnSisVAR
            // 
            this.btnSisVAR.Enabled = false;
            this.btnSisVAR.Location = new System.Drawing.Point(176, 0);
            this.btnSisVAR.Name = "btnSisVAR";
            this.btnSisVAR.Size = new System.Drawing.Size(45, 32);
            this.btnSisVAR.TabIndex = 4;
            this.toolTip1.SetToolTip(this.btnSisVAR, ".....");
            this.btnSisVAR.Values.DropDownArrowColor = System.Drawing.Color.Empty;
            this.btnSisVAR.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnSysCOL;
            this.btnSisVAR.Values.Text = "";
            this.btnSisVAR.Click += new System.EventHandler(this.btnSisVAR_Click);
            // 
            // btnSisFIN
            // 
            this.btnSisFIN.Enabled = false;
            this.btnSisFIN.Location = new System.Drawing.Point(132, 0);
            this.btnSisFIN.Name = "btnSisFIN";
            this.btnSisFIN.Size = new System.Drawing.Size(45, 32);
            this.btnSisFIN.TabIndex = 3;
            this.btnSisFIN.Tag = "FIN";
            this.toolTip1.SetToolTip(this.btnSisFIN, "FINANCIERO");
            this.btnSisFIN.Values.DropDownArrowColor = System.Drawing.Color.Empty;
            this.btnSisFIN.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnSysFIN;
            this.btnSisFIN.Values.Text = "";
            this.btnSisFIN.Click += new System.EventHandler(this.btnSisFinanciero_Click);
            // 
            // btnSisLGT
            // 
            this.btnSisLGT.Enabled = false;
            this.btnSisLGT.Location = new System.Drawing.Point(44, 0);
            this.btnSisLGT.Name = "btnSisLGT";
            this.btnSisLGT.Size = new System.Drawing.Size(45, 32);
            this.btnSisLGT.TabIndex = 1;
            this.btnSisLGT.Tag = "LGT";
            this.toolTip1.SetToolTip(this.btnSisLGT, "LOGÍSTICO");
            this.btnSisLGT.Values.DropDownArrowColor = System.Drawing.Color.Empty;
            this.btnSisLGT.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnSysLGT;
            this.btnSisLGT.Values.Text = "";
            this.btnSisLGT.Click += new System.EventHandler(this.btnSisLogistico_Click);
            // 
            // btnSisCOM
            // 
            this.btnSisCOM.Enabled = false;
            this.btnSisCOM.Location = new System.Drawing.Point(0, 0);
            this.btnSisCOM.Name = "btnSisCOM";
            this.btnSisCOM.Size = new System.Drawing.Size(45, 32);
            this.btnSisCOM.TabIndex = 0;
            this.btnSisCOM.Tag = "COM";
            this.toolTip1.SetToolTip(this.btnSisCOM, "COMERCIAL");
            this.btnSisCOM.Values.DropDownArrowColor = System.Drawing.Color.Empty;
            this.btnSisCOM.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnSysCOM;
            this.btnSisCOM.Values.Text = "";
            this.btnSisCOM.Click += new System.EventHandler(this.btnSisComercial_Click);
            // 
            // btnSisPER
            // 
            this.btnSisPER.Enabled = false;
            this.btnSisPER.Location = new System.Drawing.Point(88, 0);
            this.btnSisPER.Name = "btnSisPER";
            this.btnSisPER.Size = new System.Drawing.Size(45, 32);
            this.btnSisPER.TabIndex = 2;
            this.btnSisPER.Tag = "PER";
            this.toolTip1.SetToolTip(this.btnSisPER, "TALENTO HUMANO");
            this.btnSisPER.Values.DropDownArrowColor = System.Drawing.Color.Empty;
            this.btnSisPER.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnSysPER;
            this.btnSisPER.Values.Text = "";
            this.btnSisPER.Click += new System.EventHandler(this.btnSisLaboral_Click);
            // 
            // headSistema
            // 
            this.headSistema.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.headSistema.HeaderStylePrimary = Krypton.Toolkit.HeaderStyle.DockInactive;
            this.headSistema.HeaderVisibleSecondary = false;
            this.headSistema.Location = new System.Drawing.Point(1075, 267);
            // 
            // headSistema.Panel
            // 
            this.headSistema.Panel.Controls.Add(this.treeOpcion);
            this.headSistema.Panel.Controls.Add(this.cmbPerfil);
            this.headSistema.Size = new System.Drawing.Size(265, 382);
            this.headSistema.StateCommon.HeaderPrimary.Content.ShortText.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.headSistema.TabIndex = 0;
            this.headSistema.ValuesPrimary.Heading = "SISTEMA SEGURIDAD";
            this.headSistema.ValuesPrimary.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnSysGEN;
            this.headSistema.ValuesSecondary.Heading = "";
            // 
            // cmbPerfil
            // 
            this.cmbPerfil.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.cmbPerfil.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbPerfil.DisplayMember = "nomPerfil";
            this.cmbPerfil.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPerfil.DropDownWidth = 300;
            this.cmbPerfil.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPerfil.FormattingEnabled = true;
            this.cmbPerfil.Location = new System.Drawing.Point(1, 1);
            this.cmbPerfil.Name = "cmbPerfil";
            this.cmbPerfil.Size = new System.Drawing.Size(261, 23);
            this.cmbPerfil.TabIndex = 1;
            this.cmbPerfil.ValueMember = "idPerfil";
            this.cmbPerfil.SelectedIndexChanged += new System.EventHandler(this.cmbPerfil_SelectedIndexChanged);
            // 
            // headUsuario
            // 
            this.headUsuario.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.headUsuario.HeaderStylePrimary = Krypton.Toolkit.HeaderStyle.DockInactive;
            this.headUsuario.HeaderVisibleSecondary = false;
            this.headUsuario.Location = new System.Drawing.Point(1075, 78);
            // 
            // headUsuario.Panel
            // 
            this.headUsuario.Panel.Controls.Add(this.lblTemporizador);
            this.headUsuario.Panel.Controls.Add(this.grpFoto);
            this.headUsuario.Panel.Controls.Add(this.lblFeOper);
            this.headUsuario.Panel.Controls.Add(this.lblHora);
            this.headUsuario.Panel.Controls.Add(this.lblHost);
            this.headUsuario.Panel.Controls.Add(this.lblUsuario);
            this.headUsuario.Size = new System.Drawing.Size(265, 190);
            this.headUsuario.StateNormal.Back.Color1 = System.Drawing.Color.GhostWhite;
            this.headUsuario.TabIndex = 0;
            this.headUsuario.ValuesPrimary.Heading = "BARZOLA OLIVARES, FRANKLIN";
            this.headUsuario.ValuesPrimary.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.icoPerson;
            this.headUsuario.ValuesSecondary.Heading = "";
            // 
            // lblTemporizador
            // 
            this.lblTemporizador.BackColor = System.Drawing.Color.Red;
            this.lblTemporizador.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTemporizador.ForeColor = System.Drawing.Color.White;
            this.lblTemporizador.Location = new System.Drawing.Point(5, 135);
            this.lblTemporizador.Name = "lblTemporizador";
            this.lblTemporizador.Size = new System.Drawing.Size(122, 18);
            this.lblTemporizador.TabIndex = 7;
            this.lblTemporizador.Text = "00:00:00";
            this.lblTemporizador.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.lblTemporizador.Visible = false;
            // 
            // grpFoto
            // 
            this.grpFoto.Location = new System.Drawing.Point(131, 9);
            // 
            // grpFoto.Panel
            // 
            this.grpFoto.Panel.Controls.Add(this.picUser);
            this.grpFoto.Size = new System.Drawing.Size(122, 143);
            this.grpFoto.TabIndex = 0;
            this.grpFoto.Values.Heading = "";
            // 
            // picUser
            // 
            this.picUser.BackColor = System.Drawing.Color.Transparent;
            this.picUser.Dock = System.Windows.Forms.DockStyle.Fill;
            this.picUser.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnSysLAB;
            this.picUser.Location = new System.Drawing.Point(0, 0);
            this.picUser.Name = "picUser";
            this.picUser.Size = new System.Drawing.Size(118, 137);
            this.picUser.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picUser.TabIndex = 0;
            this.picUser.TabStop = false;
            // 
            // lblFeOper
            // 
            this.lblFeOper.BackColor = System.Drawing.Color.Transparent;
            this.lblFeOper.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFeOper.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblFeOper.Location = new System.Drawing.Point(5, 71);
            this.lblFeOper.Name = "lblFeOper";
            this.lblFeOper.Size = new System.Drawing.Size(122, 17);
            this.lblFeOper.TabIndex = 4;
            this.lblFeOper.Text = "01/ENE/1900";
            // 
            // lblHora
            // 
            this.lblHora.BackColor = System.Drawing.Color.Transparent;
            this.lblHora.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHora.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblHora.Location = new System.Drawing.Point(5, 102);
            this.lblHora.Name = "lblHora";
            this.lblHora.Size = new System.Drawing.Size(122, 17);
            this.lblHora.TabIndex = 3;
            this.lblHora.Text = "00:00:00";
            // 
            // lblHost
            // 
            this.lblHost.BackColor = System.Drawing.Color.Transparent;
            this.lblHost.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHost.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblHost.Location = new System.Drawing.Point(5, 40);
            this.lblHost.Name = "lblHost";
            this.lblHost.Size = new System.Drawing.Size(122, 17);
            this.lblHost.TabIndex = 5;
            this.lblHost.Text = "sjbsistemas01";
            // 
            // lblUsuario
            // 
            this.lblUsuario.BackColor = System.Drawing.Color.Transparent;
            this.lblUsuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUsuario.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblUsuario.Location = new System.Drawing.Point(5, 9);
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(122, 17);
            this.lblUsuario.TabIndex = 6;
            this.lblUsuario.Text = "fbarzola";
            // 
            // pnlWork
            // 
            this.pnlWork.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlWork.BackColor = System.Drawing.Color.Black;
            this.pnlWork.Controls.Add(this.ucFondo1);
            this.pnlWork.Location = new System.Drawing.Point(0, 79);
            this.pnlWork.Name = "pnlWork";
            this.pnlWork.Size = new System.Drawing.Size(1075, 600);
            this.pnlWork.TabIndex = 0;
            // 
            // ucFondo1
            // 
            this.ucFondo1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ucFondo1.BackColor = System.Drawing.Color.Honeydew;
            this.ucFondo1.Location = new System.Drawing.Point(0, 0);
            this.ucFondo1.Name = "ucFondo1";
            this.ucFondo1.Size = new System.Drawing.Size(1075, 600);
            this.ucFondo1.TabIndex = 0;
            // 
            // pnlHead
            // 
            this.pnlHead.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlHead.BackColor = System.Drawing.Color.Honeydew;
            this.pnlHead.Controls.Add(this.label1);
            this.pnlHead.Controls.Add(this.picHead2);
            this.pnlHead.Controls.Add(this.picHead1);
            this.pnlHead.Location = new System.Drawing.Point(0, 0);
            this.pnlHead.Name = "pnlHead";
            this.pnlHead.Size = new System.Drawing.Size(1339, 79);
            this.pnlHead.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.DarkGreen;
            this.label1.Location = new System.Drawing.Point(759, 36);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(238, 16);
            this.label1.TabIndex = 8;
            this.label1.Text = "----";
            // 
            // picHead2
            // 
            this.picHead2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.picHead2.BackColor = System.Drawing.Color.Transparent;
            this.picHead2.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.banner2_1000;
            this.picHead2.Location = new System.Drawing.Point(1075, 0);
            this.picHead2.Name = "picHead2";
            this.picHead2.Size = new System.Drawing.Size(264, 79);
            this.picHead2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize;
            this.picHead2.TabIndex = 1;
            this.picHead2.TabStop = false;
            // 
            // picHead1
            // 
            this.picHead1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.picHead1.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.banner1_1000;
            this.picHead1.Location = new System.Drawing.Point(0, 0);
            this.picHead1.Name = "picHead1";
            this.picHead1.Size = new System.Drawing.Size(1339, 79);
            this.picHead1.TabIndex = 0;
            this.picHead1.TabStop = false;
            // 
            // timerSegundos
            // 
            this.timerSegundos.Enabled = true;
            this.timerSegundos.Interval = 1000;
            this.timerSegundos.Tick += new System.EventHandler(this.TimerSegundos_Tick);
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Yellow;
            this.ClientSize = new System.Drawing.Size(1339, 679);
            this.Controls.Add(this.pnlSistema);
            this.Controls.Add(this.headSistema);
            this.Controls.Add(this.headUsuario);
            this.Controls.Add(this.pnlHead);
            this.Controls.Add(this.pnlWork);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MinimumSize = new System.Drawing.Size(1355, 718);
            this.Name = "FrmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "iGEST";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmMain_FormClosing);
            this.Load += new System.EventHandler(this.FrmMain_Load);
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
            ((System.ComponentModel.ISupportInitialize)(this.grpFoto.Panel)).EndInit();
            this.grpFoto.Panel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grpFoto)).EndInit();
            this.grpFoto.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picUser)).EndInit();
            this.pnlWork.ResumeLayout(false);
            this.pnlHead.ResumeLayout(false);
            this.pnlHead.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picHead2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picHead1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        public Krypton.Toolkit.KryptonTreeView treeOpcion;
        private Krypton.Toolkit.KryptonPanel pnlSistema;
        private Krypton.Toolkit.KryptonHeaderGroup headSistema;
        private Krypton.Toolkit.KryptonHeaderGroup headUsuario;
        private System.Windows.Forms.Panel pnlWork;
        private System.Windows.Forms.Panel pnlHead;
        private System.Windows.Forms.Label lblUsuario;
        private System.Windows.Forms.Label lblHost;
        private System.Windows.Forms.Label lblFeOper;
        private System.Windows.Forms.Label lblHora;
        private System.Windows.Forms.Timer timerSegundos;
        private Krypton.Toolkit.KryptonButton btnSisVAR;
        private Krypton.Toolkit.KryptonButton btnSisFIN;
        private Krypton.Toolkit.KryptonButton btnSisLGT;
        private Krypton.Toolkit.KryptonButton btnSisADM;
        private Krypton.Toolkit.KryptonButton btnSisCOM;
        private Krypton.Toolkit.KryptonButton btnSisPER;
        //private Krypton.Toolkit.KryptonContextMenuItems kryptonContextMenuItems6;
        private Krypton.Toolkit.KryptonGroupBox grpFoto;
        private System.Windows.Forms.PictureBox picUser;
        private System.Windows.Forms.ToolTip toolTip1;
        private ComboBoxMy cmbPerfil;
        private System.Windows.Forms.PictureBox picHead1;
        private System.Windows.Forms.Label lblTemporizador;
        private System.Windows.Forms.ImageList imageList1;
        private UcFondo ucFondo1;
        private System.Windows.Forms.PictureBox picHead2;
        private System.Windows.Forms.Label label1;
    }
}