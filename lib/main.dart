import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'get_it.dart';
import 'spotify_prototype_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();
  await Hive.initFlutter();
  runApp(const SpotifyPrototypeApp());
}
