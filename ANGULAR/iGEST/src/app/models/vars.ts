import { ThemeColors } from './theme-colors';

export class Vars {

    // Servidores
    static urlServerAPI: string = 'http://localhost';
    static urlServerStorage: string = 'https://storage.googleapis.com';
    static urlServerStoragePublic: string = 'https://storage.googleapis.com/igest-public';
    static urlApiServerValidate: string = `${Vars.urlServerAPI}/auth/test`;
    static urlStorageServerValidate: string = `${Vars.urlServerStorage}/igest-public/test.png`;

    // Variables generales
    static isDevMode: boolean = true;                   // ⚠️ cambiar a false al compilar para producción
    static codeNameEmpresa: string = 'sanjuanbosco';    // ⚠️ cambiar por el nombre de la empresa

    static tieneInicioSesion: boolean = false;
    static cnxOK: boolean = false;


    static obTheme: ThemeColors = ThemeColors.getTheme('default');

    static init(): void {
        ThemeColors.init(this.codeNameEmpresa);
        this.obTheme = ThemeColors.getTheme(this.codeNameEmpresa);
    }

}


