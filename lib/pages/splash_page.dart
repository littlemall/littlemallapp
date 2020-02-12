import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:littlemallapp/store/splash_page_store.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  TimerUtil _timerUtil;
  int _count = 3;
  var splashStore;
  bool isBoot = false;
  PageController _pageController = PageController();
  int _index = 0;
  List<String> piclist = [
    'assets/images/splash/sp1.png',
    'assets/images/splash/sp2.png',
    'assets/images/splash/sp3.png'
  ];

  Widget enterButton = Container();
  Future<Widget> initEnterButton() async {
    await Future.delayed(Duration(milliseconds: 250));
    return _createEnterButton();
  }

  _createEnterButton() {
    return Align(
        alignment: Alignment(0, 0.87),
        child: Container(
            width: ScreenUtil.getInstance().getWidth(170),
            height: ScreenUtil.getInstance().getHeight(40),
            child: RaisedButton(
//              padding: EdgeInsets.all(0),
              onPressed: () {
                 Navigator.of(context).pushReplacementNamed("/BootPage");
              },
              child: Text('立刻体验',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color:Colors.redAccent,
            )));
  }

  @override
  Widget build(BuildContext context) {
    if (_index == 2) {
      return Scaffold(
        body: Consumer<SplashPageStore>(builder: (context, splashStore, _) {
          splashStore = splashStore;
          isBoot = splashStore.isBoot;
          return Container(
            color: Colors.white,
            child: Stack(children: <Widget>[
              _scrollPage(),
              _createEnterButton(),
            ]),
          );
        }),
      );
    } else {
      return Scaffold(
        body: Consumer<SplashPageStore>(builder: (context, splashStore, _) {
          splashStore = splashStore;
          isBoot = splashStore.isBoot;
          return Container(
            color: Colors.white,
            child: Stack(children: <Widget>[
              _scrollPage(),
              _createAllIndicator(),
            ]),
          );
        }),
      );
    }
  }

  Widget _createAllIndicator() {
    return Opacity(
      opacity: 0.8,
      child: Align(
        alignment: Alignment(0, 0.87), //FractionalOffset(0.5,0.93),
        child: Row(
          //使用Wrap？
          mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,//主轴大小设置为最大值，会导致主轴方向（此处为水平方向）的align失效,默认是max，因此上面的Alignment（1，0.8）的1失效了
          children: <Widget>[
            _createOneIndicator(0),
            _createOneIndicator(1),
            _createOneIndicator(2),
          ],
        ),
      ),
    );
  }

  Widget _createOneIndicator(int index) {
    return Container(
        width: 26,
        height: 4,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: _index == index ? Colors.redAccent : Colors.grey));
  }

  Widget _scrollPage() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _index = index;
        });
      },
      children: <Widget>[
        Container(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            _createText('线上线下融汇贯通', '买卖触手可及'),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              piclist[0],
              fit: BoxFit.fitWidth,
            )
          ]),
        ),
        Container(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
             _createText('丰富的商品种类', '易懂明了采买'),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              piclist[1],
              fit: BoxFit.fitWidth,
            )
          ]),
        ),
        Container(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            _createText('分享购物利润', '共享经济来临'),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              piclist[2],
              fit: BoxFit.fitWidth,
            )
          ]),
        ),
      ],
    );
  }

  Widget _createText(String text1, String text2) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    double oheight = screenHeight * 0.1;
    double height = 0.0;
    if (oheight > 100) {
      height = oheight - 90;
    } else {
      if (oheight > 70) {
        height = oheight - 30;
      } else {
        height = oheight - 20;
      }
    }
    return Column(
      children: <Widget>[
        SizedBox(
          height: ScreenUtil.getInstance().getHeight(height),
        ),
        Text(
          '$text1',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        SizedBox(
          height: ScreenUtil.getInstance().getHeight(18),
        ),
        Text(
          '$text2',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: ScreenUtil.getInstance().getAdapterSize(18),
              color: Colors.grey),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // _doCountDown();
  }

  void _doCountDown() {
    _timerUtil = TimerUtil(mTotalTime: 3 * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
      });
      if (_tick == 0) {
        //_goMain();
        print("我要跳转页面了");
        Navigator.of(context).pushReplacementNamed("/BootPage");
      }
    });
    _timerUtil.startCountDown();
  }
}
