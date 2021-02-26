import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wclone/provider/appState.dart';
import 'package:wclone/screens/homeScreen.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(ChangeNotifierProvider<AppStates>(
    create: (context) => AppStates(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WhatsApp',
        theme: Provider.of<AppStates>(context).theme == ThemeType.DARK
            ? ThemeData.dark().copyWith(accentColor: Colors.black)
            : ThemeData.light().copyWith(
                primaryColor: Color(0xff075e54), accentColor: Colors.black),
        home: WhatsAppHome(cameras: cameras));
  }
}
