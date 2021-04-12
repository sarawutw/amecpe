import 'package:amecpe/utility/my_style.dart';
import 'package:amecpe/utility/signout_process.dart';
import 'package:flutter/material.dart';

class MainRider extends StatefulWidget {
  @override
  _MainRiderState createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Rider'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: [
            showHead(),
            // homeMenu(),
          ],
        ),
      );

  // ListTile homeMenu() => ListTile(
  //       leading: Icon(Icons.home),
  //       title: Text('รายการอาหารที่ ลูกค้าสั่ง'),
  //       subtitle: Text('รายการอาหารที่ยังไม่ได้ ทำส่งลูกค้า'),
  //     );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
        decoration: MyStyle().myBoxDecoration('rider.jpg'),
        currentAccountPicture: MyStyle().showLogo(),
        accountName: Text('Guest'),
        accountEmail: Text('Please Login'));
  }
}
