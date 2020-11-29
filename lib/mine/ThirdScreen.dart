import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {

  final String detailContent;
  ThirdScreen(this.detailContent);


  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: Text('详情页')
        ),
        body: Center(
            child: Text(this.widget.detailContent)
        )
    );
  }
}
