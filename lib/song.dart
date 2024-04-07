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

  // ... add more songs
];
final Map<int?, Song?> songMap = {for (var song in allSongs) song.id: song};

class Song {
  final int id;
  final String title;
  final String type;
  final double price;
  final int artistId; // We'll replace this with artistName later
  Song(this.id, this.title, this.type, this.price, this.artistId);
}
