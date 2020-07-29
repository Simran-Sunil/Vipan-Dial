import 'package:flutter/material.dart';
import 'package:vipan_dial/widget/widgets.dart';

class Contacts extends StatefulWidget {
  @override
  ContactState createState() {
    return new ContactState();
  }
}

class ContactState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          children: <Widget>[
            Text(
              "Contact Info",
              style: TextStyle(color:Colors.white,fontSize:35,fontFamily: "GentiumBasic",fontWeight:FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical:13)),
            Text(
              "Address:",
              style: titleStyle(),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical:8)),                  
            Text(
              "\t\tDoor No:4-5/4,Rajeevi compound,\n\t\tMullakad,Kavoor,\n\t\tMangalore-575015",style: aboutPageStyle(),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical:13)),
            Text( "Proprietor:",
              style: titleStyle(),),
              Padding(padding: EdgeInsets.symmetric(vertical:8)),                  
            Text(
              "\t\tSushanth Surathkal :\n\t\tPhone: +91 89045 77387",style: aboutPageStyle(),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical:13)),
            Text( "Administration Finance and Taxation:",
              style: titleStyle(),),
              Padding(padding: EdgeInsets.symmetric(vertical:8)),                  
            Text(
              "\t\tAshwin Kumar M : \n\t\tPhone: +91 80736 36312",style: aboutPageStyle(),
            ),
             Padding(padding: EdgeInsets.symmetric(vertical:13)),
            Text( "Email:",
              style: titleStyle(),),
              Padding(padding: EdgeInsets.symmetric(vertical:8)),                  
            Text(
              "\t\ttanthramshinfotech@gmail.com",style: aboutPageStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
