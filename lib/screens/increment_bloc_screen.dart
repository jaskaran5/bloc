import 'package:bloc_project/increment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class IncrementBlocScreen extends StatelessWidget {
  const IncrementBlocScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<IncrementBloc, IncrementState>(
        builder: (context, state) {
          final bloc = context.read<IncrementBloc>();
          return Scaffold(
            drawerEnableOpenDragGesture: true,
            appBar: AppBar(
              title: const Text('increment count '),
            ),
            body: ZoomDrawer(
              menuScreen: Container(color: Colors.blueAccent,),
              mainScreen:Stack(alignment: Alignment.centerRight, children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '${bloc.count}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ]),
              openCurve: Curves.fastOutSlowIn,
              mainScreenScale: 10.0,
              menuBackgroundColor: Colors.lightBlueAccent,
              shrinkMainScreen: true,
              closeCurve: Curves.fastLinearToSlowEaseIn,

            ),

              // body: Stack(alignment: Alignment.centerRight, children: [
            //   Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         const Text(
            //           'You have pushed the button this many times:',
            //         ),
            //         Text(
            //           '${bloc.count}',
            //           style: Theme.of(context).textTheme.headlineMedium,
            //         ),
            //       ],
            //     ),
            //   ),
            // ]),

            floatingActionButton: FloatingActionButton(
              onPressed: () => bloc.add(CountIncrementEvent()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ), // This trailing comma ma
          );
        },
      );
}
