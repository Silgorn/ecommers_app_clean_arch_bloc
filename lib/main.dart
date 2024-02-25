import 'package:ecommers_app2/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'service_locator.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}
