import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:collection';
import 'package:locationproject/string/stringValue.dart';
import 'package:locationproject/string/systemSettingUi.dart';
import 'apiUi.dart';
import 'package:provider/provider.dart';

double lat = 0;
double lng = 0;
String coverage = 's';
String displayList = 'building';

//class MainDisplayPage extends StatefulWidget {
//  @override
//  _MainDisplayPageState createState() => _MainDisplayPageState();
//}
//
//class _MainDisplayPageState extends State<MainDisplayPage> {
//  @override
//  Widget build(BuildContext context) {
//    return apiDataBuilder(context);
//  }
//}

class MainDisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return apiDataBuilder(context);
  }
}

FutureBuilder apiDataBuilder(context) {
  final theme = Provider.of<ThemeChanger>(context);

  String host =
      'https://www.findaway.hk/api/request-20200108.php?lang=$theLocate&lat=${theme.getLat()}&lng=${theme.getLng()}&coverage=${theme.getCoverage()}';
  fetch() async {
    return http.get(host);
  }

  return FutureBuilder(
      future: fetch(),
      builder: (context, snap) {
        if (!snap.hasData) {
          return Container(
            child: Text('Please Open Your GPS Permission'),
          );
        }

        LinkedHashMap datas = jsonDecode(snap.data.body);
        // ==============================================================
        List candidates = datas['candidates'];
        // ==============================================================
        List candidatesLocation = [];
        List candidatesType = [];
        List candidatesName = [];
        List candidatesNameOther = [];
        List candidatesAddress = [];
        List candidatesAddressOther = [];
        List candidatesBrief = [];
        List candidatesLocationLat = [];
        List candidatesLocationLng = [];
        List candidatesTypeSelection = [];
        //  ===============================================================
        for (int i = 0; i < candidates.length; i++) {
          candidatesLocation.add(candidates[i]['location']);
          candidatesType.add(candidates[i]['type']);
          candidatesName.add(candidates[i]['name']);
          candidatesNameOther.add(candidates[i]['nameOther']);
          candidatesAddress.add(candidates[i]['address']);
          candidatesAddressOther.add(candidates[i]['addressOther']);
          candidatesBrief.add(candidates[i]['brief']);
          candidatesLocationLat.add(candidatesLocation[i]['lat']);
          candidatesLocationLng.add(candidatesLocation[i]['lng']);
          candidatesTypeSelection = candidatesType.toSet().toList();
        }

        // ==============================================================
        LinkedHashMap page = datas['page'];
        // ==============================================================
        List places = page['places'];
        LinkedHashMap placesName;
        List placesNameList = [];
        // ===============================================================
        List streets = page['streets'];
        LinkedHashMap streetsName;
        List streetsNameList = [];
        // ===============================================================
        var district = page['district'];
        var summary = page['summary'];

        for (int i = 0; i < places.length; i++) {
          placesName = places[i];
          Iterable placesNameDecoded = placesName.values;
          List placesNameTempList = placesNameDecoded.toList();
          placesNameList.add(placesNameTempList[0]);
        }
        for (int i = 0; i < streets.length; i++) {
          streetsName = streets[i];
          Iterable streetsNameDecoded = streetsName.values;
          List streetsNameTempList = streetsNameDecoded.toList();
          streetsNameList.add(streetsNameTempList[0]);
        }
        // ==============================================================
        switch (theme.getDisplayList()) {
          case 'currentLocationDisplayList':
            return cl(page, placesNameList, streetsNameList, district, summary,
                context);
            break;
//          case 'nearlyBuildingDisplayList':
//            return ls(candidatesName, candidatesAddress, candidates,
//                theme.getTextFont(),candidatesLocationLat,candidatesLocationLng);
//            break;
          case 'sortedBuildingDisplayList':
            return ListView.builder(
                itemCount: candidatesTypeSelection.length,
                itemBuilder: (context, idx) {
                  return ListTile(
                    title: Text(candidatesTypeSelection[idx].toString()),
                    onTap: () {
                      theme.setSortedNumber(idx);
                      theme.setDisplayList('sortedBuildingDisplay');
                    },
                  );
                });
            break;
          case 'sortedBuildingDisplay':
            return er(
                candidatesType,
                candidatesTypeSelection,
                candidatesName,
                candidatesAddress,
                candidates,
                theme.getTextFont(),
                candidatesLocationLat,
                candidatesLocationLng,
                theme.getSortedNumber());
            break;
          case 'nearlyBuildingDisplayList':
            return ls(
                candidatesName,
                candidatesAddress,
                candidates,
                theme.getTextFont(),
                candidatesLocationLat,
                candidatesLocationLng);
            break;
          case 'home':
            return HomeSelectPage();
            break;
          default:
            return HomeSelectPage();
            break;
        }
      });
}
//HomeSelectPage
