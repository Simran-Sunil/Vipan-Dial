import 'package:flutter/material.dart';
import 'package:vipan_dial/widget/widgets.dart';

class About_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: ListView(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                children: <Widget>[
              Text(
                "Basic:",
                style: titleStyle(),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Capture and convert the leads", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Ad management", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Contact website activity", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Email marketing", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Ad retargeting", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Text("Premium:", style: titleStyle()),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Marketing automation", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Blog", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("SEO recommendations & ", style: aboutPageStyle()),
              ]),
              Text("     optimizations", style: aboutPageStyle()),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Social media", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Website traffic analytics", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Text("Gold:", style: titleStyle()),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Capture and convert the leads", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Automate & Personalize your", style: aboutPageStyle()),
              ]),
              Text("     Marketing", style: aboutPageStyle()),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Attractive", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Manage Your Brand", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("SEO recommendations & ", style: aboutPageStyle()),
              ]),
              Text("     optimizations", style: aboutPageStyle()),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Social media", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Website traffic analytics", style: aboutPageStyle()),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              new Row(children: <Widget>[
                Image.asset(
                  "assets/sparkles.png",
                  width: 25,
                  height: 23,
                ),
                Text("Filtered analytics view", style: aboutPageStyle()),
              ]),
            ])));
  }
}
