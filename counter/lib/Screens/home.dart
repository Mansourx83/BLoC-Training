import 'package:counter/bloc/counter_bloc.dart';
import 'package:counter/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter BLoC'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value is',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return const Text(
                    '0',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                    ),
                  );
                } else if (state is CounterCanged) {
                  return Text(
                    state.counterValue.toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}
