import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konfio_challenge/pages/dogs/dogs.cubit.dart';
import 'package:konfio_challenge/pages/dogs/dogs.state.dart';
import 'package:konfio_challenge/widgets/dogs/dog.card.dart';

class DogsPage extends StatelessWidget {
  const DogsPage({super.key});

  _buildList() {
    return BlocBuilder<DogsCubit, DogsState>(builder: (context, state) {
      return ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: DogCard(dog: state.dogs[index], hasShadow: index == 1),
            );
          },
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          itemCount: state.dogs.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dogs We Love')),
      body: BlocProvider(
        create: (_) {
          final cubit = DogsCubit();

          SchedulerBinding.instance.addPostFrameCallback((_) {
            cubit.fetchDogs();
          });
          return cubit;
        },
        child: _buildList(),
      ),
    );
  }
}
