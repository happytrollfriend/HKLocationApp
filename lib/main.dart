import 'package:flutter/material.dart';
import 'package:locationproject/apiService/apiDisplay.dart';
import 'package:provider/provider.dart';
import 'string/systemSettingUi.dart';
import 'package:locationproject/string/stringValue.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) {
        return ThemeChanger(Brightness.dark, 16);
      },
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      title: 'ELECS326F Project',
      theme: ThemeData(
          brightness: theme.getTheme(),
          primaryColor: Colors.pink,
          accentColor: Colors.greenAccent,
          textTheme: TextTheme(
              body1: TextStyle(fontSize: theme.getTextFont()),
              title: TextStyle(fontSize: theme.getTextFont()),
              body2: TextStyle(fontSize: theme.getTextFont()))),
      home: HttpPage(),
    );
  }
}

//class Bloc {
//  final _themeController = StreamController<bool>();
//  get changeTheme => _themeController.sink.add;
//  get darkThemeEnable => _themeController.stream;
//}
//
//final bloc = Bloc();
