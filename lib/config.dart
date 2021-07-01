import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' as json;

class Configure {
  late String baseUrl;
  late Future initialized;

  Configure() {
    initialized = init();
  }

  init() async {
    final configJson = await loadAsset();
    final config = json.jsonDecode(configJson);
    baseUrl = config['baseUrl'];
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config.json');
  }
}
