import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        color: Colors.pink[50], // Background color to match your design
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Displaying the profile image or default icon
              _profileImage != null
                  ? CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(_profileImage!),
                    )
                  : CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300], // Background color for default icon
                      child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
                    ),
              SizedBox(height: 20),
              Text(
                'Nama User', // You can replace this with actual user name
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              // Button to update the profile image
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Update Profile Picture'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Button color
                ),
              ),
              SizedBox(height: 20),
              // List of options
              ListTile(
                title: Text('Tentang kami', style: TextStyle(color: Colors.black54)),
                onTap: () {
                  // Implement your navigation or functionality here
                },
              ),
              ListTile(
                title: Text('History Pembayaran', style: TextStyle(color: Colors.black54)),
                onTap: () {
                  // Implement your navigation or functionality here
                },
              ),
              ListTile(
                title: Text('Keluar', style: TextStyle(color: Colors.black54)),
                onTap: () {
                  // Implement your logout functionality here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
