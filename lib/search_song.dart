import 'package:flutter/material.dart';
import 'song.dart';
import 'package:musicapp/song_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SongSearchPage(),
    );
  }
}

class SongSearchPage extends StatefulWidget {
  @override
  _SongSearchPageState createState() => _SongSearchPageState();
}

class _SongSearchPageState extends State<SongSearchPage> {
  // List<String> songs = [
  //   'Song 1',
  //   'Song 2',
  //   'Song 3',
  //   'Song 4',
  //   'Song 5',
  // ];

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
          title: Text('Song Search'),
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
                decoration: InputDecoration(
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
