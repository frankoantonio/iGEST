namespace com.yupana.polariss.app.main.comercial
{
    partial class FrmCliente
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmCliente));
            this.gbx1 = new ComponentFactory.Krypton.Toolkit.KryptonGroupBox();
            this.chbVal = new ComponentFactory.Krypton.Toolkit.KryptonCheckBox();
            this.btnDireccion = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.txtObs = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtDireccion = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.lblRUC = new System.Windows.Forms.Label();
            this.txtRUC = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.txtMovil = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.txtCorreo = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.txtFijo = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtSigla = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.lblNomRazSoc = new System.Windows.Forms.Label();
            this.txtNombres = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.lblMaterno = new System.Windows.Forms.Label();
            this.txtMaterno = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.cmbTiDocIdent = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.label16 = new System.Windows.Forms.Label();
            this.lblPaterno = new System.Windows.Forms.Label();
            this.label18 = new System.Windows.Forms.Label();
            this.cmbTiGenero = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.cmbTiPersona = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.txtPaterno = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.txtNumDoc = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.label19 = new System.Windows.Forms.Label();
            this.label20 = new System.Windows.Forms.Label();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1.Panel)).BeginInit();
            this.gbx1.Panel.SuspendLayout();
            this.gbx1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cmbTiDocIdent)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbTiGenero)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbTiPersona)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.gbx1);
            this.pnlMain.Size = new System.Drawing.Size(620, 428);
            this.pnlMain.TabIndex = 0;
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.gbx1, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(620, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(115, 15);
            this.lblTitle.Text = "Datos del cliente";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 388);
            this.pnlFooter.Size = new System.Drawing.Size(620, 40);
            this.pnlFooter.TabIndex = 1;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(315, 6);
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(195, 6);
            this.btnOk.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_save;
            this.btnOk.Values.Text = "&Guardar";
            this.btnOk.Click += new System.EventHandler(this.BtnOk_Click);
            // 
            // gbx1
            // 
            this.gbx1.GroupBackStyle = ComponentFactory.Krypton.Toolkit.PaletteBackStyle.GridHeaderColumnList;
            this.gbx1.Location = new System.Drawing.Point(10, 40);
            this.gbx1.Name = "gbx1";
            // 
            // gbx1.Panel
            // 
            this.gbx1.Panel.Controls.Add(this.chbVal);
            this.gbx1.Panel.Controls.Add(this.btnDireccion);
            this.gbx1.Panel.Controls.Add(this.txtObs);
            this.gbx1.Panel.Controls.Add(this.label5);
            this.gbx1.Panel.Controls.Add(this.label3);
            this.gbx1.Panel.Controls.Add(this.txtDireccion);
            this.gbx1.Panel.Controls.Add(this.lblRUC);
            this.gbx1.Panel.Controls.Add(this.txtRUC);
            this.gbx1.Panel.Controls.Add(this.label13);
            this.gbx1.Panel.Controls.Add(this.txtMovil);
            this.gbx1.Panel.Controls.Add(this.label12);
            this.gbx1.Panel.Controls.Add(this.txtCorreo);
            this.gbx1.Panel.Controls.Add(this.label11);
            this.gbx1.Panel.Controls.Add(this.txtFijo);
            this.gbx1.Panel.Controls.Add(this.label10);
            this.gbx1.Panel.Controls.Add(this.txtSigla);
            this.gbx1.Panel.Controls.Add(this.lblNomRazSoc);
            this.gbx1.Panel.Controls.Add(this.txtNombres);
            this.gbx1.Panel.Controls.Add(this.lblMaterno);
            this.gbx1.Panel.Controls.Add(this.txtMaterno);
            this.gbx1.Panel.Controls.Add(this.cmbTiDocIdent);
            this.gbx1.Panel.Controls.Add(this.label16);
            this.gbx1.Panel.Controls.Add(this.lblPaterno);
            this.gbx1.Panel.Controls.Add(this.label18);
            this.gbx1.Panel.Controls.Add(this.cmbTiGenero);
            this.gbx1.Panel.Controls.Add(this.cmbTiPersona);
            this.gbx1.Panel.Controls.Add(this.txtPaterno);
            this.gbx1.Panel.Controls.Add(this.txtNumDoc);
            this.gbx1.Panel.Controls.Add(this.label19);
            this.gbx1.Panel.Controls.Add(this.label20);
            this.gbx1.Size = new System.Drawing.Size(600, 340);
            this.gbx1.TabIndex = 0;
            this.gbx1.Values.Heading = "";
            // 
            // chbVal
            // 
            this.chbVal.Enabled = false;
            this.chbVal.Location = new System.Drawing.Point(117, 309);
            this.chbVal.Name = "chbVal";
            this.chbVal.Size = new System.Drawing.Size(316, 20);
            this.chbVal.StateDisabled.LongText.Color1 = System.Drawing.Color.Navy;
            this.chbVal.StateDisabled.LongText.Color2 = System.Drawing.Color.Navy;
            this.chbVal.StateDisabled.ShortText.Color1 = System.Drawing.Color.Navy;
            this.chbVal.StateDisabled.ShortText.Color2 = System.Drawing.Color.Navy;
            this.chbVal.TabIndex = 115;
            this.chbVal.Values.Text = "Datos validados. Solo puede cambiar algunos valores.";
            this.chbVal.Visible = false;
            // 
            // btnDireccion
            // 
            this.btnDireccion.Location = new System.Drawing.Point(555, 250);
            this.btnDireccion.Name = "btnDireccion";
            this.btnDireccion.Size = new System.Drawing.Size(30, 25);
            this.btnDireccion.TabIndex = 14;
            this.btnDireccion.Values.Text = "...";
            this.btnDireccion.Click += new System.EventHandler(this.BtnDireccion_Click);
            // 
            // txtObs
            // 
            this.txtObs.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtObs.Location = new System.Drawing.Point(117, 280);
            this.txtObs.MaxLength = 100;
            this.txtObs.Name = "txtObs";
            this.txtObs.Size = new System.Drawing.Size(468, 23);
            this.txtObs.TabIndex = 15;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.BackColor = System.Drawing.Color.Transparent;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.Navy;
            this.label5.Location = new System.Drawing.Point(45, 280);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(67, 13);
            this.label5.TabIndex = 110;
            this.label5.Text = "Observación";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Navy;
            this.label3.Location = new System.Drawing.Point(33, 250);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(79, 13);
            this.label3.TabIndex = 109;
            this.label3.Text = "Dirección fiscal";
            // 
            // txtDireccion
            // 
            this.txtDireccion.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtDireccion.Enabled = false;
            this.txtDireccion.Location = new System.Drawing.Point(117, 250);
            this.txtDireccion.Name = "txtDireccion";
            this.txtDireccion.Size = new System.Drawing.Size(438, 23);
            this.txtDireccion.TabIndex = 13;
            // 
            // lblRUC
            // 
            this.lblRUC.AutoSize = true;
            this.lblRUC.BackColor = System.Drawing.Color.Transparent;
            this.lblRUC.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRUC.ForeColor = System.Drawing.Color.Navy;
            this.lblRUC.Location = new System.Drawing.Point(11, 220);
            this.lblRUC.Name = "lblRUC";
            this.lblRUC.Size = new System.Drawing.Size(101, 13);
            this.lblRUC.TabIndex = 107;
            this.lblRUC.Text = "Pers. Nat. con RUC";
            this.lblRUC.Visible = false;
            // 
            // txtRUC
            // 
            this.txtRUC.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtRUC.Location = new System.Drawing.Point(117, 220);
            this.txtRUC.MaxLength = 11;
            this.txtRUC.Name = "txtRUC";
            this.txtRUC.Size = new System.Drawing.Size(180, 23);
            this.txtRUC.TabIndex = 12;
            this.txtRUC.Visible = false;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.BackColor = System.Drawing.Color.Transparent;
            this.label13.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label13.ForeColor = System.Drawing.Color.Navy;
            this.label13.Location = new System.Drawing.Point(328, 160);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(72, 13);
            this.label13.TabIndex = 106;
            this.label13.Text = "Número Movil";
            // 
            // txtMovil
            // 
            this.txtMovil.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtMovil.Location = new System.Drawing.Point(405, 160);
            this.txtMovil.MaxLength = 50;
            this.txtMovil.Name = "txtMovil";
            this.txtMovil.Size = new System.Drawing.Size(180, 23);
            this.txtMovil.TabIndex = 9;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.BackColor = System.Drawing.Color.Transparent;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.ForeColor = System.Drawing.Color.Navy;
            this.label12.Location = new System.Drawing.Point(74, 190);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(38, 13);
            this.label12.TabIndex = 105;
            this.label12.Text = "Correo";
            // 
            // txtCorreo
            // 
            this.txtCorreo.CharacterCasing = System.Windows.Forms.CharacterCasing.Lower;
            this.txtCorreo.Location = new System.Drawing.Point(117, 190);
            this.txtCorreo.MaxLength = 100;
            this.txtCorreo.Name = "txtCorreo";
            this.txtCorreo.Size = new System.Drawing.Size(468, 23);
            this.txtCorreo.TabIndex = 10;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.BackColor = System.Drawing.Color.Transparent;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.ForeColor = System.Drawing.Color.Navy;
            this.label11.Location = new System.Drawing.Point(44, 160);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(68, 13);
            this.label11.TabIndex = 104;
            this.label11.Text = "Teléfono Fijo";
            // 
            // txtFijo
            // 
            this.txtFijo.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtFijo.Location = new System.Drawing.Point(117, 160);
            this.txtFijo.MaxLength = 50;
            this.txtFijo.Name = "txtFijo";
            this.txtFijo.Size = new System.Drawing.Size(180, 23);
            this.txtFijo.TabIndex = 8;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.BackColor = System.Drawing.Color.Transparent;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.ForeColor = System.Drawing.Color.Navy;
            this.label10.Location = new System.Drawing.Point(19, 130);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(93, 13);
            this.label10.TabIndex = 103;
            this.label10.Text = "Nombre Comercial";
            // 
            // txtSigla
            // 
            this.txtSigla.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtSigla.Location = new System.Drawing.Point(117, 130);
            this.txtSigla.MaxLength = 100;
            this.txtSigla.Name = "txtSigla";
            this.txtSigla.Size = new System.Drawing.Size(468, 23);
            this.txtSigla.TabIndex = 7;
            // 
            // lblNomRazSoc
            // 
            this.lblNomRazSoc.BackColor = System.Drawing.Color.Transparent;
            this.lblNomRazSoc.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNomRazSoc.ForeColor = System.Drawing.Color.Navy;
            this.lblNomRazSoc.Location = new System.Drawing.Point(14, 100);
            this.lblNomRazSoc.Name = "lblNomRazSoc";
            this.lblNomRazSoc.Size = new System.Drawing.Size(98, 13);
            this.lblNomRazSoc.TabIndex = 102;
            this.lblNomRazSoc.Text = "Nombres";
            this.lblNomRazSoc.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtNombres
            // 
            this.txtNombres.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtNombres.Location = new System.Drawing.Point(117, 100);
            this.txtNombres.MaxLength = 100;
            this.txtNombres.Name = "txtNombres";
            this.txtNombres.Size = new System.Drawing.Size(468, 23);
            this.txtNombres.TabIndex = 6;
            // 
            // lblMaterno
            // 
            this.lblMaterno.AutoSize = true;
            this.lblMaterno.BackColor = System.Drawing.Color.Transparent;
            this.lblMaterno.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaterno.ForeColor = System.Drawing.Color.Navy;
            this.lblMaterno.Location = new System.Drawing.Point(335, 70);
            this.lblMaterno.Name = "lblMaterno";
            this.lblMaterno.Size = new System.Drawing.Size(65, 13);
            this.lblMaterno.TabIndex = 101;
            this.lblMaterno.Text = "Ap. Materno";
            this.lblMaterno.Visible = false;
            // 
            // txtMaterno
            // 
            this.txtMaterno.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtMaterno.Location = new System.Drawing.Point(405, 70);
            this.txtMaterno.MaxLength = 30;
            this.txtMaterno.Name = "txtMaterno";
            this.txtMaterno.Size = new System.Drawing.Size(180, 23);
            this.txtMaterno.TabIndex = 5;
            this.txtMaterno.Visible = false;
            // 
            // cmbTiDocIdent
            // 
            this.cmbTiDocIdent.DisplayMember = "nomCorto";
            this.cmbTiDocIdent.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTiDocIdent.DropDownWidth = 121;
            this.cmbTiDocIdent.Enabled = false;
            this.cmbTiDocIdent.Location = new System.Drawing.Point(117, 40);
            this.cmbTiDocIdent.Name = "cmbTiDocIdent";
            this.cmbTiDocIdent.Size = new System.Drawing.Size(180, 21);
            this.cmbTiDocIdent.TabIndex = 2;
            this.cmbTiDocIdent.ValueMember = "idTipo";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.BackColor = System.Drawing.Color.Transparent;
            this.label16.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.ForeColor = System.Drawing.Color.Navy;
            this.label16.Location = new System.Drawing.Point(35, 40);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(77, 13);
            this.label16.TabIndex = 100;
            this.label16.Text = "Doc. Identidad";
            // 
            // lblPaterno
            // 
            this.lblPaterno.AutoSize = true;
            this.lblPaterno.BackColor = System.Drawing.Color.Transparent;
            this.lblPaterno.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPaterno.ForeColor = System.Drawing.Color.Navy;
            this.lblPaterno.Location = new System.Drawing.Point(49, 70);
            this.lblPaterno.Name = "lblPaterno";
            this.lblPaterno.Size = new System.Drawing.Size(63, 13);
            this.lblPaterno.TabIndex = 99;
            this.lblPaterno.Text = "Ap. Paterno";
            this.lblPaterno.Visible = false;
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.BackColor = System.Drawing.Color.Transparent;
            this.label18.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label18.ForeColor = System.Drawing.Color.Navy;
            this.label18.Location = new System.Drawing.Point(312, 40);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(88, 13);
            this.label18.TabIndex = 98;
            this.label18.Text = "Núm. Doc. Ident.";
            // 
            // cmbTiGenero
            // 
            this.cmbTiGenero.DisplayMember = "nomTipo";
            this.cmbTiGenero.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTiGenero.DropDownWidth = 121;
            this.cmbTiGenero.Location = new System.Drawing.Point(405, 10);
            this.cmbTiGenero.Name = "cmbTiGenero";
            this.cmbTiGenero.Size = new System.Drawing.Size(180, 21);
            this.cmbTiGenero.TabIndex = 1;
            this.cmbTiGenero.ValueMember = "idTipo";
            // 
            // cmbTiPersona
            // 
            this.cmbTiPersona.DisplayMember = "nomTipo";
            this.cmbTiPersona.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTiPersona.DropDownWidth = 175;
            this.cmbTiPersona.Location = new System.Drawing.Point(117, 10);
            this.cmbTiPersona.Name = "cmbTiPersona";
            this.cmbTiPersona.Size = new System.Drawing.Size(180, 21);
            this.cmbTiPersona.TabIndex = 0;
            this.cmbTiPersona.ValueMember = "idTipo";
            this.cmbTiPersona.SelectedIndexChanged += new System.EventHandler(this.CmbTiPersona_SelectedIndexChanged);
            // 
            // txtPaterno
            // 
            this.txtPaterno.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtPaterno.Location = new System.Drawing.Point(117, 70);
            this.txtPaterno.MaxLength = 30;
            this.txtPaterno.Name = "txtPaterno";
            this.txtPaterno.Size = new System.Drawing.Size(180, 23);
            this.txtPaterno.TabIndex = 4;
            this.txtPaterno.Visible = false;
            // 
            // txtNumDoc
            // 
            this.txtNumDoc.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtNumDoc.Location = new System.Drawing.Point(405, 40);
            this.txtNumDoc.MaxLength = 11;
            this.txtNumDoc.Name = "txtNumDoc";
            this.txtNumDoc.Size = new System.Drawing.Size(180, 23);
            this.txtNumDoc.TabIndex = 3;
            this.txtNumDoc.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.BackColor = System.Drawing.Color.Transparent;
            this.label19.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.ForeColor = System.Drawing.Color.Navy;
            this.label19.Location = new System.Drawing.Point(358, 10);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(42, 13);
            this.label19.TabIndex = 97;
            this.label19.Text = "Género";
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.BackColor = System.Drawing.Color.Transparent;
            this.label20.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label20.ForeColor = System.Drawing.Color.Navy;
            this.label20.Location = new System.Drawing.Point(42, 10);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(70, 13);
            this.label20.TabIndex = 96;
            this.label20.Text = "Tipo Persona";
            // 
            // FrmCliente
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(620, 428);
            this.Name = "FrmCliente";
            this.Text = "Cliente";
            this.Load += new System.EventHandler(this.FrmCliente_Load);
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
            ((System.ComponentModel.ISupportInitialize)(this.cmbTiDocIdent)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbTiGenero)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cmbTiPersona)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private ComponentFactory.Krypton.Toolkit.KryptonGroupBox gbx1;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnDireccion;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtObs;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label3;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtDireccion;
        private System.Windows.Forms.Label lblRUC;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtRUC;
        private System.Windows.Forms.Label label13;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtMovil;
        private System.Windows.Forms.Label label12;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtCorreo;
        private System.Windows.Forms.Label label11;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtFijo;
        private System.Windows.Forms.Label label10;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtSigla;
        private System.Windows.Forms.Label lblNomRazSoc;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtNombres;
        private System.Windows.Forms.Label lblMaterno;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtMaterno;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbTiDocIdent;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label lblPaterno;
        private System.Windows.Forms.Label label18;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbTiGenero;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cmbTiPersona;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtPaterno;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtNumDoc;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Label label20;
        private ComponentFactory.Krypton.Toolkit.KryptonCheckBox chbVal;
    }
}