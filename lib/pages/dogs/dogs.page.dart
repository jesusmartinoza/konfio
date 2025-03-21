import 'package:flutter/material.dart';
import 'package:konfio_challenge/widgets/dogs/dog.card.dart';

class DogsPage extends StatelessWidget {
  const DogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dogs We Love')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [const DogCard()],
        ),
      ),
    );
  }
}
