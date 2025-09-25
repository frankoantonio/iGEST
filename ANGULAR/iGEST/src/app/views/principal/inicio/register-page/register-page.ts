import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzInputModule } from 'ng-zorro-antd/input';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NzMessageService } from 'ng-zorro-antd/message';
import { Vars } from '../../../../models/vars';

@Component({
  selector: 'app-register-page',
  standalone: true,
  imports: [CommonModule, FormsModule, NzInputModule, NzIconModule, NzButtonModule, NzFormModule, NzCardModule],
  templateUrl: './register-page.html',
  styleUrl: './register-page.css'
})
export class RegisterPage implements OnInit {
  registerData = {
    nombres: '',
    apellidoPaterno: '',
    apellidoMaterno: '',
    numDocIdentidad: '',
    celular: '',
    correo: ''
  };

  showVerification = false;
  verificationCodes: string[] = ['', '', '', '', '', ''];
  backgroundImageUrl = '';

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
      console.log('Datos de registro:', this.registerData);
      this.message.success('Código de verificación enviado a tu correo');
      this.showVerification = true;
      this.generateVerificationCode();
    }
  }

  validateForm(): boolean {
    if (!this.registerData.nombres.trim()) {
      this.message.error('Por favor ingresa tus nombres');
      return false;
    }
    if (!this.registerData.apellidoPaterno.trim()) {
      this.message.error('Por favor ingresa tu apellido paterno');
      return false;
    }
    if (!this.registerData.apellidoMaterno.trim()) {
      this.message.error('Por favor ingresa tu apellido materno');
      return false;
    }
    if (!this.registerData.numDocIdentidad.trim()) {
      this.message.error('Por favor ingresa tu número de documento');
      return false;
    }
    if (!this.registerData.celular.trim()) {
      this.message.error('Por favor ingresa tu número de celular');
      return false;
    }
    if (!this.registerData.correo.trim()) {
      this.message.error('Por favor ingresa tu correo electrónico');
      return false;
    }
    if (!this.isValidEmail(this.registerData.correo)) {
      this.message.error('Por favor ingresa un correo electrónico válido');
      return false;
    }
    return true;
  }

  isValidEmail(email: string): boolean {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }

  generateVerificationCode() {
    console.log('Código de verificación generado (simulación)');
  }

  onVerificationInput(event: any, index: number) {
    const value = event.target.value.toUpperCase();
    if (value && /^[A-Z0-9]$/.test(value)) {
      this.verificationCodes[index] = value;
      
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
    console.log('Registro completado:', {
      ...this.registerData,
      verificationCode: code
    });

    this.message.success('¡Registro completado exitosamente!');
    setTimeout(() => {
      this.router.navigate(['/login']);
    }, 2000);
  }

  resendCode() {
    this.verificationCodes = ['', '', '', '', '', ''];
    this.generateVerificationCode();
    this.message.info('Código reenviado a tu correo electrónico');
    
    const firstInput = document.querySelector('input[data-index="0"]') as HTMLInputElement;
    if (firstInput) {
      firstInput.focus();
    }
  }

  openLogin(): void {
    this.router.navigate(['/login']);
  }
}
