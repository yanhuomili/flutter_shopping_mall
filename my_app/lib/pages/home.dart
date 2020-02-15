import 'package:flutter/material.dart';
// import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:async';
// import 'package:pull_to_refresh/src/indicator/custom_indicator.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // EasyRefreshController _controller = EasyRefreshController();
  RefreshController  _refreshController = RefreshController(initialRefresh: false);
  List<int> list = [1,2,3,4,5,6,7,8,9];
  int page = 1;

  void _onRefresh() async{
    await Future.delayed(Duration(seconds: 2));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    await Future.delayed(Duration(seconds: 2));
    List<int> arr = [1,2,3,4,5];
    list.addAll(arr);
    print(mounted);
    setState(() {
      page++;
    });
    print(page);
    // if(mounted)
    if(page == 3){
      _refreshController.loadNoData();
    }else{
      _refreshController.loadComplete();
    }

  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        // footer: ClassicFooter(
        //   loadingText: '正在加载中...',
        // ),
        footer: CustomFooter(builder: (BuildContext context, LoadStatus mode){
          Widget body;
          if(mode==LoadStatus.idle){
              body =  Text("上拉加载");
            }
            else if(mode==LoadStatus.loading){
              body =  Text('正在加载中...');
            }
            else if(mode == LoadStatus.failed){
              body = Text("加载失败！点击重试！");
            }
            else if(mode == LoadStatus.canLoading){
               body = Text("松手,加载更多!");
            }
            else{
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
        }),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemExtent: 100.0,
          itemCount: list.length,
          itemBuilder: (c, i) {
            return Padding(
              padding: EdgeInsets.all(30.0),
              child: Text('data--$i'),
            );
          },
        ),
      ),
    //    child: EasyRefresh(
    //     controller: _controller,
    //     enableControlFinishLoad: true,
    //     enableControlFinishRefresh: true,
    //     header: MaterialHeader(),
    //     footer: MaterialFooter(),
    //     onRefresh: () async{
    //       _controller.finishRefresh(success: true);
    //       print('下拉刷新');
    //     },
    //     onLoad: () async{
    //       List<Widget> arr = [Padding(
    //           padding: EdgeInsets.all(30.0),
    //           child: Text('data'),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.all(30.0),
    //           child: Text('data'),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.all(30.0),
    //           child: Text('data'),
    //         ),
    //       ];
    //       setState(() {
    //         list.addAll(arr);
    //         _controller.finishLoad(success: true, noMore: false);
    //         print(list.length);
    //         print('上拉加载');
    //       });
    //     },
    //     child: ListView(
    //       children: list,    
    //     ),
    //   ),
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({Key key}) : super(key: key);
//   EasyRefreshController _easyRefreshController = EasyRefreshController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: EasyRefresh(
//         child: ListView(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(30.0),
//               child: Text('data'),
//             ),
//             Padding(
//               padding: EdgeInsets.all(30.0),
//               child: Text('data'),
//             ),
//             Padding(
//               padding: EdgeInsets.all(30.0),
//               child: Text('data'),
//             ),
//             Padding(
//               padding: EdgeInsets.all(30.0),
//               child: Text('data'),
//             ),
//             Padding(
//               padding: EdgeInsets.all(30.0),
//               child: Text('data'),
//             ),
//             Padding(
//               padding: EdgeInsets.all(30.0),
//               child: Text('data'),
//             ),
//             Padding(
//               padding: EdgeInsets.all(30.0),
//               child: Text('data'),
//             ),
//             Padding(
//               padding: EdgeInsets.all(30.0),
//               child: Text('data'),
//             ),
//             Padding(
//               padding: EdgeInsets.all(30.0),
//               child: Text('data'),
//             ),
//           ],    
//         ),
//         onRefresh: () async{
//           print('下拉刷新');
//         },
//         onLoad: () async{
//           print('上拉加载');
//         },
//       ),
//     );
//   }
// }