import { Vars } from './vars';

export class Log {
    static msg(detalles: any): void {
        if (Vars.isDevMode) {
            console.info('[DEBUG_DESARROLLO]', detalles);
        }
    }
}
