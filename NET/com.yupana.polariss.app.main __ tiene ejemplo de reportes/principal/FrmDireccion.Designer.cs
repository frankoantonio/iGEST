namespace com.yupana.polariss.app.main.principal
{
    partial class FrmDireccion
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmDireccion));
            this.gbx1 = new ComponentFactory.Krypton.Toolkit.KryptonGroupBox();
            this.cmbDist = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.cmbProv = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.cmbDpto = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.cmbPais = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.gbx2 = new ComponentFactory.Krypton.Toolkit.KryptonGroupBox();
            this.label7 = new System.Windows.Forms.Label();
            this.txtRef = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.cmbZona = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtZona = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.cmbVia = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtVia = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1.Panel)).BeginInit();
            this.gbx1.Panel.SuspendLayout();
            this.gbx1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cmbDist)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbProv)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbDpto)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbPais)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx2.Panel)).BeginInit();
            this.gbx2.Panel.SuspendLayout();
            this.gbx2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cmbZona)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbVia)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.gbx2);
            this.pnlMain.Controls.Add(this.gbx1);
            this.pnlMain.Size = new System.Drawing.Size(500, 280);
            this.pnlMain.TabIndex = 0;
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.gbx1, 0);
            this.pnlMain.Controls.SetChildIndex(this.gbx2, 0);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(68, 15);
            this.lblTitle.Text = "Dirección";
            // 
            // imgTitle
            // 
            this.imgTitle.Image = global::com.yupana.polariss.app.main.Properties.Resources.btnMarca;
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 240);
            this.pnlFooter.TabIndex = 2;
            // 
            // btnCancel
            // 
            this.btnCancel.TabIndex = 8;
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.TabIndex = 7;
            this.btnOk.Values.Image = global::com.yupana.polariss.app.main.Properties.Resources.btnAceptar;
            this.btnOk.Values.Text = "&Aceptar";
            this.btnOk.Click += new System.EventHandler(this.BtnOk_Click);
            // 
            // gbx1
            // 
            this.gbx1.GroupBackStyle = ComponentFactory.Krypton.Toolkit.PaletteBackStyle.GridHeaderColumnList;
            this.gbx1.Location = new System.Drawing.Point(10, 35);
            this.gbx1.Name = "gbx1";
            // 
            // gbx1.Panel
            // 
            this.gbx1.Panel.Controls.Add(this.cmbDist);
            this.gbx1.Panel.Controls.Add(this.cmbProv);
            this.gbx1.Panel.Controls.Add(this.cmbDpto);
            this.gbx1.Panel.Controls.Add(this.label6);
            this.gbx1.Panel.Controls.Add(this.cmbPais);
            this.gbx1.Panel.Controls.Add(this.label5);
            this.gbx1.Panel.Controls.Add(this.label4);
            this.gbx1.Panel.Controls.Add(this.label3);
            this.gbx1.Size = new System.Drawing.Size(480, 78);
            this.gbx1.TabIndex = 0;
            this.gbx1.Values.Heading = "";
            // 
            // cmbDist
            // 
            this.cmbDist.DisplayMember = "nomDist";
            this.cmbDist.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDist.DropDownWidth = 121;
            this.cmbDist.Location = new System.Drawing.Point(305, 40);
            this.cmbDist.Name = "cmbDist";
            this.cmbDist.Size = new System.Drawing.Size(160, 21);
            this.cmbDist.TabIndex = 3;
            this.cmbDist.ValueMember = "idDist";
            // 
            // cmbProv
            // 
            this.cmbProv.DisplayMember = "nomProv";
            this.cmbProv.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbProv.DropDownWidth = 121;
            this.cmbProv.Location = new System.Drawing.Point(64, 40);
            this.cmbProv.Name = "cmbProv";
            this.cmbProv.Size = new System.Drawing.Size(160, 21);
            this.cmbProv.TabIndex = 2;
            this.cmbProv.ValueMember = "idProv";
            this.cmbProv.SelectedIndexChanged += new System.EventHandler(this.CmbProv_SelectedIndexChanged);
            // 
            // cmbDpto
            // 
            this.cmbDpto.DisplayMember = "nomDpto";
            this.cmbDpto.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDpto.DropDownWidth = 121;
            this.cmbDpto.Location = new System.Drawing.Point(305, 10);
            this.cmbDpto.Name = "cmbDpto";
            this.cmbDpto.Size = new System.Drawing.Size(160, 21);
            this.cmbDpto.TabIndex = 1;
            this.cmbDpto.ValueMember = "idDpto";
            this.cmbDpto.SelectedIndexChanged += new System.EventHandler(this.CmbDpto_SelectedIndexChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.BackColor = System.Drawing.Color.Transparent;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.Color.Navy;
            this.label6.Location = new System.Drawing.Point(264, 40);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(39, 13);
            this.label6.TabIndex = 20;
            this.label6.Text = "Distrito";
            // 
            // cmbPais
            // 
            this.cmbPais.DisplayMember = "nomPais";
            this.cmbPais.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPais.DropDownWidth = 150;
            this.cmbPais.Location = new System.Drawing.Point(64, 10);
            this.cmbPais.Name = "cmbPais";
            this.cmbPais.Size = new System.Drawing.Size(160, 21);
            this.cmbPais.TabIndex = 0;
            this.cmbPais.ValueMember = "idPais";
            this.cmbPais.SelectedIndexChanged += new System.EventHandler(this.CmbPais_SelectedIndexChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.BackColor = System.Drawing.Color.Transparent;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.Navy;
            this.label5.Location = new System.Drawing.Point(10, 40);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(51, 13);
            this.label5.TabIndex = 18;
            this.label5.Text = "Provincia";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Navy;
            this.label4.Location = new System.Drawing.Point(229, 10);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(74, 13);
            this.label4.TabIndex = 17;
            this.label4.Text = "Departamento";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Navy;
            this.label3.Location = new System.Drawing.Point(34, 10);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(27, 13);
            this.label3.TabIndex = 16;
            this.label3.Text = "Pais";
            // 
            // gbx2
            // 
            this.gbx2.GroupBackStyle = ComponentFactory.Krypton.Toolkit.PaletteBackStyle.GridHeaderColumnList;
            this.gbx2.Location = new System.Drawing.Point(10, 120);
            this.gbx2.Name = "gbx2";
            // 
            // gbx2.Panel
            // 
            this.gbx2.Panel.Controls.Add(this.label7);
            this.gbx2.Panel.Controls.Add(this.txtRef);
            this.gbx2.Panel.Controls.Add(this.cmbZona);
            this.gbx2.Panel.Controls.Add(this.label2);
            this.gbx2.Panel.Controls.Add(this.txtZona);
            this.gbx2.Panel.Controls.Add(this.cmbVia);
            this.gbx2.Panel.Controls.Add(this.label1);
            this.gbx2.Panel.Controls.Add(this.txtVia);
            this.gbx2.Size = new System.Drawing.Size(480, 110);
            this.gbx2.TabIndex = 1;
            this.gbx2.Values.Heading = "";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.BackColor = System.Drawing.Color.Transparent;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.Color.Navy;
            this.label7.Location = new System.Drawing.Point(2, 70);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(59, 13);
            this.label7.TabIndex = 42;
            this.label7.Text = "Referencia";
            // 
            // txtRef
            // 
            this.txtRef.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtRef.Location = new System.Drawing.Point(64, 70);
            this.txtRef.MaxLength = 100;
            this.txtRef.Name = "txtRef";
            this.txtRef.Size = new System.Drawing.Size(401, 23);
            this.txtRef.TabIndex = 4;
            // 
            // cmbZona
            // 
            this.cmbZona.DisplayMember = "nomTipo";
            this.cmbZona.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbZona.DropDownWidth = 175;
            this.cmbZona.Location = new System.Drawing.Point(64, 40);
            this.cmbZona.Name = "cmbZona";
            this.cmbZona.Size = new System.Drawing.Size(120, 21);
            this.cmbZona.TabIndex = 2;
            this.cmbZona.ValueMember = "idTipo";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Navy;
            this.label2.Location = new System.Drawing.Point(29, 40);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(32, 13);
            this.label2.TabIndex = 39;
            this.label2.Text = "Zona";
            // 
            // txtZona
            // 
            this.txtZona.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtZona.Location = new System.Drawing.Point(187, 40);
            this.txtZona.MaxLength = 100;
            this.txtZona.Name = "txtZona";
            this.txtZona.Size = new System.Drawing.Size(278, 23);
            this.txtZona.TabIndex = 3;
            // 
            // cmbVia
            // 
            this.cmbVia.DisplayMember = "nomTipo";
            this.cmbVia.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbVia.DropDownWidth = 175;
            this.cmbVia.Location = new System.Drawing.Point(64, 10);
            this.cmbVia.Name = "cmbVia";
            this.cmbVia.Size = new System.Drawing.Size(120, 21);
            this.cmbVia.TabIndex = 0;
            this.cmbVia.ValueMember = "idTipo";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Navy;
            this.label1.Location = new System.Drawing.Point(37, 10);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(24, 13);
            this.label1.TabIndex = 36;
            this.label1.Text = "Vía";
            // 
            // txtVia
            // 
            this.txtVia.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtVia.Location = new System.Drawing.Point(187, 10);
            this.txtVia.MaxLength = 100;
            this.txtVia.Name = "txtVia";
            this.txtVia.Size = new System.Drawing.Size(278, 23);
            this.txtVia.TabIndex = 1;
            // 
            // FrmDireccion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(500, 280);
            this.Name = "FrmDireccion";
            this.Text = "Dirección";
            this.Load += new System.EventHandler(this.FrmDireccion_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gbx1.Panel)).EndInit();
            this.gbx1.Panel.ResumeLayout(false);
            this.gbx1.Panel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1)).EndInit();
            this.gbx1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.cmbDist)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbProv)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbDpto)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbPais)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx2.Panel)).EndInit();
            this.gbx2.Panel.ResumeLayout(false);
            this.gbx2.Panel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx2)).EndInit();
            this.gbx2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.cmbZona)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbVia)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private ComponentFactory.Krypton.Toolkit.KryptonGroupBox gbx1;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbDist;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbProv;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbDpto;
        private System.Windows.Forms.Label label6;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbPais;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private ComponentFactory.Krypton.Toolkit.KryptonGroupBox gbx2;
        private System.Windows.Forms.Label label7;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtRef;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbZona;
        private System.Windows.Forms.Label label2;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtZona;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbVia;
        private System.Windows.Forms.Label label1;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtVia;
    }
}