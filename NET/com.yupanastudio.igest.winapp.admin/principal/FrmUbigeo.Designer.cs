namespace com.yupanastudio.igest.winapp
{
    partial class FrmUbigeo
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmUbigeo));
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.cmbDist = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.cmbProv = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.cmbDpto = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.cmbPais = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.cmbPais);
            this.pnlMain.Controls.Add(this.cmbDpto);
            this.pnlMain.Controls.Add(this.cmbProv);
            this.pnlMain.Controls.Add(this.cmbDist);
            this.pnlMain.Controls.Add(this.label4);
            this.pnlMain.Controls.Add(this.label2);
            this.pnlMain.Controls.Add(this.label1);
            this.pnlMain.Controls.Add(this.label3);
            this.pnlMain.Controls.Add(this.pictureBox1);
            this.pnlMain.Size = new System.Drawing.Size(460, 220);
            this.pnlMain.Controls.SetChildIndex(this.pictureBox1, 0);
            this.pnlMain.Controls.SetChildIndex(this.label3, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.label1, 0);
            this.pnlMain.Controls.SetChildIndex(this.label2, 0);
            this.pnlMain.Controls.SetChildIndex(this.label4, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbDist, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbProv, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbDpto, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbPais, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(460, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(200, 20);
            this.lblTitle.Text = "UBICACIÓN GEOGRÁFICA";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 180);
            this.pnlFooter.Size = new System.Drawing.Size(460, 40);
            this.pnlFooter.TabIndex = 4;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(235, 6);
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(115, 6);
            this.toolTip.SetToolTip(this.btnOk, "Seleccionar \"Distrito\"");
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnAceptar;
            this.btnOk.Values.Text = "&Seleccionar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(320, 6);
            this.lblOper.Text = "Seleccione distrito";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.globe;
            this.pictureBox1.Location = new System.Drawing.Point(325, 46);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(120, 120);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 11;
            this.pictureBox1.TabStop = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label3.Location = new System.Drawing.Point(61, 50);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(32, 15);
            this.label3.TabIndex = 59;
            this.label3.Text = "Pais";
            this.label3.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(7, 80);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(86, 15);
            this.label1.TabIndex = 60;
            this.label1.Text = "Departamento";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label2.Location = new System.Drawing.Point(36, 110);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(57, 15);
            this.label2.TabIndex = 61;
            this.label2.Text = "Provincia";
            this.label2.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label4.Location = new System.Drawing.Point(47, 140);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(46, 15);
            this.label4.TabIndex = 62;
            this.label4.Text = "Distrito";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbDist
            // 
            this.cmbDist.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbDist.DisplayMember = "nomDistrito";
            this.cmbDist.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDist.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbDist.FormattingEnabled = true;
            this.cmbDist.Location = new System.Drawing.Point(97, 140);
            this.cmbDist.Name = "cmbDist";
            this.cmbDist.Size = new System.Drawing.Size(210, 21);
            this.cmbDist.TabIndex = 3;
            this.cmbDist.ValueMember = "idDistrito";
            // 
            // cmbProv
            // 
            this.cmbProv.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbProv.DisplayMember = "nomProvincia";
            this.cmbProv.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbProv.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbProv.FormattingEnabled = true;
            this.cmbProv.Location = new System.Drawing.Point(97, 110);
            this.cmbProv.Name = "cmbProv";
            this.cmbProv.Size = new System.Drawing.Size(210, 21);
            this.cmbProv.TabIndex = 2;
            this.cmbProv.ValueMember = "idProvincia";
            this.cmbProv.SelectedIndexChanged += new System.EventHandler(this.cmbProv_SelectedIndexChanged);
            // 
            // cmbDpto
            // 
            this.cmbDpto.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbDpto.DisplayMember = "nomDepartamento";
            this.cmbDpto.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDpto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbDpto.FormattingEnabled = true;
            this.cmbDpto.Location = new System.Drawing.Point(97, 80);
            this.cmbDpto.Name = "cmbDpto";
            this.cmbDpto.Size = new System.Drawing.Size(210, 21);
            this.cmbDpto.TabIndex = 1;
            this.cmbDpto.ValueMember = "idDepartamento";
            this.cmbDpto.SelectedIndexChanged += new System.EventHandler(this.cmbDpto_SelectedIndexChanged);
            // 
            // cmbPais
            // 
            this.cmbPais.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbPais.DisplayMember = "nomPais";
            this.cmbPais.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPais.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbPais.FormattingEnabled = true;
            this.cmbPais.Location = new System.Drawing.Point(97, 50);
            this.cmbPais.Name = "cmbPais";
            this.cmbPais.Size = new System.Drawing.Size(210, 21);
            this.cmbPais.TabIndex = 0;
            this.cmbPais.ValueMember = "idPais";
            this.cmbPais.SelectedIndexChanged += new System.EventHandler(this.cmbPais_SelectedIndexChanged);
            // 
            // FrmUbigeo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(460, 220);
            this.Name = "FrmUbigeo";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmUbigeo_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private ComboBoxMy cmbDist;
        private ComboBoxMy cmbProv;
        private ComboBoxMy cmbPais;
        private ComboBoxMy cmbDpto;
    }
}