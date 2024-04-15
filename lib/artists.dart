import 'package:http/http.dart' as http;
import 'dart:convert';

final List<Artist> allArtists = [
  Artist(1, 'ahmad', 'Doe', 'Male', 'USA'),
  Artist(2, 'Jane', 'Smith', 'Female', 'UK'),
  Artist(3, 'Michael', 'Brown', 'Male', 'Canada'),
  Artist(4, 'Alice', 'Garcia', 'Female', 'Spain'),
  // ... add more artists
];

final Map<int, Artist> artistNameMap = {
  for (var artist in allArtists) artist.id: artist
};
// Function to retrieve all artist names
List<String> getAllArtistNames() {
  // Use map to create a new list containing only artist names
  return allArtists.map((artist) => artist.fullName).toList();
}

Artist? getArtistById(int artistId) {
  for (final artist in allArtists) {
    if (artist.id == artistId) {
      return artist;
    }
  }
  return null; // Return null if artist not found
}

class Artist {
  final int id;
  final String firstName;
  final String lastName;
  final String gender;
  final String country;

  Artist(this.id, this.firstName, this.lastName, this.gender, this.country);
  String get fullName => '$firstName $lastName';
}

Future<Artist?> getArtist(int artistId) async {
  final url = Uri.parse(
      "https://amphibological-doze.000webhostapp.com/get_one_artist.php?id=$artistId");
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Artist(data['id'], data['fname'], data['lname'], data["gender"],
          data["country"]);
    } else {
      throw Exception('Failed to load artist data');
    }
  } catch (e) {
    print(e); // Log the error for debugging
    return null; // Handle error gracefully (e.g., show error message)
  }
}

Future<List<Artist>?> getData() async {
  try {
    final response = await http.get(Uri.parse(
        'https://amphibological-doze.000webhostapp.com/get_all_artists.php'));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<Artist> artists = [];

      for (var s in jsonData) {
        Artist artist =
            Artist(s["id"], s["fname"], s["lname"], s["gender"], s["country"]);
        artists.add(artist);
      }
      return artists; // Assuming JSON response
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print(e); // Log the error for debugging
    return null; // Handle error gracefully (e.g., show error message)
  }
}


// Future<List<Artist>> getData() async {
//   final url = Uri.parse("https://amphibological-doze.000webhostapp.com/get_all_artists.php");
//   try {
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body) as List;
//       return data.map((item) => Artist.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   } catch (e) {
//     print(e); // Log the error for debugging
//     return []; // Handle error gracefully (e.g., show error message)
//   }
// }
