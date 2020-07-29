import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vipan_dial/widget/widgets.dart';

class UsersTile extends StatelessWidget {
  String imgUrl, name, address, mobileno;
  TextEditingController editingController = TextEditingController();

  int startIndex = 0;
  int endIndex = 11;

  UsersTile(
      {@required this.imgUrl,
      @required this.name,
      @required this.address,
      @required this.mobileno});

  void _launchCaller(String number) async {
    var url = "tel:$number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not place call";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(bottom: 16),
        height: 92,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Card(
          elevation: 10,
          color: Colors.black,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: imgUrl,
                      height: 120,
                      width: 110,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 4),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                      name.substring(startIndex, endIndex),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "GentiumBasic",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 9),
                    Align(
                      alignment: Alignment.center,
                      child: Text(address.substring(startIndex, endIndex),
                          textAlign: TextAlign.center, style: buttonStyle()),
                    ),
                    SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        mobileno,
                        style: buttonStyle(),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: RaisedButton(
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25),
                      ),
                      onPressed: () {
                        _launchCaller(mobileno);
                      },
                    ),
                  ),
                ),
              ]),
        ));
  }
}