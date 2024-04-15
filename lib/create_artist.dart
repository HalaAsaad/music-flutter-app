import 'package:flutter/material.dart';
import 'package:music/artists.dart';
import 'package:http/http.dart' as http;

class CreateArtistPage extends StatefulWidget {
  const CreateArtistPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateArtistPageState createState() => _CreateArtistPageState();
}

class _CreateArtistPageState extends State<CreateArtistPage> {
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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  void createArtist(
      String fname, String lname, String gender, String country) async {
    final url = Uri.parse(
        'https://amphibological-doze.000webhostapp.com/add_artist.php'); // Replace with your API endpoint
    final response = await http.post(
      url,
      // headers: {'Content-Type': 'application/json'},
      body: {
        'fname': fname,
        'lname': lname,
        "gender": gender,
        "country": country
      },
    );

    if (response.statusCode == 200) {
      showSuccessDialog(context);
      firstNameController.clear();
      lastNameController.clear();
      genderController.clear();
      countryController.clear();
    } else {
      
      showErrorDialog(context);
      
    }
  }

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
                controller: firstNameController,
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
                //onSaved: (value) => setState(() => _fname = value!),
              ),
              const SizedBox(
                  height: 10.0), // Add some spacing between text fields
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'LastName',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a LastName' : null,
                // onSaved: (value) => setState(() => _lname = value!),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                //  keyboardType: TextInputType.number,
                controller: genderController,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a valid Gender' : null,
                // onSaved: (value) => setState(() => _gender = value!),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: countryController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a valid Country' : null,
                // onSaved: (value) => setState(() => _country = value!),
              ),
              const SizedBox(height: 10.0), // Add spacing before the button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    createArtist(
                        firstNameController.text.toString(),
                        lastNameController.text.toString(),
                        genderController.text.toString(),
                        countryController.text.toString());
                    // createArtist(_fname, _lname, _gender,
                    //     _country); // Call login function
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

void showErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Failed!'),
        content: const Text('Your data did not saved successfully.'),
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
