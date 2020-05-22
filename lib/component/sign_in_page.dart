import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:littlemallapp/style/theme.dart' as theme;
import 'package:littlemallapp/data/repo.dart';
import 'package:provider/provider.dart';
import 'package:littlemallapp/store/sign_up_page_store.dart';
import 'package:littlemallapp/model/success_res.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 *注册界面
 */
class SignInPage extends StatefulWidget {
    final controlCurrentIndex;
  const SignInPage({Key key, this.controlCurrentIndex}) : super(key: key);
  @override
  _SignInPageState createState() =>  _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  /**
   * 利用FocusNode和FocusScopeNode来控制焦点
   * 可以通过FocusNode.of(context)来获取widget树中默认的FocusScopeNode
   */
  FocusNode emailFocusNode =  FocusNode();
  FocusNode passwordFocusNode =  FocusNode();
  FocusScopeNode focusScopeNode =  FocusScopeNode();

  GlobalKey<FormState> _SignInFormKey =  GlobalKey();

  bool isShowPassWord = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 23),
      child:  Stack(
        alignment: Alignment.center,
//        /**
//         * 注意这里要设置溢出如何处理，设置为visible的话，可以看到孩子，
//         * 设置为clip的话，若溢出会进行裁剪
//         */
//        overflow: Overflow.visible,
        children: <Widget>[
           Column(
            children: <Widget>[
              //创建表单
              buildSignInTextForm(),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child:  Text("忘记密码?",
                  style:  TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      decoration: TextDecoration.underline),),
              ),
            ],
          ),
           new Positioned(child: buildSignInButton(), top: 170,)
        ],
      ),
    );
  }

  /**
   * 点击控制密码是否显示
   */
  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  /**
   * 创建登录界面的TextForm
   */
  Widget buildSignInTextForm() {
    return  Container(
      decoration:
       BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8))
          , color: Colors.white
      ),
      width: 300,
      height: 190,
      /**
       * Flutter提供了一个Form widget，它可以对输入框进行分组，
       * 然后进行一些统一操作，如输入内容校验、输入框重置以及输入内容保存。
       */
      child:  Form(
        key: _SignInFormKey,
        //开启自动检验输入内容，最好还是自己手动检验，不然每次修改子孩子的TextFormField的时候，其他TextFormField也会被检验，感觉不是很好
//        autovalidate: true,
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 20),
                child:  TextFormField(
                  //关联焦点
                  focusNode: emailFocusNode,
                  onEditingComplete: () {
                    if (focusScopeNode == null) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(passwordFocusNode);
                  },

                  decoration:  InputDecoration(
                      icon:  Icon(Icons.email, color: Colors.black,),
                      hintText: "邮箱地址",
                      border: InputBorder.none
                  ),
                  style:  TextStyle(fontSize: 16, color: Colors.black),
                  //验证
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Email can not be empty!";
                    }
                  },
                  onSaved: (value) {

                  },
                ),
              ),
            ),
             Container(
              height: 1,
              width: 250,
              color: Colors.grey[400],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20),
                child:  TextFormField(
                  focusNode: passwordFocusNode,
                  decoration:  InputDecoration(
                      icon:  Icon(Icons.lock, color: Colors.black,),
                      hintText: "密码",
                      border: InputBorder.none,
                      suffixIcon:  IconButton(icon:  Icon(
                        Icons.remove_red_eye, color: Colors.black,),
                          onPressed: showPassWord)
                  ),
                  //输入密码，需要用*****显示
                  obscureText: !isShowPassWord,
                  style:  TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return "Password'length must longer than 6!";
                    }
                  },
                  onSaved: (value) {

                  },
                ),
              ),
            ),


          ],
        ),),
    );
  }

  /**
   * 创建登录界面的按钮
   */
  Widget buildSignInButton() {
    return
       GestureDetector(
        child:  Container(
          padding: EdgeInsets.only(left: 42, right: 42, top: 10, bottom: 10),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gradient: theme.Theme.primaryGradient,
          ),
          child:  Text(
            "登录", style:  TextStyle(fontSize: 25, color: Colors.white),),
        ),
        onTap: () {
            String emial = Provider.of<SignUpPageStore>(context, listen: false).emial;
            String password =Provider.of<SignUpPageStore>(context, listen: false).password;
          /**利用key来获取widget的状态FormState
           * 可以用过FormState对Form的子孙FromField进行统一的操作
           */
          if (_SignInFormKey.currentState.validate()) {
            //如果输入都检验通过，则进行登录操作
            // Scaffold.of(context).showSnackBar(SnackBar(content:  Text("执行登录操作")));
            Repo().login({
              "email":emial,
              "password":password
            }).then((re) async{
              success_res res = success_res.fromJson(re);
              if(res.code == 200){
                 print(res.data);
              }
              // SharedPreferences spf = await SharedPreferences.getInstance();
              // spf.setString('token', value)
              Scaffold.of(context).showSnackBar(SnackBar(content:  Text("登录成功!")));
            });
            //调用所有自孩子的save回调，保存表单内容
            _SignInFormKey.currentState.save();
          }
//          debugDumpApp();
        },

      );
  }
}