import 'package:flutter/material.dart';

import 'local_repo/service_preferences.dart';
import 'presentation/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicePref.init();
  runApp(AppWidget());
}
