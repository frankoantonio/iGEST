import 'package:igest_app/models/principal/persona.dart';

class Usuario {
  int? idUsuario;
  String? nomUsu;
  String? pwdUsu;
  bool? activo;
  bool? cambioPwd;

  Persona? obPersona;
  //List<UsuarioSedeSistema>? lsUsuarioSedeSistema;
  //List<Perfil>? lsPerfil;

  Usuario({this.idUsuario, this.nomUsu, this.pwdUsu, this.activo, this.cambioPwd, this.obPersona});

}
