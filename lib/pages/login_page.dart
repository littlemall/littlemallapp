import 'package:flutter/material.dart';
import 'package:littlemallapp/component/sign_in_page.dart';
import 'package:littlemallapp/component/sign_up_page.dart';
import 'package:littlemallapp/store/login_page_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:littlemallapp/style/theme.dart' as theme;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  PageController _pageController;
  PageView _pageView;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    _pageView = PageView(
      controller: _pageController,
      children: <Widget>[
        SignInPage(controlCurrentIndex: (index) => _controlCurrentIndex(index)),
        SignUpPage(controlCurrentIndex: (index) => _controlCurrentIndex(index)),
      ],
      onPageChanged: (index) {
        Provider.of<LoginPageStore>(context, listen: false)
            .setCurrentIndex(index);
        setState(() {
          _currentPage = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _currentPage =
        Provider.of<LoginPageStore>(context, listen: false).currentIndex;
    return Scaffold(
        /**
       * SafeArea，让内容显示在安全的可见区域
       * SafeArea，可以避免一些屏幕有刘海或者凹槽的问题
       */
        body: SafeArea(
      child: SingleChildScrollView(
          /**
             * 用SingleChildScrollView+Column，避免弹出键盘的时候，出现overFlow现象
             */
          child: Container(
              /**这里要手动设置container的高度和宽度，不然显示不了
                 * 利用MediaQuery可以获取到跟屏幕信息有关的数据
                 */
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              //设置渐变的背景
              decoration: BoxDecoration(
                gradient: theme.Theme.primaryGradient,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 75,
                  ),
                  /**
                       * 可以用SizeBox这种写法代替Padding：在Row或者Column中单独设置一个方向的间距的时候
                       */
//                     Padding(padding: EdgeInsets.only(top: 75)),

                  //顶部图片
                  Image(
                      width: 250,
                      height: 191,
                      image: AssetImage("assets/images/v1.0/login_logo.png")),
                  SizedBox(
                    height: 20,
                  ),

                  //中间的Indicator指示器
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color(0x552B2B2B),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          /**
                                   * TODO:暂时不会用Paint去自定义indicator，所以暂时只能这样实现了
                                   */
                          decoration: _currentPage == 0
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  color: Colors.white,
                                )
                              : null,
                          child: Center(
                            child: FlatButton(
                              onPressed: () {
                                _pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                                Provider.of<LoginPageStore>(context,
                                        listen: false)
                                    .setCurrentIndex(0);
                              },
                              child: Text(
                                "老用户",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          decoration: _currentPage == 1
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  color: Colors.white,
                                )
                              : null,
                          child: Center(
                            child: FlatButton(
                              onPressed: () {
                                _pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                                Provider.of<LoginPageStore>(context,
                                        listen: false)
                                    .setCurrentIndex(1);
                              },
                              child: Text(
                                "新用户",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  // SignInPage(),
                  // SignUpPage(),
                  Expanded(child: _pageView),
                ],
              ))),
    ));
  }

  _controlCurrentIndex(editText) {
    setState(() {
      _pageController.animateToPage(editText,
          duration: Duration(milliseconds: 500), curve: Curves.decelerate);
      Provider.of<LoginPageStore>(context, listen: false)
          .setCurrentIndex(editText);
    });
  }
}
