import 'package:flutter_dotenv/flutter_dotenv.dart';

enum ConfigVar { backendBaseUrl }

extension ConfigVarExtension on ConfigVar {
  String get value {
    switch (this) {
      case ConfigVar.backendBaseUrl:
        return dotenv.env['BACKEND_BASE_URL'] ?? '';
      default:
        throw ("No config var");
    }
  }
}
