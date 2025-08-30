import { Routes } from '@angular/router';

export const routes: Routes = [

    // Página de inicialización - controla todo el flujo
    { path: 'init', loadComponent: () => import('./views/principal/inicio/init-page/init-page').then(m => m.InitPage) },

    // Páginas del flujo inicial
    { path: 'splash', loadComponent: () => import('./views/principal/inicio/splash-page/splash-page').then(m => m.SplashPage) },
    { path: 'error', loadComponent: () => import('./views/principal/inicio/error-page/error-page').then(m => m.ErrorPage) },

    { path: 'login', loadComponent: () => import('./views/principal/inicio/login-page/login-page').then(m => m.LoginPage) },


    // Páginas de autenticación
    { path: 'register', loadComponent: () => import('./views/principal/inicio/register-page/register-page').then(m => m.RegisterPage) },
    { path: 'recovery', loadComponent: () => import('./views/principal/inicio/recovery-page/recovery-page').then(m => m.RecoveryPage) },
    { path: 'location', loadComponent: () => import('./views/principal/inicio/location-page/location-page').then(m => m.LocationPage) },

    // Página principal (requiere sesión)
    {
        path: 'home',
        loadComponent: () => import('./views/principal/inicio/home-page/home-page').then(m => m.HomePage),
        children: [
            { path: 'perfil-usuario', loadComponent: () => import('./views/principal/usuarios/perfil-page/perfil-page').then(m => m.PerfilPage) },
            { path: 'roles-usuario', loadComponent: () => import('./views/principal/usuarios/roles-page/roles-page').then(m => m.RolesPage) },
        ]
    },

    // Rutas por defecto
    { path: '', redirectTo: '/init', pathMatch: 'full' },
    { path: '**', redirectTo: '/init' }

];
