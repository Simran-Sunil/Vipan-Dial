import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vipan_dial/search_page/searchservice.dart';
import 'package:vipan_dial/services/crud.dart';
import 'package:vipan_dial/usersTile.dart';
import 'package:vipan_dial/views/create_register.dart';
import 'package:vipan_dial/widget/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CrudMethods crudMethods = new CrudMethods();
  Stream usersStream;

  TextEditingController editingController = TextEditingController();

  Widget UsersList() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
          child: usersStream != null
              ? Column(children: <Widget>[
                  StreamBuilder(
                      stream: usersStream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              return UsersTile(
                                imgUrl: snapshot
                                    .data.documents[index].data['imageurl'],
                                name:
                                    snapshot.data.documents[index].data['name'],
                                address: snapshot
                                    .data.documents[index].data['location'],
                                mobileno: snapshot
                                    .data.documents[index].data['mobileno'],
                              );
                            },
                          );
                        }
                      })
                ])
              : Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )),
    );
  }

  @override
  void initState() {
    crudMethods.getData().then((result) {
      setState(() {
        usersStream = result;
      });
    });
    super.initState();
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
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            UsersList(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                      backgroundColor: Colors.orange,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateRegister()));
                      },
                      child: Icon(Icons.add)),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ]),
        ],
      ),
    );
  }
}
