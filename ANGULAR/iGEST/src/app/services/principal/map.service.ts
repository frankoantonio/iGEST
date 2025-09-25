import { Injectable } from '@angular/core';
import * as L from 'leaflet';
import { LatLng } from '../../models/principal/sede';
import { Vars } from '../../models/vars';

export interface MapProvider {
  name: string;
  url: string;
  attribution: string;
  maxZoom: number;
}

@Injectable({
  providedIn: 'root'
})
export class MapService {
  
  // Configuración de proveedores de mapas
  private mapProviders: { [key: string]: MapProvider } = {
    openStreetMap: {
      name: 'OpenStreetMap',
      url: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
      maxZoom: 19
    },
    cartodb: {
      name: 'CartoDB Positron',
      url: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
      attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors © <a href="https://carto.com/attributions">CARTO</a>',
      maxZoom: 20
    },
    openTopo: {
      name: 'OpenTopoMap',
      url: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
      attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, <a href="http://viewfinderpanoramas.org">SRTM</a> | Map style: © <a href="https://opentopomap.org">OpenTopoMap</a>',
      maxZoom: 17
    }
  };

  constructor() {
    this.configureLeafletDefaults();
  }

  /**
   * Configura los defaults de Leaflet para corregir problemas de iconos
   */
  private configureLeafletDefaults() {
    // Fix para iconos de Leaflet en Angular
    delete (L.Icon.Default.prototype as any)._getIconUrl;
    L.Icon.Default.mergeOptions({
      iconRetinaUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-icon-2x.png',
      iconUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-icon.png',
      shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-shadow.png',
    });
  }

  /**
   * Crea un mapa Leaflet
   */
  createMap(containerId: string, center: LatLng, zoom: number = 12): L.Map {
    const map = L.map(containerId, {
      center: [center.lat, center.lng],
      zoom: zoom,
      zoomControl: true,
      attributionControl: true,
      preferCanvas: false
    });

    // Añadir capa de tiles por defecto
    this.addTileLayer(map, 'cartodb');

    return map;
  }

  /**
   * Añade una capa de tiles al mapa
   */
  addTileLayer(map: L.Map, providerKey: string = 'openStreetMap'): L.TileLayer {
    const provider = this.mapProviders[providerKey];
    if (!provider) {
      throw new Error(`Map provider '${providerKey}' not found`);
    }

    const tileLayer = L.tileLayer(provider.url, {
      attribution: provider.attribution,
      maxZoom: provider.maxZoom,
      minZoom: 3
    });

    tileLayer.addTo(map);
    return tileLayer;
  }

  /**
   * Crea un marcador personalizado de sede
   */
  createSedeMarker(latLng: LatLng, isSelected: boolean = false): L.Marker {
    const iconUrl = isSelected 
      ? `https://storage.googleapis.com/igest-public/mapas/pin_${Vars.obTheme?.idEmpresa}_long.png`
      : `https://storage.googleapis.com/igest-public/mapas/pin_${Vars.obTheme?.idEmpresa}.png`;

    const icon = L.icon({
      iconUrl: iconUrl,
      iconSize: isSelected ? [50, 60] : [40, 48],
      iconAnchor: isSelected ? [25, 60] : [20, 48],
      popupAnchor: [0, isSelected ? -60 : -48],
      shadowUrl: undefined, // Sin sombra para iconos personalizados
      className: isSelected ? 'selected-marker' : 'sede-marker'
    });

    return L.marker([latLng.lat, latLng.lng], { 
      icon: icon,
      riseOnHover: true,
      riseOffset: 250
    });
  }

  /**
   * Crea un marcador para la ubicación del usuario
   */
  createUserLocationMarker(latLng: LatLng): L.CircleMarker {
    return L.circleMarker([latLng.lat, latLng.lng], {
      color: '#ffffff',
      fillColor: '#4285F4',
      fillOpacity: 1,
      weight: 3,
      radius: 8
    });
  }

  /**
   * Añade controles personalizados al mapa
   */
  addCustomControls(map: L.Map) {
    // Control de capas (si se necesita múltiples proveedores)
    const baseMaps = {
      "Mapa Claro": this.createTileLayer('cartodb'),
      "OpenStreetMap": this.createTileLayer('openStreetMap'),
      "Topográfico": this.createTileLayer('openTopo')
    };

    L.control.layers(baseMaps).addTo(map);
  }

  /**
   * Crea una capa de tiles sin añadirla al mapa
   */
  private createTileLayer(providerKey: string): L.TileLayer {
    const provider = this.mapProviders[providerKey];
    return L.tileLayer(provider.url, {
      attribution: provider.attribution,
      maxZoom: provider.maxZoom,
      minZoom: 3
    });
  }

  /**
   * Anima el mapa hacia una ubicación
   */
  flyTo(map: L.Map, latLng: LatLng, zoom: number = 15) {
    map.flyTo([latLng.lat, latLng.lng], zoom, {
      animate: true,
      duration: 1.5,
      easeLinearity: 0.25
    });
  }

  /**
   * Establece la vista del mapa inmediatamente
   */
  setView(map: L.Map, latLng: LatLng, zoom: number = 15) {
    map.setView([latLng.lat, latLng.lng], zoom);
  }

  /**
   * Ajusta la vista del mapa para mostrar todos los puntos
   */
  fitBounds(map: L.Map, points: LatLng[], padding: number = 20) {
    if (points.length === 0) return;

    const latLngs: L.LatLngExpression[] = points.map(p => [p.lat, p.lng]);
    const bounds = L.latLngBounds(latLngs);
    
    map.fitBounds(bounds, {
      padding: [padding, padding],
      maxZoom: 16
    });
  }

  /**
   * Obtiene las coordenadas de un evento de mapa
   */
  getEventLatLng(event: L.LeafletMouseEvent): LatLng {
    return {
      lat: event.latlng.lat,
      lng: event.latlng.lng
    };
  }

  /**
   * Limpia todos los marcadores del mapa
   */
  clearMarkers(map: L.Map) {
    map.eachLayer((layer) => {
      if (layer instanceof L.Marker || layer instanceof L.CircleMarker) {
        map.removeLayer(layer);
      }
    });
  }

  /**
   * Destruye el mapa y libera recursos
   */
  destroyMap(map: L.Map) {
    if (map) {
      map.remove();
    }
  }

  /**
   * Obtiene la lista de proveedores disponibles
   */
  getAvailableProviders(): string[] {
    return Object.keys(this.mapProviders);
  }

  /**
   * Obtiene información de un proveedor específico
   */
  getProviderInfo(providerKey: string): MapProvider | null {
    return this.mapProviders[providerKey] || null;
  }
}