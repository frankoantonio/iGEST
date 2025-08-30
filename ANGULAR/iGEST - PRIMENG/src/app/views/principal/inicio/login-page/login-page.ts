/*OK*/

import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { InputTextModule } from 'primeng/inputtext';
import { PasswordModule } from 'primeng/password';
import { ButtonModule } from 'primeng/button';
import { ToastModule } from 'primeng/toast';
import { CommonModule } from '@angular/common';
import { MessageService } from 'primeng/api';
import { Vars } from '../../../../models/vars';
import { FloatLabel } from 'primeng/floatlabel';
import { InputGroupModule } from 'primeng/inputgroup';
import { InputNumberModule } from 'primeng/inputnumber';
import { InputGroupAddonModule } from 'primeng/inputgroupaddon';

@Component({
  selector: 'app-login-page',
  imports: [CommonModule, FormsModule, ReactiveFormsModule, InputTextModule, PasswordModule, ButtonModule, ToastModule, FloatLabel, InputGroupModule, InputNumberModule, InputGroupAddonModule ],
  providers: [MessageService],
  templateUrl: './login-page.html',
  styleUrl: './login-page.css'
})
export class LoginPage implements OnInit {
  Vars = Vars; // expón Vars al template
  form: FormGroup;
  backgroundImageUrl: string = '';
 // price: number = 0;

 get price() {
  return this.form.get('price');
}

  //number =10;

  constructor(private fb: FormBuilder, private router: Router) {
    this.form = this.fb.group({
      username: ['', [Validators.required, Validators.minLength(6)]],
      password: ['', [Validators.required, Validators.minLength(6)]],
    });
  }

  ngOnInit() {
    this.backgroundImageUrl = `url('https://storage.googleapis.com/igest-public/fondos/fondo_${Vars.obMyUI?.idEmpresa}.png')`;
     this.form = this.fb.group({
    username: ['', [Validators.required, Validators.minLength(6)]],
    price: [null, Validators.required],
  });
  }

  login(): void {
    if (this.form.invalid) return;

    const { username, password } = this.form.value;
    if (username === 'fbarzola' && password === 'Valores@123') {
      this.router.navigate(['/ubicanos']);
    } else {
      alert('Credenciales incorrectas');
    }
  }

  contactUs(): void {
    const phone = '+51987654321'; // reemplazar con variable real
    const waUrl = window.navigator.userAgent.includes('Windows')
      ? `https://wa.me/${phone}`
      : `whatsapp://send?phone=${phone}`;

    window.open(waUrl, '_blank') || window.open(`tel:${phone}`, '_blank');
  }

  showRegisterModal(): void {
    // Aquí deberías abrir un modal, por ejemplo usando un servicio de PrimeNG como DialogService
    alert('Registro de nuevo usuario');
  }

  goToUbicanos(): void {
    this.router.navigate(['/ubicanos']);
  }

  get username() {
    return this.form.get('username');
  }

  get password() {
    return this.form.get('password');
  }

  recoverPassword(): void {
    // Aquí podrías abrir un diálogo, modal o mostrar un toast
    console.log('Recuperar contraseña...');
  }

 

}
