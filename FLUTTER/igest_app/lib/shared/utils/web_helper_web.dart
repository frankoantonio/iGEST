import 'package:web/web.dart' as web;

void replaceUrl(String path) {
  if (web.window.location.pathname != path) {
    web.window.history.replaceState(null, 'iGEST', path);
  }
}
