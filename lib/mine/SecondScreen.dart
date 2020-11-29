import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {

  final String content;
  SecondScreen(this.content);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {


  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: Text('二级页面')
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(child: Text('返回方式一'), onPressed: (){
                Navigator.of(context).pop('回传的数据'); // 销毁掉了
              }),
              RaisedButton(child: Text('返回方式二'), onPressed: (){
                Navigator.of(context).popAndPushNamed('/third');
              }),
              RaisedButton(child: Text('返回方式三'), onPressed: (){
                Navigator.of(context).pushReplacementNamed('/third');
              })
            ],
          ),
        )
    );
  }
}
