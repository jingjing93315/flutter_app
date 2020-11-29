import 'package:flutter/material.dart';
import 'package:flutter_app/mine/navigation_task.dart';

class MineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: Text('我的')
        ),
        body: Center(
            child: RaisedButton(
              child: Text('点击跳转'),
              onPressed: (){
                // Navigator.of(context).pushNamed(
                //     routeName:
                // )
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => NavigationTask()
                ));
              }
            )
        )
    );
  }
}
