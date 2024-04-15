// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'artists.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ArtistDetailsPage extends StatelessWidget {
  final int artist_id;

  const ArtistDetailsPage({super.key, required this.artist_id});

  Future<Artist> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://amphibological-doze.000webhostapp.com//get_one_artist.php?id=$artist_id'));
    if (response.statusCode == 200) {
      final artist = json.decode(response.body);
      return Artist(artist["id"], artist["fname"], artist["lname"],
          artist["gender"], artist["country"]); // Assuming JSON response
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ... other code

    final artistId = artist_id; // Replace with the actual artist ID

    return Scaffold(
      appBar: AppBar(
        title: const Text('Artist Details'),
      ),
      body: FutureBuilder<Artist?>(
        future: getArtist(artistId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final artist = snapshot.data!;
            return Center(
                child: Container(
              margin: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
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
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
