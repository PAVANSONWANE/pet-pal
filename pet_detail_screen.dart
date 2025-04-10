import 'package:flutter/material.dart';
import '../models/pet.dart';

class PetDetailScreen extends StatelessWidget {
  final Pet pet;

  PetDetailScreen({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${pet.name}\'s Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(pet.imageUrl, height: 250, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text('Name: ${pet.name}', style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 8),
            Text('Type: ${pet.type}', style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 8),
            Text('Medical History: ${pet.medicalHistory}', style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
