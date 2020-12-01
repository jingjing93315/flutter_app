import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrendScreen extends StatelessWidget {
  final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text('动态')),
        body: Center(
            child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('存储数据'),
                onPressed: () async {
                  SharedPreferences pref = await _preferences;
                  pref.setString('gjKey', '一线蓝光');
                }),
            RaisedButton(
                child: Text('读取数据'),
                onPressed: () async {
                  SharedPreferences pref = await _preferences;
                  // dynamic
                  String data = pref.get('gjKey');
                  print('data:$data');
                })
          ],
        )));
  }
}
