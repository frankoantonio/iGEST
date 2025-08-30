namespace com.yupanastudio.igest.winapp
{
    partial class FrmLogin
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmLogin));
            this.imgCnx = new System.Windows.Forms.PictureBox();
            this.imgLogo = new System.Windows.Forms.PictureBox();
            this.txtNomUsu = new Krypton.Toolkit.KryptonTextBox();
            this.txtPwdUsu = new Krypton.Toolkit.KryptonTextBox();
            this.lblMsg = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.cmbEmpresa = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgCnx)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgLogo)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.cmbEmpresa);
            this.pnlMain.Controls.Add(this.label4);
            this.pnlMain.Controls.Add(this.label3);
            this.pnlMain.Controls.Add(this.label1);
            this.pnlMain.Controls.Add(this.lblMsg);
            this.pnlMain.Controls.Add(this.txtPwdUsu);
            this.pnlMain.Controls.Add(this.txtNomUsu);
            this.pnlMain.Controls.Add(this.imgLogo);
            this.pnlMain.Controls.Add(this.imgCnx);
            this.pnlMain.Size = new System.Drawing.Size(500, 270);
            this.pnlMain.Controls.SetChildIndex(this.imgCnx, 0);
            this.pnlMain.Controls.SetChildIndex(this.imgLogo, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtNomUsu, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtPwdUsu, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblMsg, 0);
            this.pnlMain.Controls.SetChildIndex(this.label1, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.label3, 0);
            this.pnlMain.Controls.SetChildIndex(this.label4, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbEmpresa, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(500, 40);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(140, 19);
            this.lblTitle.Text = "VALIDAR USUARIO";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 230);
            this.pnlFooter.Size = new System.Drawing.Size(500, 40);
            this.pnlFooter.TabIndex = 3;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(255, 6);
            this.btnCancel.StateNormal.Content.ShortText.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación");
            this.btnCancel.Values.DropDownArrowColor = System.Drawing.Color.Empty;
            this.btnCancel.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_cancel;
            this.btnCancel.Values.Text = "&Salir";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(135, 6);
            this.btnOk.StateNormal.Content.ShortText.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.toolTip.SetToolTip(this.btnOk, "Ingresar");
            this.btnOk.Values.DropDownArrowColor = System.Drawing.Color.Empty;
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_ok;
            this.btnOk.Values.Text = "&Ingresar";
            this.btnOk.Click += new System.EventHandler(this.BtnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(463, 5);
            this.lblOper.Visible = false;
            // 
            // lblSubTitle
            // 
            this.lblSubTitle.Location = new System.Drawing.Point(338, 6);
            this.lblSubTitle.Visible = false;
            // 
            // imgCnx
            // 
            this.imgCnx.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.connect_ok;
            this.imgCnx.Location = new System.Drawing.Point(277, 190);
            this.imgCnx.Name = "imgCnx";
            this.imgCnx.Size = new System.Drawing.Size(20, 20);
            this.imgCnx.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.imgCnx.TabIndex = 26;
            this.imgCnx.TabStop = false;
            // 
            // imgLogo
            // 
            this.imgLogo.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.logo_1000;
            this.imgLogo.Location = new System.Drawing.Point(15, 60);
            this.imgLogo.Name = "imgLogo";
            this.imgLogo.Size = new System.Drawing.Size(200, 150);
            this.imgLogo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize;
            this.imgLogo.TabIndex = 27;
            this.imgLogo.TabStop = false;
            // 
            // txtNomUsu
            // 
            this.txtNomUsu.Location = new System.Drawing.Point(305, 100);
            this.txtNomUsu.MaxLength = 50;
            this.txtNomUsu.Name = "txtNomUsu";
            this.txtNomUsu.Size = new System.Drawing.Size(180, 24);
            this.txtNomUsu.StateCommon.Content.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNomUsu.TabIndex = 1;
            this.txtNomUsu.Text = "fbarzola";
            this.txtNomUsu.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtPwdUsu
            // 
            this.txtPwdUsu.Location = new System.Drawing.Point(305, 140);
            this.txtPwdUsu.MaxLength = 50;
            this.txtPwdUsu.Name = "txtPwdUsu";
            this.txtPwdUsu.PasswordChar = '●';
            this.txtPwdUsu.Size = new System.Drawing.Size(180, 24);
            this.txtPwdUsu.StateCommon.Content.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPwdUsu.TabIndex = 2;
            this.txtPwdUsu.Text = "Valores@123";
            this.txtPwdUsu.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtPwdUsu.UseSystemPasswordChar = true;
            this.txtPwdUsu.WordWrap = false;
            // 
            // lblMsg
            // 
            this.lblMsg.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMsg.ForeColor = System.Drawing.Color.Green;
            this.lblMsg.Location = new System.Drawing.Point(302, 181);
            this.lblMsg.Name = "lblMsg";
            this.lblMsg.Size = new System.Drawing.Size(183, 37);
            this.lblMsg.TabIndex = 5;
            this.lblMsg.Text = "Servidor activo, listo para establecer conexión!";
            this.lblMsg.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.DarkSlateBlue;
            this.label1.Location = new System.Drawing.Point(238, 60);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(64, 17);
            this.label1.TabIndex = 37;
            this.label1.Text = "Empresa";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.DarkSlateBlue;
            this.label3.Location = new System.Drawing.Point(245, 100);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(57, 17);
            this.label3.TabIndex = 39;
            this.label3.Text = "Usuario";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.DarkSlateBlue;
            this.label4.Location = new System.Drawing.Point(221, 140);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(81, 17);
            this.label4.TabIndex = 40;
            this.label4.Text = "Contraseña";
            // 
            // cmbEmpresa
            // 
            this.cmbEmpresa.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbEmpresa.DisplayMember = "nomComercial";
            this.cmbEmpresa.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbEmpresa.DropDownWidth = 300;
            this.cmbEmpresa.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbEmpresa.FormattingEnabled = true;
            this.cmbEmpresa.Location = new System.Drawing.Point(305, 60);
            this.cmbEmpresa.Name = "cmbEmpresa";
            this.cmbEmpresa.Size = new System.Drawing.Size(180, 24);
            this.cmbEmpresa.TabIndex = 0;
            this.cmbEmpresa.ValueMember = "idEmpresa";
            this.cmbEmpresa.SelectedIndexChanged += new System.EventHandler(this.CmbEmpresa_SelectedIndexChanged);
            // 
            // FrmLogin
            // 
            this.AcceptButton = this.btnOk;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(500, 270);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmLogin";
            this.ShowInTaskbar = true;
            this.Text = "FrmLogin";
            this.Load += new System.EventHandler(this.FrmLogin_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgCnx)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgLogo)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox imgCnx;
        private Krypton.Toolkit.KryptonTextBox txtNomUsu;
        private System.Windows.Forms.PictureBox imgLogo;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblMsg;
        private Krypton.Toolkit.KryptonTextBox txtPwdUsu;
        private ComboBoxMy cmbEmpresa;
    }
}