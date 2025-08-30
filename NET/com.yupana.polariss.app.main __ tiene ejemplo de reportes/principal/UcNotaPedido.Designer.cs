namespace com.yupana.polariss.app.main.principal
{
    partial class UcNotaPedido
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
            this.kryptonDropButton1 = new ComponentFactory.Krypton.Toolkit.KryptonDropButton();
            this.SuspendLayout();
            // 
            // kryptonDropButton1
            // 
            this.kryptonDropButton1.Location = new System.Drawing.Point(190, 62);
            this.kryptonDropButton1.Name = "kryptonDropButton1";
            this.kryptonDropButton1.Size = new System.Drawing.Size(131, 25);
            this.kryptonDropButton1.TabIndex = 0;
            this.kryptonDropButton1.Values.Text = "kryptonDropButton1";
            // 
            // UcNotaPedido
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.kryptonDropButton1);
            this.Name = "UcNotaPedido";
            this.Size = new System.Drawing.Size(490, 226);
            this.ResumeLayout(false);

        }

        #endregion

        private ComponentFactory.Krypton.Toolkit.KryptonDropButton kryptonDropButton1;
    }
}
