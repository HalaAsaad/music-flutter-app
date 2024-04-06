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

// final List<Artist> allArtists = [
//   Artist(1, 'ahmad', 'Doe', 'Male', 'USA'),
//   Artist(2, 'Jane', 'Smith', 'Female', 'UK'),
//   Artist(3, 'Michael', 'Brown', 'Male', 'Canada'),
//   Artist(4, 'Alice', 'Garcia', 'Female', 'Spain'),
//   // ... add more artists
// ];
// final Map<int?, Artist?> artistMap = {
//   for (var artist in allArtists) artist.id: artist
// };

// class Artist {
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String gender;
//   final String country;

//   Artist(this.id, this.firstName, this.lastName, this.gender, this.country);
// }
