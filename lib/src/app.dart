import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show get;

import 'package:flutter/material.dart';
import 'package:imageslide/src/models/image_model.dart';
import 'package:imageslide/src/widgets/image_list.dart';

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return AppState();
  }
  
}

class AppState extends State<App> {  
  int counter = 0;
  List<ImageModel> images = [];

  fetchImage() async{
    counter++;
    String url= 'https://jsonplaceholder.typicode.com/photos/$counter';
    var result = await get(url);
    if(result.statusCode == 200){
      var jsonParsed = json.decode(result.body);
      var imageModel = ImageModel.fronJson(jsonParsed);
      setState(() {
        images.add(imageModel);  
      });
      
    }
    
  }

  @override
  Widget build(BuildContext context) {
    
   return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Geethanya Balamurugan'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: Icon(Icons.add, size: 48),
      ),
      body: ImageList(images),
      
    )
  );
  }
 
}