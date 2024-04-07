// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'song.dart';
import 'package:musicapp/song_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SongSearchPage(),
    );
  }
}

class SongSearchPage extends StatefulWidget {
  const SongSearchPage({super.key});

  @override
  _SongSearchPageState createState() => _SongSearchPageState();
}

class _SongSearchPageState extends State<SongSearchPage> {


  String searchText = '';

  List<dynamic> searchResults = allSongs;

  void searchSongs(String query) {
    setState(() {
      searchResults = allSongs
          .where(
              (song) => song.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Song Search'),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  searchText = value;
                  searchSongs(searchText);
                },
                decoration: const InputDecoration(
                  hintText: 'Search for a song',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(searchResults[index].title),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SongDetailsPage(song: searchResults[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
