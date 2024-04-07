import 'package:flutter/material.dart';
import 'package:musicapp/all_artists.dart';
import 'package:musicapp/create_artist.dart';
import 'package:musicapp/homepage.dart';
import 'package:musicapp/login.dart';
import 'package:musicapp/pagesong.dart';
import 'package:musicapp/register.dart';
import 'package:musicapp/create_song.dart';
import 'package:musicapp/buy_song.dart';
import 'package:musicapp/search_artist_page.dart';
import 'package:musicapp/search_song.dart';

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
