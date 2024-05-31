import 'package:bloc_project/bloc/auth/signup/signup_bloc.dart';
import 'package:bloc_project/bloc/internet/internet_block.dart';
import 'package:bloc_project/cubit/internet_cubit.dart';
import 'package:bloc_project/increment_bloc.dart';
import 'package:bloc_project/screens/internet_cubit_view.dart';
import 'package:bloc_project/screens/profile_view.dart';
import 'package:bloc_project/screens/signup_screen.dart';
import 'package:bloc_project/screens/video_player_view.dart';
import 'package:bloc_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/internet_view.dart';
import 'bloc/profile/profile_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => IncrementBloc(),
        ),

        /// define cubit------------------
        BlocProvider(
          create: (context) => InternetCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Utils.internetChecker(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InternetView(),
                    ),
                  );
                },
                child: const Text('Go To Internet View'),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileView(),
                    ),
                  );
                },
                child: const Text('Go To Profile View'),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoPlayerView(
                            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
                      ));
                },
                child: const Text('Go To Video View'),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InternetCubitView()));
                },
                child: const Text('Go To Cubit View'),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (BuildContext context) => SignUpBloc(),
                        child: const SignupView(),
                      ),
                    ),
                  );
                },
                child: const Text('Go To Signup View'),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      );
}
