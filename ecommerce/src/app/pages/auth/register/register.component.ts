import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ToastrService } from 'ngx-toastr';
import { AuthService } from '../service/auth.service';
import { Router, RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  templateUrl: './register.component.html',
  styleUrl: './register.component.scss'
})
export class RegisterComponent {

  name: string = '';
  surname: string = '';
  email: string = '';
  password: string = '';
  phone: string = '';
  errores: any = {};

  constructor(
    private authService: AuthService,
    private router: Router,
    private toastr: ToastrService,
  ) {}

  validar(): boolean {
    this.errores = {};

    if (!this.name.trim()) {
      this.errores.name = 'El nombre es obligatorio';
    } else if (this.name.trim().length < 2) {
      this.errores.name = 'El nombre debe tener al menos 2 caracteres';
    }

    if (!this.surname.trim()) {
      this.errores.surname = 'El apellido es obligatorio';
    } else if (this.surname.trim().length < 2) {
      this.errores.surname = 'El apellido debe tener al menos 2 caracteres';
    }

    if (!this.email.trim()) {
      this.errores.email = 'El email es obligatorio';
    } else {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(this.email)) {
        this.errores.email = 'El formato del email no es válido';
      }
    }

    if (!this.phone.trim()) {
      this.errores.phone = 'El teléfono es obligatorio';
    } else {
      const phoneRegex = /^\d{9}$/;
      if (!phoneRegex.test(this.phone)) {
        this.errores.phone = 'El teléfono debe tener exactamente 9 dígitos';
      }
    }

    if (!this.password) {
      this.errores.password = 'La contraseña es obligatoria';
    } else if (this.password.length < 8) {
      this.errores.password = 'La contraseña debe tener al menos 8 caracteres';
    }

    return Object.keys(this.errores).length === 0;
  }

  register() {
    if (!this.validar()) return;

    let data = {
      name: this.name,
      surname: this.surname,
      email: this.email,
      password: this.password,
      phone: this.phone,
    };

    this.authService.register(data).subscribe({
      next: (resp: any) => {
        console.log(resp);
        this.toastr.success('Éxito', 'Cuenta creada correctamente, ya puedes iniciar sesión');
        setTimeout(() => {
          this.router.navigateByUrl('/login');
        }, 500);
      },
      error: (err: any) => {
        console.log(err);
        this.toastr.error('Error', 'No se pudo registrar (revisa los datos)');
      }
    });
  }
}
