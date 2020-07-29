import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vipan_dial/catergoryPage/category.dart';
import 'package:vipan_dial/search_page/searchScreen.dart';
import 'package:vipan_dial/views/home.dart';
import 'package:vipan_dial/widget/widgets.dart';

import 'nav_bar.dart';

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const [
  const Choice(title: 'Fishing', icon: MdiIcons.sailBoat),
  const Choice(title: 'IT Services', icon: Icons.computer),
  const Choice(title: 'Construction', icon: Icons.build),
  const Choice(title: 'Agriculture', icon: MdiIcons.leaf),
  const Choice(title: 'Groceries', icon: MdiIcons.shopping),
  const Choice(title: 'Transportation', icon: MdiIcons.truck),
  const Choice(title: 'Medical', icon: MdiIcons.medicalBag),
  const Choice(title: 'Media', icon: MdiIcons.radio),
  const Choice(title: 'E-Commerce', icon: MdiIcons.cart),
  const Choice(title: 'Education', icon: MdiIcons.school),
  const Choice(title: 'Real Estate', icon: MdiIcons.home),
  const Choice(title: 'Clothing', icon: MdiIcons.tshirtCrew),
  const Choice(title: 'Tax consultant', icon: MdiIcons.handshake),
  const Choice(title: 'Electronics & Electrical', icon: MdiIcons.powerPlug),
];

class HomePage extends StatelessWidget {
  HomePage(
      {@required this.name,
      this.mobileno,
      this.landline,
      this.location,
      this.pincode});

  final name;
  //final category;
  final mobileno;
  final landline;
  final location;
  final pincode;
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
     drawer: NavDrawer(), 
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                width: 200,
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                    controller: editingController,
                    style: buttonStyle(),
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
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  children: List.generate(choices.length, (index) {
                    return GestureDetector(
                      child: Center(
                        child: ChoiceCard(
                          choice: choices[index],

                        ),
                      ),
                      onTap: () {
                        
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryPage(data: choices[index].title)));
                      },
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 13),
              ),
              Row(
                  //mainAxisalignment:MainAxisAlignment.spaceevenly,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
                    Text("Register  here", style: regStyle()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    RaisedButton(
                        color: Colors.orange,
                        child: Text(
                          "Register",
                          style: simpleStyle(),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        })
                  ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              ImageCarousel(),
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            ],
          )
        ],
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    return Card(
        color: Colors.black,
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Icon(
                  choice.icon,
                  size: 43.0,
                  color: Colors.white,
                )),
                Text(
                  choice.title,
                  style: homeStyle(),
                ),
              ]),
        ));
  }
}

class ImageCarousel extends StatelessWidget {
  final carousel = Carousel(
    images: [
      //AssetImage('assets/img1.jpeg'),
      AssetImage('assets/img3.jpeg'),
      AssetImage('assets/img2.jpeg'),
     // AssetImage('assets/img4.jpeg'),
    ],
    animationCurve: Curves.fastOutSlowIn,
    autoplayDuration: Duration(milliseconds: 2000),
  );

  final banner = new Padding(
      padding: EdgeInsets.only(top: 20.0, left: 20.0),
      child: new Container(
        decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            )),
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Advertise your Company",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "GentiumBasic",
          ),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 300,
      child: new ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: <Widget>[
              carousel,
              banner,
            ],
          )),
    );
  }
}
