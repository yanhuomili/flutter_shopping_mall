import 'package:flutter/material.dart';

/* 
  1.底部tab切换  BottomNavigationBar 配合 cuttentIndex
  2.顶部tab切换  TabBar 配合 TabBarView
  3.tabBar里隐藏的更多操作   IconBtton 和 PopupMenuButton
  4.保持组件的状态  AutomaticKeepAliveClientMixin
  5.可左右滑动的页面  PageView
 */

/* 底部tab切换 */
class BottomNavigationBarDemo extends StatefulWidget {
  BottomNavigationBarDemo({Key key}) : super(key: key);

  @override
  _BottomNavigationBarDemoState createState() => _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  List<Widget> pageList = [BodyPage(),bodyPage2(),bodyPage3(),BodyPage4()];
  TabController _tabController;

  @override
  void initState() { 
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bottomNavigationBar'),
        actions: <Widget>[
          IconButton( // 非隐藏的菜单
              icon: Icon(Icons.more),
              tooltip: 'add',
              onPressed: (){
                print('object');
              },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'a',
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.movie, color: Colors.blue),
                    Text('发起群聊')
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'b',
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.movie_creation, color: Colors.blue),
                    Text('添加服务')
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'c',
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.my_location, color: Colors.blue),
                    Text('扫一扫')
                  ],
                ),
              )
            ],
            onSelected: (String action){
              switch(action){
                case 'a': print('aaa');
                break;
                case 'b': print('bbb');
                break;
                case 'c': print('ccc');
                break;
                
              }
            },
          )
        ],

        // bottom: TabBar(
        //   controller: _tabController,
        //   tabs: <Widget>[
        //     Tab(icon: Icon(Icons.card_giftcard)),
        //     Tab(icon: Icon(Icons.chat_bubble)),
        //     Tab(icon: Icon(Icons.cloud_download)),
        //   ],
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // 未选中的选项文字也显示出来
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
            print('$index');
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home
            ),
            title: Text('home')
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_mall
            ),
            title: Text('local_mall')
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category
            ),
            title: Text('category')
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person
            ),
            title: Text('person')
          ),
        ],
        
      ),
      body: pageList[currentIndex],
    );
  }

  static Widget bodyPage1(){
    return Container(
      child: Column(children: <Widget>[
        Center(
          child: Text('bodyPage1'),
        )
      ],),
    );
  }
  static Widget bodyPage2(){
    return Container(
      child: Column(children: <Widget>[
        Center(
          child: Text('bodyPage2'),
        )
      ],),
    );
  }
  static Widget bodyPage3(){
    return Container(
      child: Column(children: <Widget>[
        Center(
          child: Text('bodyPage3'),
        )
      ],),
    );
  }
  static Widget bodyPage4(){
    return Container(
      child: Column(children: <Widget>[
        Center(
          child: Text('bodyPage4'),
        )
      ],),
    );
  }

}


/* 可左右滑动的页面 */
class BodyPage4 extends StatefulWidget {
  BodyPage4({Key key}) : super(key: key);

  @override
  _BodyPage4State createState() => _BodyPage4State();
}

class _BodyPage4State extends State<BodyPage4> {
  PageController _pageController;
  List<Widget> pageList = [KeepAlivePage(),KeepAlivePage(),KeepAlivePage()];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
              //要点1
              // physics: NeverScrollableScrollPhysics(),
              //禁止页面左右滑动切换
              controller: _pageController,
              onPageChanged: (int index){
                print('$index');
              },
              //回调函数
              itemCount: pageList.length,
              itemBuilder: (context, index) => pageList[index]
            ),
      );

      /* 方法二 */
      // child: PageView(
      //   controller: _pageController,
      //   onPageChanged: (int index){
      //     print('$index');
      //   },
      //   children: <Widget>[
      //     Center(child: Text('p1'),),
      //     Center(child: Text('p2'),),
      //     Center(child: Text('p3'),),
      //   ],
      // )
    // );
  }
}


/*  */
class BodyPage extends StatefulWidget {
    BodyPage({Key key}) : super(key: key);
  
    @override
    _BodyPageState createState() => _BodyPageState();
  }
  
  class _BodyPageState extends State<BodyPage> with SingleTickerProviderStateMixin{
    TabController _tabController;
    int activeIndex;

    @override
    void initState() { 
      super.initState();
      _tabController = TabController(length: 3, vsync: this,initialIndex: 1);
      activeIndex = 1;
    }

    @override
    Widget build(BuildContext context) {
      return Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TabBar(
              controller: _tabController,
              onTap: (index){
                setState(() {
                  activeIndex = index;
                });
                print('$index');
              },
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.cloud_upload,color: activeIndex == 0 ? Colors.lightBlue : Colors.grey),
                  child: Text('tab1',style: TextStyle(color: activeIndex == 0 ? Colors.blue : Colors.grey),),
                ),
                Tab(
                  icon: Icon(Icons.beach_access,color: activeIndex == 1 ? Colors.lightBlue : Colors.grey),
                  child: Text('tab2',style: TextStyle(color: activeIndex == 1 ? Colors.blue : Colors.grey),),
                ),
                Tab(
                  icon: Icon(Icons.computer,color: activeIndex == 2 ? Colors.lightBlue : Colors.grey),
                  child: Text('tab3',style: TextStyle(color: activeIndex == 2 ? Colors.blue : Colors.grey),),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  KeepAlivePage(),
                  KeepAlivePage(),
                  KeepAlivePage(),
                ],
              ),
            )
          ],
        ),
      );
    }
  }



/* 保持状态的组件  AutomaticKeepAliveClientMixin*/
class KeepAlivePage extends StatefulWidget {

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

//混入AutomaticKeepAliveClientMixin，这是保持状态的关键
//然后重写wantKeppAlive 的值为true。
class _KeepAlivePageState extends State<KeepAlivePage> with AutomaticKeepAliveClientMixin {
  int _counter = 0;
  //重写keepAlive 为ture ，就是可以有记忆功能了。
  @override
  bool get wantKeepAlive => true;
  //声明一个内部方法，用来点击按钮后增加数量
  void _incrementCounter(){
    setState((){ _counter++;});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点一下加1，点一下加1:'),
            Text(
              '$_counter',
              style:Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              onPressed: _incrementCounter,
              child: Text('add'),
            )
          ],
        ),
      ),
    );
  }
}