import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vipan_dial/search_page/searchservice.dart';
import 'package:vipan_dial/widget/widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController editingController = TextEditingController();

  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['name'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
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
      body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18)),
            TextField(
              controller: editingController,
              style: buttonStyle(),
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: buttonStyle(),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: tempSearchStore.map((element) {
                  return buildResultCard(
                    element,
                  );
                }).toList()),
          ],
        ),
      ]),
    );
  }

  void _launchCaller(String number) async {
    var url = "tel:$number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not place call";
    }
  }

  Widget buildResultCard(data) {
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
                      imageUrl: data['imageurl'],
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
                        data['name'].substring(0,14),
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
                      child: Text(data['location'].substring(0,15),
                          textAlign: TextAlign.center, style: buttonStyle()),
                    ),
                    SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        data['mobileno'],
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
                        _launchCaller(data['mobileno']);
                      },
                    ),
                  ),
                ),
              ]),
        ));
  }
}
