namespace com.yupana.polariss.app.main.comercial
{
    partial class FrmSetUsuario
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmSetUsuario));
            this.cmbCaja = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.lblNomRazSoc = new System.Windows.Forms.Label();
            this.cmbPtVta = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.label16 = new System.Windows.Forms.Label();
            this.lblPaterno = new System.Windows.Forms.Label();
            this.cmbSerie = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.cmbLocal = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.label20 = new System.Windows.Forms.Label();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cmbCaja)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbPtVta)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbSerie)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbLocal)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.cmbCaja);
            this.pnlMain.Controls.Add(this.lblNomRazSoc);
            this.pnlMain.Controls.Add(this.cmbPtVta);
            this.pnlMain.Controls.Add(this.label16);
            this.pnlMain.Controls.Add(this.label20);
            this.pnlMain.Controls.Add(this.lblPaterno);
            this.pnlMain.Controls.Add(this.cmbLocal);
            this.pnlMain.Controls.Add(this.cmbSerie);
            this.pnlMain.Size = new System.Drawing.Size(340, 210);
            this.pnlMain.TabIndex = 0;
            this.pnlMain.Controls.SetChildIndex(this.cmbSerie, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbLocal, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblPaterno, 0);
            this.pnlMain.Controls.SetChildIndex(this.label20, 0);
            this.pnlMain.Controls.SetChildIndex(this.label16, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbPtVta, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblNomRazSoc, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbCaja, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(340, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(186, 15);
            this.lblTitle.Text = "Local | Pt. Vta. | Caja | Serie";
            // 
            // imgTitle
            // 
            this.imgTitle.Image = global::com.yupana.polariss.app.main.Properties.Resources.imgPersona;
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 170);
            this.pnlFooter.Size = new System.Drawing.Size(340, 40);
            this.pnlFooter.TabIndex = 4;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(278, 6);
            this.btnCancel.Size = new System.Drawing.Size(29, 28);
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            this.btnCancel.Visible = false;
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(115, 6);
            this.btnOk.Values.Image = global::com.yupana.polariss.app.main.Properties.Resources.btnAceptar;
            this.btnOk.Values.Text = "&Establecer";
            this.btnOk.Click += new System.EventHandler(this.BtnOk_Click);
            // 
            // cmbCaja
            // 
            this.cmbCaja.DisplayMember = "nomAreaFunc";
            this.cmbCaja.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCaja.DropDownWidth = 121;
            this.cmbCaja.Location = new System.Drawing.Point(117, 105);
            this.cmbCaja.Name = "cmbCaja";
            this.cmbCaja.Size = new System.Drawing.Size(190, 21);
            this.cmbCaja.TabIndex = 2;
            this.cmbCaja.ValueMember = "idAreaFunc";
            // 
            // lblNomRazSoc
            // 
            this.lblNomRazSoc.AutoSize = true;
            this.lblNomRazSoc.BackColor = System.Drawing.Color.Transparent;
            this.lblNomRazSoc.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNomRazSoc.ForeColor = System.Drawing.Color.Navy;
            this.lblNomRazSoc.Location = new System.Drawing.Point(86, 105);
            this.lblNomRazSoc.Name = "lblNomRazSoc";
            this.lblNomRazSoc.Size = new System.Drawing.Size(28, 13);
            this.lblNomRazSoc.TabIndex = 110;
            this.lblNomRazSoc.Text = "Caja";
            this.lblNomRazSoc.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbPtVta
            // 
            this.cmbPtVta.DisplayMember = "nomAreaFunc";
            this.cmbPtVta.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPtVta.DropDownWidth = 121;
            this.cmbPtVta.Location = new System.Drawing.Point(117, 75);
            this.cmbPtVta.Name = "cmbPtVta";
            this.cmbPtVta.Size = new System.Drawing.Size(190, 21);
            this.cmbPtVta.TabIndex = 1;
            this.cmbPtVta.ValueMember = "idAreaFunc";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.BackColor = System.Drawing.Color.Transparent;
            this.label16.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.ForeColor = System.Drawing.Color.Navy;
            this.label16.Location = new System.Drawing.Point(33, 75);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(81, 13);
            this.label16.TabIndex = 109;
            this.label16.Text = "Punto de Venta";
            // 
            // lblPaterno
            // 
            this.lblPaterno.AutoSize = true;
            this.lblPaterno.BackColor = System.Drawing.Color.Transparent;
            this.lblPaterno.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPaterno.ForeColor = System.Drawing.Color.Navy;
            this.lblPaterno.Location = new System.Drawing.Point(83, 135);
            this.lblPaterno.Name = "lblPaterno";
            this.lblPaterno.Size = new System.Drawing.Size(31, 13);
            this.lblPaterno.TabIndex = 108;
            this.lblPaterno.Text = "Serie";
            // 
            // cmbSerie
            // 
            this.cmbSerie.DisplayMember = "nomAreaFunc";
            this.cmbSerie.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSerie.DropDownWidth = 121;
            this.cmbSerie.Location = new System.Drawing.Point(117, 135);
            this.cmbSerie.Name = "cmbSerie";
            this.cmbSerie.Size = new System.Drawing.Size(190, 21);
            this.cmbSerie.TabIndex = 3;
            this.cmbSerie.ValueMember = "idAreaFunc";
            // 
            // cmbLocal
            // 
            this.cmbLocal.DisplayMember = "nomLocal";
            this.cmbLocal.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbLocal.DropDownWidth = 175;
            this.cmbLocal.Location = new System.Drawing.Point(117, 45);
            this.cmbLocal.Name = "cmbLocal";
            this.cmbLocal.Size = new System.Drawing.Size(190, 21);
            this.cmbLocal.TabIndex = 0;
            this.cmbLocal.ValueMember = "idLocal";
            this.cmbLocal.SelectedIndexChanged += new System.EventHandler(this.CmbLocal_SelectedIndexChanged);
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.BackColor = System.Drawing.Color.Transparent;
            this.label20.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label20.ForeColor = System.Drawing.Color.Navy;
            this.label20.Location = new System.Drawing.Point(81, 45);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(33, 13);
            this.label20.TabIndex = 107;
            this.label20.Text = "Local";
            // 
            // FrmSetUsuario
            // 
            this.AcceptButton = this.btnOk;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(340, 210);
            this.Name = "FrmSetUsuario";
            this.Text = "Areas de usuario";
            this.Load += new System.EventHandler(this.FrmSetUsuario_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.cmbCaja)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbPtVta)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbSerie)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbLocal)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbCaja;
        private System.Windows.Forms.Label lblNomRazSoc;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbPtVta;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label20;
        private System.Windows.Forms.Label lblPaterno;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbLocal;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbSerie;
    }
}