import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vipan_dial/usersTile.dart';
import 'package:vipan_dial/widget/widgets.dart';

class CategoryPage extends StatelessWidget {
  String data;
  CategoryPage({this.data});

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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(horizontal: 33)),
              Text("Vipan",
                  style: TextStyle(fontSize: 22, fontFamily: "GentiumBasic")),
              Text("Dial",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.orange,
                      fontFamily: "GentiumBasic")),
            ],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: FutureBuilder(
          future: Firestore.instance
              .collection('users')
              .where("category", isEqualTo: data)
              .getDocuments(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, i) {
                    //YOUR WIDGET HERE
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
                                      imageUrl: snapshot
                                          .data.documents[i].data['imageurl'],
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
                                        snapshot.data.documents[i].data['name'].substring(0,14),
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
                                      child: Text(
                                          snapshot.data.documents[i]
                                              .data['location'].substring(0,15),
                                          textAlign: TextAlign.center,
                                          style: buttonStyle()),
                                    ),
                                    SizedBox(height: 4),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        snapshot
                                            .data.documents[i].data['mobileno'],
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
                                        borderRadius:
                                            new BorderRadius.circular(25),
                                      ),
                                      onPressed: () {
                                        _launchCaller(snapshot.data.documents[i]
                                            .data['mobileno']);
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                        ));
                  });
            }
            return Center(
              child:CircularProgressIndicator(),
            );
            
          },
        ),
      ),
    );
  }
}
