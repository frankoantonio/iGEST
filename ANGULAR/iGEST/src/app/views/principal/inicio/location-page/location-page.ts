import { Component, OnInit, OnDestroy, ViewChild, ElementRef, inject, PLATFORM_ID, AfterViewInit } from '@angular/core';
import { CommonModule, isPlatformBrowser } from '@angular/common';
import { Router } from '@angular/router';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzSpinModule } from 'ng-zorro-antd/spin';
import { NzResultModule } from 'ng-zorro-antd/result';
import { NzMessageService } from 'ng-zorro-antd/message';
import { NzTooltipModule } from 'ng-zorro-antd/tooltip';
import { Subscription } from 'rxjs';
import * as L from 'leaflet';

import { Sede, LatLng } from '../../../../models/principal/sede';
import { SedeService } from '../../../../services/principal/sede.service';
import { MapService } from '../../../../services/principal/map.service';
import { Vars } from '../../../../models/vars';

@Component({
  selector: 'app-location-page',
  standalone: true,
  imports: [
    CommonModule, 
    NzIconModule, 
    NzButtonModule, 
    NzSpinModule, 
    NzResultModule,
    NzTooltipModule
  ],
  templateUrl: './location-page.html',
  styleUrl: './location-page.css'
})
export class LocationPage implements OnInit, OnDestroy, AfterViewInit {
  @ViewChild('mapContainer') mapContainer!: ElementRef;
  @ViewChild('cardsScroll') cardsScroll!: ElementRef;

  // Injected services
  private router = inject(Router);
  private sedeService = inject(SedeService);
  private mapService = inject(MapService);
  private message = inject(NzMessageService);
  private platformId = inject(PLATFORM_ID);

  // Component state
  isLoading = true;
  error: string | null = null;
  backgroundImageUrl = '';

  // Map instance and data
  private map: L.Map | null = null;
  private sedeMarkers: L.Marker[] = [];
  private userLocationMarker: L.CircleMarker | null = null;

  // Data
  sedes: Sede[] = [];
  selectedIndex = 0;
  userLocation: LatLng | null = null;

  // Map configuration
  mapCenter: LatLng = { lat: -12.05, lng: -77.05 };
  mapZoom = 12;
  mapHeight = 500;

  // UI state
  showArrows = false;
  defaultSedeImage = `https://storage.googleapis.com/igest-public/logos/logo_${Vars.obTheme?.idEmpresa}.png`;

  // Subscriptions
  private subscriptions: Subscription[] = [];

  // Public vars for template
  public Vars = Vars;

  ngOnInit() {
    this.backgroundImageUrl = `url('https://storage.googleapis.com/igest-public/fondos/fondo_${Vars.obTheme?.idEmpresa}.png')`;
    this.calculateMapHeight();
    this.initializeData();
    
    if (isPlatformBrowser(this.platformId)) {
      window.addEventListener('resize', this.onWindowResize.bind(this));
    }
  }

  ngAfterViewInit() {
    if (isPlatformBrowser(this.platformId)) {
      // Delay para asegurar que el DOM esté listo
      setTimeout(() => {
        this.initializeMap();
      }, 100);
    }
  }

  ngOnDestroy() {
    this.subscriptions.forEach(sub => sub.unsubscribe());
    
    if (isPlatformBrowser(this.platformId)) {
      window.removeEventListener('resize', this.onWindowResize.bind(this));
    }

    // Limpiar mapa
    if (this.map) {
      this.mapService.destroyMap(this.map);
      this.map = null;
    }
  }

  // ================== INITIALIZATION ==================

  initializeData() {
    this.isLoading = true;
    this.error = null;

    const sedesSub = this.sedeService.getDemoSedes().subscribe({
      next: (sedes) => {
        this.sedes = sedes;
        if (sedes.length > 0) {
          this.mapCenter = sedes[0].coords;
          this.selectedIndex = 0;
          this.updateArrowsVisibility();
          
          // Si el mapa ya está inicializado, actualizar marcadores
          if (this.map) {
            this.updateMapMarkers();
            this.centerMapOnSedes();
          }
        }
        this.isLoading = false;
      },
      error: (err) => {
        console.error('Error loading sedes:', err);
        this.error = 'No se pudieron cargar las ubicaciones. Por favor, intenta nuevamente.';
        this.isLoading = false;
      }
    });

    this.subscriptions.push(sedesSub);
  }

