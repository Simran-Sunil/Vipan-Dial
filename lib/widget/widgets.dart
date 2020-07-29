import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle aboutPageStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 20, fontFamily: "GentiumBasic");
}

TextStyle pageStyle() {
  return TextStyle(
      color: Colors.black, fontSize: 20, fontFamily: "GentiumBasic");
}

TextStyle titleStyle() {
  return TextStyle(
      color: Colors.orange, fontSize: 29, fontFamily: "GentiumBasic");
}

TextStyle buttonStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 17, fontFamily: "GentiumBasic");
}

TextStyle homeStyle() {
  return TextStyle(
      color: Colors.orange, fontSize: 17, fontFamily: "GentiumBasic");
}

TextStyle simpleStyle() {
  return TextStyle(
      color: Colors.black, fontSize: 17, fontFamily: "GentiumBasic");
}

TextStyle navbarStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 29, fontFamily: "GentiumBasic");
}

TextStyle regStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 26, fontFamily: "GentiumBasic");
}

OutlineInputBorder borderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.orange),
  );
}
