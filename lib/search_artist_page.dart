import 'package:flutter/material.dart';
import 'package:music/artist_songs_page.dart';
import 'artists.dart';
import 'song.dart';

// import 'song.dart';

class SearchArtistPage extends StatefulWidget {
  const SearchArtistPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  State<SearchArtistPage> createState() => _SearchArtistPageState();
}

class _SearchArtistPageState extends State<SearchArtistPage> {
  String _searchText = '';
  List<Artist> _AllArtists = []; //allArtists;
  List<Artist> _filteredArtists = []; //allArtists;

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data on initialization
  }

  Future<void> fetchData() async {
    _AllArtists = (await getData())!;
    _filteredArtists = _AllArtists; // Initially show all data
    setState(() {}); // Update UI
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Artist'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search Artist (First or Last Name)',
                icon: Icon(Icons.search),
              ),
              onChanged: (text) {
                _searchText = text.toLowerCase();
                _filteredArtists = _AllArtists.where((artist) =>
                        // artist.firstName.toLowerCase().contains(_searchText))
                        artist.firstName.toLowerCase().contains(_searchText) ||
                        artist.lastName.toLowerCase().contains(_searchText))
                    .toList();
                setState(() {}); // Rebuild the UI with filtered artists
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredArtists.length,
              itemBuilder: (context, index) {
                final artist = _filteredArtists[index];
                return ListTile(
                  title: Text("${artist.firstName} ${artist.lastName}"),
                  onTap: () {
                    final artistSongs = [songMap[artist.id]];
                    if (artistSongs.contains(null)) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('No Songs Found'),
                          content:
                              const Text('No songs found for this artist.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                    // myList.contains(null)
                    // if (!checknull) {
                    if (!artistSongs.contains(null)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArtistSongsPage(
                            artist: artist,
                            songs: artistSongs.cast<Song>(),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
