namespace com.yupanastudio.igest.winapp
{
    partial class FrmDireccionMap
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmDireccionMap));
            this.gmap = new GMap.NET.WindowsForms.GMapControl();
            this.txtLat = new Krypton.Toolkit.KryptonTextBox();
            this.txtLgt = new Krypton.Toolkit.KryptonTextBox();
            this.kryptonLabel1 = new Krypton.Toolkit.KryptonLabel();
            this.pnlMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).BeginInit();
            this.pnlFooter.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.gmap);
            this.pnlMain.Size = new System.Drawing.Size(900, 600);
            this.pnlMain.Controls.SetChildIndex(this.gmap, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlFooter, 0);
            this.pnlMain.Controls.SetChildIndex(this.pnlHeader, 0);
            // 
            // pnlHeader
            // 
            this.pnlHeader.Size = new System.Drawing.Size(900, 30);
            // 
            // lblTitle
            // 
            this.lblTitle.Size = new System.Drawing.Size(193, 20);
            this.lblTitle.Text = "COORDENADAS DIRECCIÓN";
            // 
            // pnlFooter
            // 
            this.pnlFooter.Controls.Add(this.kryptonLabel1);
            this.pnlFooter.Controls.Add(this.txtLgt);
            this.pnlFooter.Controls.Add(this.txtLat);
            this.pnlFooter.Location = new System.Drawing.Point(0, 560);
            this.pnlFooter.Size = new System.Drawing.Size(900, 40);
            this.pnlFooter.TabIndex = 10;
            this.pnlFooter.Controls.SetChildIndex(this.txtLat, 0);
            this.pnlFooter.Controls.SetChildIndex(this.txtLgt, 0);
            this.pnlFooter.Controls.SetChildIndex(this.kryptonLabel1, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnOk, 0);
            this.pnlFooter.Controls.SetChildIndex(this.btnCancel, 0);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(780, 6);
            this.btnCancel.TabIndex = 2;
            this.toolTip.SetToolTip(this.btnCancel, "Cancelar la operación.");
            this.btnCancel.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnCancel.Values.Image")));
            this.btnCancel.Values.Text = "&Cancelar";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(665, 6);
            this.btnOk.TabIndex = 1;
            this.toolTip.SetToolTip(this.btnOk, "Establecer las coordenadas.");
            this.btnOk.Values.Image = global::com.yupanastudio.igest.winapp.Properties.Resources.btnAceptar;
            this.btnOk.Values.Text = "E&stablecer";
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblOper
            // 
            this.lblOper.Location = new System.Drawing.Point(762, 6);
            // 
            // gmap
            // 
            this.gmap.Bearing = 0F;
            this.gmap.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.gmap.CanDragMap = true;
            this.gmap.EmptyTileColor = System.Drawing.Color.Navy;
            this.gmap.GrayScaleMode = false;
            this.gmap.HelperLineOption = GMap.NET.WindowsForms.HelperLineOptions.DontShow;
            this.gmap.LevelsKeepInMemmory = 5;
            this.gmap.Location = new System.Drawing.Point(10, 40);
            this.gmap.MarkersEnabled = true;
            this.gmap.MaxZoom = 2;
            this.gmap.MinZoom = 2;
            this.gmap.MouseWheelZoomEnabled = true;
            this.gmap.MouseWheelZoomType = GMap.NET.MouseWheelZoomType.MousePositionAndCenter;
            this.gmap.Name = "gmap";
            this.gmap.NegativeMode = false;
            this.gmap.PolygonsEnabled = true;
            this.gmap.RetryLoadTile = 0;
            this.gmap.RoutesEnabled = true;
            this.gmap.ScaleMode = GMap.NET.WindowsForms.ScaleModes.Integer;
            this.gmap.SelectedAreaFillColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(65)))), ((int)(((byte)(105)))), ((int)(((byte)(225)))));
            this.gmap.ShowTileGridLines = false;
            this.gmap.Size = new System.Drawing.Size(880, 510);
            this.gmap.TabIndex = 0;
            this.gmap.Zoom = 0D;
            this.gmap.DoubleClick += new System.EventHandler(this.gmap_DoubleClick);
            // 
            // txtLat
            // 
            this.txtLat.Location = new System.Drawing.Point(612, 4);
            this.txtLat.Name = "txtLat";
            this.txtLat.Size = new System.Drawing.Size(50, 15);
            this.txtLat.StateCommon.Content.Font = new System.Drawing.Font("Microsoft Sans Serif", 5.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLat.StateCommon.Content.TextH = Krypton.Toolkit.PaletteRelativeAlign.Inherit;
            this.txtLat.TabIndex = 122;
            this.txtLat.Visible = false;
            // 
            // txtLgt
            // 
            this.txtLgt.Location = new System.Drawing.Point(612, 20);
            this.txtLgt.Name = "txtLgt";
            this.txtLgt.Size = new System.Drawing.Size(50, 15);
            this.txtLgt.StateCommon.Content.Font = new System.Drawing.Font("Microsoft Sans Serif", 5.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLgt.StateCommon.Content.TextH = Krypton.Toolkit.PaletteRelativeAlign.Inherit;
            this.txtLgt.TabIndex = 123;
            this.txtLgt.Visible = false;
            // 
            // kryptonLabel1
            // 
            this.kryptonLabel1.Location = new System.Drawing.Point(7, 12);
            this.kryptonLabel1.Name = "kryptonLabel1";
            this.kryptonLabel1.Size = new System.Drawing.Size(622, 20);
            this.kryptonLabel1.StateNormal.ShortText.Color1 = System.Drawing.Color.White;
            this.kryptonLabel1.TabIndex = 124;
            this.kryptonLabel1.Values.Text = "*Zoom: Utilice el scroll del mouse.   *Establecer marcador: De doble clic.   *Des" +
    "plazar: De clic izquierdo y arrastre.";
            // 
            // FrmDireccionMap
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(900, 600);
            this.Name = "FrmDireccionMap";
            this.Text = "EmpresaFrm";
            this.Load += new System.EventHandler(this.FrmDireccionMap_Load);
            this.pnlMain.ResumeLayout(false);
            this.pnlHeader.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.imgTitle)).EndInit();
            this.pnlFooter.ResumeLayout(false);
            this.pnlFooter.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private GMap.NET.WindowsForms.GMapControl gmap;
        private Krypton.Toolkit.KryptonTextBox txtLgt;
        private Krypton.Toolkit.KryptonTextBox txtLat;
        private Krypton.Toolkit.KryptonLabel kryptonLabel1;
    }
}