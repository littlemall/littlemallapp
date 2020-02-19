import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:littlemallapp/style/theme.dart' as theme;

/**
 * 注册界面
 */
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() =>  _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.only(top: 23),
        child:  Stack(
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children: <Widget>[
             Container(
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,),
                width: 300,
                height: 360,
                child: buildSignUpTextForm()
            ),

             Positioned(child:  Center(child:
             Container(
              padding: EdgeInsets.only(
                  top: 10, bottom: 10, left: 42, right: 42),
              decoration:  BoxDecoration(
                gradient: theme.Theme.primaryGradient,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child:  Text("注册",
                style:  TextStyle(fontSize: 25, color: Colors.white),),
            ),), top: 340,)

          ],
        )
    );
  }

  Widget buildSignUpTextForm() {
    return  Form(child:  Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        //用户名字
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25, right: 25, top: 20, bottom: 20),
            child:  TextFormField(
              decoration:  InputDecoration(
                  icon:  Icon(FontAwesomeIcons.user, color: Colors.black,),
                  hintText: "名称",
                  border: InputBorder.none
              ),
              style:  TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
         Container(
          height: 1,
          width: 250,
          color: Colors.grey[400],
        ),
        //邮箱
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25, right: 25, top: 20, bottom: 20),
            child:  TextFormField(
              decoration:  InputDecoration(
                  icon:  Icon(Icons.email, color: Colors.black,),
                  hintText: "邮箱地址",
                  border: InputBorder.none
              ),
              style:  TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
         Container(
          height: 1,
          width: 250,
          color: Colors.grey[400],
        ),
        //密码
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25, right: 25, top: 20, bottom: 20),
            child:  TextFormField(
              decoration:  InputDecoration(
                icon:  Icon(Icons.lock, color: Colors.black,),
                hintText: "密码",
                border: InputBorder.none,
                suffixIcon:  IconButton(
                    icon:  Icon(Icons.remove_red_eye, color: Colors.black,),
                    onPressed: () {}),
              ),
              obscureText: true,
              style:  TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
         Container(
          height: 1,
          width: 250,
          color: Colors.grey[400],
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25, right: 25, top: 20, bottom: 20),
            child:  TextFormField(
              decoration:  InputDecoration(
                icon:  Icon(Icons.lock, color: Colors.black,),
                hintText: "确认密码",
                border: InputBorder.none,
                suffixIcon:  IconButton(
                    icon:  Icon(Icons.remove_red_eye, color: Colors.black,),
                    onPressed: () {}),
              ),
              obscureText: true,
              style:  TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),

      ],
    ));
  }

}