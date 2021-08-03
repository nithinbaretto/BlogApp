import 'package:flutter/material.dart';

AppBar appBar(String title, var icon) {
  return AppBar(
    backgroundColor: Colors.teal,
    title: Text(title),
    centerTitle: true,
    actions: [IconButton(onPressed: () {}, icon: Icon(icon))],
  );
}
