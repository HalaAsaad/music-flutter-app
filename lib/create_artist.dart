import 'package:flutter/material.dart';
import 'package:musicapp/artists.dart';

class CreateArtistPage extends StatefulWidget {
  const CreateArtistPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateArtistPageState createState() => _CreateArtistPageState();
}

class _CreateArtistPageState extends State<CreateArtistPage> {
  // // ignore: unused_field
  // final int _selectedArtistIndex = 0; // Index of the selected artist in the dropdown
  // final List<String> artistNames = [
  //   'Artist 1',
  //   'Artist 2',
  //   'Artist 3',
  // ]; // Fake artists

  // final Artist artist;
  List<String> artistNames = []; // List to store artist names

  @override
  void initState() {
    super.initState();
    // Fetch artist data on initialization (assuming a function in artists.dart)
    artistNames =
        getAllArtistNames(); // Replace with actual function from artists.dart
  }
  // String get fullName => '$firstName $lastName';

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _typeController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Artist'),
        backgroundColor: Colors.blue, // Add a background color to the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'FirstName',
                  border: OutlineInputBorder(
                    // Add an outline border to the text field
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a FirstName' : null,
              ),
              const SizedBox(
                  height: 10.0), // Add some spacing between text fields
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(
                  labelText: 'LastName',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a LastName' : null,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty || double.tryParse(value) == null
                        ? 'Please enter a valid Gender'
                        : null,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty || double.tryParse(value) == null
                        ? 'Please enter a valid Country'
                        : null,
              ),
              const SizedBox(height: 10.0), // Add spacing before the button
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
                        content: Text('Artist created successfully!'),
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
                  'Create Artist',
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
