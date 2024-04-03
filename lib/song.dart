final List<Song> allSongs = [
  Song(1, 'Song Title 1', 'Genre 1', 2.99, 1),
  Song(2, 'Song Title 2', 'Genre 2', 1.99, 2),
  Song(3, 'Song Title 3', 'Genre 2', 1.99, 2),
  Song(4, 'Song Title 4', 'Genre 2', 1.99, 2),
  Song(5, 'Song Title 5', 'Genre 2', 1.99, 2),
  Song(6, 'Song Title 6', 'Genre 2', 1.99, 2),
  Song(7, 'Song Title 6', 'Genre 2', 1.99, 2),
  Song(8, 'Song Title 6', 'Genre 2', 1.99, 2),
  Song(9, 'Song Title 6', 'Genre 2', 1.99, 2),
  Song(10, 'Song Title 6', 'Genre 2', 1.99, 3),
  Song(11, 'Song Title 6', 'Genre 2', 1.99, 3),
  Song(12, 'Song Title 6', 'Genre 2', 1.99, 3),
  Song(13, 'Song Title 6', 'Genre 2', 1.99, 3),
  Song(14, 'Song Title 6', 'Genre 2', 1.99, 3),
  Song(15, 'Song Title 6', 'Genre 2', 1.99, 3),
  Song(16, 'Song Title 6', 'Genre 2', 1.99, 3),
  Song(17, 'Song Title 1', 'Genre 1', 2.99, 1),
  Song(18, 'Song Title 1', 'Genre 1', 2.99, 1),
  Song(19, 'Song Title 1', 'Genre 1', 2.99, 1),
  Song(20, 'Song Title 1', 'Genre 1', 2.99, 1),

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
