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
            return '顯示語言';
            break;
          case 'english':
            return '英文';
            break;
          case 'chinese':
            return '中文';
            break;
          case 'small':
            return '小';
            break;
          case 'medium':
            return '中';
            break;
          case 'large':
            return '大';
            break;
          case 'nightmode':
            return '夜間模式';
            break;
          case 'lightmode':
            return '日間模式';
            break;
          case 'Brightness.dark':
            return '夜間模式';
            break;
          case 'Brightness.light':
            return '日間模式';
            break;
          case 'CurrentState':
            return '當前狀態';
            break;
          case 'coverage':
            return '搜索範圍';
            break;
          case 'places':
            return '地點';
            break;
          case 'streets':
            return '街道';
            break;
          case 'district':
            return '地區';
            break;
          case 'summary':
            return '地點資訊總匯';
            break;
          case 'fontsize':
            return '文本大小';
            break;
          case 'textmode':
            return '文本模式';
            break;
          case 'appbarTitle':
            return '香港地區資訊';
            break;
          case 'settingPageTitle':
            return '設定頁面';
            break;
          case 'locationDetail':
            return '地區資料';
            break;
          case 'locationType':
            return '地區性質';
            break;
          case 'locationChineseName':
            return '地區名稱(中文)';
            break;
          case 'locationEnglishName':
            return '地區名稱(英文)';
            break;
          case 'locationAddressChinese':
            return '地區地址(中文)';
            break;
          case 'locationAddressEnglish':
            return '地區地址(英文)';
            break;
          case 'locationBrief':
            return '地區簡要';
            break;
          case 'locationLatitudeAndLongitude':
            return '地區經緯度';
            break;
          case 'Latitude':
            return '經度為';
            break;
          case 'Longitude':
            return '緯度為';
            break;
          case 'nearlyBuilding':
            return '附近建築';
            break;
          case 'yourLocation':
            return '你的位置';
            break;
          case 'updateGPS':
            return '更新定位';
            break;
          case 'checkYourGpsStatus':
            return '查看GPS狀態';
            break;
          case 'gpsPermission':
            return 'GPS權限開啟';
            break;
          case 'gpsEnabled':
            return 'GPS服務開啟';
            break;
          case 'currentLatAndLng':
            return '當前經緯度';
            break;
          case 'gpsGranted':
            return '已允許';
            break;
          case 'gpsHaveEnabled':
            return '已開啟';
            break;
          default:
            return '文字出現錯誤 , 請聯絡我們';
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


