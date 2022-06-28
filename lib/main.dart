import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', ''), // Farsi
      ],
      theme: ThemeData(
          fontFamily: 'DANAFONT',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 25, color: Colors.red),
          )),
      title: "برنامه",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
            child: Row(
              children: [
                Text(
                  "سلام",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  "خوبی",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            )));
  }
}
