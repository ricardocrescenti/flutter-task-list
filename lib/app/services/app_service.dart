import 'package:module_provider/module_provider.dart';

class AppService extends Service {
  AppService(Module module) : super(module);

  bool _darkMode = false;
  bool get darkMode => _darkMode;

  changeDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }
}