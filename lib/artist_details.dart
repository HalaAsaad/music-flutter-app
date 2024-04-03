import 'package:flutter/material.dart';
import 'artists.dart';
// import 'song.dart';

class ArtistDetailsPage extends StatelessWidget {
  final Artist artist;

  const ArtistDetailsPage({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artist Details: ${artist.fullName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: 'First Name: ${artist.firstName}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              readOnly: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              initialValue: 'Last Name: ${artist.lastName}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              readOnly: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              initialValue: 'Gender: ${artist.gender}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              readOnly: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              initialValue: 'Country: ${artist.country}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              readOnly: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
