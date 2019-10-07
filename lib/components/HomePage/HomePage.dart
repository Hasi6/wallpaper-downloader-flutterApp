import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_finder/components/GridImages/GridImagesViews.dart';



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

//   Future textChanged()async{
//     var res = await getData();
//     print(res);
// }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBarOpen ? TextField(
            decoration: InputDecoration(labelText: 'Search Images',)) : Text('Hasi'),
            centerTitle: true,
            backgroundColor: searchBarOpen ? Colors.white : Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: searchBarOpen ? Colors.black : Colors.white,),
            onPressed: () => searchPressed(),
          )
        ],
      ),
      // backgroundColor: Colors.black,
      body: GridImagesViews()
    );
  }
}



