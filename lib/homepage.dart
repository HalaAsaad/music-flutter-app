import 'package:flutter/material.dart';
import 'package:music/drawer_content.dart';
import 'package:music/register.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _PageState();
}

class _PageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
              backgroundColor: Colors.blue[700], // Set app bar color
              centerTitle: true, // Center app bar title
            ),
            drawer: const MyDrawerContent(),
            body: ListView(
              children: <Widget>[
                ListTile(
                  title: const Text('Add Artist'),
                  onTap: () {
                    Navigator.of(context).pushNamed("add-artist");
                  },
                ),
                ListTile(
                  title: const Text('Add Song'),
                  onTap: () {
                    Navigator.of(context).pushNamed("add-song");
                  },
                ),
                ListTile(
                  title: const Text('All Songs'),
                  onTap: () {
                    Navigator.of(context).pushNamed("song");
                  },
                ),
                ListTile(
                  title: const Text('All Artists'),
                  onTap: () {
                    Navigator.of(context).pushNamed("artists");
                  },
                ),
                ListTile(
                    title: const Text('Song Search'),
                    onTap: () {
                      Navigator.of(context).pushNamed("song-search");
                    }),
                ListTile(
                    title: const Text('Artist Search'),
                    onTap: () {
                      Navigator.of(context).pushNamed("artist-search");
                    }),
                ListTile(
                    title: const Text('Buy song'),
                    onTap: () {
                      Navigator.of(context).pushNamed("buy-song");
                    }),
                Container(
                    margin:
                        const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil('login'  ,(_) => false,);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                            double.infinity, 50.0), // Set minimum button size
                        backgroundColor: Colors.red[700], // Set button color
                      ),
                      child: const Text(
                        'Log out',
                        style: CustomTextStyle.buttonText,
                      ),
                    )),
              ],
            )));
  }
}
