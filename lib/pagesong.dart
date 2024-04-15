import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:music/song_details_page.dart'; // Replace with your project name
import 'song.dart'; // Import your song data

class SongListPage extends StatefulWidget {
  const SongListPage({super.key});

  @override
  State<SongListPage>  createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://amphibological-doze.000webhostapp.com/get_all_songs.php'));
    if (response.statusCode == 200) {
      return json.decode(response.body); // Assuming JSON response
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Songs'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final song = data[index];
                return ListTile(
                  title: Text(song['title']), // Access data properties
                  subtitle: Text(
                      'Type: ${song["type"]} - Price: \$ ${song["price"]}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SongDetailsPage(
                            song: Song(song["id"], song["title"], song["type"],
                                song["price"], song["artist_id"])),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
