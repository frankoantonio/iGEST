using GMap.NET;
using GMap.NET.MapProviders;
using GMap.NET.WindowsForms;
using GMap.NET.WindowsForms.Markers;
using System;
using System.Windows.Forms;

namespace com.yupanastudio.polariss.app
{
    public partial class FrmDireccionMap : FrmMaster
    {
        private GMarkerGoogle marker;
        private GMapOverlay markerOverlay;
        public string xLat = "";
        public string xLgt = "";
        private int xZoom;

        //https://youtu.be/_V7CRn47pZk
        //https://youtu.be/cNtCnIO8p64
        //https://youtu.be/dYWRxaWoQYc
        //https://youtu.be/WS_TwK42UEc
        //https://youtu.be/URcTGuuSKIU
        //https://youtu.be/CuFW7nYAJ88

        public FrmDireccionMap(string xLat, string xLgt, int xZoom, bool xReadOnly) : base(CRUD.SELECT, xReadOnly)
        {
            InitializeComponent();
            this.xLat = xLat == "" ? "-12.06005363" : xLat;        // coordenadas distrito de lima
            this.xLgt = xLgt == "" ? "-77.03730226" : xLgt;
            this.xZoom = xZoom == 0 ? 5 : xZoom;
        }

        private void FrmDireccionMap_Load(object sender, EventArgs e)
        {
            gmap.DragButton = MouseButtons.Left;
            gmap.CanDragMap = true;
            gmap.MapProvider = GMapProviders.GoogleMap;
            gmap.AutoScroll = true;
            gmap.MinZoom = 4;
            gmap.MaxZoom = 24;

            setCoordenada(xLat, xLgt, xZoom);
        }

        private void gmap_DoubleClick(object sender, EventArgs e)
        {
            if (MouseButtons.Left == ((MouseEventArgs)e).Button)
            {
                MouseEventArgs hj = (MouseEventArgs)e;
                setMarcador(gmap.FromLocalToLatLng(hj.X, hj.Y));
            }
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == Utils.msgQ("Estás seguro/a de establecer esta ubicación?", Estado.YESNO))
            {
                this.operOK = true;
                xLat = txtLat.Text;
                xLgt = txtLgt.Text;
                this.Dispose();
            }
        }

        //
        // Métodos
        //
        private void setCoordenada(string ltd, string lgt, int zoom)
        {
            gmap.Position = new PointLatLng(Double.Parse(ltd), Double.Parse(lgt));
            gmap.Zoom = zoom;

            marker = new GMarkerGoogle(new PointLatLng(Double.Parse(ltd), Double.Parse(lgt)), GMarkerGoogleType.green_pushpin);
            marker.ToolTipMode = MarkerTooltipMode.Always;

            markerOverlay = new GMapOverlay("Mi Dirección");
            markerOverlay.Markers.Add(marker);

            gmap.Overlays.Add(markerOverlay);

            setMarcador(gmap.Position);
            gmap.Zoom += 1;
            gmap.Refresh();
        }

        private void setMarcador(PointLatLng p)
        {
            txtLat.Text = p.Lat.ToString();
            txtLgt.Text = p.Lng.ToString();
            marker.Position = p;
            marker.ToolTipText = string.Format("Ubicación\nLatitud:{0}\nLongitud:{1}", txtLat.Text, txtLgt.Text);
        }

    }//end class

}
