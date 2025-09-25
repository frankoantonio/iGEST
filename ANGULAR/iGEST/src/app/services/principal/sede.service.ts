import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { Sede } from '../../models/principal/sede';

@Injectable({
  providedIn: 'root'
})
export class SedeService {

  constructor() { }

  getDemoSedes(): Observable<Sede[]> {
    const sedes: Sede[] = [
      {
        idSede: 1001,
        nombre: 'Sede Principal',
        direccion: 'Av. Javier Prado Este 1066, San Isidro, Lima',
        telefono: '+51 1 234-5678',
        email: 'principal@igest.com.pe',
        horario: 'Lun - Vie: 8:00 AM - 6:00 PM\nSáb: 9:00 AM - 1:00 PM',
        coords: {
          lat: -12.0964,
          lng: -77.0428
        },
        imagen: `https://storage.googleapis.com/igest-public/sedes/sede_1001_1.png`,
        descripcion: 'Nuestra sede principal ubicada en el corazón financiero de Lima'
      },
      {
        idSede: 1002,
        nombre: 'Sede Norte',
        direccion: 'Av. Túpac Amaru 1250, Los Olivos, Lima',
        telefono: '+51 1 234-5679',
        email: 'norte@igest.com.pe',
        horario: 'Lun - Vie: 8:30 AM - 5:30 PM\nSáb: 9:00 AM - 12:00 PM',
        coords: {
          lat: -11.9608,
          lng: -77.0677
        },
        imagen: `https://storage.googleapis.com/igest-public/sedes/sede_1002_1.png`,
        descripcion: 'Sede moderna en la zona norte de Lima'
      },
      {
        idSede: 1003,
        nombre: 'Sede Sur',
        direccion: 'Av. Benavides 1955, Miraflores, Lima',
        telefono: '+51 1 234-5680',
        email: 'sur@igest.com.pe',
        horario: 'Lun - Vie: 9:00 AM - 6:00 PM\nSáb: 10:00 AM - 2:00 PM',
        coords: {
          lat: -12.1067,
          lng: -77.0365
        },
        imagen: `https://storage.googleapis.com/igest-public/sedes/sede_1003_1.png`,
        descripcion: 'Sede estratégica en el distrito de Miraflores'
      },
      {
        idSede: 1004,
        nombre: 'Sede Este',
        direccion: 'Av. Nicolás Ayllón 3750, Ate, Lima',
        telefono: '+51 1 234-5681',
        email: 'este@igest.com.pe',
        horario: 'Lun - Vie: 8:00 AM - 5:00 PM\nSáb: 9:00 AM - 1:00 PM',
        coords: {
          lat: -12.0347,
          lng: -76.9678
        },
        imagen: `https://storage.googleapis.com/igest-public/sedes/sede_1004_1.png`,
        descripcion: 'Sede en la zona este con amplio estacionamiento'
      }
    ];

    return of(sedes);
  }

  getSedeById(id: number): Observable<Sede | undefined> {
    return new Observable(observer => {
      this.getDemoSedes().subscribe(sedes => {
        const sede = sedes.find(s => s.idSede === id);
        observer.next(sede);
        observer.complete();
      });
    });
  }
}