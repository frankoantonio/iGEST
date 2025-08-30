namespace com.yupanastudio.igest.winapp
{
    partial class FrmFamiliar
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmFamiliar));
            this.label35 = new System.Windows.Forms.Label();
            this.lblOtros = new System.Windows.Forms.Label();
            this.pnl2 = new Krypton.Toolkit.KryptonGroupBox();
            this.txtCelular = new Krypton.Toolkit.KryptonMaskedTextBox();
            this.txtCorreo = new Krypton.Toolkit.KryptonTextBox();
            this.txtFijo = new Krypton.Toolkit.KryptonMaskedTextBox();
            this.txtOcupacion = new Krypton.Toolkit.KryptonTextBox();
            this.txtCenLabDet = new Krypton.Toolkit.KryptonTextBox();
            this.btnDir = new Krypton.Toolkit.KryptonButton();
            this.txtCenLab = new Krypton.Toolkit.KryptonTextBox();
            this.txtDir = new Krypton.Toolkit.KryptonTextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label21 = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            this.label23 = new System.Windows.Forms.Label();
            this.label32 = new System.Windows.Forms.Label();
            this.label24 = new System.Windows.Forms.Label();
            this.label25 = new System.Windows.Forms.Label();
            this.cmbSitEdu = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.lblSitEduc = new System.Windows.Forms.Label();
            this.chbViveConAlu = new Krypton.Toolkit.KryptonCheckBox();
            this.chbApoderado = new Krypton.Toolkit.KryptonCheckBox();
            this.pnl1 = new Krypton.Toolkit.KryptonGroupBox();
            this.btnInsEst = new Krypton.Toolkit.KryptonButton();
            this.cmbParentesco = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.label5 = new System.Windows.Forms.Label();
            this.chbFallecido = new Krypton.Toolkit.KryptonCheckBox();
            this.txtInsEst = new Krypton.Toolkit.KryptonTextBox();
            this.txtNoms = new Krypton.Toolkit.KryptonTextBox();
            this.label26 = new System.Windows.Forms.Label();
            this.btnNac = new Krypton.Toolkit.KryptonButton();
            this.lblInsEst = new System.Windows.Forms.Label();
            this.txtNac = new Krypton.Toolkit.KryptonTextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.cmbEstCiv = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.cmbSexo = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.cmbDocIdent = new com.yupanastudio.igest.winapp.ComboBoxMy();
            this.txtMat = new Krypton.Toolkit.KryptonTextBox();
            this.txtDocIdent = new Krypton.Toolkit.KryptonTextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label18 = new System.Windows.Forms.Label();
            this.label19 = new System.Windows.Forms.Label();
            this.label20 = new System.Windows.Forms.Label();
            this.txtPat = new Krypton.Toolkit.KryptonTextBox();
            this.label28 = new System.Windows.Forms.Label();
            this.lblDataOK = new System.Windows.Forms.Label();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pnl2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pnl2.Panel)).BeginInit();
            this.pnl2.Panel.SuspendLayout();
            this.pnl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pnl1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pnl1.Panel)).BeginInit();
            this.pnl1.Panel.SuspendLayout();
            this.pnl1.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.lblDataOK);
            this.pnlMain.Controls.Add(this.pnl1);
            this.pnlMain.Controls.Add(this.lblOtros);
            this.pnlMain.Controls.Add(this.pnl2);
            this.pnlMain.Controls.Add(this.label35);
            this.pnlMain.Size = new System.Drawing.Size(800, 495);
            this.pnlMain.Controls.SetChildIndex(this.label35, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnl2, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblOtros, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnl1, 0);
            this.pnlMain.Controls.SetChildIndex(this.lblDataOK, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(800, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(575, 18);
            this.lblTitle.Text = "FAMILIAR DEL ESTUDIANTE";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 455);
            this.pnlFooter.Size = new System.Drawing.Size(800, 40);
            this.pnlFooter.TabIndex = 2;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(405, 6);
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(285, 6);
            this.toolTip.SetToolTip(this.btnOk, "Guardar los cambios.");
            this.btnOk.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnOk.Values.Image")));
            this.btnOk.Values.Text = "&Guardar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(663, 5);
            // 
            // label35
            // 
            this.label35.AutoSize = true;
            this.label35.BackColor = System.Drawing.Color.Transparent;
            this.label35.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label35.Location = new System.Drawing.Point(8, 40);
            this.label35.Name = "label35";
            this.label35.Size = new System.Drawing.Size(104, 16);
            this.label35.TabIndex = 106;
            this.label35.Text = "Datos Generales";
            this.label35.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // lblOtros
            // 
            this.lblOtros.AutoSize = true;
            this.lblOtros.BackColor = System.Drawing.Color.Transparent;
            this.lblOtros.Font = new System.Drawing.Font("Arial", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblOtros.Location = new System.Drawing.Point(8, 275);
            this.lblOtros.Name = "lblOtros";
            this.lblOtros.Size = new System.Drawing.Size(172, 16);
            this.lblOtros.TabIndex = 151;
            this.lblOtros.Text = "Datos de Contacto y Laboral";
            this.lblOtros.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // pnl2
            // 
            this.pnl2.CaptionStyle = Krypton.Toolkit.LabelStyle.NormalControl;
            this.pnl2.Location = new System.Drawing.Point(10, 295);
            this.pnl2.Name = "pnl2";
            // 
            // pnl2.Panel
            // 
            this.pnl2.Panel.Controls.Add(this.txtCelular);
            this.pnl2.Panel.Controls.Add(this.txtCorreo);
            this.pnl2.Panel.Controls.Add(this.txtFijo);
            this.pnl2.Panel.Controls.Add(this.txtOcupacion);
            this.pnl2.Panel.Controls.Add(this.txtCenLabDet);
            this.pnl2.Panel.Controls.Add(this.btnDir);
            this.pnl2.Panel.Controls.Add(this.txtCenLab);
            this.pnl2.Panel.Controls.Add(this.txtDir);
            this.pnl2.Panel.Controls.Add(this.label4);
            this.pnl2.Panel.Controls.Add(this.label21);
            this.pnl2.Panel.Controls.Add(this.label17);
            this.pnl2.Panel.Controls.Add(this.label23);
            this.pnl2.Panel.Controls.Add(this.label32);
            this.pnl2.Panel.Controls.Add(this.label24);
            this.pnl2.Panel.Controls.Add(this.label25);
            this.pnl2.Size = new System.Drawing.Size(780, 145);
            this.pnl2.StateCommon.Back.Color1 = System.Drawing.Color.PaleTurquoise;
            this.pnl2.StateCommon.Content.ShortText.Color1 = System.Drawing.Color.Navy;
            this.pnl2.StateCommon.Content.ShortText.Font = new System.Drawing.Font("Arial", 9F);
            this.pnl2.TabIndex = 1;
            this.pnl2.Values.Heading = "";
            // 
            // txtCelular
            // 
            this.txtCelular.CutCopyMaskFormat = System.Windows.Forms.MaskFormat.ExcludePromptAndLiterals;
            this.txtCelular.Location = new System.Drawing.Point(508, 45);
            this.txtCelular.Mask = "000 000 000";
            this.txtCelular.Name = "txtCelular";
            this.txtCelular.Size = new System.Drawing.Size(260, 23);
            this.txtCelular.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtCelular.TabIndex = 3;
            this.txtCelular.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtCelular.TextMaskFormat = System.Windows.Forms.MaskFormat.ExcludePromptAndLiterals;
            this.txtCelular.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // txtCorreo
            // 
            this.txtCorreo.CharacterCasing = System.Windows.Forms.CharacterCasing.Lower;
            this.txtCorreo.Location = new System.Drawing.Point(104, 75);
            this.txtCorreo.MaxLength = 75;
            this.txtCorreo.Name = "txtCorreo";
            this.txtCorreo.Size = new System.Drawing.Size(260, 23);
            this.txtCorreo.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtCorreo.TabIndex = 4;
            this.txtCorreo.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // txtFijo
            // 
            this.txtFijo.CutCopyMaskFormat = System.Windows.Forms.MaskFormat.ExcludePromptAndLiterals;
            this.txtFijo.Location = new System.Drawing.Point(104, 45);
            this.txtFijo.Mask = "000 000 000";
            this.txtFijo.Name = "txtFijo";
            this.txtFijo.Size = new System.Drawing.Size(260, 23);
            this.txtFijo.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtFijo.TabIndex = 2;
            this.txtFijo.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtFijo.TextMaskFormat = System.Windows.Forms.MaskFormat.ExcludePromptAndLiterals;
            this.txtFijo.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // txtOcupacion
            // 
            this.txtOcupacion.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtOcupacion.Location = new System.Drawing.Point(508, 75);
            this.txtOcupacion.MaxLength = 75;
            this.txtOcupacion.Name = "txtOcupacion";
            this.txtOcupacion.Size = new System.Drawing.Size(260, 23);
            this.txtOcupacion.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtOcupacion.TabIndex = 5;
            this.txtOcupacion.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // txtCenLabDet
            // 
            this.txtCenLabDet.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtCenLabDet.Location = new System.Drawing.Point(508, 105);
            this.txtCenLabDet.MaxLength = 100;
            this.txtCenLabDet.Name = "txtCenLabDet";
            this.txtCenLabDet.Size = new System.Drawing.Size(260, 23);
            this.txtCenLabDet.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtCenLabDet.TabIndex = 7;
            this.txtCenLabDet.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // btnDir
            // 
            this.btnDir.Location = new System.Drawing.Point(738, 15);
            this.btnDir.Name = "btnDir";
            this.btnDir.Size = new System.Drawing.Size(30, 22);
            this.btnDir.TabIndex = 1;
            this.toolTip.SetToolTip(this.btnDir, "Establecer \"Dirección\".");
            this.btnDir.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnDir.Values.Image")));
            this.btnDir.Values.Text = "";
            this.btnDir.Click += new System.EventHandler(this.btnDir_Click);
            // 
            // txtCenLab
            // 
            this.txtCenLab.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtCenLab.Location = new System.Drawing.Point(104, 105);
            this.txtCenLab.MaxLength = 75;
            this.txtCenLab.Name = "txtCenLab";
            this.txtCenLab.Size = new System.Drawing.Size(260, 23);
            this.txtCenLab.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtCenLab.TabIndex = 6;
            this.txtCenLab.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // txtDir
            // 
            this.txtDir.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtDir.Enabled = false;
            this.txtDir.Location = new System.Drawing.Point(104, 15);
            this.txtDir.Name = "txtDir";
            this.txtDir.Size = new System.Drawing.Size(633, 23);
            this.txtDir.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtDir.TabIndex = 0;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label4.Location = new System.Drawing.Point(391, 105);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(115, 15);
            this.label4.TabIndex = 140;
            this.label4.Text = "Contacto Cent. Lab.";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.BackColor = System.Drawing.Color.Transparent;
            this.label21.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label21.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label21.Location = new System.Drawing.Point(57, 75);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(45, 15);
            this.label21.TabIndex = 82;
            this.label21.Text = "Correo";
            this.label21.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.BackColor = System.Drawing.Color.Transparent;
            this.label17.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label17.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label17.Location = new System.Drawing.Point(9, 105);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(93, 15);
            this.label17.TabIndex = 131;
            this.label17.Text = "Centro Labores";
            this.label17.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.BackColor = System.Drawing.Color.Transparent;
            this.label23.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label23.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label23.Location = new System.Drawing.Point(43, 15);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(59, 15);
            this.label23.TabIndex = 78;
            this.label23.Text = "Dirección";
            this.label23.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label32
            // 
            this.label32.AutoSize = true;
            this.label32.BackColor = System.Drawing.Color.Transparent;
            this.label32.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label32.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label32.Location = new System.Drawing.Point(440, 75);
            this.label32.Name = "label32";
            this.label32.Size = new System.Drawing.Size(66, 15);
            this.label32.TabIndex = 114;
            this.label32.Text = "Ocupación";
            this.label32.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label24
            // 
            this.label24.AutoSize = true;
            this.label24.BackColor = System.Drawing.Color.Transparent;
            this.label24.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label24.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label24.Location = new System.Drawing.Point(459, 45);
            this.label24.Name = "label24";
            this.label24.Size = new System.Drawing.Size(47, 15);
            this.label24.TabIndex = 70;
            this.label24.Text = "Celular";
            this.label24.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label25
            // 
            this.label25.AutoSize = true;
            this.label25.BackColor = System.Drawing.Color.Transparent;
            this.label25.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label25.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label25.Location = new System.Drawing.Point(25, 45);
            this.label25.Name = "label25";
            this.label25.Size = new System.Drawing.Size(77, 15);
            this.label25.TabIndex = 57;
            this.label25.Text = "Teléfono Fijo";
            this.label25.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbSitEdu
            // 
            this.cmbSitEdu.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbSitEdu.DisplayMember = "nomTipo";
            this.cmbSitEdu.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSitEdu.DropDownWidth = 280;
            this.cmbSitEdu.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbSitEdu.FormattingEnabled = true;
            this.cmbSitEdu.Location = new System.Drawing.Point(104, 165);
            this.cmbSitEdu.Name = "cmbSitEdu";
            this.cmbSitEdu.Size = new System.Drawing.Size(260, 21);
            this.cmbSitEdu.TabIndex = 13;
            this.cmbSitEdu.ValueMember = "idTipo";
            // 
            // lblSitEduc
            // 
            this.lblSitEduc.AutoSize = true;
            this.lblSitEduc.BackColor = System.Drawing.Color.Transparent;
            this.lblSitEduc.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSitEduc.ForeColor = System.Drawing.Color.MidnightBlue;
            this.lblSitEduc.Location = new System.Drawing.Point(10, 165);
            this.lblSitEduc.Name = "lblSitEduc";
            this.lblSitEduc.Size = new System.Drawing.Size(92, 15);
            this.lblSitEduc.TabIndex = 143;
            this.lblSitEduc.Text = "Situación Educ.";
            this.lblSitEduc.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // chbViveConAlu
            // 
            this.chbViveConAlu.Location = new System.Drawing.Point(259, 135);
            this.chbViveConAlu.Name = "chbViveConAlu";
            this.chbViveConAlu.Size = new System.Drawing.Size(114, 20);
            this.chbViveConAlu.TabIndex = 10;
            this.chbViveConAlu.Values.Text = "Vive con alumno";
            // 
            // chbApoderado
            // 
            this.chbApoderado.Location = new System.Drawing.Point(175, 135);
            this.chbApoderado.Name = "chbApoderado";
            this.chbApoderado.Size = new System.Drawing.Size(85, 20);
            this.chbApoderado.TabIndex = 9;
            this.chbApoderado.Values.Text = "Apoderado";
            // 
            // pnl1
            // 
            this.pnl1.CaptionStyle = Krypton.Toolkit.LabelStyle.NormalControl;
            this.pnl1.Location = new System.Drawing.Point(10, 60);
            this.pnl1.Name = "pnl1";
            // 
            // pnl1.Panel
            // 
            this.pnl1.Panel.Controls.Add(this.chbViveConAlu);
            this.pnl1.Panel.Controls.Add(this.chbApoderado);
            this.pnl1.Panel.Controls.Add(this.btnInsEst);
            this.pnl1.Panel.Controls.Add(this.cmbParentesco);
            this.pnl1.Panel.Controls.Add(this.label5);
            this.pnl1.Panel.Controls.Add(this.chbFallecido);
            this.pnl1.Panel.Controls.Add(this.txtInsEst);
            this.pnl1.Panel.Controls.Add(this.txtNoms);
            this.pnl1.Panel.Controls.Add(this.label26);
            this.pnl1.Panel.Controls.Add(this.btnNac);
            this.pnl1.Panel.Controls.Add(this.lblInsEst);
            this.pnl1.Panel.Controls.Add(this.txtNac);
            this.pnl1.Panel.Controls.Add(this.label10);
            this.pnl1.Panel.Controls.Add(this.cmbEstCiv);
            this.pnl1.Panel.Controls.Add(this.cmbSexo);
            this.pnl1.Panel.Controls.Add(this.cmbDocIdent);
            this.pnl1.Panel.Controls.Add(this.txtMat);
            this.pnl1.Panel.Controls.Add(this.txtDocIdent);
            this.pnl1.Panel.Controls.Add(this.cmbSitEdu);
            this.pnl1.Panel.Controls.Add(this.label7);
            this.pnl1.Panel.Controls.Add(this.lblSitEduc);
            this.pnl1.Panel.Controls.Add(this.label12);
            this.pnl1.Panel.Controls.Add(this.label18);
            this.pnl1.Panel.Controls.Add(this.label19);
            this.pnl1.Panel.Controls.Add(this.label20);
            this.pnl1.Panel.Controls.Add(this.txtPat);
            this.pnl1.Panel.Controls.Add(this.label28);
            this.pnl1.Size = new System.Drawing.Size(780, 205);
            this.pnl1.StateCommon.Back.Color1 = System.Drawing.Color.PaleTurquoise;
            this.pnl1.StateCommon.Content.ShortText.Color1 = System.Drawing.Color.Navy;
            this.pnl1.StateCommon.Content.ShortText.Font = new System.Drawing.Font("Arial", 9F);
            this.pnl1.TabIndex = 0;
            this.pnl1.Values.Heading = "";
            // 
            // btnInsEst
            // 
            this.btnInsEst.Location = new System.Drawing.Point(738, 165);
            this.btnInsEst.Name = "btnInsEst";
            this.btnInsEst.Size = new System.Drawing.Size(30, 22);
            this.btnInsEst.TabIndex = 15;
            this.toolTip.SetToolTip(this.btnInsEst, "Establecer \"Institución de estudios\".");
            this.btnInsEst.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnInsEst.Values.Image")));
            this.btnInsEst.Values.Text = "";
            this.btnInsEst.Click += new System.EventHandler(this.btnInsEst_Click);
            // 
            // cmbParentesco
            // 
            this.cmbParentesco.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbParentesco.DisplayMember = "nomTipo";
            this.cmbParentesco.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbParentesco.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbParentesco.FormattingEnabled = true;
            this.cmbParentesco.Location = new System.Drawing.Point(104, 45);
            this.cmbParentesco.Name = "cmbParentesco";
            this.cmbParentesco.Size = new System.Drawing.Size(260, 21);
            this.cmbParentesco.TabIndex = 2;
            this.cmbParentesco.ValueMember = "idTipo";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.BackColor = System.Drawing.Color.Transparent;
            this.label5.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label5.Location = new System.Drawing.Point(434, 105);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(72, 15);
            this.label5.TabIndex = 154;
            this.label5.Text = "Estado Civil";
            this.label5.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // chbFallecido
            // 
            this.chbFallecido.Location = new System.Drawing.Point(104, 135);
            this.chbFallecido.Name = "chbFallecido";
            this.chbFallecido.Size = new System.Drawing.Size(71, 20);
            this.chbFallecido.TabIndex = 8;
            this.chbFallecido.Values.Text = "Fallecido";
            // 
            // txtInsEst
            // 
            this.txtInsEst.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtInsEst.Enabled = false;
            this.txtInsEst.Location = new System.Drawing.Point(508, 165);
            this.txtInsEst.Name = "txtInsEst";
            this.txtInsEst.Size = new System.Drawing.Size(229, 23);
            this.txtInsEst.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtInsEst.TabIndex = 14;
            // 
            // txtNoms
            // 
            this.txtNoms.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtNoms.Location = new System.Drawing.Point(508, 75);
            this.txtNoms.MaxLength = 30;
            this.txtNoms.Name = "txtNoms";
            this.txtNoms.Size = new System.Drawing.Size(260, 23);
            this.txtNoms.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtNoms.TabIndex = 5;
            this.txtNoms.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // label26
            // 
            this.label26.AutoSize = true;
            this.label26.BackColor = System.Drawing.Color.Transparent;
            this.label26.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label26.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label26.Location = new System.Drawing.Point(447, 75);
            this.label26.Name = "label26";
            this.label26.Size = new System.Drawing.Size(59, 15);
            this.label26.TabIndex = 147;
            this.label26.Text = "Nombres";
            this.label26.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // btnNac
            // 
            this.btnNac.Location = new System.Drawing.Point(738, 135);
            this.btnNac.Name = "btnNac";
            this.btnNac.Size = new System.Drawing.Size(30, 22);
            this.btnNac.TabIndex = 12;
            this.toolTip.SetToolTip(this.btnNac, "Establecer \"Fecha y Lugar de Nacimiento\".");
            this.btnNac.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnNac.Values.Image")));
            this.btnNac.Values.Text = "";
            this.btnNac.Click += new System.EventHandler(this.btnNac_Click);
            // 
            // lblInsEst
            // 
            this.lblInsEst.AutoSize = true;
            this.lblInsEst.BackColor = System.Drawing.Color.Transparent;
            this.lblInsEst.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblInsEst.ForeColor = System.Drawing.Color.MidnightBlue;
            this.lblInsEst.Location = new System.Drawing.Point(407, 165);
            this.lblInsEst.Name = "lblInsEst";
            this.lblInsEst.Size = new System.Drawing.Size(99, 15);
            this.lblInsEst.TabIndex = 156;
            this.lblInsEst.Text = "Inst. de Estudios";
            this.lblInsEst.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtNac
            // 
            this.txtNac.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtNac.Enabled = false;
            this.txtNac.Location = new System.Drawing.Point(508, 135);
            this.txtNac.Name = "txtNac";
            this.txtNac.Size = new System.Drawing.Size(229, 23);
            this.txtNac.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtNac.TabIndex = 11;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.BackColor = System.Drawing.Color.Transparent;
            this.label10.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label10.Location = new System.Drawing.Point(402, 135);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(104, 15);
            this.label10.TabIndex = 153;
            this.label10.Text = "Fecha y Lug. Nac.";
            this.label10.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // cmbEstCiv
            // 
            this.cmbEstCiv.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbEstCiv.DisplayMember = "nomTipo";
            this.cmbEstCiv.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbEstCiv.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbEstCiv.FormattingEnabled = true;
            this.cmbEstCiv.Location = new System.Drawing.Point(508, 105);
            this.cmbEstCiv.Name = "cmbEstCiv";
            this.cmbEstCiv.Size = new System.Drawing.Size(260, 21);
            this.cmbEstCiv.TabIndex = 7;
            this.cmbEstCiv.ValueMember = "idTipo";
            // 
            // cmbSexo
            // 
            this.cmbSexo.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbSexo.DisplayMember = "nomTipo";
            this.cmbSexo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSexo.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbSexo.FormattingEnabled = true;
            this.cmbSexo.Location = new System.Drawing.Point(104, 105);
            this.cmbSexo.Name = "cmbSexo";
            this.cmbSexo.Size = new System.Drawing.Size(260, 21);
            this.cmbSexo.TabIndex = 6;
            this.cmbSexo.ValueMember = "idTipo";
            // 
            // cmbDocIdent
            // 
            this.cmbDocIdent.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbDocIdent.DisplayMember = "nomCorto";
            this.cmbDocIdent.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDocIdent.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbDocIdent.FormattingEnabled = true;
            this.cmbDocIdent.Location = new System.Drawing.Point(104, 15);
            this.cmbDocIdent.Name = "cmbDocIdent";
            this.cmbDocIdent.Size = new System.Drawing.Size(260, 21);
            this.cmbDocIdent.TabIndex = 0;
            this.cmbDocIdent.ValueMember = "idTipo";
            this.cmbDocIdent.SelectedIndexChanged += new System.EventHandler(this.cmbDocIdent_SelectedIndexChanged);
            // 
            // txtMat
            // 
            this.txtMat.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtMat.Location = new System.Drawing.Point(104, 75);
            this.txtMat.MaxLength = 30;
            this.txtMat.Name = "txtMat";
            this.txtMat.Size = new System.Drawing.Size(260, 23);
            this.txtMat.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtMat.TabIndex = 4;
            this.txtMat.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // txtDocIdent
            // 
            this.txtDocIdent.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtDocIdent.Location = new System.Drawing.Point(508, 15);
            this.txtDocIdent.MaxLength = 20;
            this.txtDocIdent.Name = "txtDocIdent";
            this.txtDocIdent.Size = new System.Drawing.Size(260, 23);
            this.txtDocIdent.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtDocIdent.TabIndex = 1;
            this.txtDocIdent.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.BackColor = System.Drawing.Color.Transparent;
            this.label7.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label7.Location = new System.Drawing.Point(4, 75);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(98, 15);
            this.label7.TabIndex = 155;
            this.label7.Text = "Apellido Materno";
            this.label7.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.BackColor = System.Drawing.Color.Transparent;
            this.label12.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label12.Location = new System.Drawing.Point(394, 15);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(112, 15);
            this.label12.TabIndex = 151;
            this.label12.Text = "Nro. Doc. Identidad";
            this.label12.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.BackColor = System.Drawing.Color.Transparent;
            this.label18.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label18.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label18.Location = new System.Drawing.Point(68, 105);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(34, 15);
            this.label18.TabIndex = 150;
            this.label18.Text = "Sexo";
            this.label18.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.BackColor = System.Drawing.Color.Transparent;
            this.label19.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label19.Location = new System.Drawing.Point(32, 45);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(70, 15);
            this.label19.TabIndex = 149;
            this.label19.Text = "Parentesco";
            this.label19.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.BackColor = System.Drawing.Color.Transparent;
            this.label20.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label20.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label20.Location = new System.Drawing.Point(16, 15);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(86, 15);
            this.label20.TabIndex = 148;
            this.label20.Text = "Doc. Identidad";
            this.label20.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtPat
            // 
            this.txtPat.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtPat.Location = new System.Drawing.Point(508, 45);
            this.txtPat.MaxLength = 30;
            this.txtPat.Name = "txtPat";
            this.txtPat.Size = new System.Drawing.Size(260, 23);
            this.txtPat.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtPat.TabIndex = 3;
            this.txtPat.Enter += new System.EventHandler(this.txtDocIdent_Enter);
            // 
            // label28
            // 
            this.label28.AutoSize = true;
            this.label28.BackColor = System.Drawing.Color.Transparent;
            this.label28.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label28.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label28.Location = new System.Drawing.Point(409, 45);
            this.label28.Name = "label28";
            this.label28.Size = new System.Drawing.Size(97, 15);
            this.label28.TabIndex = 146;
            this.label28.Text = "Apellido Paterno";
            this.label28.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // lblDataOK
            // 
            this.lblDataOK.BackColor = System.Drawing.Color.Transparent;
            this.lblDataOK.Font = new System.Drawing.Font("Arial", 7F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDataOK.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblDataOK.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.check;
            this.lblDataOK.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblDataOK.Location = new System.Drawing.Point(517, 40);
            this.lblDataOK.Name = "lblDataOK";
            this.lblDataOK.Size = new System.Drawing.Size(276, 15);
            this.lblDataOK.TabIndex = 152;
            this.lblDataOK.Text = "Datos validados, algunos datos no se podrá modificar.";
            this.lblDataOK.TextAlign = System.Drawing.ContentAlignment.TopRight;
            this.lblDataOK.Visible = false;
            // 
            // FrmFamiliar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 495);
            this.Name = "FrmFamiliar";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmFamiliar_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pnl2.Panel)).EndInit();
            this.pnl2.Panel.ResumeLayout(false);
            this.pnl2.Panel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pnl2)).EndInit();
            this.pnl2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pnl1.Panel)).EndInit();
            this.pnl1.Panel.ResumeLayout(false);
            this.pnl1.Panel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pnl1)).EndInit();
            this.pnl1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Label label35;
        private System.Windows.Forms.Label lblOtros;
        private Krypton.Toolkit.KryptonGroupBox pnl2;
        private Krypton.Toolkit.KryptonTextBox txtOcupacion;
        private Krypton.Toolkit.KryptonTextBox txtCenLabDet;
        private Krypton.Toolkit.KryptonTextBox txtCenLab;
        private System.Windows.Forms.Label label4;
        private ComboBoxMy cmbSitEdu;
        private System.Windows.Forms.Label lblSitEduc;
        private System.Windows.Forms.Label label17;
        private Krypton.Toolkit.KryptonCheckBox chbViveConAlu;
        private System.Windows.Forms.Label label32;
        private Krypton.Toolkit.KryptonCheckBox chbApoderado;
        private Krypton.Toolkit.KryptonGroupBox pnl1;
        private ComboBoxMy cmbParentesco;
        private System.Windows.Forms.Label label5;
        private Krypton.Toolkit.KryptonButton btnNac;
        private ComboBoxMy cmbEstCiv;
        private Krypton.Toolkit.KryptonTextBox txtNac;
        private ComboBoxMy cmbSexo;
        private ComboBoxMy cmbDocIdent;
        private Krypton.Toolkit.KryptonTextBox txtMat;
        private Krypton.Toolkit.KryptonTextBox txtDocIdent;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Label label20;
        private Krypton.Toolkit.KryptonTextBox txtPat;
        private System.Windows.Forms.Label label26;
        private Krypton.Toolkit.KryptonTextBox txtNoms;
        private System.Windows.Forms.Label label28;
        private Krypton.Toolkit.KryptonTextBox txtCorreo;
        private Krypton.Toolkit.KryptonButton btnDir;
        private Krypton.Toolkit.KryptonTextBox txtDir;
        private System.Windows.Forms.Label label21;
        private System.Windows.Forms.Label label23;
        private System.Windows.Forms.Label label24;
        private System.Windows.Forms.Label label25;
        private System.Windows.Forms.Label lblDataOK;
        private Krypton.Toolkit.KryptonButton btnInsEst;
        private Krypton.Toolkit.KryptonTextBox txtInsEst;
        private System.Windows.Forms.Label lblInsEst;
        private Krypton.Toolkit.KryptonCheckBox chbFallecido;
        private Krypton.Toolkit.KryptonMaskedTextBox txtCelular;
        private Krypton.Toolkit.KryptonMaskedTextBox txtFijo;
    }
}