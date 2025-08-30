namespace com.yupanastudio.igest.winapp
{
    partial class FrmLugNac
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmLugNac));
            this.label22 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.cmbPais = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.dtpFeNac = new Krypton.Toolkit.KryptonDateTimePicker();
            this.cmbDpto = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.label5 = new System.Windows.Forms.Label();
            this.cmbProv = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.cmbDist = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.label19 = new System.Windows.Forms.Label();
            this.txtLugNac = new Krypton.Toolkit.KryptonTextBox();
            this.txtEdad = new Krypton.Toolkit.KryptonTextBox();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.txtEdad);
            this.pnlMain.Controls.Add(this.label22);
            this.pnlMain.Controls.Add(this.cmbPais);
            this.pnlMain.Controls.Add(this.dtpFeNac);
            this.pnlMain.Controls.Add(this.cmbDpto);
            this.pnlMain.Controls.Add(this.label5);
            this.pnlMain.Controls.Add(this.label1);
            this.pnlMain.Controls.Add(this.cmbProv);
            this.pnlMain.Controls.Add(this.label4);
            this.pnlMain.Controls.Add(this.cmbDist);
            this.pnlMain.Controls.Add(this.label3);
            this.pnlMain.Controls.Add(this.label19);
            this.pnlMain.Controls.Add(this.label2);
            this.pnlMain.Controls.Add(this.txtLugNac);
            this.pnlMain.Size = new System.Drawing.Size(552, 220);
            this.pnlMain.Controls.SetChildIndex(this.txtLugNac, 0);
            this.pnlMain.Controls.SetChildIndex(this.label2, 0);
            this.pnlMain.Controls.SetChildIndex(this.label19, 0);
            this.pnlMain.Controls.SetChildIndex(this.label3, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbDist, 0);
            this.pnlMain.Controls.SetChildIndex(this.label4, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbProv, 0);
            this.pnlMain.Controls.SetChildIndex(this.label1, 0);
            this.pnlMain.Controls.SetChildIndex(this.label5, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbDpto, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.dtpFeNac, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbPais, 0);
            this.pnlMain.Controls.SetChildIndex(this.label22, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtEdad, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(552, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(150, 20);
            this.lblTitle.Text = "FECHA Y LUGAR NAC.";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 180);
            this.pnlFooter.Size = new System.Drawing.Size(552, 40);
            this.pnlFooter.TabIndex = 7;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(281, 6);
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(161, 6);
            this.toolTip.SetToolTip(this.btnOk, "Establecer \"Fecha y Lugar de Nacimiento\".");
            this.btnOk.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnOk.Values.Image")));
            this.btnOk.Values.Text = "E&stablecer";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(414, 6);
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.BackColor = System.Drawing.Color.Transparent;
            this.label22.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label22.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label22.Location = new System.Drawing.Point(13, 50);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(69, 15);
            this.label22.TabIndex = 50;
            this.label22.Text = "Fecha Nac.";
            this.label22.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(50, 80);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(32, 15);
            this.label1.TabIndex = 55;
            this.label1.Text = "País";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label2.Location = new System.Drawing.Point(273, 80);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(86, 15);
            this.label2.TabIndex = 56;
            this.label2.Text = "Departamento";
            this.label2.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label3.Location = new System.Drawing.Point(25, 110);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(57, 15);
            this.label3.TabIndex = 57;
            this.label3.Text = "Provincia";
            this.label3.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label4.Location = new System.Drawing.Point(313, 110);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(46, 15);
            this.label4.TabIndex = 58;
            this.label4.Text = "Distrito";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbPais
            // 
            this.cmbPais.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbPais.DisplayMember = "nomPais";
            this.cmbPais.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPais.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbPais.FormattingEnabled = true;
            this.cmbPais.Location = new System.Drawing.Point(84, 80);
            this.cmbPais.Name = "cmbPais";
            this.cmbPais.Size = new System.Drawing.Size(180, 21);
            this.cmbPais.TabIndex = 2;
            this.cmbPais.ValueMember = "idPais";
            this.cmbPais.SelectedIndexChanged += new System.EventHandler(this.cmbPais_SelectedIndexChanged);
            // 
            // dtpFeNac
            // 
            this.dtpFeNac.CustomFormat = "ddd, dd \'de\' MMMM \'de\' yyyy";
            this.dtpFeNac.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpFeNac.Location = new System.Drawing.Point(84, 50);
            this.dtpFeNac.MinDate = new System.DateTime(1900, 1, 1, 0, 0, 0, 0);
            this.dtpFeNac.Name = "dtpFeNac";
            this.dtpFeNac.Size = new System.Drawing.Size(180, 21);
            this.dtpFeNac.TabIndex = 0;
            this.dtpFeNac.ValueNullable = new System.DateTime(1900, 1, 1, 0, 0, 0, 0);
            this.dtpFeNac.Leave += new System.EventHandler(this.dtpFeNac_Leave);
            // 
            // cmbDpto
            // 
            this.cmbDpto.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbDpto.DisplayMember = "nomDepartamento";
            this.cmbDpto.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDpto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbDpto.FormattingEnabled = true;
            this.cmbDpto.Location = new System.Drawing.Point(361, 80);
            this.cmbDpto.Name = "cmbDpto";
            this.cmbDpto.Size = new System.Drawing.Size(180, 21);
            this.cmbDpto.TabIndex = 3;
            this.cmbDpto.ValueMember = "idDepartamento";
            this.cmbDpto.SelectedIndexChanged += new System.EventHandler(this.cmbDep_SelectedIndexChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.BackColor = System.Drawing.Color.Transparent;
            this.label5.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label5.Location = new System.Drawing.Point(323, 50);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(36, 15);
            this.label5.TabIndex = 52;
            this.label5.Text = "Edad";
            this.label5.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbProv
            // 
            this.cmbProv.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbProv.DisplayMember = "nomProvincia";
            this.cmbProv.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbProv.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbProv.FormattingEnabled = true;
            this.cmbProv.Location = new System.Drawing.Point(84, 110);
            this.cmbProv.Name = "cmbProv";
            this.cmbProv.Size = new System.Drawing.Size(180, 21);
            this.cmbProv.TabIndex = 4;
            this.cmbProv.ValueMember = "idProvincia";
            this.cmbProv.SelectedIndexChanged += new System.EventHandler(this.cmbProv_SelectedIndexChanged);
            // 
            // cmbDist
            // 
            this.cmbDist.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbDist.DisplayMember = "nomDistrito";
            this.cmbDist.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDist.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbDist.FormattingEnabled = true;
            this.cmbDist.Location = new System.Drawing.Point(361, 110);
            this.cmbDist.Name = "cmbDist";
            this.cmbDist.Size = new System.Drawing.Size(180, 21);
            this.cmbDist.TabIndex = 5;
            this.cmbDist.ValueMember = "idDistrito";
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.BackColor = System.Drawing.Color.Transparent;
            this.label19.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label19.Location = new System.Drawing.Point(7, 140);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(75, 15);
            this.label19.TabIndex = 65;
            this.label19.Text = "Anexo / Obs.";
            this.label19.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtLugNac
            // 
            this.txtLugNac.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtLugNac.Location = new System.Drawing.Point(84, 140);
            this.txtLugNac.MaxLength = 75;
            this.txtLugNac.Name = "txtLugNac";
            this.txtLugNac.Size = new System.Drawing.Size(457, 23);
            this.txtLugNac.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtLugNac.TabIndex = 6;
            // 
            // txtEdad
            // 
            this.txtEdad.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtEdad.Enabled = false;
            this.txtEdad.Location = new System.Drawing.Point(361, 50);
            this.txtEdad.MaxLength = 75;
            this.txtEdad.Name = "txtEdad";
            this.txtEdad.Size = new System.Drawing.Size(180, 23);
            this.txtEdad.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtEdad.TabIndex = 1;
            this.txtEdad.Text = "7 AÑO(S), 1 MES(ES), 5 DÍA(S)";
            this.txtEdad.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // FrmLugNac
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(552, 220);
            this.Name = "FrmLugNac";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmLugNac_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Label label22;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label19;
        private Krypton.Toolkit.KryptonTextBox txtLugNac;
        private Krypton.Toolkit.KryptonDateTimePicker dtpFeNac;
        private System.Windows.Forms.Label label5;
        private ComboBoxMy cmbDist;
        private ComboBoxMy cmbProv;
        private ComboBoxMy cmbDpto;
        private ComboBoxMy cmbPais;
        private Krypton.Toolkit.KryptonTextBox txtEdad;
    }
}