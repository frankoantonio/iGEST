namespace com.yupanastudio.polariss.app
{
    partial class FrmGrupoFam
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmGrupoFam));
            this.label7 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtProced = new Krypton.Toolkit.KryptonTextBox();
            this.txtNomGrp = new Krypton.Toolkit.KryptonTextBox();
            this.txtCodigo = new Krypton.Toolkit.KryptonTextBox();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.label4);
            this.pnlMain.Controls.Add(this.label5);
            this.pnlMain.Controls.Add(this.txtCodigo);
            this.pnlMain.Controls.Add(this.txtNomGrp);
            this.pnlMain.Controls.Add(this.label7);
            this.pnlMain.Controls.Add(this.txtProced);
            this.pnlMain.Size = new System.Drawing.Size(420, 160);
            this.pnlMain.Controls.SetChildIndex(this.txtProced, 0);
            this.pnlMain.Controls.SetChildIndex(this.label7, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtNomGrp, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtCodigo, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.label5, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.label4, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(420, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(122, 15);
            this.lblTitle.Text = "GRUPO FAMILIAR";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 120);
            this.pnlFooter.Size = new System.Drawing.Size(420, 40);
            this.pnlFooter.TabIndex = 6;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(215, 6);
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(95, 6);
            this.toolTip.SetToolTip(this.btnOk, "Guardar los cambios.");
            this.btnOk.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnOk.Values.Image")));
            this.btnOk.Values.Text = "&Guardar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(282, 5);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.BackColor = System.Drawing.Color.Transparent;
            this.label7.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label7.Location = new System.Drawing.Point(8, 50);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(89, 15);
            this.label7.TabIndex = 201;
            this.label7.Text = "Nombre Grupo";
            this.label7.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.BackColor = System.Drawing.Color.Transparent;
            this.label5.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label5.Location = new System.Drawing.Point(21, 80);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(76, 15);
            this.label5.TabIndex = 200;
            this.label5.Text = "Procedencia";
            this.label5.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label4.Location = new System.Drawing.Point(260, 80);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(47, 15);
            this.label4.TabIndex = 163;
            this.label4.Text = "Código";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtProced
            // 
            this.txtProced.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtProced.Location = new System.Drawing.Point(100, 80);
            this.txtProced.MaxLength = 30;
            this.txtProced.Name = "txtProced";
            this.txtProced.Size = new System.Drawing.Size(150, 23);
            this.txtProced.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.txtProced.TabIndex = 1;
            // 
            // txtNomGrp
            // 
            this.txtNomGrp.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtNomGrp.Location = new System.Drawing.Point(100, 50);
            this.txtNomGrp.MaxLength = 30;
            this.txtNomGrp.Name = "txtNomGrp";
            this.txtNomGrp.Size = new System.Drawing.Size(310, 23);
            this.txtNomGrp.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.txtNomGrp.TabIndex = 0;
            // 
            // txtCodigo
            // 
            this.txtCodigo.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtCodigo.Enabled = false;
            this.txtCodigo.Location = new System.Drawing.Point(310, 80);
            this.txtCodigo.MaxLength = 30;
            this.txtCodigo.Name = "txtCodigo";
            this.txtCodigo.Size = new System.Drawing.Size(100, 23);
            this.txtCodigo.StateDisabled.Content.Color1 = System.Drawing.Color.DimGray;
            this.txtCodigo.TabIndex = 2;
            // 
            // FrmGrupoFam
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(420, 160);
            this.Name = "FrmGrupoFam";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmGrpFam_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private Krypton.Toolkit.KryptonTextBox txtCodigo;
        private Krypton.Toolkit.KryptonTextBox txtNomGrp;
        private System.Windows.Forms.Label label7;
        private Krypton.Toolkit.KryptonTextBox txtProced;
    }
}