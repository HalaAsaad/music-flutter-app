import 'package:flutter/material.dart';
import 'package:musicapp/drawer_content.dart';

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
      body: Row(
        children: [
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          )
        ],
      ),
    ));
  }
}
