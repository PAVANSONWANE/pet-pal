import 'package:flutter/material.dart';
import 'package:pet_pal/services/firestore_service.dart';
import 'package:pet_pal/models/pet.dart';

class AddPetScreen extends StatefulWidget {
  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final FirestoreService _service = FirestoreService();
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _medicalHistoryController = TextEditingController();

  void _addPet() {
    final pet = Pet(
      id: '',
      name: _nameController.text,
      type: _typeController.text,
      imageUrl: _imageUrlController.text,
      medicalHistory: _medicalHistoryController.text,
    );

    _service.addPet(pet);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Pet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Pet Name')),
            TextField(controller: _typeController, decoration: InputDecoration(labelText: 'Pet Type')),
            TextField(controller: _imageUrlController, decoration: InputDecoration(labelText: 'Image URL')),
            TextField(controller: _medicalHistoryController, decoration: InputDecoration(labelText: 'Medical History')),
            SizedBox(height: 16),
            ElevatedButton(onPressed: _addPet, child: Text('Add Pet')),
          ],
        ),
      ),
    );
  }
}
