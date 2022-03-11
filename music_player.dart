// ignore_for_file: prefer_const_constructors

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  List<Song> _songs = [];
  void initState() async {
    super.initState();
    var songs = await MusicFinder.allSongs();
    songs = List.from(songs);
    setState(() {
      _songs = songs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget home() {
      return Scaffold(
        appBar: AppBar(
          title: Text("music app f"),
        ),
        body: ListView.builder(
          itemCount: _songs.length,
          itemBuilder: (context, int index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(_songs[index].title[0]),
              ),
              title: Text(_songs[index].title[0]),
            );
          },
        ),
      );
    }

    return MaterialApp(
      home: home(),
    );
  }
}
