export class InterfazUI {
    constructor(
        public idEmpresa: number,
        public codeName: string,
        public colorFondoDK: string,
        public colorFondoST: string,
        public colorFondoLT: string,
        public colorLabelPri: string,
        public colorLabSec: string,
        public numContacto: string
    ) { }

    static lsInterfazUI: InterfazUI[] = [
        new InterfazUI(1000, 'igest', '#448aff', '#ffffff', '#000000', '#ffffff', '#000000', ''),
        new InterfazUI(1001, 'yupana', '#01579b', '#039be5', '#fff3db', '#ffffff', '#0d47a1', '+51987779695'),
        new InterfazUI(1002, 'geraldine', '#ffffff', '#ffffff', '#000000', '#ffffff', '#ffffff', '+51987779695'),
        new InterfazUI(1003, 'mundodeloslibros', '#ffffff', '#ffffff', '#000000', '#ffffff', '#ffffff', '+51987779695'),
        new InterfazUI(1004, 'sanjuanbosco', '#0d47a1', '#1976d2', '#e3f2fd', '#ffffff', '#558b2f', '+51987779695'),
        new InterfazUI(1005, 'sanfernando', '#0d47a1', '#1976d2', '#e3f2fd', '#ffffff', '#558b2f', '+51987779695'),
        new InterfazUI(1006, 'polideportivosjb', '#0d47a1', '#1976d2', '#e3f2fd', '#ffffff', '#558b2f', '+51987779695'),
        new InterfazUI(1007, 'casadelniño', '#b71c1c', '#e53935', '#ffe0db', '#ffff00', '#0000ff', '+51987779695'),
    ];

    static getInterfazUI(codeNameEmpresa: string): InterfazUI {
        return this.lsInterfazUI.find(ui => ui.codeName === codeNameEmpresa) || this.lsInterfazUI[0];
    }

}
