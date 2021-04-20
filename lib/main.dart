import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_app/wealth_app.dart';

void main() async {
  await AppConfig().init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(WealthApp());
  });
}
