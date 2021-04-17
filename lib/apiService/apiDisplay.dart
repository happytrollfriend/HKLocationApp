import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locationproject/string/systemSettingUi.dart';
import 'httpRequest.dart';
import 'package:provider/provider.dart';
import 'package:locationproject/string/stringValue.dart';
import 'package:locationproject/locationService/get_location.dart';

class HttpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LanguageUi ui = LanguageUi();

    return Scaffold(
        appBar: ui.getAppbar(context),
        body: MainDisplayPage(),
        bottomNavigationBar: bottomAppBarWidget(context));
  }
}

ButtonBar bottomAppBarWidget(context) {
  ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return ButtonBar(
    buttonHeight: 55,
    alignment: MainAxisAlignment.center,
    children: <Widget>[
      Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(3),
            width: width / 4.5,
            child: RaisedButton(
              onPressed: () {
                _themeChanger.setDisplayList('home');
              },
              child: Icon(Icons.home),
            ),
          ),
          Container(
            margin: EdgeInsets.all(3),
            width: width / 4.5,
            child: RaisedButton(
              onPressed: () {
                _themeChanger.setDisplayList('sortedBuildingDisplayList');
              },
              child: Icon(Icons.sort),
            ),
          ),
          Container(
            margin: EdgeInsets.all(3),
            width: width / 4.5,
            child: RaisedButton(
              onPressed: () {
                _themeChanger.setDisplayList('currentLocationDisplayList');
              },
              child: Icon(Icons.my_location),
            ),
          ),
          Container(
            margin: EdgeInsets.all(3),
            width: width / 4.5,
            child: RaisedButton(
              onPressed: () {
                _themeChanger.setDisplayList('nearlyBuildingDisplayList');
              },
              child: Icon(Icons.near_me),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.all(3),
        width: width,
        child: GetLocationWidget()
      ),
    ],
  );
}

