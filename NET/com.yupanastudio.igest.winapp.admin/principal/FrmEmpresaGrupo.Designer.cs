namespace com.yupanastudio.polariss.app
{
    partial class FrmEmpresaGrupo
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmEmpresaGrupo));
            this.txtCodGrp = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.txtNomGrp = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.nudIdGrp = new ComponentFactory.Krypton.Toolkit.KryptonNumericUpDown();
            this.label15 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.label2);
            this.pnlMain.Controls.Add(this.label1);
            this.pnlMain.Controls.Add(this.label15);
            this.pnlMain.Controls.Add(this.nudIdGrp);
            this.pnlMain.Controls.Add(this.txtNomGrp);
            this.pnlMain.Controls.Add(this.txtCodGrp);
            this.pnlMain.Size = new System.Drawing.Size(455, 190);
            this.pnlMain.Controls.SetChildIndex(this.txtCodGrp, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtNomGrp, 0);
            this.pnlMain.Controls.SetChildIndex(this.nudIdGrp, 0);
            this.pnlMain.Controls.SetChildIndex(this.label15, 0);
            this.pnlMain.Controls.SetChildIndex(this.label1, 0);
            this.pnlMain.Controls.SetChildIndex(this.label2, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(455, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(156, 15);
            this.lblTitle.Text = "GRUPO EMPRESARIAL";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 150);
            this.pnlFooter.Size = new System.Drawing.Size(455, 40);
            this.pnlFooter.TabIndex = 3;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(285, 6);
            this.toolTip.SetToolTip(this.btnCancel, "Cancela la operación");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(165, 6);
            this.btnOk.Values.Image = global::com.yupanastudio.polariss.app.Properties.Resources.row_save;
            this.btnOk.Values.Text = "&Guardar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(328, 6);
            // 
            // txtCodGrp
            // 
            this.txtCodGrp.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtCodGrp.Location = new System.Drawing.Point(125, 80);
            this.txtCodGrp.MaxLength = 6;
            this.txtCodGrp.Name = "txtCodGrp";
            this.txtCodGrp.Size = new System.Drawing.Size(180, 23);
            this.txtCodGrp.TabIndex = 1;
            // 
            // txtNomGrp
            // 
            this.txtNomGrp.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtNomGrp.Location = new System.Drawing.Point(125, 110);
            this.txtNomGrp.MaxLength = 100;
            this.txtNomGrp.Name = "txtNomGrp";
            this.txtNomGrp.Size = new System.Drawing.Size(320, 23);
            this.txtNomGrp.TabIndex = 2;
            // 
            // nudIdGrp
            // 
            this.nudIdGrp.Enabled = false;
            this.nudIdGrp.Location = new System.Drawing.Point(125, 50);
            this.nudIdGrp.Maximum = new decimal(new int[] {
            9999,
            0,
            0,
            0});
            this.nudIdGrp.Minimum = new decimal(new int[] {
            101,
            0,
            0,
            0});
            this.nudIdGrp.Name = "nudIdGrp";
            this.nudIdGrp.Size = new System.Drawing.Size(180, 22);
            this.nudIdGrp.TabIndex = 0;
            this.nudIdGrp.TabStop = false;
            this.nudIdGrp.Value = new decimal(new int[] {
            1000,
            0,
            0,
            0});
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.BackColor = System.Drawing.Color.Transparent;
            this.label15.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label15.ForeColor = System.Drawing.Color.Navy;
            this.label15.Location = new System.Drawing.Point(62, 50);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(57, 15);
            this.label15.TabIndex = 39;
            this.label15.Text = "Id. Grupo";
            this.label15.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Navy;
            this.label1.Location = new System.Drawing.Point(72, 80);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(47, 15);
            this.label1.TabIndex = 40;
            this.label1.Text = "Código";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Navy;
            this.label2.Location = new System.Drawing.Point(7, 110);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(112, 15);
            this.label2.TabIndex = 41;
            this.label2.Text = "Grupo Empresarial";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // FrmEmpresaGrupo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(455, 190);
            this.Name = "FrmEmpresaGrupo";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmEmpresa_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtCodGrp;
        private ComponentFactory.Krypton.Toolkit.KryptonNumericUpDown nudIdGrp;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtNomGrp;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label15;
    }
}