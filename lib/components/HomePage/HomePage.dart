import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_finder/config/Keys.dart' as keys;

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool searchBarOpen = false;
  searchPressed() {
    setState(() {
      searchBarOpen = !searchBarOpen;
    });
  }

  Future textChanged()async{
    var res = await getData();
    print(res);
}
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpaper App By Hasi"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => searchPressed(),
          )
        ],
      ),
      // backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
            Visibility(
              visible: searchBarOpen,
              child: TextField(
                onChanged: (e)=>textChanged(),
            decoration: InputDecoration(labelText: 'Search Images',),
            )
          )
        ],
      )
    );
  }
}



Future getData() async {
  String apiUrl = 'https://api.unsplash.com/photos/?client_id=${keys.access_Key}';
  http.Response res = await http.get(apiUrl);
  return jsonDecode(res.body);  // Retun a list
}