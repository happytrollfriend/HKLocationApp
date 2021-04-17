import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:locationproject/string/stringValue.dart';

ListView cl(LinkedHashMap page, List placesNameList, List streetsNameList,
    district, summary, context) {
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Total ${placesNameList.length} ${systemText('places')}'),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: ListView.builder(
                    itemBuilder: (context, idx) {
                      return ListTile(
                        title: Text(placesNameList[idx]),
                      );
                    },
                    itemCount: placesNameList.length,
                  ),
                );
              });
        },
      ),
      ListTile(
        title: Text('Total ${streetsNameList.length} ${systemText('streets')}'),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: ListView.builder(
                    itemBuilder: (context, idx) {
                      return ListTile(
                        title: Text(streetsNameList[idx]),
                      );
                    },
                    itemCount: streetsNameList.length,
                  ),
                );
              });
        },
      ),
      ListTile(
        title: Text(district.toString()),
      ),
      ListTile(
        title: Text(summary),
      )
    ],
  );
}

ListView er(
    List candidatesType,
    List candidatesTypeSorted,
    List candidatesName,
    List candidatesAddress,
    List candidates,
    double size,
    List lat,
    List lng,
    int index) {
  int theListLength = 0;
  List theSortedCandidates = [];
  for (int i = 0; i < candidatesType.length; i++) {
    if (candidatesTypeSorted[index] == candidatesType[i]) {
      theListLength++;
      theSortedCandidates.add(candidates[i]);
    }
  }

  return ListView.builder(
      itemCount: theListLength,
      itemBuilder: (context, idx) {
        return ListTile(
          subtitle: Text(theSortedCandidates[idx]['nameOther'].toString()),
          title: Text(theSortedCandidates[idx]['name'].toString()),
          trailing: Text(theSortedCandidates[idx]['address'].toString()),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: locationInformationList(candidates, idx, lat, lng),
                  );
                });
          },
        );
      });
}

ListView ls(List candidatesName, List candidatesAddress, List candidates,
    double size, List lat, List lng) {
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
  return ListView.builder(
    itemBuilder: (context, idx) {
      return ListTile(
        title: Text(
          candidatesName[idx].toString(),
          style: TextStyle(fontSize: size),
        ),
        subtitle: Text(candidatesAddress[idx].toString()),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: locationInformationList(candidates, idx, lat, lng),
                );
              });
        },
      );
    },
    itemCount: candidates.length,
  );
}

//candidatesLocation.add(candidates[i]['location']);
//candidatesType.add(candidates[i]['type']);
//candidatesName.add(candidates[i]['name']);
//candidatesNameOther.add(candidates[i]['nameOther']);
//candidatesAddress.add(candidates[i]['address']);
//candidatesAddressOther.add(candidates[i]['addressOther']);
//candidatesBrief.add(candidates[i]['brief']);
//candidatesLocationLat.add(candidatesLocation[i]['lat']);
//candidatesLocationLng.add(candidatesLocation[i]['lng']);
ListView locationInformationList(
    List candidates, int index, List lat, List lng) {
  return ListView(
    children: <Widget>[
      AppBar(
        title: Text(systemText('locationDetail')),
        automaticallyImplyLeading: false,
      ),
      ListTile(
        title: Text(systemText('locationType')),
        subtitle: Text(candidates[index]['type'].toString()),
      ),
      ListTile(
        title: Text(systemText('locationChineseName')),
        subtitle: Text(candidates[index]['name'].toString()),
      ),
      ListTile(
        title: Text(systemText('locationEnglishName')),
        subtitle: Text(candidates[index]['nameOther'].toString()),
      ),
      ListTile(
        title: Text(systemText('locationAddressChinese')),
        subtitle: Text(candidates[index]['address'].toString()),
      ),
      ListTile(
        title: Text(systemText('locationAddressEnglish')),
        subtitle: Text(candidates[index]['addressOther'].toString()),
      ),
      ListTile(
        title: Text(systemText('locationBrief')),
        subtitle: Text(candidates[index]['brief'].toString()),
      ),
      ListTile(
        title: Text(systemText('locationLatitudeAndLongitude')),
        subtitle: Text(
            '${systemText('Latitude')}${lat[index].toString()} ${systemText('Longitude')}${lat[index].toString()}'),
      ),
    ],
  );
}

//candidatesLocation.add(candidates[i]['location']);
//candidatesType.add(candidates[i]['type']);
//candidatesName.add(candidates[i]['name']);
//candidatesNameOther.add(candidates[i]['nameOther']);
//candidatesAddress.add(candidates[i]['address']);
//candidatesAddressOther.add(candidates[i]['addressOther']);
//candidatesBrief.add(candidates[i]['brief']);
//candidatesLocationLat.add(candidatesLocation[i]['lat']);
//candidatesLocationLng.add(candidatesLocation[i]['lng']);
