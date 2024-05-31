import 'dart:developer';

import 'package:bloc_project/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubitView extends StatelessWidget {
  const InternetCubitView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Cubit view'),
          centerTitle: true,
        ),
        body: BlocConsumer<InternetCubit, InternetCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubitState = context.watch<InternetCubit>().state;
            log('Cubit state>>>> $cubitState, $state');
            if (cubitState == InternetCubitState.gained) {
              return const Center(child: Text('Internet connected.......'));
            } else if (cubitState == InternetCubitState.lost) {
              return const Center(child: Text('Not connected'));
            } else {
              return const Center(child: Text('Loading .....'));
            }
          },
        ),
      );
}
