import 'package:flutter/material.dart';
import 'package:pet_pal/models/pet.dart';
import 'package:pet_pal/services/firestore_service.dart';
import 'package:pet_pal/widgets/pet_card.dart';

class PetListScreen extends StatelessWidget {
  final FirestoreService _service = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Available Pets for Adoption')),
      body: StreamBuilder(
        stream: _service.getPets(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          final pets = snapshot.data!;
          return ListView(
            children: pets.map((pet) => PetCard(pet: pet)).toList(),
          );
        },
      ),
    );
  }
}