  initializeMap() {
    try {
      this.map = this.mapService.createMap('leaflet-map', this.mapCenter, this.mapZoom);
      
      // Añadir controles personalizados
      this.mapService.addCustomControls(this.map);
      
      // Event listeners
      this.map.on('click', (e: L.LeafletMouseEvent) => {
        console.log('Map clicked at:', e.latlng);
      });

      // Si ya tenemos datos de sedes, añadir marcadores
      if (this.sedes.length > 0) {
        this.updateMapMarkers();
        this.centerMapOnSedes();
      }

      console.log('Leaflet map initialized successfully');
    } catch (error) {
      console.error('Error initializing map:', error);
      this.error = 'Error al inicializar el mapa. Por favor, recarga la página.';
    }
  }

  calculateMapHeight() {
    if (isPlatformBrowser(this.platformId)) {
      const windowHeight = window.innerHeight;
      const headerHeight = 70;
      const cardsHeight = 180;
      this.mapHeight = Math.max(400, windowHeight - headerHeight - cardsHeight - 40);
    }
  }

  onWindowResize() {
    this.calculateMapHeight();
    this.updateArrowsVisibility();
  }

  updateArrowsVisibility() {
    if (isPlatformBrowser(this.platformId) && this.cardsScroll) {
      const container = this.cardsScroll.nativeElement;
      this.showArrows = container.scrollWidth > container.clientWidth;
    }
  }

  // ================== MAP FUNCTIONALITY ==================

  updateMapMarkers() {
    if (!this.map) return;

    // Limpiar marcadores existentes
    this.clearSedeMarkers();

    // Crear nuevos marcadores de sedes
    this.sedes.forEach((sede, index) => {
      const isSelected = index === this.selectedIndex;
      const marker = this.mapService.createSedeMarker(sede.coords, isSelected);
      
      // Popup con información de la sede
      const popupContent = this.createPopupContent(sede);
      marker.bindPopup(popupContent);
      
      // Event listener para selección
      marker.on('click', () => {
        this.selectSede(index);
      });

      // Añadir al mapa y guardar referencia
      marker.addTo(this.map!);
      this.sedeMarkers.push(marker);
    });
  }

  centerMapOnSedes() {
    if (!this.map || this.sedes.length === 0) return;

    if (this.sedes.length === 1) {
      this.mapService.setView(this.map, this.sedes[0].coords, 15);
    } else {
      const coords = this.sedes.map(sede => sede.coords);
      this.mapService.fitBounds(this.map, coords, 30);
    }
  }

  clearSedeMarkers() {
    this.sedeMarkers.forEach(marker => {
      if (this.map) {
        this.map.removeLayer(marker);
      }
    });
    this.sedeMarkers = [];
  }

  updateUserLocationMarker() {
    if (!this.map) return;

    // Remover marcador anterior si existe
    if (this.userLocationMarker) {
      this.map.removeLayer(this.userLocationMarker);
    }

    // Crear nuevo marcador si hay ubicación
    if (this.userLocation) {
      this.userLocationMarker = this.mapService.createUserLocationMarker(this.userLocation);
      this.userLocationMarker.bindPopup('Tu ubicación actual');
      this.userLocationMarker.addTo(this.map);
    }
  }

  createPopupContent(sede: Sede): string {
    return `
      <div class="sede-popup">
        <h3 style="margin: 0 0 8px 0; color: var(--theme-primary-color-dark);">${sede.nombre}</h3>
        <p style="margin: 4px 0; font-size: 13px;"><strong>📍</strong> ${sede.direccion}</p>
        ${sede.telefono ? `<p style="margin: 4px 0; font-size: 13px;"><strong>📞</strong> ${sede.telefono}</p>` : ''}
        ${sede.horario ? `<p style="margin: 4px 0; font-size: 13px;"><strong>🕒</strong> ${sede.horario.replace(/\n/g, '<br>')}</p>` : ''}
      </div>
    `;
  }

