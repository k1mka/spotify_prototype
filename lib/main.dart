import 'package:flutter/material.dart';

import 'get_it.dart';
import 'spotify_prototype_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const SpotifyPrototypeApp());
}
