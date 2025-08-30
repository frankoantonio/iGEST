import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { App } from './app/app';
import { Vars } from './app/models/vars';

// Cargar el tema antes del arranque de la aplicación
Vars.init();

bootstrapApplication(App, appConfig).catch((err) => console.error(err));
