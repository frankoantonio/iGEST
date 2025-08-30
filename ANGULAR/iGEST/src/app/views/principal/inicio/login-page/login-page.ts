import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzInputModule } from 'ng-zorro-antd/input';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzCardModule } from 'ng-zorro-antd/card';
import { Vars } from '../../../../models/vars';

@Component({
  selector: 'app-login-page',
  standalone: true,
  imports: [CommonModule, FormsModule, NzInputModule, NzIconModule, NzButtonModule, NzFormModule, NzCardModule],
  templateUrl: 'login-page.html',
  styleUrl: 'login-page.css'
})
export class LoginPage implements OnInit {
  username = '';
  password = '';
  passwordVisible = false;
  backgroundImageUrl = '';

  public Vars = Vars;

  constructor(private router: Router) { }

  ngOnInit() {
    this.backgroundImageUrl = `url('https://storage.googleapis.com/igest-public/fondos/fondo_${Vars.obTheme?.idEmpresa}.png')`;
  }

  onSubmit() {
    console.log('Login attempt:', {
      username: this.username,
      password: this.password
    });
  }

  openHome(): void {
    Vars.tieneInicioSesion = true;
    this.router.navigate(['/home'], { replaceUrl: true });
  }

  openRecovery(): void {
    this.router.navigate(['/recovery']);
  }

  openRegister(): void {
    this.router.navigate(['/register']);
  }

  openLocation(): void {
    this.router.navigate(['/location']);
  }

  openWhatsapp(): void {
    const phoneNumber = Vars.obTheme.contacto;
    const whatsappUrl = `https://wa.me/${phoneNumber}`;
    window.open(whatsappUrl, '_blank');
  }
}