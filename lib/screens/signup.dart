import 'package:amecpe/utility/my_style.dart';
import 'package:amecpe/utility/normal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType;
  String name;
  String user;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: ListView(padding: EdgeInsets.all(30.0), children: [
        myLogo(),
        MyStyle().mySizebox(),
        showAppName(),
        MyStyle().mySizebox(),
        nameForm(),
        MyStyle().mySizebox(),
        userForm(),
        MyStyle().mySizebox(),
        passwordForm(),
        MyStyle().mySizebox(),
        MyStyle().showTitleH2('ชนิดของสมาชิก :'),
        MyStyle().mySizebox(),
        userRadio(),
        MyStyle().mySizebox(),
        shopRadio(),
        MyStyle().mySizebox(),
        riderRadio(),
        MyStyle().mySizebox(),
        registerButton()
      ]),
    );
  }

  Widget registerButton() {
    return Container(
      width: 250.0,
      child: RaisedButton(
        color: MyStyle().darkColor,
        onPressed: () {
          print(
              'name = $name, user = $user, password = $password, chooseType = $chooseType');
          if (name == null ||
              name.isEmpty ||
              user == null ||
              user.isEmpty ||
              password == null ||
              password.isEmpty) {
            print('Have Space');
            normalDialog(context, 'มีช่องว่างคะ กรุณากรอกทุกช่อง');
          } else if (chooseType == null) {
            normalDialog(context, 'กรุณาเลือกชนิดของผู้สมัคร');
          } else {
            checkUser();
            // registerThread();
          }
        },
        child: Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<Null> checkUser() async {
    String url =
        'http://192.168.1.103/amecpe/getUserWhereUser.php?isAdd=true&User=$user';

    try {
      Response response = await Dio().get(url);
      if (response.toString() == 'null') {
        registerThread();
      } else {
        normalDialog(context, 'user ซ้ำ กรุณาใช้ชื่ออื่น');
      }
    } catch (e) {}
  }

  Future<Null> registerThread() async {
    // print('$name, $password, $chooseType, $user');
    String url =
        'http://192.168.1.103/amecpe/insertData.php?isAdd=true&Name=$name&User=$user&Password=$password&ChooseType=$chooseType';

    // print('$url');
    try {
      Response response = await Dio().get(url);
      print('res = $response');

      if (response.toString() == 'true') {
        Navigator.pop(context);
      } else {
        normalDialog(context, 'ไม่สามารถ สมัครได้ กรุณาลองใหม่ค่ะ');
      }
    } catch (e) {}
  }

  Widget userRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: [
                Radio(
                  value: 'User',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'ผู้สั่งอาหาร',
                  style: TextStyle(color: MyStyle().darkColor),
                )
              ],
            ),
          ),
        ],
      );

  Widget shopRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: [
                Radio(
                  value: 'Shop',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'เจ้าของร้านอาหาร',
                  style: TextStyle(color: MyStyle().darkColor),
                )
              ],
            ),
          ),
        ],
      );

  Widget riderRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: [
                Radio(
                  value: 'Rider',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'ผู้ส่งอาหาร',
                  style: TextStyle(color: MyStyle().darkColor),
                )
              ],
            ),
          ),
        ],
      );

  Row showAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyStyle().showTitle('SCOM Food'),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyStyle().showLogo(),
        ],
      );

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 250.0,
              child: TextField(
                onChanged: (value) => name = value.trim(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.face,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Name :',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().primaryColor)),
                ),
              )),
        ],
      );

  Widget userForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 250.0,
              child: TextField(
                onChanged: (value) => user = value.trim(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_box,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'User :',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().primaryColor)),
                ),
              )),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 250.0,
              child: TextField(
                onChanged: (value) => password = value.trim(),
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Password :',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().primaryColor)),
                ),
              )),
        ],
      );
}
