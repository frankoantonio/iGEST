namespace com.yupanastudio.polariss.app.principal
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
            this.cmbEmpresa = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.cmbNegocio = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.txtNomUsu = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.imgLoguito = new System.Windows.Forms.PictureBox();
            this.txtPwdUsu = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.lblMsg = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgCnx)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgLogo)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbEmpresa)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbNegocio)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgLoguito)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.label4);
            this.pnlMain.Controls.Add(this.label3);
            this.pnlMain.Controls.Add(this.label2);
            this.pnlMain.Controls.Add(this.label1);
            this.pnlMain.Controls.Add(this.lblMsg);
            this.pnlMain.Controls.Add(this.txtPwdUsu);
            this.pnlMain.Controls.Add(this.txtNomUsu);
            this.pnlMain.Controls.Add(this.cmbNegocio);
            this.pnlMain.Controls.Add(this.cmbEmpresa);
            this.pnlMain.Controls.Add(this.imgLogo);
            this.pnlMain.Controls.Add(this.imgCnx);
            this.pnlMain.Size = new System.Drawing.Size(450, 230);
            this.pnlMain.TabIndex = 0;
            this.pnlMain.Controls.SetChildIndex(this.imgCnx, 0);
            this.pnlMain.Controls.SetChildIndex(this.imgLogo, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbEmpresa, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbNegocio, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtNomUsu, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtPwdUsu, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblMsg, 0);
            this.pnlMain.Controls.SetChildIndex(this.label1, 0);
            this.pnlMain.Controls.SetChildIndex(this.label2, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.label3, 0);
            this.pnlMain.Controls.SetChildIndex(this.label4, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(450, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Location = new System.Drawing.Point(45, 8);
            this.lblTitle.Size = new System.Drawing.Size(148, 15);
            this.lblTitle.TabIndex = 0;
            this.lblTitle.Text = "Validación de Usuario";
            // 
            // imgTitle
            // 
            this.imgTitle.Location = new System.Drawing.Point(10, 3);
            // 
            // pnlFooter
            // 
            this.pnlFooter.Controls.Add(this.imgLoguito);
            this.pnlFooter.Location = new System.Drawing.Point(0, 190);
            this.pnlFooter.Size = new System.Drawing.Size(450, 40);
            this.pnlFooter.TabIndex = 4;
            this.pnlFooter.Controls.SetChildIndex(this.btnOk, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnCancel, 0);
            this.pnlFooter.Controls.SetChildIndex(this.imgLoguito, 0);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(330, 6);
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(210, 6);
            this.btnOk.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnOk.Values.Image")));
            this.btnOk.Values.Text = "&Aceptar";
            this.btnOk.Click += new System.EventHandler(this.BtnOk_Click);
            // 
            // imgCnx
            // 
            this.imgCnx.Image = global::com.yupanastudio.polariss.app.Properties.Resources.connect_ok;
            this.imgCnx.Location = new System.Drawing.Point(420, 166);
            this.imgCnx.Name = "imgCnx";
            this.imgCnx.Size = new System.Drawing.Size(20, 20);
            this.imgCnx.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.imgCnx.TabIndex = 26;
            this.imgCnx.TabStop = false;
            // 
            // imgLogo
            // 
            this.imgLogo.Image = global::com.yupanastudio.polariss.app.Properties.Resources.logo;
            this.imgLogo.Location = new System.Drawing.Point(10, 50);
            this.imgLogo.Name = "imgLogo";
            this.imgLogo.Size = new System.Drawing.Size(150, 110);
            this.imgLogo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.imgLogo.TabIndex = 27;
            this.imgLogo.TabStop = false;
            // 
            // cmbEmpresa
            // 
            this.cmbEmpresa.DisplayMember = "alias";
            this.cmbEmpresa.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbEmpresa.DropDownWidth = 250;
            this.cmbEmpresa.Location = new System.Drawing.Point(240, 50);
            this.cmbEmpresa.Name = "cmbEmpresa";
            this.cmbEmpresa.Size = new System.Drawing.Size(200, 21);
            this.cmbEmpresa.TabIndex = 0;
            this.cmbEmpresa.ValueMember = "idEmpresa";
            this.cmbEmpresa.SelectedIndexChanged += new System.EventHandler(this.CmbEmpresa_SelectedIndexChanged);
            // 
            // cmbNegocio
            // 
            this.cmbNegocio.DisplayMember = "nomNegocio";
            this.cmbNegocio.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbNegocio.DropDownWidth = 250;
            this.cmbNegocio.Location = new System.Drawing.Point(240, 80);
            this.cmbNegocio.Name = "cmbNegocio";
            this.cmbNegocio.Size = new System.Drawing.Size(200, 21);
            this.cmbNegocio.TabIndex = 1;
            this.cmbNegocio.ValueMember = "idNegocio";
            this.cmbNegocio.SelectedIndexChanged += new System.EventHandler(this.CmbNegocio_SelectedIndexChanged);
            // 
            // txtNomUsu
            // 
            this.txtNomUsu.Location = new System.Drawing.Point(240, 110);
            this.txtNomUsu.Name = "txtNomUsu";
            this.txtNomUsu.Size = new System.Drawing.Size(200, 23);
            this.txtNomUsu.TabIndex = 2;
            this.txtNomUsu.Text = "fbarzola";
            this.txtNomUsu.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // imgLoguito
            // 
            this.imgLoguito.Image = global::com.yupanastudio.polariss.app.Properties.Resources.loguito;
            this.imgLoguito.Location = new System.Drawing.Point(10, 5);
            this.imgLoguito.Name = "imgLoguito";
            this.imgLoguito.Size = new System.Drawing.Size(100, 30);
            this.imgLoguito.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.imgLoguito.TabIndex = 37;
            this.imgLoguito.TabStop = false;
            // 
            // txtPwdUsu
            // 
            this.txtPwdUsu.Location = new System.Drawing.Point(240, 140);
            this.txtPwdUsu.Name = "txtPwdUsu";
            this.txtPwdUsu.PasswordChar = '●';
            this.txtPwdUsu.Size = new System.Drawing.Size(200, 23);
            this.txtPwdUsu.TabIndex = 3;
            this.txtPwdUsu.Text = "Gimnasio@123";
            this.txtPwdUsu.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtPwdUsu.UseSystemPasswordChar = true;
            this.txtPwdUsu.WordWrap = false;
            // 
            // lblMsg
            // 
            this.lblMsg.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMsg.ForeColor = System.Drawing.Color.ForestGreen;
            this.lblMsg.Location = new System.Drawing.Point(10, 166);
            this.lblMsg.Name = "lblMsg";
            this.lblMsg.Size = new System.Drawing.Size(404, 20);
            this.lblMsg.TabIndex = 36;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Navy;
            this.label1.Location = new System.Drawing.Point(189, 50);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(48, 13);
            this.label1.TabIndex = 37;
            this.label1.Text = "Empresa";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Navy;
            this.label2.Location = new System.Drawing.Point(190, 80);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(47, 13);
            this.label2.TabIndex = 38;
            this.label2.Text = "Negocio";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Navy;
            this.label3.Location = new System.Drawing.Point(194, 110);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(43, 13);
            this.label3.TabIndex = 39;
            this.label3.Text = "Usuario";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Navy;
            this.label4.Location = new System.Drawing.Point(176, 140);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(61, 13);
            this.label4.TabIndex = 40;
            this.label4.Text = "Contraseña";
            // 
            // FrmLogin
            // 
            this.AcceptButton = this.btnOk;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(450, 230);
            this.Name = "FrmLogin";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FrmLogin";
            this.Load += new System.EventHandler(this.FrmLogin_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgCnx)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgLogo)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbEmpresa)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbNegocio)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgLoguito)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox imgCnx;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtNomUsu;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbNegocio;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbEmpresa;
        private System.Windows.Forms.PictureBox imgLogo;
        private System.Windows.Forms.PictureBox imgLoguito;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblMsg;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtPwdUsu;
    }
}