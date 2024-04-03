import 'package:flutter/material.dart';
import 'package:musicapp/song_details_page.dart'; // Replace with your project name
import 'song.dart'; // Import your song data

class SongListPage extends StatefulWidget {
  const SongListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  int? _selectedSongId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Songs'),
      ),
      body: ListView.builder(
        itemCount: allSongs.length,
        itemBuilder: (context, index) {
          final song = allSongs[index];
          return ListTile(
            title: Text(song.title),
            subtitle: Text('${song.type} - \$${song.price.toStringAsFixed(2)}'),
            onTap: () {
              setState(() {
                _selectedSongId = song.id;
              });
              if (_selectedSongId != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SongDetailsPage(song: song),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
