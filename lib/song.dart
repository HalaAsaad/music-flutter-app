import 'package:http/http.dart' as http;
import 'dart:convert';

Future getSongs() async {
  var url = Uri.parse(
      "https://amphibological-doze.000webhostapp.com/get_all_songs.php");
  final response =
      await http.get(url, headers: {"Content-Type": "application/json"});
  var jsonData = json.decode(response.body);
  // return body.map((e) => Post.fromJson(e)).toList();
  List<Song> songs = [];

  for (var s in jsonData) {
    Song song =
        Song(s["id"], s["title"], s["type"], s["price"], s["artist_id"]);
    songs.add(song);
  }
  return songs;
}

//final List<Song> allSongs = getSongs() as List<Song>;
//Future _allSongs = getSongs();
final List<Song> allSongs = [
  Song(1, 'Song Title 1', 'Genre 1', 2.99, 1),
  Song(2, 'Song Title 2', 'Genre 2', 1.99, 2),
  Song(3, 'Song Title 3', 'Genre 2', 1.99, 2),
  Song(4, 'Song Title 4', 'Genre 2', 1.99, 2),
  Song(5, 'Song Title 5', 'Genre 2', 1.99, 2),
  Song(6, 'Song Title 6', 'Genre 2', 1.99, 2),
  Song(7, 'Song Title 7', 'Genre 2', 1.99, 2),
  Song(8, 'Song Title 8', 'Genre 2', 1.99, 2),
  Song(9, 'Song Title 9', 'Genre 2', 1.99, 2),
  Song(10, 'Song Title 10', 'Genre 2', 1.99, 3),

  //... add more songs
];
final Map<int?, Song?> songMap = {};
void main() {
  getSongs().then((songs) {
    for (Song song in songs) {
      songMap[song.id] = song;
      // Do something with each song
    }
  });
}

// Future<List<Song>> futureSongs = Future.value(allSongs);
// SongList songList = SongList(futureSongs);

// final Map<int?, Song?> songMap = {for (var song in allSongs) song.id: song};

class Song {
  final int id;
  final String title;
  final String type;
  final dynamic price;
  final int artist_id; // We'll replace this with artistName later
  Song(this.id, this.title, this.type, this.price, this.artist_id);
}
