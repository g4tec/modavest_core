import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter/services.dart' show rootBundle;

class KeyCloakConfig {
  Future get config async => json.decode(await getJson());

  Future<String> getJson() async {
    String? envJson = dotenv.env['keyCloakJson'];

    if (envJson != null) {
      return envJson;
    }
    return rootBundle.loadString('assets/json/key_cloack.json');
  }
}
