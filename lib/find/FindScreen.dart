import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/find/Section.dart';
import 'package:flutter_app/mine/ThirdScreen.dart';
import 'package:flutter_app/provider/section_list.dart';
import 'package:provider/provider.dart';

import 'SectionItem.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

// class FindScreen extends StatefulWidget {
//   @override
//   _FindScreenState createState() => _FindScreenState();
// }

// // 暗号：原来还可以这么玩
// class _FindScreenState extends State<FindScreen> {
//   List<Section> _dataList = [];

//   int currentPage = 1;

//   // ScrollController _scrollController = ScrollController();
//   getDataList(bool isRefresh) async {
//     String url =
//         'http://m.app.haosou.com/index/getData?type=1&page=$currentPage';
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       var data = response.body;
//       var json = jsonDecode(data);

//       if (isRefresh == true) {
//         _refreshController.refreshCompleted();
//         // _refreshController.loadComplete();
//         _refreshController.resetNoData();
//         setState(() {
//           _dataList = Section.fromMapData(json);
//         });
//       } else {
//         _refreshController.loadComplete();
//         setState(() {
//           _dataList.addAll(Section.fromMapData(json));
//         });
//       }
//       currentPage++;

//       // setState(() {
//       //   var resultList = Section.fromMapData(json);
//       //   if (resultList.length == 0) {
//       //     _refreshController.loadNoData();
//       //   }
//       //   if (currentPage == 1) {
//       //     _dataList = Section.fromMapData(json);
//       //   } else {
//       //     _dataList.addAll(resultList);
//       //   }
//       // });
//     } else {
//       if (isRefresh == true) {
//         _refreshController.refreshFailed();
//       } else {
//         _refreshController.loadFailed();
//       }
//     }
//   }

//   RefreshController _refreshController =
//       RefreshController(initialRefresh: false);

//   @override
//   void initState() {
//     super.initState();
//     getDataList(true);
//     // _scrollController.addListener(() {
//     //   if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
//     //     print('滑动到最底部了');
//     //   }
//     // });
//   }

//   _buildContent() {
//     if (_dataList.isEmpty) {
//       return new Center(child: CircularProgressIndicator());
//     } else {
//       return SmartRefresher(
//         controller: _refreshController,
//         enablePullDown: true,
//         enablePullUp: true,
//         header: ClassicHeader(
//           // refreshingIcon: ,
//           refreshingText: '正在加载中',
//           idleText: '拉刷新',
//           completeText: '加载完成',
//           failedText: '数据刷新异常',
//           releaseText: '松开刷新',
//         ),
//         footer: ClassicFooter(
//           idleText: '加载更多数据',
//           loadingText: '玩命加载中...',
//           noDataText: '没有更多数据啦',
//         ),
//         onRefresh: _onRefresh,
//         onLoading: _onLoading,
//         child: ListView.builder(
//             // controller: _scrollController,
//             itemCount: _dataList.length,
//             itemBuilder: (context, index) {
//               Section model = _dataList[index];
//               return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ThirdScreen('${model.name}')));
//                 },
//                 child: SectionItem(model),
//               );
//             }),
//       );
//     }
//   }

//   _onRefresh() async {
//     currentPage = 1;
//     getDataList(true);
//     // await Future.delayed(Duration(seconds: 1), () {
//     //   _refreshController.refreshCompleted();
//     // });
//   }

//   _onLoading() async {
//     // await Future.delayed(Duration(seconds: 1), () {
//     //   currentPage++;
//     //   getDataList();
//     //   _refreshController.loadComplete();
//     // _refreshController.loadFailed();
//     // _refreshController.loadNoData();
//     // });
//     this.getDataList(false);
//   }

//   // Future<void> _onRefresh() async{
//   //   await Future.delayed(Duration(seconds: 2),(){
//   //     print('_onRefresh');
//   //   });
//   // }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(title: Text('发现')),
//       body: _buildContent(),
//     );
//   }
// }

/*******************************************/
class FindScreen extends StatefulWidget {
  @override
  _FindScreenState createState() => _FindScreenState();
}

// 暗号：原来还可以这么玩
class _FindScreenState extends State<FindScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    SectionListProvider provider =
        Provider.of<SectionListProvider>(context, listen: false);
    provider.refreshData();
  }

  _buildContent() {
    return Consumer<SectionListProvider>(builder: (context, provider, _) {
      // if (provider.showValue == 0) {
      //   return new Center(child: CircularProgressIndicator());
      // }
      return IndexedStack(
        index: provider.showValue,
        children: <Widget>[
          new Center(child: CircularProgressIndicator()),
          SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            header: ClassicHeader(
              // refreshingIcon: ,
              refreshingText: '正在加载中',
              idleText: '拉刷新',
              completeText: '加载完成',
              failedText: '数据刷新异常',
              releaseText: '松开刷新',
            ),
            footer: ClassicFooter(
              idleText: '加载更多数据',
              loadingText: '玩命加载中...',
              noDataText: '没有更多数据啦',
            ),
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
                // controller: _scrollController,
                itemCount: provider.sectionLists.length,
                itemBuilder: (context, index) {
                  Section model = provider.sectionLists[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ThirdScreen('${model.name}')));
                    },
                    child: SectionItem(model),
                  );
                }),
          )
        ],
      );
    });
    // if (_dataList.isEmpty) {
    //   return new Center(child: CircularProgressIndicator());
    // } else {
    //   return SmartRefresher(
    //     controller: _refreshController,
    //     enablePullDown: true,
    //     enablePullUp: true,
    //     header: ClassicHeader(
    //       // refreshingIcon: ,
    //       refreshingText: '正在加载中',
    //       idleText: '拉刷新',
    //       completeText: '加载完成',
    //       failedText: '数据刷新异常',
    //       releaseText: '松开刷新',
    //     ),
    //     footer: ClassicFooter(
    //       idleText: '加载更多数据',
    //       loadingText: '玩命加载中...',
    //       noDataText: '没有更多数据啦',
    //     ),
    //     onRefresh: _onRefresh,
    //     onLoading: _onLoading,
    //     child: ListView.builder(
    //         // controller: _scrollController,
    //         itemCount: _dataList.length,
    //         itemBuilder: (context, index) {
    //           Section model = _dataList[index];
    //           return InkWell(
    //             onTap: () {
    //               Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                       builder: (context) => ThirdScreen('${model.name}')));
    //             },
    //             child: SectionItem(model),
    //           );
    //         }),
    //   );
    // }
  }

  _onRefresh() async {
    SectionListProvider provider =
        Provider.of<SectionListProvider>(context, listen: false);
    bool isSuccess = await provider.refreshData();
    if (isSuccess) {
      _refreshController.refreshCompleted();
    } else {
      _refreshController.refreshFailed();
    }
  }

  _onLoading() async {
    SectionListProvider provider =
        Provider.of<SectionListProvider>(context, listen: false);
    bool isSuccess = await provider.loadMoreData();
    if (isSuccess) {
      _refreshController.loadComplete();
    } else {
      _refreshController.loadComplete();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('发现')),
      body: _buildContent(),
    );
  }
}
