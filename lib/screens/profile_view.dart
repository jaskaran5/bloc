import 'dart:developer';

import 'package:bloc_project/bloc/profile/profile_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profile view'),
          actions: [
            InkWell(
                onTap: () {
                  final bloc = context.read<ProfileBloc>();
                  bloc.i++;
                  bloc.add(GetProfileDataEvent(bloc.i));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.refresh,
                    size: 40,
                  ),
                )),
          ],
        ),
        backgroundColor: Colors.lightBlue,
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            log('state:$state');
            if (state is ProfileLoadingState) {
              Navigator.pop(context);
            } else if (state is ProfileSuccessState) {
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is GetProfileDateFailedState) {
              const AlertDialog(
                alignment: Alignment.center,
                content: Center(
                  child: Dialog(
                    backgroundColor: Colors.transparent,
                    child: Text('Error is occur'),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            final profileBloc = context.read<ProfileBloc>();
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: profileBloc.profileResponse != null
                          ? SizedBox(
                              height: 100,
                              width: 100,
                              child: CachedNetworkImage(
                                imageUrl:
                                    profileBloc.profileResponse?.profilePic ??
                                        '',

                                progressIndicatorBuilder:
                                    (context, url, progress) =>
                                        const CircularProgressIndicator(),
                                fit: BoxFit.cover,

                                // errorWidget: (context, url, error) => const Icon(
                                //   Icons.error,
                                //   color: Colors.redAccent,
                                // ),
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      profileBloc.profileResponse?.email ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      profileBloc.profileResponse?.username ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
