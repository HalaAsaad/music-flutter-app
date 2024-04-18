import 'package:flutter/material.dart';
import 'package:music/artists.dart';
import 'package:http/http.dart' as http;

class CreateSongPage extends StatefulWidget {
  const CreateSongPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateSongPageState createState() => _CreateSongPageState();
}

class _CreateSongPageState extends State<CreateSongPage> {
  List<String> artistNames = [];
  List<Artist> artists = []; // List to store artist names
  @override
  void initState() {
    super.initState();
    artistNames = getAllArtistNames();
    fetchData(); // Fetch data on initialization
  }

  Future<void> fetchData() async {
    artists = (await getData())!; // Initially show all data
    setState(() {}); // Update UI
  }
  // String get fullName => '$firstName $lastName';

  final _formKey = GlobalKey<FormState>();
  int? _artistId;
  TextEditingController titleController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController artistController = TextEditingController();

  void createSong(String title, String type, String price) async {
    // Navigator.of(context).pushNamed("login"); // to delete when request Success
    final url = Uri.parse(
        'https://amphibological-doze.000webhostapp.com/add_song.php'); // Replace with your API endpoint
    final response = await http.post(
      url,
      // headers: {'Content-Type': 'application/json'},
      body: {
        'title': title,
        'type': type,
        'price': price,
        'artist_id': _artistId.toString(),
      },
    );

    if (response.statusCode == 200) {
      // Handle successful login (e.g., navigate to another page)
      showSuccessDialog(context);
      titleController.clear();
      typeController.clear();
      priceController.clear();
      artistController.clear();
      print('Create Song successful!');
    } else {
      // Handle login failure (e.g., show error message)
      print('Create Song failed: ${response.statusCode}');
      // Show an appropriate error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Song'),
        backgroundColor: Colors.blue, // Add a background color to the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    // Add an outline border to the text field
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a title' : null,
              ),
              const SizedBox(
                  height: 10.0), // Add some spacing between text fields
              TextFormField(
                controller: typeController,
                decoration: InputDecoration(
                  labelText: 'Type',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a type' : null,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty || double.tryParse(value) == null
                        ? 'Please enter a valid price'
                        : null,
              ),
              const SizedBox(height: 10.0),
              DropdownButtonFormField<int>(
                value: _artistId, // Holds the currently selected user ID
                hint: const Text('Select Artist'),
                items: artists
                    .map((user) => DropdownMenuItem<int>(
                          value: user.id, // Set value to user ID (int)
                          child: Text(user.firstName),
                        ))
                    .toList(),
                onChanged: (int? value) {
                  setState(() {
                    _artistId = value!; // Update selected user ID
                  });
                },
              ),
              const SizedBox(height: 20.0), // Add spacing before the button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    createSong(
                        titleController.text.toString(),
                        typeController.text.toString(),
                        priceController.text.toString());
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
                  'Create Song',
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

class Item {
  final int id;
  final String name;

  const Item({required this.id, required this.name});
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
