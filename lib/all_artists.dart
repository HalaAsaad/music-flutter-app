import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:music/artist_details.dart';

class ArtistListPage extends StatefulWidget {
  const ArtistListPage({super.key});

  @override
  State<ArtistListPage> createState() => _ArtistListPageState();
}

class _ArtistListPageState extends State<ArtistListPage> {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://amphibological-doze.000webhostapp.com/get_all_artists.php'));
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
        title: const Text('Artists'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final artist = data[index];
                return ListTile(
                  title: Text(
                      "${artist['fname']} ${artist['lname']}"), // Access data properties
                  subtitle: Text(
                      'Gender: ${artist["gender"]} - Country: ${artist["country"]}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ArtistDetailsPage(artist_id: artist['id']),
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