  // ================== SEDE SELECTION ==================

  selectSede(index: number) {
    if (index < 0 || index >= this.sedes.length || index === this.selectedIndex) {
      return;
    }

    this.selectedIndex = index;
    const sede = this.sedes[index];
    
    // Actualizar marcadores para reflejar selección
    this.updateMapMarkers();
    
    // Animar mapa a la sede seleccionada
    if (this.map) {
      this.mapService.flyTo(this.map, sede.coords, 15);
    }

    // Scroll tarjetas a la sede seleccionada
    this.scrollToCard(index);

    console.log('Selected sede:', sede.nombre);
  }

  scrollToCard(index: number) {
    if (isPlatformBrowser(this.platformId) && this.cardsScroll) {
      const cardWidth = 280;
      const cardGap = 16;
      const scrollLeft = index * (cardWidth + cardGap);
      
      this.cardsScroll.nativeElement.scrollTo({
        left: scrollLeft,
        behavior: 'smooth'
      });
    }
  }

  // ================== GEOLOCATION ==================

  async goToMyLocation() {
    if (!isPlatformBrowser(this.platformId)) {
      this.message.warning('La geolocalización no está disponible en este entorno');
      return;
    }

    if (!navigator.geolocation) {
      this.message.error('Tu navegador no soporta geolocalización');
      return;
    }

    try {
      this.message.loading('Obteniendo tu ubicación...', { nzDuration: 0 });

      const position = await this.getCurrentPosition();
      
      this.userLocation = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      // Actualizar marcador de ubicación del usuario
      this.updateUserLocationMarker();

      // Animar mapa a la ubicación del usuario
      if (this.map) {
        this.mapService.flyTo(this.map, this.userLocation, 16);
      }

      this.message.remove();
      this.message.success('¡Ubicación encontrada!');

    } catch (error) {
      this.message.remove();
      this.handleGeolocationError(error as GeolocationPositionError);
    }
  }

  private getCurrentPosition(): Promise<GeolocationPosition> {
    return new Promise((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(resolve, reject, {
        enableHighAccuracy: true,
        timeout: 10000,
        maximumAge: 300000
      });
    });
  }

  private handleGeolocationError(error: GeolocationPositionError) {
    switch (error.code) {
      case error.PERMISSION_DENIED:
        this.message.error('Permiso de ubicación denegado. Actívalo en la configuración de tu navegador.');
        break;
      case error.POSITION_UNAVAILABLE:
        this.message.error('No se pudo obtener tu ubicación. Verifica tu conexión a internet.');
        break;
      case error.TIMEOUT:
        this.message.error('Tiempo de espera agotado al obtener la ubicación.');
        break;
      default:
        this.message.error('Error desconocido al obtener la ubicación.');
        break;
    }
  }

  // ================== NAVIGATION ==================

  openDirections(sede: Sede) {
    if (!isPlatformBrowser(this.platformId)) {
      return;
    }

    const lat = sede.coords.lat;
    const lng = sede.coords.lng;
    
    // Detect platform and open appropriate maps app
    const userAgent = navigator.userAgent.toLowerCase();
    let url: string;

    if (userAgent.includes('iphone') || userAgent.includes('ipad')) {
      // iOS - Apple Maps
      url = `http://maps.apple.com/?daddr=${lat},${lng}&dirflg=d`;
    } else if (userAgent.includes('android')) {
      // Android - Google Maps
      url = `google.navigation:q=${lat},${lng}`;
    } else {
      // Web - Google Maps
      url = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}`;
    }

    try {
      window.open(url, '_blank');
    } catch (error) {
      // Fallback to Google Maps web
      const fallbackUrl = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}`;
      window.open(fallbackUrl, '_blank');
    }
  }

  goBack() {
    this.router.navigate(['/login']);
  }

  // ================== UTILITY METHODS ==================

  formatSchedule(schedule: string): string {
    return schedule.replace(/\n/g, '<br>');
  }

  onImageError(event: Event) {
    const target = event.target as HTMLImageElement;
    target.src = this.defaultSedeImage;
  }
}
