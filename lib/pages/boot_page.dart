import 'package:flutter/material.dart';

class BootPage extends StatefulWidget {
  @override
  _BootPageState createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('boot!!!'),
      ),
    );
  }
}
