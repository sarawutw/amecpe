import 'package:amecpe/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddInfoShop extends StatefulWidget {
  @override
  _AddInfoShopState createState() => _AddInfoShopState();
}

class _AddInfoShopState extends State<AddInfoShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Information Shop'),
      ),
      body: ListView(
        children: [
          MyStyle().mySizebox(),
          nameForm(),
          MyStyle().mySizebox(),
          addressForm(),
          MyStyle().mySizebox(),
          phoneForm(),
          MyStyle().mySizebox(),
          groupImage(),
          MyStyle().mySizebox(),
          showMap(),
          MyStyle().mySizebox(),
          saveButton()
        ],
      ),
    );
  }

  Widget saveButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton.icon(
        color: MyStyle().primaryColor,
        onPressed: () {},
        icon: Icon(
          Icons.save,
          color: Colors.white,
        ),
        label: Text(
          'Save Information',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Container showMap() {
    LatLng latLng = LatLng(16.81034563062542, 100.26035136010252);
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16.0,
    );

    return Container(
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
      ),
      height: 300.0,
    );
  }

  Row groupImage() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
              size: 36.0,
            ),
            onPressed: () {},
          ),
          Container(
            width: 250.0,
            child: Image.asset(
              'images/myimage.png',
              height: 300,
              width: 300,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add_photo_alternate,
              size: 36.0,
            ),
            onPressed: () {},
          )
        ],
      );

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 250.0,
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'ชื่อร้านค้า',
                    prefixIcon: Icon(Icons.account_box),
                    border: OutlineInputBorder()),
              )),
        ],
      );

  Widget addressForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 250.0,
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'ที่อยู่ร้านค้า',
                    prefixIcon: Icon(Icons.home),
                    border: OutlineInputBorder()),
              )),
        ],
      );

  Widget phoneForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 250.0,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'เบอร์ติดต่อร้านค้า',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder()),
              )),
        ],
      );
}
