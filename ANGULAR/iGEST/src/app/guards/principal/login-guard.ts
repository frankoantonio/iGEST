// import { CanActivateFn, Router } from '@angular/router';
// import { Vars } from '../../models/vars';
// import { inject } from '@angular/core';

// export const loginGuard: CanActivateFn = (route, state) => {
//   const router = inject(Router);

//   // Primero verificar conexión
//   if (!Vars.cnxOK) {
//     router.navigate(['/init'], { replaceUrl: true });
//     return false;
//   }

//   // Si hay conexión Y ya inició sesión → redirigir a home
//   if (Vars.tieneInicioSesion) {
//     router.navigate(['/home'], { replaceUrl: true });
//     return false;
//   }

//   // Si hay conexión pero NO ha iniciado sesión → permitir acceso a login
//   return true;

// };
