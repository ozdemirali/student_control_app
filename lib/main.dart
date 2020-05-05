import 'package:flutter/material.dart';
import 'package:studentcontrolapp/screens/homePage.dart';


// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
/*void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}*/



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return  MaterialApp(
      title: "Student Demo",
      home: HomePage(),
    );
  }
}
