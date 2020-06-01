import 'package:flutter/material.dart';
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
                            top:50,
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              Application.router.navigateTo(context, '/custom/login');
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
        // appBar: AppBar(
        //   backgroundColor: Colors.redAccent,
        //   title: Text('Little mall'),
        // ),
        body: Container(
          alignment: Alignment.center,
          child: Text('boot!!!'),
        ),
      );
    }
  }

  Future<bool> _judgeIsLogin() async {
    SharedPreferences spf = await SharedPreferences.getInstance();
    return spf.getString('isLogin') == 'true';
  }
}
