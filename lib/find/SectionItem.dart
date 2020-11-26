import 'package:flutter/material.dart';

import 'Section.dart';

// 暗号哦：不用背，学规律
class SectionItem extends StatelessWidget {
  final Section model;
  SectionItem(this.model);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(model.logo),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 100,
                    child: Text(
                      model.location,
                      maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('|${model.type}',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text('|${model.size}',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text('|${model.employee}',
                          style: TextStyle(fontSize: 12, color: Colors.grey))
                    ],
                  )
                ],
              ),
            ),
            Divider(
                height: 5,
                indent: 0.0,
                color: Color.fromRGBO(204, 204, 204, .8)),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('热招:',
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(width: 5),
                        Text(model.hot,
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(width: 5),
                        Text('等${model.count}个职位',
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_sharp,
                        size: 12, color: Colors.grey)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
