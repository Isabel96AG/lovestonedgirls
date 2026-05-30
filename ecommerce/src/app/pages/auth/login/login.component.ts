import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ToastrService } from 'ngx-toastr';
import { AuthService } from '../service/auth.service';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent implements OnInit {

  email: string = '';
  password: string = '';
  code_user: string = '';
  errores: any = {};

  constructor(
    private toastr: ToastrService,
    private authService: AuthService,
    public router: Router,
    public activedRoute: ActivatedRoute,
  ) {}

  ngOnInit(): void {
    if (this.authService.token && this.authService.user) {
      this.router.navigateByUrl('/');
      return;
    }

    this.activedRoute.queryParams.subscribe((resp: any) => {
      this.code_user = resp.code;
    });

    if (this.code_user) {
      let data = { code_user: this.code_user };
      this.authService.verifiedAuth(data).subscribe((resp: any) => {
        if (resp.message == 403) {
          this.toastr.error('Validacion', 'El código no pertenece a ningún usuario');
        }
        if (resp.message == 200) {
          this.toastr.success('Éxito', 'Correo verificado, ya puedes iniciar sesión');
          setTimeout(() => { this.router.navigateByUrl('/login'); }, 500);
        }
      });
    }
  }

  validar(): boolean {
    this.errores = {};

    if (!this.email.trim()) {
      this.errores.email = 'El email es obligatorio';
    } else {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(this.email)) {
        this.errores.email = 'El formato del email no es válido';
      }
    }

    if (!this.password.trim()) {
      this.errores.password = 'La contraseña es obligatoria';
    }

    return Object.keys(this.errores).length === 0;
  }

  login() {
    if (!this.validar()) return;

    this.authService.login(this.email, this.password).subscribe((resp: any) => {
      if (resp === true) {
        this.toastr.success('Bienvenido', 'Login exitoso');
        this.router.navigateByUrl('/');
      } else {
        this.toastr.error('Credenciales incorrectas', 'Error de login');
      }
    });
  }
}
