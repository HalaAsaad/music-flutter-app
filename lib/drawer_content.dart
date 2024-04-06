import 'package:flutter/material.dart';
import 'package:musicapp/create_song.dart';
import 'package:musicapp/homepage.dart';
import 'package:musicapp/pagesong.dart';
import 'package:musicapp/search_artist_page.dart';

class MyDrawerContent extends StatelessWidget {
  const MyDrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Header'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
              // Navigator.pushReplacementNamed(context, 'song');
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Home(),
              ));
            },
          ),
          ListTile(
            title: const Text('Song'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
              // Navigator.pushReplacementNamed(context, 'song');
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SongListPage(),
              ));
            },
          ),
          ListTile(
            title: const Text('Add Song'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
              // Navigator.pushReplacementNamed(context, 'song');
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CreateSongPage(),
              ));
            },
          ),
          ListTile(
            title: const Text('Artist Search'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
              // Navigator.pushReplacementNamed(context, 'song');
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SearchArtistPage(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
