import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:project_duckhawk/components/horizontal_listview.dart';
import 'package:project_duckhawk/components/products.dart';
import 'package:project_duckhawk/pages/login_page.dart';
import 'package:project_duckhawk/pages/product_details.dart';
import 'package:project_duckhawk/pages/cart.dart';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress = "Tap to update";

  String _value = '';
  void _onClick(String value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [AssetImage('images/armani.png')],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
    Widget image_carousel1 = new Container(
      height: 200.00,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/armani.png'),
          AssetImage('images/watches-111a.png'),
          AssetImage('images/Guide-mens-smart-casual-dress-code15@2x.png'),
          AssetImage('images/men-jeans@2x.png'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );

    return Scaffold(
      appBar: new AppBar(
            backgroundColor: Color(0xff104670),
            title: Container(

                child: Column(
                children: <Widget>[
                  Row(
                    children:
                   <Widget>[
                    new IconButton(
                      icon: new Icon(Icons.place),
                      onPressed: () {
                        _getCurrentLocation();
                      },
                    ),
                    new Text(_currentAddress),


                  ],
                ),
              ],

            )
            ),
        leading:new Text("hi"),


          ),
      /*



      persistentFooterButtons: <Widget>[/*
        new IconButton(icon: new Icon(Icons.add_shopping_cart), onPressed: () => _onClick('Button1')),
        new IconButton(icon: new Icon(Icons.shop), onPressed: () => _onClick('Button2')),
        new IconButton(icon: new Icon(Icons.monetization_on), onPressed: () => _onClick('Button3')),
        new IconButton(icon: new Icon(Icons.notifications), onPressed: () => _onClick('Button4')),
        new IconButton(icon: new Icon(Icons.share), onPressed: () => _onClick('Button5')),*/
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.add_shopping_cart), onPressed: () => _onClick('Button1')),
              new IconButton(icon: new Icon(Icons.shop), onPressed: () => _onClick('Button2')),
              new IconButton(icon: new Icon(Icons.monetization_on), onPressed: () => _onClick('Button3')),
              new IconButton(icon: new Icon(Icons.notifications), onPressed: () => _onClick('Button4')),
              new IconButton(icon: new Icon(Icons.share), onPressed: () => _onClick('Button5')),

            ],
          ),
        ),

      ],*/
      bottomNavigationBar: new Container(
        padding: EdgeInsets.all(0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: IconButton(
                icon: new Icon(Icons.add_shopping_cart),
                onPressed: () => _onClick('Button1'),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: new Icon(Icons.shop),
                  onPressed: () => _onClick('Button2')),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: new Icon(Icons.monetization_on),
                  onPressed: () => _onClick('Button3')),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: new Icon(Icons.notifications),
                  onPressed: () => _onClick('Button3')),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: new Icon(Icons.share),
                  onPressed: () => _onClick('Button3')),
            ),
          ],
        ),
      ),
      endDrawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            InkWell(
              child: new UserAccountsDrawerHeader(
                accountName: Text('Ekanta'),
                accountEmail: null,
                currentAccountPicture: GestureDetector(
                    child: new CircleAvatar(
                      backgroundColor: Colors.grey,
                    )),
                decoration: new BoxDecoration(color: Color(0xff104670)),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>new LoginPage()));
              },
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Men'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(title: Text('Women')),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(title: Text('Electronics')),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(title: Text('Sports')),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(title: Text('Books')),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(title: Text('Home & Furniture')),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(title: Text('Beauty & Personal Care')),
            ),
            Divider(),
            Container(
                color: Color(0xffaaaaaa),
                child: new Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('My Orders')),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>new cart(null,null,null)));
                      },
                      child: ListTile(title: Text('My Cart')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('Account')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('Notifications')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('Budget')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('Share')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('Settings')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('LOGOUT')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('HELP')),
                    )
                  ],
                )),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(2.0),
          ),
          HorizontalList(),
          new Padding(padding: const EdgeInsets.all(8.0)),
          image_carousel,
          image_carousel1,
          Container(
              padding: const EdgeInsets.all(10.0),
              color: Color(0xff104670),
              child: new Row(
                children: <Widget>[
                  new Icon(

                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                  new Text(

                    'Fashion',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),

                ],
              )),
          Container(
            height:120.0,
            child: products(
              'fashion',
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10.0),
              color: Color(0xff104670),
              child: new Row(
                children: <Widget>[
                  new Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                  new Text(
                    'Electronics',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              )),

          /*new Padding(padding: const EdgeInsets.all(20.0),
            child:new Text('Electronics'
            ) ,),*/

          Container(
            height:120.0,
            child: products('electronics'),
          ),
        ],
      ),
    );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = "${place.locality}";
        print(place.locality);
      });
    } catch (e) {
      print(e);
    }
  }
}
