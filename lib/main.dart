import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_hind/Provider/disconnectStatus.dart';
import 'package:share_a_hind/Screens/MakeReceiverConnectionScreen.dart';
import 'Screens/HomeScreen.dart';
import './Screens/MakeSenderConnectionScreen.dart';
import "./Screens/SendReceiveFileScreen.dart";
import "package:flutter/services.dart";
import "./Screens/CheckScreen.dart";
import 'Screens/Permission.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ChangeNotifierProvider.value(
      value: CheckConnectionStatus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Saajha Kare',
        home: Cond(),
        theme: ThemeData(primarySwatch: Colors.orange),
        routes: {
          'send': (context) => MakeSenderConnectionScreen(
              ModalRoute.of(context).settings.arguments),
          'receive': (context) => MakeReceiverConnectionScreen(
              ModalRoute.of(context).settings.arguments),
          'Select File Screen': (context) =>
              SendReceiveFileScreen(ModalRoute.of(context).settings.arguments),
          'home': (context) => HomeScreen(),
          '/permission': (context) => Permission()
        },
      ),
    );
  }
}
