import 'package:flutter/material.dart';
import 'package:flutter_app/mine/SecondScreen.dart';

class NavigationTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text('导航的使用')),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(child: Text('静态跳转'), onPressed: (){
                Navigator.of(context).pushNamed('/second').then((value) => {
                  print(value)
                });
              }),
              RaisedButton(child: Text('动态跳转'), onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen('gaojing')));
              })
            ],
          ),
        ));
  }
}
