import 'dart:developer';

import 'package:bloc_project/bloc/internet/internet_block.dart';
import 'package:bloc_project/bloc/internet/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetView extends StatelessWidget {
  const InternetView({super.key});

  /// bloc listener is used to perform the background task.
  /// bloc builder is used to make the ui .
  /// bloc consumer is mixed up of bloc listener and bloc builder.

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Internet View'),
          centerTitle: true,
        ),
        body: Center(
            child: SizedBox(
          height: 100,
          child: BlocConsumer<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetConnectedState) {
                return const Text('Internet connected.......');
              } else if (state is InternetLostState) {
                return const Text('Not connected');
              } else {
                return const Text('Loading .....');
              }
            },
            listener: (context, state) {
              log('Internet state:$state');
            },
          ),
        )

            // BlocBuilder<InternetBloc, InternetState>(
            //   builder: (context, state) {
            //     /// is used to check data type. and == used to check values.
            //     if (state is InternetConnectedState) {
            //       return const Text('Internet connected.......');
            //     } else if (state is InternetLostState) {
            //       return const Text('Not connected');
            //     } else {
            //       return const Text('Loading .....');
            //     }
            //   },
            // ),

            ),
      );
}
