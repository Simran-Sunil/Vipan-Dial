import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:random_string/random_string.dart';
import 'package:vipan_dial/Registration_Page/About_Page.dart';
import 'package:vipan_dial/services/crud.dart';
import 'package:vipan_dial/widget/widgets.dart';

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class CreateRegister extends StatefulWidget {
  @override
  _CreateRegisterState createState() => _CreateRegisterState();
}

class _CreateRegisterState extends State<CreateRegister> {
  Item selectedUser;
  bool _isLoading = false;

  String name, location, plans, message, mobileno, landline, pincode, category,searchKey;

  String _categoryname;

  CrudMethods crudMethods = new CrudMethods();
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  List<Item> users = <Item>[
    const Item(
      'Fishing',
      Icon(MdiIcons.sailBoat, color: Colors.orange),
    ),
    const Item(
      'IT Services',
      Icon(Icons.computer, color: Colors.orange),
    ),
    const Item(
      'Construction',
      Icon(Icons.build, color: Colors.orange),
    ),
    const Item(
      'Agriculture',
      Icon(MdiIcons.leaf, color: Colors.orange),
    ),
    const Item(
      'Groceries',
      Icon(MdiIcons.shopping, color: Colors.orange),
    ),
    const Item(
      'Transportation',
      Icon(MdiIcons.truck, color: Colors.orange),
    ),
    const Item(
      'Medical',
      Icon(MdiIcons.medicalBag, color: Colors.orange),
    ),
    const Item(
      'Media',
      Icon(MdiIcons.radio, color: Colors.orange),
    ),
    const Item(
      'E-Commerce',
      Icon(MdiIcons.cart, color: Colors.orange),
    ),
    const Item(
      'Education',
      Icon(MdiIcons.school, color: Colors.orange),
    ),
    const Item(
      'Real Estate',
      Icon(MdiIcons.home, color: Colors.orange),
    ),
    const Item(
      'Clothing',
      Icon(MdiIcons.tshirtCrew, color: Colors.orange),
    ),
    const Item(
      'Tax consultant',
      Icon(MdiIcons.handshake, color: Colors.orange),
    ),
    const Item(
      'Electronics & \nElectrical',
      Icon(MdiIcons.powerPlug, color: Colors.orange),
    ),
  ];

  uploadData() async {
    if (_image != null) {
      setState(() {
        _isLoading = true;
      });
      StorageReference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("RegImages")
          .child("${randomAlphaNumeric(9)}.jpg");

      final StorageUploadTask task = firebaseStorageRef.putFile(_image);
      var downloadurl = await (await task.onComplete).ref.getDownloadURL();
      print("This is url $downloadurl");
      Map<String, String> regMap = {
        "imageurl": downloadurl,
        "name": name,
        "category": selectedUser.name,
        "location": location,
        "plans": plans,
        "message": message,
        "mobileno": mobileno,
        "landline": landline,
        "pincode": pincode,
        "searchKey":name[0].toUpperCase(),
      };

      crudMethods.addData(regMap).then((result) {
        Navigator.pop(context);
      });
    } else {}
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
              Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
              Text("Registration ",
                  style: TextStyle(fontSize: 22, fontFamily: "GentiumBasic")),
              Text(" Page",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.orange,
                      fontFamily: "GentiumBasic")),
            ],
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                uploadData();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.file_upload)),
            )
          ],
        ),
        body: _isLoading
            ? SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(
                    vertical: 8,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 90.0,
                            backgroundColor: Colors.orange,
                            child: _image != null
                                ? ClipOval(
                                    child: SizedBox(
                                      height: 160,
                                      width: 160,
                                      child: Image.file(
                                        _image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                : ClipOval(
                                    child: SizedBox(
                                    width: 160,
                                    height: 160,
                                    child: Image(
                                      image: AssetImage(
                                        'assets/backgnd.jpg',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 60.0),
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.camera,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              getImage();
                            },
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: TextFormField(
                        onChanged: (val) {
                          name = val;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Business Name *",
                          hintStyle: aboutPageStyle(),
                          fillColor: Colors.white,
                          enabledBorder: borderStyle(),
                          focusedBorder: borderStyle(),
                        )),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Container(
                      width: 370,
                      height: 60,
                      decoration: new BoxDecoration(
                          color: Colors.black,
                          borderRadius: new BorderRadius.circular(10),
                          border: Border.all(color: Colors.orange, width: 1)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(children: <Widget>[
                            Expanded(
                              child: Text(
                                "Select Category *",
                                style: aboutPageStyle(),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: DropdownButton<Item>(
                                  hint: Text(
                                    'Select Catagory',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  value: selectedUser,
                                  onChanged: (Item Value) {
                                    setState(() {
                                      selectedUser = Value;
                                    });
                                  },
                                  items: users.map((Item user) {
                                    return DropdownMenuItem<Item>(
                                      value: user,
                                      child: Row(children: <Widget>[
                                        user.icon,
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          user.name,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 16,
                                              fontFamily: "GentiumBasic"),
                                        ),
                                      ]),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: TextFormField(
                        onChanged: (val) {
                          mobileno = val;
                        },
                        // controller: taskMobileInputController,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "Mobile Number *",
                            hintStyle: aboutPageStyle(),
                            fillColor: Colors.white,
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle())),
                  ),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: TextFormField(
                        onChanged: (val) {
                          landline = val;
                        },
                        // controller:taskLandlineInputController ,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Landline Number *",
                          hintStyle: aboutPageStyle(),
                          fillColor: Colors.white,
                          enabledBorder: borderStyle(),
                          focusedBorder: borderStyle(),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: TextFormField(
                        onChanged: (val) {
                          location = val;
                        },
                        // controller: taskLocationInputController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Enter Location *",
                          hintStyle: aboutPageStyle(),
                          fillColor: Colors.white,
                          enabledBorder: borderStyle(),
                          focusedBorder: borderStyle(),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: TextFormField(
                        onChanged: (val) {
                          pincode = val;
                        },
                        //controller: taskPincodeInputController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Enter Pincode *",
                          hintStyle: aboutPageStyle(),
                          fillColor: Colors.white,
                          enabledBorder: borderStyle(),
                          focusedBorder: borderStyle(),
                        )),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Advertising Plans *', style: aboutPageStyle()),
                      RaisedButton(
                        padding: EdgeInsets.all(8),
                        color: Colors.grey,
                        child: Text("About the plan", style: buttonStyle()),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => About_Page()));
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: TextFormField(
                        onChanged: (val) {
                          plans = val;
                        },
                        //controller: taskNameInputController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "eg : basic , premium or gold",
                          hintStyle: aboutPageStyle(),
                          fillColor: Colors.white,
                          enabledBorder: borderStyle(),
                          focusedBorder: borderStyle(),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                    child: Container(
                      height: 60,
                      width: 850,
                      child: TextField(
                          onChanged: (val) {
                            message = val;
                          },
                          //controller: taskMessageInputController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "Write message about Workspace here...",
                              hintStyle: buttonStyle(),
                              fillColor: Colors.black,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.orange),
                              ))),
                    ),
                  ),
                ],
              )));
  }
}
