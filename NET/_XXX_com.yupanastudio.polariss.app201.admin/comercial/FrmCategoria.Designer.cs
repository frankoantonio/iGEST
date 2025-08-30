namespace com.yupanastudio.polariss.app
{
    partial class FrmCategoria
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmCategoria));
            this.label19 = new System.Windows.Forms.Label();
            this.txtNombre = new Krypton.Toolkit.KryptonTextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.txtCodigo = new Krypton.Toolkit.KryptonTextBox();
            this.btnClaseSunat = new Krypton.Toolkit.KryptonButton();
            this.nudOrden = new Krypton.Toolkit.KryptonNumericUpDown();
            this.label1 = new System.Windows.Forms.Label();
            this.txtClase = new Krypton.Toolkit.KryptonTextBox();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.btnClaseSunat);
            this.pnlMain.Controls.Add(this.nudOrden);
            this.pnlMain.Controls.Add(this.label1);
            this.pnlMain.Controls.Add(this.txtClase);
            this.pnlMain.Controls.Add(this.label9);
            this.pnlMain.Controls.Add(this.label19);
            this.pnlMain.Controls.Add(this.label8);
            this.pnlMain.Controls.Add(this.txtNombre);
            this.pnlMain.Controls.Add(this.txtCodigo);
            this.pnlMain.Size = new System.Drawing.Size(420, 182);
            this.pnlMain.Controls.SetChildIndex(this.txtCodigo, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtNombre, 0);
            this.pnlMain.Controls.SetChildIndex(this.label8, 0);
            this.pnlMain.Controls.SetChildIndex(this.label19, 0);
            this.pnlMain.Controls.SetChildIndex(this.label9, 0);
            this.pnlMain.Controls.SetChildIndex(this.txtClase, 0);
            this.pnlMain.Controls.SetChildIndex(this.label1, 0);
            this.pnlMain.Controls.SetChildIndex(this.nudOrden, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            this.pnlMain.Controls.SetChildIndex(this.btnClaseSunat, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(420, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(84, 20);
            this.lblTitle.Text = "CATEGORÍA";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Location = new System.Drawing.Point(0, 140);
            this.pnlFooter.Size = new System.Drawing.Size(420, 40);
            this.pnlFooter.TabIndex = 5;
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
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_save;
            this.btnOk.Values.Text = "&Guardar";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(281, 6);
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.BackColor = System.Drawing.Color.Transparent;
            this.label19.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label19.Location = new System.Drawing.Point(7, 75);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(52, 15);
            this.label19.TabIndex = 65;
            this.label19.Text = "Nombre";
            this.label19.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtNombre
            // 
            this.txtNombre.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtNombre.Location = new System.Drawing.Point(62, 75);
            this.txtNombre.MaxLength = 100;
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(348, 23);
            this.txtNombre.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtNombre.TabIndex = 2;
            this.txtNombre.Enter += new System.EventHandler(this.txtCodigo_Enter);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.BackColor = System.Drawing.Color.Transparent;
            this.label8.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label8.Location = new System.Drawing.Point(303, 45);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(41, 15);
            this.label8.TabIndex = 2;
            this.label8.Text = "Orden";
            this.label8.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.BackColor = System.Drawing.Color.Transparent;
            this.label9.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label9.Location = new System.Drawing.Point(12, 45);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(47, 15);
            this.label9.TabIndex = 0;
            this.label9.Text = "Código";
            this.label9.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtCodigo
            // 
            this.txtCodigo.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtCodigo.Location = new System.Drawing.Point(62, 45);
            this.txtCodigo.MaxLength = 5;
            this.txtCodigo.Name = "txtCodigo";
            this.txtCodigo.Size = new System.Drawing.Size(209, 23);
            this.txtCodigo.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtCodigo.TabIndex = 0;
            this.txtCodigo.Enter += new System.EventHandler(this.txtCodigo_Enter);
            // 
            // btnClaseSunat
            // 
            this.btnClaseSunat.Location = new System.Drawing.Point(370, 105);
            this.btnClaseSunat.Name = "btnClaseSunat";
            this.btnClaseSunat.Size = new System.Drawing.Size(40, 25);
            this.btnClaseSunat.TabIndex = 4;
            this.toolTip.SetToolTip(this.btnClaseSunat, "Selecciona una \"Clase\" del catálogo SUNAT.");
            this.btnClaseSunat.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.row_load;
            this.btnClaseSunat.Values.Text = "";
            this.btnClaseSunat.Click += new System.EventHandler(this.btnClaseSunat_Click);
            // 
            // nudOrden
            // 
            this.nudOrden.Location = new System.Drawing.Point(347, 45);
            this.nudOrden.Maximum = new decimal(new int[] {
            1000000,
            0,
            0,
            0});
            this.nudOrden.Name = "nudOrden";
            this.nudOrden.Size = new System.Drawing.Size(63, 22);
            this.nudOrden.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label1.Location = new System.Drawing.Point(19, 105);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 15);
            this.label1.TabIndex = 70;
            this.label1.Text = "Clase";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // txtClase
            // 
            this.txtClase.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtClase.Enabled = false;
            this.txtClase.Location = new System.Drawing.Point(62, 105);
            this.txtClase.Name = "txtClase";
            this.txtClase.Size = new System.Drawing.Size(306, 23);
            this.txtClase.StateDisabled.Content.Color1 = System.Drawing.Color.Brown;
            this.txtClase.TabIndex = 3;
            // 
            // FrmCategoria
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(420, 180);
            this.Name = "FrmCategoria";
            this.Text = "d";
            this.Load += new System.EventHandler(this.FrmCategoria_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Label label19;
        private Krypton.Toolkit.KryptonTextBox txtNombre;
        private Krypton.Toolkit.KryptonTextBox txtCodigo;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label1;
        private Krypton.Toolkit.KryptonTextBox txtClase;
        private Krypton.Toolkit.KryptonNumericUpDown nudOrden;
        private Krypton.Toolkit.KryptonButton btnClaseSunat;
    }
}