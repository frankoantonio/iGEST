// import { CanActivateFn, Router } from '@angular/router';
// import { Vars } from '../../models/vars';
// import { inject } from '@angular/core';

// export const homeGuard: CanActivateFn = (route, state) => {
//   const router = inject(Router);

//   // Sin conexión → init
//   // if (!Vars.cnxOK) {
//   //   router.navigate(['/error'], { replaceUrl: true });
//   //   return false;
//   // }
//   if (!Vars.cnxOK) {
//     router.navigate(['/error'], { 
//       queryParams: { 
//         message: 'Sin conexión al servidor',
//         from: 'guard'
//       }, 
//       replaceUrl: true 
//     });
//     return false;
//   }

//   // Con conexión pero sin sesión → login
//   if (!Vars.tieneInicioSesion) {
//     router.navigate(['/login'], { replaceUrl: true });
//     return false;
//   }

//   // Con conexión y sesión → permitir acceso
//   return true;

// };
