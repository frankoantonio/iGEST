namespace com.yupanastudio.polariss.app
{
    partial class FrmDescalificar
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmDescalificar));
            this.txtPorque = new Krypton.Toolkit.KryptonTextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.label20 = new System.Windows.Forms.Label();
            this.label26 = new System.Windows.Forms.Label();
            this.txtInsEdu = new Krypton.Toolkit.KryptonTextBox();
            this.cmbMotivo = new com.yupanastudio.polariss.app.ComboBoxMy();
            this.txtObs = new Krypton.Toolkit.KryptonTextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.rbtYes = new Krypton.Toolkit.KryptonRadioButton();
            this.rbtNo = new Krypton.Toolkit.KryptonRadioButton();
            this.btnInsEdu = new Krypton.Toolkit.KryptonButton();
            this.cmbTipoAtencion = new com.yupanastudio.polariss.app.ComboBoxMy();
            this.label4 = new System.Windows.Forms.Label();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.cmbTipoAtencion);
            this.pnlMain.Controls.Add(this.label4);
            this.pnlMain.Controls.Add(this.btnInsEdu);
            this.pnlMain.Controls.Add(this.rbtNo);
            this.pnlMain.Controls.Add(this.rbtYes);
            this.pnlMain.Controls.Add(this.txtObs);
            this.pnlMain.Controls.Add(this.label1);
            this.pnlMain.Controls.Add(this.cmbMotivo);
            this.pnlMain.Controls.Add(this.txtInsEdu);
            this.pnlMain.Controls.Add(this.txtPorque);
            this.pnlMain.Controls.Add(this.label26);
            this.pnlMain.Controls.Add(this.label10);
            this.pnlMain.Controls.Add(this.label20);
            this.pnlMain.Size = new System.Drawing.Size(500, 274);
            this.pnlMain.Controls.SetChildIndex(this.label20, 0);
            this.pnlMain.Controls.SetChildIndex(this.label10, 0);
            this.pnlMain.Controls.SetChildIndex(this.label26, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtPorque, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtInsEdu, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbMotivo, 0);
            this.pnlMain.Controls.SetChildIndex(this.label1, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtObs, 0);
            this.pnlMain.Controls.SetChildIndex(this.rbtYes, 0);
            this.pnlMain.Controls.SetChildIndex(this.rbtNo, 0);
            this.pnlMain.Controls.SetChildIndex(this.btnInsEdu, 0);
            this.pnlMain.Controls.SetChildIndex(this.label4, 0);
            this.pnlMain.Controls.SetChildIndex(this.cmbTipoAtencion, 0);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(130, 15);
            this.lblTitle.Text = "DESCALIFICACIÓN";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 234);
            this.pnlFooter.TabIndex = 8;
            // 
            // btnCancel
            // 
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.toolTip.SetToolTip(this.btnOk, "Guardar los cambios.");
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_save;
            this.btnOk.Values.Text = "&Guardar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(363, 5);
            // 
            // txtPorque
            // 
            this.txtPorque.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtPorque.Enabled = false;
            this.txtPorque.Location = new System.Drawing.Point(73, 110);
            this.txtPorque.MaxLength = 50;
            this.txtPorque.Name = "txtPorque";
            this.txtPorque.Size = new System.Drawing.Size(417, 23);
            this.txtPorque.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtPorque.TabIndex = 4;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.BackColor = System.Drawing.Color.Transparent;
            this.label10.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label10.Location = new System.Drawing.Point(21, 80);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(50, 15);
            this.label10.TabIndex = 1;
            this.label10.Text = "Colegio";
            this.label10.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.BackColor = System.Drawing.Color.Transparent;
            this.label20.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label20.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label20.Location = new System.Drawing.Point(30, 50);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(41, 15);
            this.label20.TabIndex = 0;
            this.label20.Text = "Motivo";
            this.label20.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label26
            // 
            this.label26.AutoSize = true;
            this.label26.BackColor = System.Drawing.Color.Transparent;
            this.label26.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label26.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label26.Location = new System.Drawing.Point(7, 110);
            this.label26.Name = "label26";
            this.label26.Size = new System.Drawing.Size(64, 15);
            this.label26.TabIndex = 2;
            this.label26.Text = "¿Por qué?";
            this.label26.TextAlign = System.Drawing.ContentAlignment.TopRight;
            this.toolTip.SetToolTip(this.label26, "Motivo por el cual eligió otra institución de estudio.");
            // 
            // txtInsEdu
            // 
            this.txtInsEdu.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtInsEdu.Enabled = false;
            this.txtInsEdu.Location = new System.Drawing.Point(73, 80);
            this.txtInsEdu.MaxLength = 20;
            this.txtInsEdu.Name = "txtInsEdu";
            this.txtInsEdu.Size = new System.Drawing.Size(386, 23);
            this.txtInsEdu.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtInsEdu.TabIndex = 2;
            // 
            // cmbMotivo
            // 
            this.cmbMotivo.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbMotivo.DisplayMember = "nomTipo";
            this.cmbMotivo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbMotivo.DropDownWidth = 250;
            this.cmbMotivo.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbMotivo.FormattingEnabled = true;
            this.cmbMotivo.Location = new System.Drawing.Point(73, 50);
            this.cmbMotivo.Name = "cmbMotivo";
            this.cmbMotivo.Size = new System.Drawing.Size(165, 21);
            this.cmbMotivo.TabIndex = 0;
            this.cmbMotivo.ValueMember = "idTipo";
            this.cmbMotivo.SelectedIndexChanged += new System.EventHandler(this.cmbMotivo_SelectedIndexChanged);
            // 
            // txtObs
            // 
            this.txtObs.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtObs.Location = new System.Drawing.Point(73, 200);
            this.txtObs.MaxLength = 50;
            this.txtObs.Name = "txtObs";
            this.txtObs.Size = new System.Drawing.Size(417, 23);
            this.txtObs.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtObs.TabIndex = 7;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(38, 200);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(33, 15);
            this.label1.TabIndex = 170;
            this.label1.Text = "Obs.";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // rbtYes
            // 
            this.rbtYes.Location = new System.Drawing.Point(73, 140);
            this.rbtYes.Name = "rbtYes";
            this.rbtYes.Size = new System.Drawing.Size(251, 20);
            this.rbtYes.TabIndex = 5;
            this.rbtYes.Values.Text = "Acepta lo llamemos la siguiente campaña.";
            // 
            // rbtNo
            // 
            this.rbtNo.Location = new System.Drawing.Point(73, 170);
            this.rbtNo.Name = "rbtNo";
            this.rbtNo.Size = new System.Drawing.Size(240, 20);
            this.rbtNo.TabIndex = 6;
            this.rbtNo.Values.Text = "No desea ser contactado en lo sucesivo.";
            // 
            // btnInsEdu
            // 
            this.btnInsEdu.Enabled = false;
            this.btnInsEdu.Location = new System.Drawing.Point(460, 80);
            this.btnInsEdu.Name = "btnInsEdu";
            this.btnInsEdu.Size = new System.Drawing.Size(30, 22);
            this.btnInsEdu.TabIndex = 3;
            this.btnInsEdu.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnInsEdu.Values.Image")));
            this.btnInsEdu.Values.Text = "";
            this.btnInsEdu.Click += new System.EventHandler(this.btnInsEdu_Click);
            // 
            // cmbTipoAtencion
            // 
            this.cmbTipoAtencion.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(177)))), ((int)(((byte)(192)))), ((int)(((byte)(214)))));
            this.cmbTipoAtencion.DisplayMember = "nomTipo";
            this.cmbTipoAtencion.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTipoAtencion.DropDownWidth = 200;
            this.cmbTipoAtencion.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbTipoAtencion.FormattingEnabled = true;
            this.cmbTipoAtencion.Location = new System.Drawing.Point(325, 50);
            this.cmbTipoAtencion.Name = "cmbTipoAtencion";
            this.cmbTipoAtencion.Size = new System.Drawing.Size(165, 21);
            this.cmbTipoAtencion.TabIndex = 1;
            this.cmbTipoAtencion.ValueMember = "idTipo";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label4.Location = new System.Drawing.Point(267, 50);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(56, 15);
            this.label4.TabIndex = 172;
            this.label4.Text = "Contacto";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // FrmDescalificar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(500, 274);
            this.Name = "FrmDescalificar";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmDescalificar_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private Krypton.Toolkit.KryptonTextBox txtPorque;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label20;
        private System.Windows.Forms.Label label26;
        private Krypton.Toolkit.KryptonTextBox txtInsEdu;
        private ComboBoxMy cmbMotivo;
        private Krypton.Toolkit.KryptonTextBox txtObs;
        private System.Windows.Forms.Label label1;
        private Krypton.Toolkit.KryptonRadioButton rbtNo;
        private Krypton.Toolkit.KryptonRadioButton rbtYes;
        private Krypton.Toolkit.KryptonButton btnInsEdu;
        private ComboBoxMy cmbTipoAtencion;
        private System.Windows.Forms.Label label4;
    }
}