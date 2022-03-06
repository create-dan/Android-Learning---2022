// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final String url = "https://swapi.co/api/people";
  final String url = "https://swapi.dev/api/films/";
  // final String url = "https://jsonplaceholder.typicode.com/posts";
  var data = [];

  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  Future<String> getJsonData() async {
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    // var response = await http.get(
    //     //Encode the url
    //     Uri.encodeFull(url),
    //     //only accept json response
    //     headers: {"Accept": "application/json"});

    print(response.body);

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['results'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve Json via HTTP GET "),
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      child: Container(
                        child: Text(data[index]['title']),
                        padding: EdgeInsets.all(20.0),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
