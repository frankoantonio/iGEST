import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Vars } from '../models/vars';
import { firstValueFrom } from 'rxjs';
import { Log } from '../models/log';

@Injectable({ providedIn: 'root' })
export class ConnectionService {

  constructor(private http: HttpClient) { }

  async validateCnx(): Promise<{ success: boolean, message: string }> {
    const apiOk = await this.checkConnection(Vars.urlApiServerValidate, 'API Server');
    if (!apiOk) return { success: false, message: 'No hay conexión con [API Server]' };

    const storageOk = await this.checkConnection(Vars.urlStorageServerValidate, 'Storage Server');
    if (!storageOk) return { success: false, message: 'No hay conexión con [Storage Server]' };

    return { success: true, message: 'Conexión OK con API Server y Storage Server.' };
  }

  private async checkConnection(url: string, name: string): Promise<boolean> {
    try {
      await firstValueFrom(this.http.request('HEAD', url));
      return true;
    } catch {
      Log.msg(`Sin conexión a ${name}: ${url}`);
      return false;
    }
  }

}
