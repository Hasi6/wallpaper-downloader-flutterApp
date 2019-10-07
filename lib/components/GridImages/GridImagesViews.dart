import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_finder/config/Keys.dart' as keys;
import 'dart:async';
import 'dart:convert';
class GridImagesViews extends StatefulWidget {
  _GridImagesViewsState createState() => _GridImagesViewsState();
}

class _GridImagesViewsState extends State<GridImagesViews> {
  var imageList = [];
  _GridImagesViewsState(){
    getDatas();
  }
  getDatas() async{
    var imageLists = await getData(); 
    setState(() {
      imageList = imageLists;
    });
    print(imageList);
  }
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150.0,
      children: _buildGridTiles(imageList.length, imageList),
    );
  }
}

List<Widget> _buildGridTiles(images, imageList) {
  var containers = List<Container>.generate(images, (int index) {
    return Container(
      child: Image.network(imageList[index]['urls']['raw'], width: 100.0,height: 100.0,),
    );
  });

  return containers;
}

Future getData() async {
  String apiUrl = 'https://api.unsplash.com/photos/?client_id=${keys.access_Key}';
  http.Response res = await http.get(apiUrl);
  return jsonDecode(res.body);  // Retun a list
}