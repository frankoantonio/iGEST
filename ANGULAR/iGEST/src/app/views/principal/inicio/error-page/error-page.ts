import { CommonModule } from '@angular/common';
import { Component, inject, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { Vars } from '../../../../models/vars';

@Component({
  selector: 'app-error-page',
  imports: [CommonModule, NzIconModule, NzButtonModule],
  templateUrl: './error-page.html',
  styleUrl: './error-page.css'
})
export class ErrorPage implements OnInit {
  errorMessage: string = 'Error desconocido!';
  showRetryButton: boolean = false;
  private route = inject(ActivatedRoute);
  private router = inject(Router);

  ngOnInit(): void {
    // Redirigir si tiene sesión Y conexión
    if (Vars.tieneInicioSesion && Vars.cnxOK) {
      this.router.navigate(['/home'], { replaceUrl: true });
      return;
    }

    // Recuperar parámetros
    const params = this.route.snapshot.queryParams;

    if (params['message']) {
      this.errorMessage = params['message'];
    }

    if (params['from'] === 'init') {
      this.showRetryButton = true;
    }
  }

  recargar(): void {
    if (Vars.tieneInicioSesion && Vars.cnxOK) {
      this.router.navigate(['/home'], { replaceUrl: true });
      return;
    }
    this.router.navigate(['/init'], { replaceUrl: true });
  }
}