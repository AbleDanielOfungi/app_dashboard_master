import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _picker = ImagePicker();

  //product model
  XFile? _image;
  String _selectedCategory = 'Roughage';
  String _productName = '';
  double _productPrice = 0.0;
  String _productDetails = '';
  int _productRating = 0;

  final _formkey = GlobalKey<FormState>();

  Future<void> pickImage() async {
    _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  Future<void> uploadImage() async {
    if (_image != null) {
      Reference storageRef =
      FirebaseStorage.instance.ref().child('$_selectedCategory/${DateTime.now()}.png');
      UploadTask uploadTask = storageRef.putFile(File(_image!.path));

      await uploadTask.whenComplete(() async {
        // Getting the download URL for the uploaded image
        String imageURL = await storageRef.getDownloadURL();

        // Creating a new document in Firestore
        FirebaseFirestore.instance.collection('products').add({
          'name': _productName,
          'price': _productPrice,
          'details': _productDetails,
          'rating': _productRating,
          'imageURL': imageURL,
          'category': _selectedCategory,
        });

        print('Image uploaded with details');

        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Image uploaded with details')),
        // );


        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context){
              return AlertDialog(

                content: Text('Image uploaded with details',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),
                actions: [
                  //okay button
                  IconButton(onPressed: (){

                    //pop once to remove dialog box
                    Navigator.pop(context);


                  },
                      icon: Icon(Icons.done))
                ],
              );

            });


      });
    }
  }

  Map<String, String> categoryImages = {
    'Roughage': 'assets/category/roughages.jpg',
    'Fruits': 'assets/category/fruit.jpg',
    'Root Tubers': 'assets/category/tubers.jpg',
    'Vegetables': 'assets/category/greens.jpg',
    'Grains and Flour': 'assets/category/grain.jpg',
    'Meats': 'assets/category/meat.jpg',
    'Fats and Oils': 'assets/category/oil.jpg',
    'Herbs and Spices': 'assets/category/herbs.jpg',
    'Juice and Meals': 'assets/category/meals.jpg'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Column(
          children: [
            Text('Product Upload'),

          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _image != null
                      ? Image.file(
                    File(_image!.path),
                    height: 150,
                  )
                      : Container(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: pickImage,
                    child: Text('Pick Image'),
                  ),
                  SizedBox(height: 10),
                  Text('Product Categories'),
                  SizedBox(height: 10),
                  DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: _selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue!;
                      });
                    },
                    items: categoryImages.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                categoryImages[value]!,
                                height: 24,
                                width: 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(labelText: 'Product Name'),
                    onChanged: (value) {
                      setState(() {
                        _productName = value;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Product Price'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _productPrice = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Product Details'),
                    onChanged: (value) {
                      setState(() {
                        _productDetails = value;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Product Rating'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _productRating = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  _image != null
                      ? Column(
                    children: [
                      Text(
                        'Selected Image:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Image.file(
                        File(_image!.path),
                        height: 150,
                      ),
                    ],
                  )
                      : Container(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: uploadImage,
                    child: Text('Upload Image with Details'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
