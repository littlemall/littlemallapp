import 'package:flutter/material.dart';

class BottomNavigationBarCom extends StatefulWidget {
  BottomNavigationBarCom({Key key}) : super(key: key);

  @override
  _BottomNavigationBarComState createState() => _BottomNavigationBarComState();
}

class _BottomNavigationBarComState extends State<BottomNavigationBarCom> {
  int _currentIndex = 0;

  void _onTabHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabHandler,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Image(
                width: 20,
                height: 20,
                color: Colors.black26,
                image: AssetImage("assets/images/v1.0/home.png")),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Image(
                width: 20,
                height: 20,
                color: Colors.black26,
                image: AssetImage("assets/images/v1.0/search.png")),
            title: Text('搜搜'),
          ),
          BottomNavigationBarItem(
            icon: Image(
                width: 20,
                height: 20,
                color: Colors.black26,
                image: AssetImage("assets/images/v1.0/cart.png")),
            title: Text('购物车'),
          ),
          BottomNavigationBarItem(
            icon: Image(
                width: 20,
                height: 20,
                color: Colors.black26,
                image: AssetImage("assets/images/v1.0/user.png")),
            title: Text('我的'),
          ),
        ],
      ),
    );
  }
}
