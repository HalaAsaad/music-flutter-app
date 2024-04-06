import 'package:flutter/material.dart';

class BuySongPage extends StatefulWidget {
  const BuySongPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BuySongPageState createState() => _BuySongPageState();
}

class _BuySongPageState extends State<BuySongPage> {
  int _selectedArtistIndex = 0; // Index of the selected artist in the dropdown
  // final List<String> artistNames = [
  //   'Artist 1',
  //   'Artist 2',
  //   'Artist 3',
  // ]; // Fake artists

  // final Artist artist;
  List<String> SongsNames = []; // List to store artist names

  @override
  void initState() {
    super.initState();
    // Fetch artist data on initialization (assuming a function in artists.dart)
    SongsNames = [
      "Song1",
      "Song2"
    ]; // Replace with actual function from artists.dart
  }
  // String get fullName => '$firstName $lastName';

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

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
              DropdownButtonFormField(
                value: SongsNames[_selectedArtistIndex],
                items: SongsNames.map((artist) => DropdownMenuItem(
                      value: artist,
                      child: Text(artist), // Use artist.fullName for display
                    )).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedArtistIndex = SongsNames.indexOf(value as String);
                    // Access the selected artist using artistNames[_selectedArtistIndex]
                    // if needed
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Song',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _titleController,
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle song creation (replace with actual saving logic)
                    // final song = Song(
                    //   // Generate unique ID, or use other methods for saving
                    //   1, // Replace with actual ID generation
                    //   _titleController.text,
                    //   _typeController.text,
                    //   double.parse(_priceController.text),
                    //   // Use the selected artist index to get the artist ID from your actual data source
                    //   // (replace with your artist data logic)
                    //   0, // Replace with actual artist ID fetching
                    // );
                    // Show a success message or navigate to another page
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Song created successfully!'),
                      ),
                    );
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
