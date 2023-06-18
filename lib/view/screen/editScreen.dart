import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pariwisata_flutter/model/editResponse/edit_model.dart';
import 'package:http/http.dart' as http;
import 'package:pariwisata_flutter/view/screen/secondscreen.dart';
import 'package:http_parser/http_parser.dart';

class EditScreen extends StatefulWidget {
  final String userId;
  EditScreen({required this.userId});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  File? _image;
  TextEditingController _usernameController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SecondScreen(userId: widget.userId)),
        );
        return true;
    },
      child:  Scaffold(
        appBar: AppBar(
          title: Text('Edit Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image != null
                  ? CircleAvatar(
                radius: 80,
                backgroundImage: FileImage(_image!),
              )
                  : CircleAvatar(
                radius: 80,
                child: Icon(Icons.person),
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Wrap(
                          children: [
                            ListTile(
                              leading: Icon(Icons.photo_camera),
                              title: Text('Camera'),
                              onTap: () {
                                _pickImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.photo_library),
                              title: Text('Gallery'),
                              onTap: () {
                                _pickImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text('Choose Image'),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement the action for "Oke" button here
                  String username = _usernameController.text;
                  _edit();
                  // Perform the desired operation with the username and image
                },
                child: Text('Oke'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<EditResponse> doEdit(File? photoUrl, String userId, String username) async {
    try {
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse("https://ff6f-114-125-77-36.ngrok-free.app/user/update/$userId"),
      );

      if (photoUrl != null) {
        var multipartFile = await http.MultipartFile.fromPath(
          'profile',
          photoUrl.path,
          contentType: MediaType("image","jpeg"), // Atur content type di sini
        );
        request.files.add(multipartFile);
      }

      request.fields['namalengkap'] = username;

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      return EditResponse.fromJson(json.decode(responseBody));
    } catch (e) {
      throw Exception(e.toString());
    }
  }



  Future<void> _edit() async {
    try {
      final registerResult =
      await doEdit(_image!,widget.userId,_usernameController.text);
      Fluttertoast.showToast(
        msg: registerResult.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      if (!registerResult.error) {
        MaterialPageRoute(builder: (context) => SecondScreen(userId: widget.userId));
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

}
