export interface Sede {
  idSede: number;
  nombre: string;
  direccion: string;
  telefono?: string;
  email?: string;
  horario?: string;
  coords: {
    lat: number;
    lng: number;
  };
  imagen?: string;
  descripcion?: string;
}

export interface LatLng {
  lat: number;
  lng: number;
}