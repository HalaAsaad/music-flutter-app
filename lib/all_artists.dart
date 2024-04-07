import 'package:flutter/material.dart';
import 'package:musicapp/artist_details.dart';
import 'package:musicapp/artists.dart';

class ArtistListPage extends StatefulWidget {
  const ArtistListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ArtistListPageState createState() => _ArtistListPageState();
}

class MyObject {
  final int id;
  final String firstName;
  final String lastName;
  final String gender;
  final String country;

  MyObject(this.id, this.firstName, this.lastName, this.gender, this.country);
}

class _ArtistListPageState extends State<ArtistListPage> {
  // // int? _selectedArtistId;
  // //List<dynamic> allArtists = [];
  // List<MyObject> allArtists = [
  //   // MyObject('John', "aa", "male", "lebanon"),
  //   // MyObject('Alice', "bb", "female", "syria"),
  //   // MyObject('Bob', "cc", "male", "syria"),
  // ];
  @override
  void initState() {
    super.initState();
    // Fetch artist data on initialization (assuming a function in artists.dart)
    // allArtists = [
    //   // {
    //   //   "id": 1,
    //   //   "firstName": "Artist 1",
    //   //   "lastName": "Test",
    //   //   "gender": "Male",
    //   //   "country": "Syria"
    //   // },
    //   // {
    //   //   "id": 2,
    //   //   "firstName": "Artist 2",
    //   //   "lastName": "Test2",
    //   //   "gender": "Female",
    //   //   "country": "Syria"
    //   // }
    //   MyObject(1, 'John', "aa", "male", "lebanon"),
    //   MyObject(2, 'Alice', "bb", "female", "syria"),
    //   MyObject(3, 'Bob', "cc", "male", "syria"),
    // ]; // Replace with actual function from artists.dart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artists'),
      ),
      body: ListView.builder(
        itemCount: allArtists.length,
        itemBuilder: (context, index) {
          final artist = allArtists[index];
          return ListTile(
            title: Text(
                '${allArtists[index].firstName} ${allArtists[index].lastName}'),
            subtitle: Text(
                '${allArtists[index].gender} ${allArtists[index].country}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtistDetailsPage(
                      artist: Artist(artist.id, artist.firstName,
                          artist.lastName, artist.gender, artist.country)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
