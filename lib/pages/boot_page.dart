import 'package:flutter/material.dart';
import 'package:littlemallapp/component/bottom_navigation_bar_com.dart';
import 'package:littlemallapp/routers/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BootPage extends StatefulWidget {
  @override
  _BootPageState createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _judgeIsLogin().then((_) {
      setState(() {
        isLogin = _;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLogin) {
      return Scaffold(
          body: Container(
              color: Colors.grey,
              child: Column(children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/images/v1.0/signin_bg@3x.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Column(children: [
                        Text(
                          '欢迎来到小小卖铺',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 50,
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              Application.router
                                  .navigateTo(context, '/custom/login');
                            },
                            child: Text('邮箱登录',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.redAccent,
                          ),
                        ),
                      ])),
                )
              ])));
    } else {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('小小店铺'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search",
              onPressed: () => debugPrint("Search button is pressed."),
            ),
          ],
          elevation: 0.0,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text('boot!!!'),
        ),
        drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                // DrawerHeader(
                //   child: Text('header'.toUpperCase()),
                //   decoration: BoxDecoration(
                //     color: Colors.grey[100],
                //   ),
                // ),
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'rahul wu',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  accountEmail: Text(
                    'rahul.wu@126.com',
                    style: TextStyle(color: Colors.white),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://avatars2.githubusercontent.com/u/5243522?s=460&v=4'),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.yellow[400],
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://p1.pstatp.com/origin/2a4100008d310b5fd8a8'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.redAccent[400].withOpacity(0.6),
                              BlendMode.hardLight))),
                ),
                ListTile(
                  title: Text(
                    'Message',
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(
                    Icons.message,
                    color: Colors.black12,
                    size: 22.0,
                  ),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  title: Text(
                    'Favprote',
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(
                    Icons.favorite,
                    color: Colors.black12,
                    size: 22.0,
                  ),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  title: Text(
                    'Setting',
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(
                    Icons.settings,
                    color: Colors.black12,
                    size: 22.0,
                  ),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBarCom(),
      );
    }
  }

  Future<bool> _judgeIsLogin() async {
    SharedPreferences spf = await SharedPreferences.getInstance();
    return spf.getString('isLogin') == 'true';
  }
}
