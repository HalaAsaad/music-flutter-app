import 'package:flutter/material.dart';
import 'package:music/all_artists.dart';
import 'package:music/create_artist.dart';
import 'package:music/homepage.dart';
import 'package:music/login.dart';
import 'package:music/pagesong.dart';
import 'package:music/register.dart';
import 'package:music/create_song.dart';
import 'package:music/buy_song.dart';
import 'package:music/search_artist_page.dart';
import 'package:music/search_song.dart';

//main
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        'signup': (context) => const RegisterPage(),
        'login': (context) => const LoginPage(),
        'home': (context) => const Home(),
        "add-song": (context) => const CreateSongPage(),
        'song': (context) => const SongListPage(),
        "artist-search": (context) => const SearchArtistPage(),
        "add-artist": (context) => const CreateArtistPage(),
        "buy-song": (context) => const BuySongPage(),
        "artists": (context) => const ArtistListPage(),
        "song-search": (context) => const SongSearchPage()
      },
    );
  }
}
