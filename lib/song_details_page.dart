import 'package:flutter/material.dart';
import 'package:music/artist_details.dart';
import 'artists.dart';
import 'song.dart';

class SongDetailsPage extends StatelessWidget {
  final Song song;
  const SongDetailsPage({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Song Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              song.title,
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Text('Type: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(song.type),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Text('Price: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${song.price}'),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Text('Artist: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(getArtistName(song.artist_id)),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ArtistDetailsPage(artist_id: song.artist_id),
                  ),
                );
              },
              child: const Text('View Artist Details'),
            ),
          ],
        ),
      ),
    );
  }
}

String getArtistName(int artistId) {
  // Implement your logic to find artist name based on artistId
  // This could involve searching through a list of artists or querying a database
  // Replace this placeholder with your actual implementation
  for (final artist in allArtists) {
    if (artist.id == artistId) {
      return artist.firstName;
    }
  }
  return 'Unknown'; // Return a default value for missing artists
}
