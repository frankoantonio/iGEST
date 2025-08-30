import { Component, inject, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ConnectionService } from '../../../../services/connection-service';
import { Log } from '../../../../models/log';
import { Vars } from '../../../../models/vars';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-init-page',
  imports: [CommonModule],
  templateUrl: './init-page.html',
  styleUrl: './init-page.css'
})
export class InitPage implements OnInit {

  private conexionService = inject(ConnectionService);
  private router = inject(Router);

  // private delay(ms: number): Promise<void> {
  //   return new Promise(resolve => setTimeout(resolve, ms));
  // }

  async ngOnInit() {

    // await this.delay(3000); // ← simula espera

    // 1. Verificar si ya tiene sesión iniciada
    if (Vars.tieneInicioSesion) {
      // Usuario autenticado → va directo a main
      this.router.navigate(['/home']);
      return;
    }

    // 2. Usuario no autenticado → verificar conexión
    try {
      const validacion = await this.conexionService.validateCnx();
      Log.msg(validacion.success);
      Log.msg(validacion.message);

      if (validacion.success) {
        this.router.navigate(['/splash']);
      } else {
        this.router.navigate(['/error'], { queryParams: { message: validacion.message } });
      }

    } catch (error) {
      this.router.navigate(['/error'], { queryParams: { message: 'Error de conexión inesperado' } });
    }
  }



}
