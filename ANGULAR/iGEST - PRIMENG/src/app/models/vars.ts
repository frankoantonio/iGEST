import { InterfazUI } from './interfaz-ui';

export class Vars {
    // Servidores
    static urlServerAPI: string = 'http://localhost';
    static urlServerStorage: string = 'https://storage.googleapis.com';
    static urlApiServerValidate: string = `${Vars.urlServerAPI}/auth/test`;
    static urlStorageServerValidate: string = `${Vars.urlServerStorage}/igest-public/test.png`;
    // Variables generales
    static isDevMode: boolean = true;                   // ⚠️ cambiar a false al compilar para producción
    static withSubDomain: boolean = true;               // ⚠️ cambiar a true cuando se compila para una empresa específica
    static codeNameEmpresa: string = 'casadelniño';     // ⚠️ cambiar por el nombre de la empresa
    static obMyUI: InterfazUI = InterfazUI.getInterfazUI(Vars.codeNameEmpresa);
    //
    static tieneInicioSesion: boolean = false;
}
