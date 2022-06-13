import 'dart:convert';


import 'package:flutter/material.dart';

import '../api/cats_api.dart';
import '../models/cats.dart';

class CatInfo extends StatefulWidget {
  final String catBreed;
  final String catId;

  CatInfo({required this.catBreed, required this.catId});

  @override
  _CatInfoState createState() => _CatInfoState();
}

class _CatInfoState extends State<CatInfo> {

  CatList catList = CatList(breeds: []);

  void getCatData() async {
    var catJson = await CatAPI().getCatBreed(widget.catId);
    print(catJson);

    var catMap = json.decode(catJson);
    print(catMap);
    setState(() {
      catList = CatList.fromJson(catMap);
    });
  }

  @override
  void initState() {
    super.initState();
    getCatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.catBreed),
        ),
        body: getCat());
  }

  Widget getCat() {
    var mediaSize = MediaQuery
        .of(context)
        .size;
    if (catList == null ||
        catList.breeds == null ||
        catList.breeds.length == 0) {
      return Container();
    }
    return Center(
      child: Container(
        width: mediaSize.width,
        height: mediaSize.height,
        decoration: BoxDecoration(image: DecorationImage(
          image: NetworkImage(catList.breeds[0].url), fit: BoxFit.contain,
        )),
      ),
    );
  }
}