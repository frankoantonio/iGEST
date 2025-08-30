namespace com.yupanastudio.polariss.app.principal
{
    partial class UcFondo
    {
        /// <summary> 
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de componentes
        /// <summary> 
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.imgFondo = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.imgFondo)).BeginInit();
            this.SuspendLayout();
            // 
            // imgFondo
            // 
            this.imgFondo.Image = global::com.yupanastudio.polariss.app.Properties.Resources.banner_neg_10001;
            this.imgFondo.Location = new System.Drawing.Point(0, 0);
            this.imgFondo.Name = "imgFondo";
            this.imgFondo.Size = new System.Drawing.Size(1000, 620);
            this.imgFondo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.imgFondo.TabIndex = 0;
            this.imgFondo.TabStop = false;
            // 
            // UcFondo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.imgFondo);
            this.Name = "UcFondo";
            this.Size = new System.Drawing.Size(1000, 620);
            ((System.ComponentModel.ISupportInitialize)(this.imgFondo)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox imgFondo;
    }
}
