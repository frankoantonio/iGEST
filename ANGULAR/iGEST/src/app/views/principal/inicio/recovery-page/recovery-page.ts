import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzInputModule } from 'ng-zorro-antd/input';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NzAlertModule } from 'ng-zorro-antd/alert';
import { NzMessageService } from 'ng-zorro-antd/message';
import { Vars } from '../../../../models/vars';

@Component({
  selector: 'app-recovery-page',
  standalone: true,
  imports: [
    CommonModule, 
    FormsModule, 
    NzInputModule, 
    NzIconModule, 
    NzButtonModule, 
    NzFormModule, 
    NzCardModule,
    NzAlertModule
  ],
  templateUrl: './recovery-page.html',
  styleUrl: './recovery-page.css'
})
export class RecoveryPage implements OnInit {
  
  recoveryData = {
    username: '',
    email: ''
  };

  showVerification = false;
  verificationCodes: string[] = ['', '', '', '', '', ''];
  backgroundImageUrl = '';
  maskedEmail = '';

  public Vars = Vars;

  constructor(
    private router: Router,
    private message: NzMessageService
  ) { }

  ngOnInit() {
    this.backgroundImageUrl = `url('https://storage.googleapis.com/igest-public/fondos/fondo_${Vars.obTheme?.idEmpresa}.png')`;
  }

  onSubmit() {
    if (this.validateForm()) {
      // Simular validación de usuario y email
      this.maskedEmail = this.maskEmail(this.recoveryData.email);
      
      console.log('Datos de recovery:', this.recoveryData);
      console.log('Email enmascarado:', this.maskedEmail);
      
      this.message.success('Código de recuperación enviado a tu correo');
      this.showVerification = true;
      this.generateRecoveryCode();
    }
  }

  validateForm(): boolean {
    if (!this.recoveryData.username.trim()) {
      this.message.error('Por favor ingresa tu usuario');
      return false;
    }
    if (!this.recoveryData.email.trim()) {
      this.message.error('Por favor ingresa tu correo electrónico');
      return false;
    }
    if (!this.isValidEmail(this.recoveryData.email)) {
      this.message.error('Por favor ingresa un correo electrónico válido');
      return false;
    }
    return true;
  }

  isValidEmail(email: string): boolean {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }

  /**
   * Enmascara un email mostrando solo algunas letras del inicio
   * Ejemplo: francisco@gmail.com -> fr______@g____.com
   */
  maskEmail(email: string): string {
    if (!email || !email.includes('@')) {
      return email;
    }

    const [localPart, domain] = email.split('@');
    const [domainName, extension] = domain.split('.');

    // Enmascarar parte local (mostrar primeras 2 letras)
    const maskedLocal = localPart.length >= 2 
      ? localPart.substring(0, 2) + '_'.repeat(Math.max(6, localPart.length - 2))
      : localPart + '_'.repeat(6);

    // Enmascarar dominio (mostrar primera letra)
    const maskedDomain = domainName.length >= 1
      ? domainName.substring(0, 1) + '_'.repeat(Math.max(4, domainName.length - 1))
      : domainName + '_'.repeat(4);

    return `${maskedLocal}@${maskedDomain}.${extension}`;
  }

  generateRecoveryCode() {
    // En un sistema real, aquí se enviaría el email y se generaría el código
    console.log('Código de recuperación generado (simulación)');
  }

  onVerificationInput(event: any, index: number) {
    const value = event.target.value.toUpperCase();
    if (value && /^[A-Z0-9]$/.test(value)) {
      this.verificationCodes[index] = value;
      
      // Auto-focus al siguiente input
      if (index < 5) {
        const nextInput = document.querySelector(`input[data-index="${index + 1}"]`) as HTMLInputElement;
        if (nextInput) {
          nextInput.focus();
        }
      }
    } else {
      this.verificationCodes[index] = '';
    }
  }

  onVerificationKeydown(event: any, index: number) {
    // Manejar backspace para ir al input anterior
    if (event.key === 'Backspace' && !this.verificationCodes[index] && index > 0) {
      const prevInput = document.querySelector(`input[data-index="${index - 1}"]`) as HTMLInputElement;
      if (prevInput) {
        prevInput.focus();
      }
    }
  }

  onVerify() {
    const code = this.verificationCodes.join('');
    if (code.length !== 6) {
      this.message.error('Por favor ingresa los 6 dígitos del código');
      return;
    }

    console.log('Código de verificación:', code);
    console.log('Recuperación completada para:', {
      username: this.recoveryData.username,
      email: this.recoveryData.email,
      verificationCode: code
    });

    // En un sistema real, aquí se validaría el código y se permitiría el cambio de contraseña
    this.message.success('¡Código verificado! Redirigiendo a cambio de contraseña...');
    
    setTimeout(() => {
      // Aquí se redirigiría a una página de cambio de contraseña
      // Por ahora regresamos al login
      this.message.info('Funcionalidad de cambio de contraseña pendiente de implementar');
      this.router.navigate(['/login']);
    }, 2000);
  }

  resendCode() {
    this.verificationCodes = ['', '', '', '', '', ''];
    this.generateRecoveryCode();
    this.message.info('Código reenviado a ' + this.maskedEmail);
    
    // Focus al primer input
    setTimeout(() => {
      const firstInput = document.querySelector('input[data-index="0"]') as HTMLInputElement;
      if (firstInput) {
        firstInput.focus();
      }
    }, 100);
  }

  goBack() {
    this.showVerification = false;
    this.verificationCodes = ['', '', '', '', '', ''];
    this.maskedEmail = '';
  }

  openLogin(): void {
    this.router.navigate(['/login']);
  }
}
