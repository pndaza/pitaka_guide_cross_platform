import 'package:flutter/material.dart';

import 'app.dart';
import 'data/shared_pref_client.dart';

void main() async {
  // https://github.com/tekartik/sqflite/blob/master/sqflite_common_ffi/doc/using_ffi_instead_of_sqflite.md
  // sqflite only supports iOS/Android/MacOS
  // so  sqflite_common_ffi will be used for windows and linux

  // Required for async calls in `main`
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize SharedPrefs instance.

  await SharedPreferenceClient.init();

  runApp(const MyApp());
}
