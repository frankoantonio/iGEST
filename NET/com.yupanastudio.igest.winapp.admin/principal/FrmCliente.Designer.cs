namespace com.yupanastudio.igest.winapp
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
            this.label35 = new System.Windows.Forms.Label();
            this.gbx1 = new Krypton.Toolkit.KryptonGroupBox();
            this.lblMsg = new System.Windows.Forms.Label();
            this.lblDataOK = new System.Windows.Forms.Label();
            this.txtSigla = new Krypton.Toolkit.KryptonTextBox();
            this.lblSigla = new System.Windows.Forms.Label();
            this.kryptonButton1 = new Krypton.Toolkit.KryptonButton();
            this.txtRucPerNat = new Krypton.Toolkit.KryptonTextBox();
            this.lblRucPerNat = new System.Windows.Forms.Label();
            this.cmbDocIdent = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.txtMat = new Krypton.Toolkit.KryptonTextBox();
            this.txtDocIdent = new Krypton.Toolkit.KryptonTextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label20 = new System.Windows.Forms.Label();
            this.txtPat = new Krypton.Toolkit.KryptonTextBox();
            this.label26 = new System.Windows.Forms.Label();
            this.txtNoms = new Krypton.Toolkit.KryptonTextBox();
            this.label28 = new System.Windows.Forms.Label();
            this.lblContacto = new System.Windows.Forms.Label();
            this.label25 = new System.Windows.Forms.Label();
            this.label24 = new System.Windows.Forms.Label();
            this.label21 = new System.Windows.Forms.Label();
            this.txtFijo = new Krypton.Toolkit.KryptonMaskedTextBox();
            this.txtCelular = new Krypton.Toolkit.KryptonMaskedTextBox();
            this.gbx2 = new Krypton.Toolkit.KryptonGroupBox();
            this.txtCorreo = new Krypton.Toolkit.KryptonTextBox();
            this.kryptonTextBox2 = new Krypton.Toolkit.KryptonTextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cmbCondicion = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.label3 = new System.Windows.Forms.Label();
            this.cmbEstado = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.label4 = new System.Windows.Forms.Label();
            this.btnDir = new Krypton.Toolkit.KryptonButton();
            this.txtDir = new Krypton.Toolkit.KryptonTextBox();
            this.label23 = new System.Windows.Forms.Label();
            this.kryptonCheckBox1 = new Krypton.Toolkit.KryptonCheckBox();
            this.kryptonTextBox3 = new Krypton.Toolkit.KryptonTextBox();
            this.comboBoxMy1 = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.label1 = new System.Windows.Forms.Label();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx1.Panel)).BeginInit();
            this.gbx1.Panel.SuspendLayout();
            this.gbx1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gbx2.Panel)).BeginInit();
            this.gbx2.Panel.SuspendLayout();
            this.gbx2.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.lblMsg);
            this.pnlMain.Controls.Add(this.gbx1);
            this.pnlMain.Controls.Add(this.lblDataOK);
            this.pnlMain.Controls.Add(this.lblContacto);
            this.pnlMain.Controls.Add(this.gbx2);
            this.pnlMain.Controls.Add(this.label35);
            this.pnlMain.Size = new System.Drawing.Size(799, 558);
            this.pnlMain.Controls.SetChildIndex(this.label35, 0);
            this.pnlMain.Controls.SetChildIndex(this.gbx2, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblContacto, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblDataOK, 0);
            this.pnlMain.Controls.SetChildIndex(this.gbx1, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblMsg, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(799, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(298, 15);
            this.lblTitle.Text = "TI_PERSONA";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 518);
            this.pnlFooter.Size = new System.Drawing.Size(799, 40);
            this.pnlFooter.TabIndex = 2;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(365, 6);
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(245, 6);
            this.toolTip.SetToolTip(this.btnOk, "Guardar los cambios.");
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_save;
            this.btnOk.Values.Text = "&Guardar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(662, 5);
            // 
            // label35
            // 
            this.label35.AutoSize = true;
            this.label35.BackColor = System.Drawing.Color.Transparent;
            this.label35.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label35.Location = new System.Drawing.Point(7, 40);
            this.label35.Name = "label35";
            this.label35.Size = new System.Drawing.Size(104, 16);
            this.label35.TabIndex = 106;
            this.label35.Text = "Datos Generales";
            this.label35.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // gbx1
            // 
            this.gbx1.CaptionStyle = Krypton.Toolkit.LabelStyle.NormalControl;
            this.gbx1.Location = new System.Drawing.Point(10, 77);
            this.gbx1.Name = "gbx1";
            // 
            // gbx1.Panel
            // 
            this.gbx1.Panel.Controls.Add(this.kryptonCheckBox1);
            this.gbx1.Panel.Controls.Add(this.kryptonTextBox3);
            this.gbx1.Panel.Controls.Add(this.comboBoxMy1);
            this.gbx1.Panel.Controls.Add(this.label1);
            this.gbx1.Panel.Controls.Add(this.cmbCondicion);
            this.gbx1.Panel.Controls.Add(this.label3);
            this.gbx1.Panel.Controls.Add(this.kryptonButton1);
            this.gbx1.Panel.Controls.Add(this.cmbEstado);
            this.gbx1.Panel.Controls.Add(this.label4);
            this.gbx1.Panel.Controls.Add(this.txtSigla);
            this.gbx1.Panel.Controls.Add(this.lblSigla);
            this.gbx1.Panel.Controls.Add(this.txtRucPerNat);
            this.gbx1.Panel.Controls.Add(this.lblRucPerNat);
            this.gbx1.Panel.Controls.Add(this.cmbDocIdent);
            this.gbx1.Panel.Controls.Add(this.txtMat);
            this.gbx1.Panel.Controls.Add(this.txtDocIdent);
            this.gbx1.Panel.Controls.Add(this.label7);
            this.gbx1.Panel.Controls.Add(this.label12);
            this.gbx1.Panel.Controls.Add(this.label20);
            this.gbx1.Panel.Controls.Add(this.txtPat);
            this.gbx1.Panel.Controls.Add(this.label26);
            this.gbx1.Panel.Controls.Add(this.txtNoms);
            this.gbx1.Panel.Controls.Add(this.label28);
            this.gbx1.Size = new System.Drawing.Size(703, 205);
            this.gbx1.StateCommon.Back.Color1 = System.Drawing.Color.PaleTurquoise;
            this.gbx1.StateCommon.Content.ShortText.Color1 = System.Drawing.Color.Navy;
            this.gbx1.StateCommon.Content.ShortText.Font = new System.Drawing.Font("Arial", 9F);
            this.gbx1.TabIndex = 0;
            this.gbx1.Values.Heading = "";
            // 
            // lblMsg
            // 
            this.lblMsg.BackColor = System.Drawing.Color.Transparent;
            this.lblMsg.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMsg.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblMsg.Location = new System.Drawing.Point(414, 278);
            this.lblMsg.Name = "lblMsg";
            this.lblMsg.Size = new System.Drawing.Size(278, 16);
            this.lblMsg.TabIndex = 163;
            this.lblMsg.Text = "HABIDO | ENCONTRADO";
            this.lblMsg.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lblDataOK
            // 
            this.lblDataOK.BackColor = System.Drawing.Color.Transparent;
            this.lblDataOK.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F);
            this.lblDataOK.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblDataOK.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.check;
            this.lblDataOK.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblDataOK.Location = new System.Drawing.Point(419, 58);
            this.lblDataOK.Name = "lblDataOK";
            this.lblDataOK.Size = new System.Drawing.Size(280, 16);
            this.lblDataOK.TabIndex = 162;
            this.lblDataOK.Text = "Datos validados, algunos datos no se podrá modificar.";
            this.lblDataOK.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.lblDataOK.Visible = false;
            // 
            // txtSigla
            // 
            this.txtSigla.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtSigla.Location = new System.Drawing.Point(457, 146);
            this.txtSigla.MaxLength = 75;
            this.txtSigla.Name = "txtSigla";
            this.txtSigla.Size = new System.Drawing.Size(230, 23);
            this.txtSigla.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.txtSigla.TabIndex = 7;
            this.txtSigla.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // lblSigla
            // 
            this.lblSigla.AutoSize = true;
            this.lblSigla.BackColor = System.Drawing.Color.Transparent;
            this.lblSigla.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.lblSigla.ForeColor = System.Drawing.Color.Navy;
            this.lblSigla.Location = new System.Drawing.Point(343, 146);
            this.lblSigla.Name = "lblSigla";
            this.lblSigla.Size = new System.Drawing.Size(120, 16);
            this.lblSigla.TabIndex = 159;
            this.lblSigla.Text = "Nombre Comercial";
            this.lblSigla.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // kryptonButton1
            // 
            this.kryptonButton1.Location = new System.Drawing.Point(256, 22);
            this.kryptonButton1.Name = "kryptonButton1";
            this.kryptonButton1.Size = new System.Drawing.Size(107, 28);
            this.kryptonButton1.TabIndex = 154;
            this.toolTip.SetToolTip(this.kryptonButton1, "Establecer \"Dirección\".");
            this.kryptonButton1.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.nodo;
            this.kryptonButton1.Values.Text = "Extraer/Actualizar";
            // 
            // txtRucPerNat
            // 
            this.txtRucPerNat.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtRucPerNat.Location = new System.Drawing.Point(106, 146);
            this.txtRucPerNat.MaxLength = 11;
            this.txtRucPerNat.Name = "txtRucPerNat";
            this.txtRucPerNat.Size = new System.Drawing.Size(230, 23);
            this.txtRucPerNat.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.txtRucPerNat.TabIndex = 6;
            this.txtRucPerNat.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // lblRucPerNat
            // 
            this.lblRucPerNat.AutoSize = true;
            this.lblRucPerNat.BackColor = System.Drawing.Color.Transparent;
            this.lblRucPerNat.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.lblRucPerNat.ForeColor = System.Drawing.Color.Navy;
            this.lblRucPerNat.Location = new System.Drawing.Point(17, 146);
            this.lblRucPerNat.Name = "lblRucPerNat";
            this.lblRucPerNat.Size = new System.Drawing.Size(93, 16);
            this.lblRucPerNat.TabIndex = 158;
            this.lblRucPerNat.Text = "RUC Personal";
            this.lblRucPerNat.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbDocIdent
            // 
            this.cmbDocIdent.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbDocIdent.DisplayMember = "nomCorto";
            this.cmbDocIdent.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDocIdent.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbDocIdent.FormattingEnabled = true;
            this.cmbDocIdent.Location = new System.Drawing.Point(106, 56);
            this.cmbDocIdent.Name = "cmbDocIdent";
            this.cmbDocIdent.Size = new System.Drawing.Size(230, 21);
            this.cmbDocIdent.TabIndex = 0;
            this.cmbDocIdent.ValueMember = "idTipo";
            this.cmbDocIdent.SelectedIndexChanged += new System.EventHandler(this.cmbDocIdent_SelectedIndexChanged);
            // 
            // txtMat
            // 
            this.txtMat.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtMat.Location = new System.Drawing.Point(457, 116);
            this.txtMat.MaxLength = 30;
            this.txtMat.Name = "txtMat";
            this.txtMat.Size = new System.Drawing.Size(230, 23);
            this.txtMat.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.txtMat.TabIndex = 5;
            this.txtMat.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // txtDocIdent
            // 
            this.txtDocIdent.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtDocIdent.Location = new System.Drawing.Point(457, 56);
            this.txtDocIdent.MaxLength = 20;
            this.txtDocIdent.Name = "txtDocIdent";
            this.txtDocIdent.Size = new System.Drawing.Size(230, 23);
            this.txtDocIdent.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.txtDocIdent.TabIndex = 1;
            this.txtDocIdent.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.BackColor = System.Drawing.Color.Transparent;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label7.ForeColor = System.Drawing.Color.Navy;
            this.label7.Location = new System.Drawing.Point(357, 116);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(109, 16);
            this.label7.TabIndex = 155;
            this.label7.Text = "Apellido Materno";
            this.label7.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.BackColor = System.Drawing.Color.Transparent;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label12.ForeColor = System.Drawing.Color.Navy;
            this.label12.Location = new System.Drawing.Point(352, 56);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(111, 16);
            this.label12.TabIndex = 151;
            this.label12.Text = "N° Doc. Identidad";
            this.label12.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.BackColor = System.Drawing.Color.Transparent;
            this.label20.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label20.ForeColor = System.Drawing.Color.Navy;
            this.label20.Location = new System.Drawing.Point(18, 56);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(101, 16);
            this.label20.TabIndex = 148;
            this.label20.Text = "Tipo Doc. Ident.";
            this.label20.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtPat
            // 
            this.txtPat.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtPat.Location = new System.Drawing.Point(106, 116);
            this.txtPat.MaxLength = 30;
            this.txtPat.Name = "txtPat";
            this.txtPat.Size = new System.Drawing.Size(230, 23);
            this.txtPat.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.txtPat.TabIndex = 4;
            this.txtPat.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // label26
            // 
            this.label26.AutoSize = true;
            this.label26.BackColor = System.Drawing.Color.Transparent;
            this.label26.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label26.ForeColor = System.Drawing.Color.Navy;
            this.label26.Location = new System.Drawing.Point(40, 86);
            this.label26.Name = "label26";
            this.label26.Size = new System.Drawing.Size(63, 16);
            this.label26.TabIndex = 147;
            this.label26.Text = "Nombres";
            this.label26.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtNoms
            // 
            this.txtNoms.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtNoms.Location = new System.Drawing.Point(105, 86);
            this.txtNoms.MaxLength = 30;
            this.txtNoms.Name = "txtNoms";
            this.txtNoms.Size = new System.Drawing.Size(582, 23);
            this.txtNoms.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.txtNoms.TabIndex = 3;
            this.txtNoms.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // label28
            // 
            this.label28.AutoSize = true;
            this.label28.BackColor = System.Drawing.Color.Transparent;
            this.label28.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label28.ForeColor = System.Drawing.Color.Navy;
            this.label28.Location = new System.Drawing.Point(7, 116);
            this.label28.Name = "label28";
            this.label28.Size = new System.Drawing.Size(107, 16);
            this.label28.TabIndex = 146;
            this.label28.Text = "Apellido Paterno";
            this.label28.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // lblContacto
            // 
            this.lblContacto.AutoSize = true;
            this.lblContacto.BackColor = System.Drawing.Color.Transparent;
            this.lblContacto.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblContacto.Location = new System.Drawing.Point(7, 285);
            this.lblContacto.Name = "lblContacto";
            this.lblContacto.Size = new System.Drawing.Size(59, 16);
            this.lblContacto.TabIndex = 151;
            this.lblContacto.Text = "Contacto";
            this.lblContacto.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label25
            // 
            this.label25.AutoSize = true;
            this.label25.BackColor = System.Drawing.Color.Transparent;
            this.label25.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label25.ForeColor = System.Drawing.Color.Navy;
            this.label25.Location = new System.Drawing.Point(10, 47);
            this.label25.Name = "label25";
            this.label25.Size = new System.Drawing.Size(103, 16);
            this.label25.TabIndex = 57;
            this.label25.Text = "N° Teléfono Fijo";
            this.label25.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label24
            // 
            this.label24.AutoSize = true;
            this.label24.BackColor = System.Drawing.Color.Transparent;
            this.label24.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label24.ForeColor = System.Drawing.Color.Navy;
            this.label24.Location = new System.Drawing.Point(391, 47);
            this.label24.Name = "label24";
            this.label24.Size = new System.Drawing.Size(66, 16);
            this.label24.TabIndex = 70;
            this.label24.Text = "N° Celular";
            this.label24.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.BackColor = System.Drawing.Color.Transparent;
            this.label21.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label21.ForeColor = System.Drawing.Color.Navy;
            this.label21.Location = new System.Drawing.Point(59, 77);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(55, 16);
            this.label21.TabIndex = 82;
            this.label21.Text = "Correos";
            this.label21.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtFijo
            // 
            this.txtFijo.CutCopyMaskFormat = System.Windows.Forms.MaskFormat.ExcludePromptAndLiterals;
            this.txtFijo.Location = new System.Drawing.Point(106, 47);
            this.txtFijo.Mask = "000 000 000";
            this.txtFijo.Name = "txtFijo";
            this.txtFijo.Size = new System.Drawing.Size(230, 23);
            this.txtFijo.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtFijo.TabIndex = 0;
            this.txtFijo.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtFijo.TextMaskFormat = System.Windows.Forms.MaskFormat.ExcludePromptAndLiterals;
            this.txtFijo.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // txtCelular
            // 
            this.txtCelular.CutCopyMaskFormat = System.Windows.Forms.MaskFormat.ExcludePromptAndLiterals;
            this.txtCelular.Location = new System.Drawing.Point(457, 47);
            this.txtCelular.Mask = "000 000 000";
            this.txtCelular.Name = "txtCelular";
            this.txtCelular.Size = new System.Drawing.Size(230, 23);
            this.txtCelular.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtCelular.TabIndex = 1;
            this.txtCelular.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtCelular.TextMaskFormat = System.Windows.Forms.MaskFormat.ExcludePromptAndLiterals;
            this.txtCelular.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // gbx2
            // 
            this.gbx2.CaptionStyle = Krypton.Toolkit.LabelStyle.NormalControl;
            this.gbx2.Location = new System.Drawing.Point(10, 305);
            this.gbx2.Name = "gbx2";
            // 
            // gbx2.Panel
            // 
            this.gbx2.Panel.Controls.Add(this.kryptonTextBox2);
            this.gbx2.Panel.Controls.Add(this.label2);
            this.gbx2.Panel.Controls.Add(this.btnDir);
            this.gbx2.Panel.Controls.Add(this.txtDir);
            this.gbx2.Panel.Controls.Add(this.label23);
            this.gbx2.Panel.Controls.Add(this.txtCelular);
            this.gbx2.Panel.Controls.Add(this.txtFijo);
            this.gbx2.Panel.Controls.Add(this.txtCorreo);
            this.gbx2.Panel.Controls.Add(this.label21);
            this.gbx2.Panel.Controls.Add(this.label24);
            this.gbx2.Panel.Controls.Add(this.label25);
            this.gbx2.Size = new System.Drawing.Size(700, 135);
            this.gbx2.StateCommon.Back.Color1 = System.Drawing.Color.PaleTurquoise;
            this.gbx2.StateCommon.Content.ShortText.Color1 = System.Drawing.Color.Navy;
            this.gbx2.StateCommon.Content.ShortText.Font = new System.Drawing.Font("Arial", 9F);
            this.gbx2.TabIndex = 1;
            this.gbx2.Values.Heading = "";
            // 
            // txtCorreo
            // 
            this.txtCorreo.CharacterCasing = System.Windows.Forms.CharacterCasing.Lower;
            this.txtCorreo.Location = new System.Drawing.Point(106, 77);
            this.txtCorreo.MaxLength = 75;
            this.txtCorreo.Name = "txtCorreo";
            this.txtCorreo.Size = new System.Drawing.Size(580, 23);
            this.txtCorreo.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.txtCorreo.TabIndex = 2;
            this.txtCorreo.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // kryptonTextBox2
            // 
            this.kryptonTextBox2.CharacterCasing = System.Windows.Forms.CharacterCasing.Lower;
            this.kryptonTextBox2.Location = new System.Drawing.Point(105, 105);
            this.kryptonTextBox2.MaxLength = 75;
            this.kryptonTextBox2.Name = "kryptonTextBox2";
            this.kryptonTextBox2.Size = new System.Drawing.Size(596, 23);
            this.kryptonTextBox2.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.kryptonTextBox2.TabIndex = 165;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label2.ForeColor = System.Drawing.Color.Navy;
            this.label2.Location = new System.Drawing.Point(10, 105);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(84, 16);
            this.label2.TabIndex = 166;
            this.label2.Text = "Observación";
            this.label2.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbCondicion
            // 
            this.cmbCondicion.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbCondicion.DisplayMember = "nomTipo";
            this.cmbCondicion.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCondicion.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbCondicion.FormattingEnabled = true;
            this.cmbCondicion.Location = new System.Drawing.Point(405, 175);
            this.cmbCondicion.Name = "cmbCondicion";
            this.cmbCondicion.Size = new System.Drawing.Size(260, 21);
            this.cmbCondicion.TabIndex = 165;
            this.cmbCondicion.ValueMember = "idTipo";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label3.ForeColor = System.Drawing.Color.Navy;
            this.label3.Location = new System.Drawing.Point(340, 175);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(67, 16);
            this.label3.TabIndex = 167;
            this.label3.Text = "Condición";
            this.label3.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbEstado
            // 
            this.cmbEstado.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbEstado.DisplayMember = "nomTipo";
            this.cmbEstado.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbEstado.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbEstado.FormattingEnabled = true;
            this.cmbEstado.Location = new System.Drawing.Point(67, 175);
            this.cmbEstado.Name = "cmbEstado";
            this.cmbEstado.Size = new System.Drawing.Size(260, 21);
            this.cmbEstado.TabIndex = 164;
            this.cmbEstado.ValueMember = "idTipo";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label4.ForeColor = System.Drawing.Color.Navy;
            this.label4.Location = new System.Drawing.Point(18, 175);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(50, 16);
            this.label4.TabIndex = 166;
            this.label4.Text = "Estado";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // btnDir
            // 
            this.btnDir.Location = new System.Drawing.Point(656, 18);
            this.btnDir.Name = "btnDir";
            this.btnDir.Size = new System.Drawing.Size(30, 22);
            this.btnDir.TabIndex = 84;
            this.toolTip.SetToolTip(this.btnDir, "Establecer \"Dirección\".");
            this.btnDir.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_load;
            this.btnDir.Values.Text = "";
            // 
            // txtDir
            // 
            this.txtDir.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtDir.Enabled = false;
            this.txtDir.Location = new System.Drawing.Point(88, 18);
            this.txtDir.Name = "txtDir";
            this.txtDir.Size = new System.Drawing.Size(567, 23);
            this.txtDir.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtDir.TabIndex = 83;
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.BackColor = System.Drawing.Color.Transparent;
            this.label23.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label23.ForeColor = System.Drawing.Color.Navy;
            this.label23.Location = new System.Drawing.Point(26, 18);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(64, 16);
            this.label23.TabIndex = 85;
            this.label23.Text = "Dirección";
            this.label23.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // kryptonCheckBox1
            // 
            this.kryptonCheckBox1.Location = new System.Drawing.Point(21, 22);
            this.kryptonCheckBox1.Name = "kryptonCheckBox1";
            this.kryptonCheckBox1.Size = new System.Drawing.Size(62, 20);
            this.kryptonCheckBox1.TabIndex = 170;
            this.kryptonCheckBox1.Values.Text = "SUNAT";
            // 
            // kryptonTextBox3
            // 
            this.kryptonTextBox3.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.kryptonTextBox3.Location = new System.Drawing.Point(86, 22);
            this.kryptonTextBox3.MaxLength = 11;
            this.kryptonTextBox3.Name = "kryptonTextBox3";
            this.kryptonTextBox3.Size = new System.Drawing.Size(171, 23);
            this.kryptonTextBox3.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.kryptonTextBox3.TabIndex = 168;
            // 
            // comboBoxMy1
            // 
            this.comboBoxMy1.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.comboBoxMy1.DisplayMember = "nomTipo";
            this.comboBoxMy1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxMy1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.comboBoxMy1.FormattingEnabled = true;
            this.comboBoxMy1.Location = new System.Drawing.Point(461, 22);
            this.comboBoxMy1.Name = "comboBoxMy1";
            this.comboBoxMy1.Size = new System.Drawing.Size(250, 21);
            this.comboBoxMy1.TabIndex = 171;
            this.comboBoxMy1.ValueMember = "idTipo";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F);
            this.label1.ForeColor = System.Drawing.Color.Navy;
            this.label1.Location = new System.Drawing.Point(369, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(89, 16);
            this.label1.TabIndex = 172;
            this.label1.Text = "Tipo Persona";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // FrmClientePerNat
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(799, 558);
            this.Name = "FrmClientePerNat";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmPersona_Load);
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
            ((System.ComponentModel.ISupportInitialize)(this.gbx2.Panel)).EndInit();
            this.gbx2.Panel.ResumeLayout(false);
            this.gbx2.Panel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gbx2)).EndInit();
            this.gbx2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Label label35;
        private Krypton.Toolkit.KryptonGroupBox gbx1;
        private ComboBoxMy cmbDocIdent;
        private Krypton.Toolkit.KryptonTextBox txtMat;
        private Krypton.Toolkit.KryptonTextBox txtDocIdent;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label20;
        private Krypton.Toolkit.KryptonTextBox txtPat;
        private System.Windows.Forms.Label label26;
        private Krypton.Toolkit.KryptonTextBox txtNoms;
        private System.Windows.Forms.Label label28;
        private Krypton.Toolkit.KryptonTextBox txtSigla;
        private System.Windows.Forms.Label lblSigla;
        private Krypton.Toolkit.KryptonTextBox txtRucPerNat;
        private System.Windows.Forms.Label lblRucPerNat;
        private Krypton.Toolkit.KryptonButton kryptonButton1;
        private System.Windows.Forms.Label lblDataOK;
        private System.Windows.Forms.Label lblMsg;
        private System.Windows.Forms.Label lblContacto;
        private Krypton.Toolkit.KryptonGroupBox gbx2;
        private Krypton.Toolkit.KryptonMaskedTextBox txtCelular;
        private Krypton.Toolkit.KryptonMaskedTextBox txtFijo;
        private Krypton.Toolkit.KryptonTextBox txtCorreo;
        private System.Windows.Forms.Label label21;
        private System.Windows.Forms.Label label24;
        private System.Windows.Forms.Label label25;
        private Krypton.Toolkit.KryptonTextBox kryptonTextBox2;
        private System.Windows.Forms.Label label2;
        private ComboBoxMy cmbCondicion;
        private System.Windows.Forms.Label label3;
        private ComboBoxMy cmbEstado;
        private System.Windows.Forms.Label label4;
        private Krypton.Toolkit.KryptonButton btnDir;
        private Krypton.Toolkit.KryptonTextBox txtDir;
        private System.Windows.Forms.Label label23;
        private Krypton.Toolkit.KryptonCheckBox kryptonCheckBox1;
        private Krypton.Toolkit.KryptonTextBox kryptonTextBox3;
        private ComboBoxMy comboBoxMy1;
        private System.Windows.Forms.Label label1;
    }
}