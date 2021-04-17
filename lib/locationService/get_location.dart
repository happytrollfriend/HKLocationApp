import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:locationproject/apiService/httpRequest.dart';
import 'package:locationproject/string/stringValue.dart';
import 'package:provider/provider.dart';

class GetLocationWidget extends StatefulWidget {
  const GetLocationWidget({Key key}) : super(key: key);

  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocationWidget> {
  final Location location = Location();

  LocationData _location;
  String _error;

  Future<void> _getLocation() async {
    setState(() {
      _error = null;
    });
    try {
      final LocationData _locationResult = await location.getLocation();
      setState(() {
        _location = _locationResult;
        lng = _location.longitude;
        lat = _location.latitude;
      });
    } on PlatformException catch (err) {
      setState(() {
        _error = err.code;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return RaisedButton(
//        Text(systemText('updateGPS'))
      child: Icon(Icons.settings_input_antenna),
      onPressed: () {
        _getLocation();
        _themeChanger.setLat(lat);
        _themeChanger.setLng(lng);
      },
    );
  }
}
