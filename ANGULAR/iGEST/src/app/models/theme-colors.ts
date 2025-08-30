export class ThemeColors {

    constructor(
        public idEmpresa: number,           // Identificador único de la empresa
        public codeName: string,            // Nombre clave de la empresa
        public contacto: string,            // Teléfono o contacto principal
        public primaryColor: string,        // Color institucional principal
        public primaryColorDark: string,    // Variante oscura del color principal 
        public primaryColorLight: string,   // Variante clara del color principal
        public textColorOnPri: string,      // Color del texto sobre fondo primario
        public textColor: string,           // Color de todos los textos
        public secondaryColor: string,       // Color complementario
    ) { }

    static readonly lsValores: ThemeColors[] = [
        new ThemeColors(1000, 'igest', '', '#000000', '#000000', '#000000', '#ffffff', '#ffffff', '#ffffff'),
        new ThemeColors(1001, 'yupana', '+51987779695', '#00aeed', '#01579b', '#000000', '#000000', '#28ed00', '#28ed00'),
        new ThemeColors(1002, 'geraldine', '+51987779695', '#ffffff', '#ffffff', '#000000', '#ffffff', '#ffffff', '#ffffff'),
        new ThemeColors(1003, 'mundodeloslibros', '+51987779695', '#ffffff', '#ffffff', '#000000', '#ffffff', '#ffffff', '#ffffff'),
        new ThemeColors(1004, 'sanjuanbosco', '+51987779695', '#08589c', '#0d1122', '#e0f7fa', '#ffffff', '#0d1122', '#feca16'),
        new ThemeColors(1005, 'sanfernando', '+51987779695', '#08589c', '#0d1122', '#e0f7fa', '#ffffff', '#0d1122', '#feca16'),
        new ThemeColors(1006, 'polideportivosjb', '+51987779695', '#08589c', '#0d1122', '#e0f7fa', '#ffffff', '#0d1122', '#feca16'),
        new ThemeColors(1007, 'casadelniño', '+51987779695', '#ff0000', '#d50000', '#fce4ec', '#ffffff', '#ff0000', '#ffff00'),
    ];

    static getTheme(codeNameEmpresa: string): ThemeColors {
        return this.lsValores.find(item => item.codeName.toLowerCase() === codeNameEmpresa.toLowerCase()) || this.lsValores[0];
    }

    static applyTheme(theme: ThemeColors): void {
        const r = document.documentElement;
        r.style.setProperty('--theme-primary-color', theme.primaryColor);
        r.style.setProperty('--theme-primary-color-dark', theme.primaryColorDark);
        r.style.setProperty('--theme-primary-color-light', theme.primaryColorLight);
        r.style.setProperty('--theme-text-on-primary', theme.textColorOnPri);
        r.style.setProperty('--theme-text-color', theme.textColor);
        r.style.setProperty('--theme-secondary-color', theme.secondaryColor);
    }

    static init(codeNameEmpresa: string): void {
        const theme = this.getTheme(codeNameEmpresa);
        this.applyTheme(theme);
        console.log(`🎨 Tema inicializado: ${theme.codeName}`);
    }

}
