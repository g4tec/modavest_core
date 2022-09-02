import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class KeyCloakConfig {
  Future get config async => json.decode(await getJson());

  Future<String> getJson() async {
    return rootBundle.loadString('assets/json/key_cloack.json');
  }
}
