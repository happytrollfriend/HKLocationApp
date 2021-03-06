import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String theLocate = 'en';
double textSizeValue = 24;
String systemText(String text) {
  return Strings().getText(text);
}

TextStyle getTextSetting(double size) {
  return Strings().getTextStyle();
}

class Strings {
  String getText(String text) {
    switch (theLocate) {
      // en locate ==================================================================================================================
      case 'en':
        switch (text) {
          case 'language':
            return 'Language';
            break;
          case 'english':
            return 'English';
            break;
          case 'chinese':
            return 'Chinese';
            break;
          case 'small':
            return 'Small';
            break;
          case 'medium':
            return 'Medium';
            break;
          case 'large':
            return 'Large';
            break;
          case 'nightmode':
            return 'Nightmode';
            break;
          case 'lightmode':
            return 'Lightmode';
            break;
          case 'Brightness.dark':
            return 'Nightmode';
            break;
          case 'Brightness.light':
            return 'Lightmode';
            break;
          case 'CurrentState':
            return 'CurrentState';
            break;
          case 'places':
            return 'Places';
            break;
          case 'streets':
            return 'Streets';
            break;
          case 'district':
            return 'District';
            break;
          case 'summary':
            return 'LocationSummary';
            break;
          case 'fontsize':
            return 'Fontsize';
            break;
          case 'textmode':
            return 'Textmode';
            break;
          case 'appbarTitle':
            return 'Hong Kong Location Information';
            break;
          case 'coverage':
            return 'SearchCoverage';
            break;
          case 'settingPageTitle':
            return 'SettingPage';
            break;
          case 'nearlyBuilding':
            return 'NearlyBuilding';
            break;
          case 'yourLocation':
            return 'YourLocation';
            break;
          case 'locationDetail':
            return 'Location Information';
            break;
          case 'locationType':
            return 'Type';
            break;
          case 'locationChineseName':
            return 'ChineseName';
            break;
          case 'locationEnglishName':
            return 'EnglishName';
            break;
          case 'locationAddressChinese':
            return 'Address (Chinese)';
            break;
          case 'locationAddressEnglish':
            return 'Address (English)';
            break;
          case 'locationBrief':
            return 'Brief';
            break;
          case 'locationLatitudeAndLongitude':
            return 'LocationLatitudeAndLongitude';
            break;
          case 'Latitude':
            return 'Latitude is';
            break;
          case 'Longitude':
            return 'Longitude is';
            break;
          case 'updateGPS':
            return 'Refresh Your GPS';
            break;
          case 'checkYourGpsStatus':
            return 'Check Your GPS Status';
            break;
          case 'gpsPermission':
            return 'GPS Permission Status';
            break;
          case 'gpsEnabled':
            return 'GPS Service Enabled';
            break;
          case 'gpsGranted':
            return 'Granted';
            break;
          case 'gpsHaveEnabled':
            return 'Enabled';
            break;
          case 'currentLatAndLng':
            return 'CurrentLatAndLng';
            break;
          default:
            return 'error , please contact us';
            break;
        }
        break;

      // zh locate ==================================================================================================================
      case 'zh':
        switch (text) {
          case 'language':
            return '????????????';
            break;
          case 'english':
            return '??????';
            break;
          case 'chinese':
            return '??????';
            break;
          case 'small':
            return '???';
            break;
          case 'medium':
            return '???';
            break;
          case 'large':
            return '???';
            break;
          case 'nightmode':
            return '????????????';
            break;
          case 'lightmode':
            return '????????????';
            break;
          case 'Brightness.dark':
            return '????????????';
            break;
          case 'Brightness.light':
            return '????????????';
            break;
          case 'CurrentState':
            return '????????????';
            break;
          case 'coverage':
            return '????????????';
            break;
          case 'places':
            return '??????';
            break;
          case 'streets':
            return '??????';
            break;
          case 'district':
            return '??????';
            break;
          case 'summary':
            return '??????????????????';
            break;
          case 'fontsize':
            return '????????????';
            break;
          case 'textmode':
            return '????????????';
            break;
          case 'appbarTitle':
            return '??????????????????';
            break;
          case 'settingPageTitle':
            return '????????????';
            break;
          case 'locationDetail':
            return '????????????';
            break;
          case 'locationType':
            return '????????????';
            break;
          case 'locationChineseName':
            return '????????????(??????)';
            break;
          case 'locationEnglishName':
            return '????????????(??????)';
            break;
          case 'locationAddressChinese':
            return '????????????(??????)';
            break;
          case 'locationAddressEnglish':
            return '????????????(??????)';
            break;
          case 'locationBrief':
            return '????????????';
            break;
          case 'locationLatitudeAndLongitude':
            return '???????????????';
            break;
          case 'Latitude':
            return '?????????';
            break;
          case 'Longitude':
            return '?????????';
            break;
          case 'nearlyBuilding':
            return '????????????';
            break;
          case 'yourLocation':
            return '????????????';
            break;
          case 'updateGPS':
            return '????????????';
            break;
          case 'checkYourGpsStatus':
            return '??????GPS??????';
            break;
          case 'gpsPermission':
            return 'GPS????????????';
            break;
          case 'gpsEnabled':
            return 'GPS????????????';
            break;
          case 'currentLatAndLng':
            return '???????????????';
            break;
          case 'gpsGranted':
            return '?????????';
            break;
          case 'gpsHaveEnabled':
            return '?????????';
            break;
          default:
            return '?????????????????? , ???????????????';
            break;
        }
        break;
      // default ==================================================================================================================
      default:
        switch (text) {
          case 'welcome':
            return 'welcome';
            break;
          default:
            return 'error , please contact us';
            break;
        }
        break;
    }
  }

  TextStyle getTextStyle() {
    return TextStyle(fontSize: textSizeValue);
  }

  Color getThemeTextColor(String theme) {
    if (theme == 'light') {
      return Colors.black;
    } else if (theme == 'dark') {
      return Colors.white;
    }
    return Colors.white;
  }
}

class ThemeChanger with ChangeNotifier {
  Brightness _themeData;
  double _textFont;
  String _coverage;
  double _lat;
  double _lng;
  String _displayList;
  int _sortedNumber;
  ThemeChanger(this._themeData, this._textFont);

  getTheme() => _themeData;
  getTextFont() => _textFont;
  getCoverage() => _coverage;
  getLat() => _lat;
  getLng() => _lng;
  getDisplayList() => _displayList;
  getSortedNumber () => _sortedNumber;

  setSortedNumber (int sortedNumber) {
    _sortedNumber = sortedNumber;
    notifyListeners();
  }
  setTheme(Brightness theme) {
    _themeData = theme;
    notifyListeners();
  }

  setTextFont(double textFont) {
    _textFont = textFont;
    notifyListeners();
  }

  setCoverage(String coverage) {
    _coverage = coverage;
    notifyListeners();
  }

  setLat(double lat) {
    _lat = lat;
    notifyListeners();
  }

  setLng(double lng) {
    _lng = lng;
    notifyListeners();
  }

  setDisplayList(String displayList) {
    _displayList = displayList;
    notifyListeners();
  }
}


