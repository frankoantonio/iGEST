import { Component, inject, OnInit, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { ConnectionService } from '../../../../services/connection-service';
import { Log } from '../../../../models/log';
import { Vars } from '../../../../models/vars';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-init-page',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './init-page.html',
  styleUrl: './init-page.css'
})
export class InitPage implements OnInit, OnDestroy {
  private readonly conexionService = inject(ConnectionService);
  private readonly router = inject(Router);

  private readonly animationDuration = 2000; // Duración para dar tiempo a la validación
  private readonly transitionDuration = 100;

  progressValue = 0;
  countValue = 0;
  logoAnimate = false;

  private animationStartTime = 0;
  private animationFrameId: number | null = null;
  private timeoutId: number | null = null;
  private popstateHandler?: () => void;

  // Estado de la validación
  private connectionValidated = false;
  private connectionResult: any = null;

  async ngOnInit(): Promise<void> {
    this.preventBackNavigation();

    // Iniciar animación visual del logo
    setTimeout(() => (this.logoAnimate = true), 100);

    // Iniciar animación de progreso
    this.animationStartTime = performance.now();
    this.animate();

    // Ejecutar validación de conexión en paralelo
    this.initializeApp();
  }

  ngOnDestroy(): void {
    // Limpiar recursos
    if (this.animationFrameId) cancelAnimationFrame(this.animationFrameId);
    if (this.timeoutId) clearTimeout(this.timeoutId);
    if (this.popstateHandler) {
      window.removeEventListener('popstate', this.popstateHandler);
    }
    document.body.classList.remove('splash-exit');
  }

  private preventBackNavigation(): void {
    // Prevenir navegación hacia atrás
    window.history.pushState(null, '', window.location.href);
    if (window.history.length > 1) {
      window.history.pushState(null, '', window.location.href);
    }

    this.popstateHandler = () => {
      window.history.pushState(null, '', window.location.href);
    };
    window.addEventListener('popstate', this.popstateHandler);
  }

  private async initializeApp(): Promise<void> {
    try {
      const connectionResult = await this.conexionService.validateCnx();

      // Log de resultados
      Log.msg(connectionResult.success);
      Log.msg(connectionResult.message);

      // Establecer estado de conexión global
      Vars.cnxOK = connectionResult.success;

      // Guardar resultado para navegación posterior
      this.connectionResult = connectionResult;
      this.connectionValidated = true;

      // Si la animación ya terminó, navegar inmediatamente
      // Si no, esperará a que termine la animación
      this.checkAndNavigate();

    } catch (error) {
      await this.handleConnectionError(error);
    }
  }

  private async handleConnectionError(error: any): Promise<void> {
    Vars.cnxOK = false;
    this.connectionResult = { success: false, message: 'Error de conexión inesperado' };
    this.connectionValidated = true;
    this.checkAndNavigate();
  }

  private animate = (): void => {
    const currentTime = performance.now();
    const elapsed = currentTime - this.animationStartTime;
    const progress = Math.min(elapsed / this.animationDuration, 1);

    this.progressValue = progress;
    this.countValue = Math.floor(progress * 100);

    if (progress < 1) {
      this.animationFrameId = requestAnimationFrame(this.animate);
    } else {
      // Animación completada, verificar si podemos navegar
      this.checkAndNavigate();
    }
  };

  private checkAndNavigate(): void {
    // Solo navegar si tanto la animación como la validación están completas
    if (this.connectionValidated && this.progressValue >= 1) {
      this.performNavigation();
    }
  }

  private performNavigation(): void {
    // Aplicar transición de salida
    document.body.classList.add('splash-exit');

    this.timeoutId = window.setTimeout(async () => {
      if (this.connectionResult) {
        await this.navigateBasedOnConnectionState(this.connectionResult);
      }
    }, this.transitionDuration);
  }

  private async navigateBasedOnConnectionState(connectionResult: any): Promise<void> {
    if (Vars.tieneInicioSesion && connectionResult.success) {
      // Usuario con sesión y conexión OK → Home
      await this.router.navigate(['/home'], { replaceUrl: true });
    } else if (!Vars.tieneInicioSesion && connectionResult.success) {
      // Sin sesión pero con conexión OK → Login
      await this.router.navigate(['/login'], { replaceUrl: true });
    } else {
      // Sin conexión → Error
      await this.navigateToError(connectionResult.message, 'init');
    }
  }

  private async navigateToError(message: string, from: string): Promise<void> {
    const errorParams = { message, from };

    try {
      await this.router.navigate(['/error'], {
        queryParams: errorParams,
        replaceUrl: true
      });
    } catch (navigationError) {
      // Fallback si falla la navegación
      window.location.href = '/error';
    }
  }

  getLogoPath(): string {
    return `${Vars.urlServerStoragePublic}/logos/logo_${Vars.obTheme.idEmpresa}.png`;
  }
}