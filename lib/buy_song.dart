import 'package:flutter/material.dart';
import 'song.dart';
import 'package:http/http.dart' as http;

class BuySongPage extends StatefulWidget {
  const BuySongPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BuySongPageState createState() => _BuySongPageState();
}

class _BuySongPageState extends State<BuySongPage> {
  List<dynamic> songsNames = []; // List to store artist names
  List<Song> songs = [];
  @override
  void initState() {
    super.initState();
    songsNames = allSongs;
    fetchData(); // Fetch data on initialization
  }

  Future<void> fetchData() async {
    songs = (await getSongs())!; // Initially show all data
    setState(() {}); // Update UI
  }

  final _formKey = GlobalKey<FormState>();
  int? _songId;
  TextEditingController creditCardController = TextEditingController();
  void buySong(String creditCard) async {
    // Navigator.of(context).pushNamed("login"); // to delete when request succcess
    final url = Uri.parse(
        'https://amphibological-doze.000webhostapp.com/bysong.php'); // Replace with your API endpoint
    final response = await http.post(
      url,
      // headers: {'Content-Type': 'application/json'},
      body: {
        'user_id': "1",
        'song_id': _songId.toString(),
        'credit_card_Number': creditCard,
      },
    );

    if (response.statusCode == 200) {
      // Handle successful login (e.g., navigate to another page)
      showSuccessDialog(context);
      creditCardController.clear();
      // print('Create Song successful!');
    } else {
      // Handle login failure (e.g., show error message)
      // print('Create Song failed: ${response.statusCode}');
      // Show an appropriate error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Song'),
        backgroundColor: Colors.blue, // Add a background color to the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // DropdownButtonFormField(
              //   value: songsNames[_selectedArtistIndex].id,
              //   items: songsNames.map((artist) => DropdownMenuItem(
              //         value: artist.id,
              //         child:
              //             Text(artist.title), // Use artist.fullName for display
              //       )).toList(),
              //   onChanged: (value) {
              //     setState(() {
              //       // _selectedArtistIndex = songsNames.indexOf(value as String);
              //       _selectedArtistIndex =
              //           songsNames.indexWhere((element) => element.id == value);
              //       // Access the selected artist using artistNames[_selectedArtistIndex]
              //       // if needed
              //     });
              //   },
              //   decoration: InputDecoration(
              //     labelText: 'Song',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //   ),
              // ),
              DropdownButtonFormField<int>(
                value: _songId, // Holds the currently selected user ID
                hint: const Text('Select Song'),
                items: songs
                    .map((song) => DropdownMenuItem<int>(
                          value: song.id, // Set value to song ID (int)
                          child: Text(song.title),
                        ))
                    .toList(),
                onChanged: (int? value) {
                  setState(() {
                    _songId = value!; // Update selected user ID
                  });
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: creditCardController,
                decoration: InputDecoration(
                  labelText: 'Credit card number',
                  border: OutlineInputBorder(
                    // Add an outline border to the text field
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a Credit card number' : null,
              ),
              const SizedBox(
                  height: 10.0), // Add some spacing between text fields
              // Add spacing before the button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // createSong(_title, _type, _price, _artistId);
                    buySong(creditCardController.text.toString());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Set a custom button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Rounded corners for the button
                  ),
                ),
                child: const Text(
                  'Buy Song',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Success!'),
        content: const Text('Your data has been saved successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
