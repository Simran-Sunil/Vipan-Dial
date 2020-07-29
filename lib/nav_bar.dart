import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vipan_dial/Registration_Page/About_Page.dart';
import 'package:vipan_dial/home_page.dart';
import 'package:vipan_dial/views/create_register.dart';
import 'package:vipan_dial/views/home.dart';
import 'package:vipan_dial/widget/widgets.dart';

import 'Contacts.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        
        padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            "Welcome,",
            style: navbarStyle(),
          ),
          decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/background.jpg'))),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            'Home',
            style: simpleStyle(),
          ),
          onTap: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()))
          },
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text(
            'Contacts',
            style: simpleStyle(),
          ),
          onTap: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Contacts()))
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'Services',
            style: simpleStyle(),
          ),
          onTap:() => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()))
          },
        ),
        ListTile(
          leading: Icon( MdiIcons.bullhorn),
          title: Text(
            'Advertising',
            style: simpleStyle(),
          ),
           onTap:() => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CreateRegister()))
          },
        ),
        ListTile(
          leading: Icon(Icons.local_offer),
          title: Text(
            'Pricing',
            style: simpleStyle(),
          ),
          onTap:() => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => About_Page()))
          },
        ),
      ]),
    );
  }
}
