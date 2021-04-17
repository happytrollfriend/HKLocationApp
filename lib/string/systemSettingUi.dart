import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'stringValue.dart';
import 'package:locationproject/apiService/httpRequest.dart';

class LanguageUi {
  AppBar getAppbar(context) {
    return AppBar(
      title: Text(systemText('appbarTitle')),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TextSettingPage();
              }));
            }),
      ],
    );
  }
}

class TextSettingPage extends StatefulWidget {
  @override
  _TextSettingPageState createState() => _TextSettingPageState();
}

class _TextSettingPageState extends State<TextSettingPage> {
  int _radioLanguageValue;
  int _radioTextValue;
  int _radioModeValue;
  int _radioCoverageValue;

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void _handleRadioModeValueChange(int value) {
      setState(() {
        _radioModeValue = value;
        if (_radioModeValue == 0) {
//        brightness = Brightness.dark;
          _themeChanger.setTheme(Brightness.dark);
        } else if (_radioModeValue == 1) {
//        brightness = Brightness.light;
          _themeChanger.setTheme(Brightness.light);
        }
      });
    }

    void _handleRadioLanguageValueChange(int value) {
      setState(() {
        _radioLanguageValue = value;
        if (_radioLanguageValue == 0) {
          setState(() {
            theLocate = 'zh';
          });
        } else if (_radioLanguageValue == 1) {
          setState(() {
            theLocate = 'en';
          });
        }
      });
    }

    void _handleRadioTextValueChange(int value) {
      setState(() {
        _radioTextValue = value;
        if (_radioTextValue == 0) {
          _themeChanger.setTextFont(14);
        } else if (_radioTextValue == 1) {
          _themeChanger.setTextFont(16);
        } else if (_radioTextValue == 2) {
          _themeChanger.setTextFont(18);
        }
      });
    }

    void _handleRadioCoverageValueChange(int value) {
      setState(() {
        _radioCoverageValue = value;
        if (_radioCoverageValue == 0) {
          _themeChanger.setCoverage('s');
        } else if (_radioCoverageValue == 1) {
          _themeChanger.setCoverage('m');
        } else if (_radioCoverageValue == 2) {
          _themeChanger.setCoverage('l');
        }
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(systemText('settingPageTitle')),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(border: Border.all(width: 2.5)),
                height: 200,
                width: width,
                margin: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Text(
                      systemText('CurrentState'),
                    ),
                    Text(
                      '${systemText('fontsize')}  ${_themeChanger.getTextFont()}',
                    ),
                    Text(
                      '${systemText('language')}  $theLocate',
                    ),
                    Text(
                      '${systemText('textmode')}  ${systemText(_themeChanger.getTheme().toString())}',
                    ),
                    Text(
                      '${systemText('gpsPermission')}  ${systemText('gpsGranted')}',
                    ),
                    Text(
                      '${systemText('gpsEnabled')}  ${systemText('gpsHaveEnabled')}',
                    ),
                    Text(
                      '${systemText('currentLatAndLng')}  ${_themeChanger.getLat()} & ${_themeChanger.getLng()}',
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 80,
                    child: Text(
                      systemText('fontsize'),
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment(0.0, 0.0),
                  ),
                  Container(
                    height: 30,
                    width: width / 1.5,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.8, color: Colors.red),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: <Widget>[
                        Text(systemText('small')),
                        new Radio(
                          value: 0,
                          groupValue: _radioTextValue,
                          onChanged: _handleRadioTextValueChange,
                        ),
                        Text(systemText('medium')),
                        new Radio(
                          value: 1,
                          groupValue: _radioTextValue,
                          onChanged: _handleRadioTextValueChange,
                        ),
                        Text(systemText('large')),
                        new Radio(
                          value: 2,
                          groupValue: _radioTextValue,
                          onChanged: _handleRadioTextValueChange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 80,
                    child: Text(
                      systemText('language'),
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment(0.0, 0.0),
                  ),
                  Container(
                    height: 30,
                    width: width / 1.5,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.8, color: Colors.red),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: <Widget>[
                        Text(systemText('chinese')),
                        new Radio(
                          value: 0,
                          groupValue: _radioLanguageValue,
                          onChanged: _handleRadioLanguageValueChange,
                        ),
                        Text(systemText('english')),
                        new Radio(
                          value: 1,
                          groupValue: _radioLanguageValue,
                          onChanged: _handleRadioLanguageValueChange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 80,
                    child: Text(
                      systemText('textmode'),
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment(0.0, 0.0),
                  ),
                  Container(
                    height: 30,
                    width: width / 1.5,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.8, color: Colors.red),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: <Widget>[
                        Text(systemText('nightmode')),
                        new Radio(
                          value: 0,
                          groupValue: _radioModeValue,
                          onChanged: _handleRadioModeValueChange,
                        ),
                        Text(systemText('lightmode')),
                        new Radio(
                          value: 1,
                          groupValue: _radioModeValue,
                          onChanged: _handleRadioModeValueChange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 80,
                    child: Text(
                      systemText('coverage'),
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment(0.0, 0.0),
                  ),
                  Container(
                    height: 30,
                    width: width / 1.5,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.8, color: Colors.red),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: <Widget>[
                        Text(systemText('small')),
                        new Radio(
                          value: 0,
                          groupValue: _radioCoverageValue,
                          onChanged: _handleRadioCoverageValueChange,
                        ),
                        Text(systemText('medium')),
                        new Radio(
                          value: 1,
                          groupValue: _radioCoverageValue,
                          onChanged: _handleRadioCoverageValueChange,
                        ),
                        Text(systemText('large')),
                        new Radio(
                          value: 2,
                          groupValue: _radioCoverageValue,
                          onChanged: _handleRadioCoverageValueChange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class HomeSelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                'Welcome to This App',
              ),
              subtitle: Text(
                  'Remember to open your GPS and granted the Location Service Permission in first time and you can press the Refresh GPS Button to search building'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              subtitle: Text('This button is for you to back to home page'),
              title: Text(
                'HomePage',
              ),
            ),
            ListTile(
              leading: Icon(Icons.sort),
              subtitle: Text(
                  'This button is to display the building which nearly your location (you can sort the data)'),
              title: Text(
                'Nearly Building (You can Sort the data)',
              ),
            ),
            ListTile(
              leading: Icon(Icons.near_me),
              subtitle: Text(
                  'This button is to display all the building which nearly your location (All Building)'),
              title: Text(
                'Nearly Building (Show All)',
              ),
            ),
            ListTile(
              leading: Icon(Icons.my_location),
              subtitle: Text(
                  'This button is to display your current location status'),
              title: Text(
                'Current Location Status',
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings_input_antenna),
              subtitle: Text('This button is for you refresh the gps status'),
              title: Text(
                'Refresh GPS',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
