import 'package:flutter/material.dart';
import 'package:music/song_details_page.dart'; // Replace with your project name
import 'artists.dart';
import 'song.dart';

class ArtistSongsPage extends StatelessWidget {
  final Artist artist;
  final List<Song?> songs;

  const ArtistSongsPage({super.key, required this.artist, required this.songs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${artist.firstName} Songs'), // Use string interpolation for clear formatting
      ),
      // body: songs.isEmpty
      body: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            final song = songs[index];
            return ListTile(
              title: Text(song!.title),
              subtitle: Text(song.price
                  .toStringAsFixed(2)), // Display price with currency symbol
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SongDetailsPage(song: song),
                  ),
                );
              },
            );
          }),
    );
  }
}
