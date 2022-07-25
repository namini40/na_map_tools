import 'package:flutter/material.dart';
import 'package:na_map_tools/namaptools_lib.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NaMapTools naMapTools = NaMapTools();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('NaToolsMap Example'),
        ),
        body: Center(
          child: Text(
              'closest city:${naMapTools.findClosestCity(NaLocation(longitude: 34.0, latitude: 52.0)).geoLocation.toString()} '),
        ),
      ),
    );
  }
}
