import 'package:bloc_project/bloc/auth/signup/signup_bloc.dart';
import 'package:bloc_project/bloc/auth/signup/signup_event.dart';
import 'package:bloc_project/bloc/auth/signup/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('signup_view'),
          centerTitle: true,
        ),
        body: BlocBuilder<SignUpBloc, SignupState>(
          builder: (context, state) {
            final bloc = context.read<SignUpBloc>();
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          controller: bloc.emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {
                            bloc.add(SignUpOnChangeEvent());
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Text(''):SizedBox.shrink()
                        TextField(
                          controller: bloc.passwordController,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {
                            bloc.add(SignUpOnChangeEvent());
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Text(''):SizedBox.shrink()
                        TextField(
                          controller: bloc.confirmPasswordController,
                          decoration: InputDecoration(
                            hintText: 'Enter confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {
                            bloc.add(SignUpOnChangeEvent());
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        state is SignUpValidationFailedState
                            ? Text(
                                bloc.error,
                                style: const TextStyle(
                                    color: Colors.redAccent, fontSize: 15),
                              )
                            : const SizedBox.shrink(),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  state is SignUpValidateState
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                              ),
                              onPressed: () {
                                // bloc.add(SignUpOnChangeEvent());
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
