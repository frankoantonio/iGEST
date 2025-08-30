namespace com.yupanastudio.igest.winapp
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
            this.txtNomVia = new Krypton.Toolkit.KryptonTextBox();
            this.txtNomZona = new Krypton.Toolkit.KryptonTextBox();
            this.txtRef = new Krypton.Toolkit.KryptonTextBox();
            this.txtTipVia = new Krypton.Toolkit.KryptonTextBox();
            this.txtTipZona = new Krypton.Toolkit.KryptonTextBox();
            this.label21 = new System.Windows.Forms.Label();
            this.label22 = new System.Windows.Forms.Label();
            this.label18 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.gbx1 = new Krypton.Toolkit.KryptonGroupBox();
            this.cmbDist = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.cmbDpto = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.cmbProv = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.cmbPais = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.label19 = new System.Windows.Forms.Label();
            this.btnMap = new Krypton.Toolkit.KryptonButton();
            this.txtMap = new Krypton.Toolkit.KryptonTextBox();
            this.label27 = new System.Windows.Forms.Label();
            this.cmbTipZona = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.cmbTipVia = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1.Panel)).BeginInit();
            this.gbx1.Panel.SuspendLayout();
            this.gbx1.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.label27);
            this.pnlMain.Controls.Add(this.cmbTipZona);
            this.pnlMain.Controls.Add(this.cmbTipVia);
            this.pnlMain.Controls.Add(this.gbx1);
            this.pnlMain.Controls.Add(this.label21);
            this.pnlMain.Controls.Add(this.label22);
            this.pnlMain.Controls.Add(this.label18);
            this.pnlMain.Controls.Add(this.txtTipZona);
            this.pnlMain.Controls.Add(this.txtTipVia);
            this.pnlMain.Controls.Add(this.txtRef);
            this.pnlMain.Controls.Add(this.txtNomZona);
            this.pnlMain.Controls.Add(this.txtNomVia);
            this.pnlMain.Size = new System.Drawing.Size(630, 335);
            this.pnlMain.Controls.SetChildIndex(this.txtNomVia, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtNomZona, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtRef, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtTipVia, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtTipZona, 0);
            this.pnlMain.Controls.SetChildIndex(this.label18, 0);
            this.pnlMain.Controls.SetChildIndex(this.label22, 0);
            this.pnlMain.Controls.SetChildIndex(this.label21, 0);
            this.pnlMain.Controls.SetChildIndex(this.gbx1, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbTipVia, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbTipZona, 0);
            this.pnlMain.Controls.SetChildIndex(this.label27, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(630, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(82, 15);
            this.lblTitle.Text = "DIRECCIÓN";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 295);
            this.pnlFooter.Size = new System.Drawing.Size(630, 40);
            this.pnlFooter.TabIndex = 10;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(320, 6);
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(200, 6);
            this.toolTip.SetToolTip(this.btnOk, "Guardar los cambios.");
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_save;
            this.btnOk.Values.Text = "&Guardar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(493, 5);
            // 
            // txtNomVia
            // 
            this.txtNomVia.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtNomVia.Location = new System.Drawing.Point(295, 50);
            this.txtNomVia.MaxLength = 100;
            this.txtNomVia.Name = "txtNomVia";
            this.txtNomVia.Size = new System.Drawing.Size(325, 23);
            this.txtNomVia.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtNomVia.TabIndex = 2;
            // 
            // txtNomZona
            // 
            this.txtNomZona.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtNomZona.Location = new System.Drawing.Point(295, 80);
            this.txtNomZona.MaxLength = 100;
            this.txtNomZona.Name = "txtNomZona";
            this.txtNomZona.Size = new System.Drawing.Size(325, 23);
            this.txtNomZona.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtNomZona.TabIndex = 5;
            // 
            // txtRef
            // 
            this.txtRef.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtRef.Location = new System.Drawing.Point(77, 110);
            this.txtRef.MaxLength = 100;
            this.txtRef.Name = "txtRef";
            this.txtRef.Size = new System.Drawing.Size(543, 23);
            this.txtRef.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtRef.TabIndex = 6;
            // 
            // txtTipVia
            // 
            this.txtTipVia.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtTipVia.Enabled = false;
            this.txtTipVia.Location = new System.Drawing.Point(226, 50);
            this.txtTipVia.Name = "txtTipVia";
            this.txtTipVia.Size = new System.Drawing.Size(70, 23);
            this.txtTipVia.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtTipVia.TabIndex = 1;
            this.txtTipVia.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // txtTipZona
            // 
            this.txtTipZona.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtTipZona.Enabled = false;
            this.txtTipZona.Location = new System.Drawing.Point(226, 80);
            this.txtTipZona.Name = "txtTipZona";
            this.txtTipZona.Size = new System.Drawing.Size(70, 23);
            this.txtTipZona.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtTipZona.TabIndex = 4;
            this.txtTipZona.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.BackColor = System.Drawing.Color.Transparent;
            this.label21.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label21.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label21.Location = new System.Drawing.Point(39, 80);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(35, 15);
            this.label21.TabIndex = 49;
            this.label21.Text = "Zona";
            this.label21.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.BackColor = System.Drawing.Color.Transparent;
            this.label22.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label22.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label22.Location = new System.Drawing.Point(7, 110);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(67, 15);
            this.label22.TabIndex = 50;
            this.label22.Text = "Referencia";
            this.label22.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.BackColor = System.Drawing.Color.Transparent;
            this.label18.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label18.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label18.Location = new System.Drawing.Point(15, 50);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(59, 15);
            this.label18.TabIndex = 53;
            this.label18.Text = "Dirección";
            this.label18.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(56, 15);
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
            this.label2.Location = new System.Drawing.Point(306, 15);
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
            this.label3.Location = new System.Drawing.Point(31, 45);
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
            this.label4.Location = new System.Drawing.Point(346, 45);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(46, 15);
            this.label4.TabIndex = 58;
            this.label4.Text = "Distrito";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // gbx1
            // 
            this.gbx1.CaptionStyle = Krypton.Toolkit.LabelStyle.NormalControl;
            this.gbx1.Location = new System.Drawing.Point(10, 165);
            this.gbx1.Name = "gbx1";
            // 
            // gbx1.Panel
            // 
            this.gbx1.Panel.Controls.Add(this.cmbDist);
            this.gbx1.Panel.Controls.Add(this.cmbDpto);
            this.gbx1.Panel.Controls.Add(this.cmbProv);
            this.gbx1.Panel.Controls.Add(this.cmbPais);
            this.gbx1.Panel.Controls.Add(this.label19);
            this.gbx1.Panel.Controls.Add(this.btnMap);
            this.gbx1.Panel.Controls.Add(this.txtMap);
            this.gbx1.Panel.Controls.Add(this.label1);
            this.gbx1.Panel.Controls.Add(this.label2);
            this.gbx1.Panel.Controls.Add(this.label3);
            this.gbx1.Panel.Controls.Add(this.label4);
            this.gbx1.Size = new System.Drawing.Size(610, 115);
            this.gbx1.StateCommon.Back.Color1 = System.Drawing.Color.PaleTurquoise;
            this.gbx1.StateCommon.Content.ShortText.Color1 = System.Drawing.Color.Black;
            this.gbx1.StateCommon.Content.ShortText.Font = new System.Drawing.Font("Arial", 10F);
            this.gbx1.TabIndex = 7;
            this.gbx1.Values.Heading = "";
            // 
            // cmbDist
            // 
            this.cmbDist.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbDist.DisplayMember = "nomDistrito";
            this.cmbDist.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDist.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbDist.FormattingEnabled = true;
            this.cmbDist.Location = new System.Drawing.Point(395, 45);
            this.cmbDist.Name = "cmbDist";
            this.cmbDist.Size = new System.Drawing.Size(200, 21);
            this.cmbDist.TabIndex = 3;
            this.cmbDist.ValueMember = "idDistrito";
            this.cmbDist.SelectedIndexChanged += new System.EventHandler(this.cmbDist_SelectedIndexChanged);
            // 
            // cmbDpto
            // 
            this.cmbDpto.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbDpto.DisplayMember = "nomDepartamento";
            this.cmbDpto.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDpto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbDpto.FormattingEnabled = true;
            this.cmbDpto.Location = new System.Drawing.Point(395, 15);
            this.cmbDpto.Name = "cmbDpto";
            this.cmbDpto.Size = new System.Drawing.Size(200, 21);
            this.cmbDpto.TabIndex = 1;
            this.cmbDpto.ValueMember = "idDepartamento";
            this.cmbDpto.SelectedIndexChanged += new System.EventHandler(this.cmbDep_SelectedIndexChanged);
            // 
            // cmbProv
            // 
            this.cmbProv.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbProv.DisplayMember = "nomProvincia";
            this.cmbProv.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbProv.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbProv.FormattingEnabled = true;
            this.cmbProv.Location = new System.Drawing.Point(90, 45);
            this.cmbProv.Name = "cmbProv";
            this.cmbProv.Size = new System.Drawing.Size(200, 21);
            this.cmbProv.TabIndex = 2;
            this.cmbProv.ValueMember = "idProvincia";
            this.cmbProv.SelectedIndexChanged += new System.EventHandler(this.cmbProv_SelectedIndexChanged);
            // 
            // cmbPais
            // 
            this.cmbPais.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbPais.DisplayMember = "nomPais";
            this.cmbPais.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPais.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbPais.FormattingEnabled = true;
            this.cmbPais.Location = new System.Drawing.Point(90, 15);
            this.cmbPais.Name = "cmbPais";
            this.cmbPais.Size = new System.Drawing.Size(200, 21);
            this.cmbPais.TabIndex = 0;
            this.cmbPais.ValueMember = "idPais";
            this.cmbPais.SelectedIndexChanged += new System.EventHandler(this.cmbPais_SelectedIndexChanged);
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.BackColor = System.Drawing.Color.Transparent;
            this.label19.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label19.Location = new System.Drawing.Point(5, 75);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(83, 15);
            this.label19.TabIndex = 65;
            this.label19.Text = "Coordenadas";
            this.label19.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // btnMap
            // 
            this.btnMap.Location = new System.Drawing.Point(565, 75);
            this.btnMap.Name = "btnMap";
            this.btnMap.Size = new System.Drawing.Size(30, 22);
            this.btnMap.TabIndex = 5;
            this.toolTip.SetToolTip(this.btnMap, "Coordenadas en Google Maps.");
            this.btnMap.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_load;
            this.btnMap.Values.Text = "";
            this.btnMap.Click += new System.EventHandler(this.btnMap_Click);
            // 
            // txtMap
            // 
            this.txtMap.Enabled = false;
            this.txtMap.Location = new System.Drawing.Point(90, 75);
            this.txtMap.MaxLength = 250;
            this.txtMap.Name = "txtMap";
            this.txtMap.ReadOnly = true;
            this.txtMap.Size = new System.Drawing.Size(474, 23);
            this.txtMap.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtMap.TabIndex = 4;
            // 
            // label27
            // 
            this.label27.AutoSize = true;
            this.label27.BackColor = System.Drawing.Color.Transparent;
            this.label27.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label27.Location = new System.Drawing.Point(7, 145);
            this.label27.Name = "label27";
            this.label27.Size = new System.Drawing.Size(130, 16);
            this.label27.TabIndex = 96;
            this.label27.Text = "Ubicación Geográfica";
            this.label27.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbTipZona
            // 
            this.cmbTipZona.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbTipZona.DisplayMember = "nomTipo";
            this.cmbTipZona.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTipZona.DropDownWidth = 160;
            this.cmbTipZona.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbTipZona.FormattingEnabled = true;
            this.cmbTipZona.Location = new System.Drawing.Point(77, 80);
            this.cmbTipZona.Name = "cmbTipZona";
            this.cmbTipZona.Size = new System.Drawing.Size(140, 21);
            this.cmbTipZona.TabIndex = 3;
            this.cmbTipZona.ValueMember = "idTipo";
            this.cmbTipZona.SelectedIndexChanged += new System.EventHandler(this.cmbTipZona_SelectedIndexChanged);
            // 
            // cmbTipVia
            // 
            this.cmbTipVia.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbTipVia.DisplayMember = "nomTipo";
            this.cmbTipVia.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTipVia.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbTipVia.FormattingEnabled = true;
            this.cmbTipVia.Location = new System.Drawing.Point(77, 50);
            this.cmbTipVia.Name = "cmbTipVia";
            this.cmbTipVia.Size = new System.Drawing.Size(140, 21);
            this.cmbTipVia.TabIndex = 0;
            this.cmbTipVia.ValueMember = "idTipo";
            this.cmbTipVia.SelectedIndexChanged += new System.EventHandler(this.cmbTipVia_SelectedIndexChanged);
            // 
            // FrmDireccion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(630, 335);
            this.Name = "FrmDireccion";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmDireccion_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gbx1.Panel)).EndInit();
            this.gbx1.Panel.ResumeLayout(false);
            this.gbx1.Panel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1)).EndInit();
            this.gbx1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private Krypton.Toolkit.KryptonTextBox txtNomVia;
        private Krypton.Toolkit.KryptonTextBox txtRef;
        private Krypton.Toolkit.KryptonTextBox txtNomZona;
        private Krypton.Toolkit.KryptonTextBox txtTipZona;
        private Krypton.Toolkit.KryptonTextBox txtTipVia;
        private System.Windows.Forms.Label label21;
        private System.Windows.Forms.Label label22;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private Krypton.Toolkit.KryptonGroupBox gbx1;
        private System.Windows.Forms.Label label19;
        private Krypton.Toolkit.KryptonButton btnMap;
        private Krypton.Toolkit.KryptonTextBox txtMap;
        private ComboBoxMy cmbTipZona;
        private ComboBoxMy cmbTipVia;
        private ComboBoxMy cmbProv;
        private ComboBoxMy cmbPais;
        private ComboBoxMy cmbDist;
        private ComboBoxMy cmbDpto;
        private System.Windows.Forms.Label label27;
    }
}