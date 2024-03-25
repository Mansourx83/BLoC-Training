import 'package:counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterIncrement());
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.cyan,
        ),
        const SizedBox(
          height: 8,
        ),
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterReset());
          },
          child: const Icon(Icons.undo),
          backgroundColor: Colors.cyan,
        ),
        const SizedBox(
          height: 8,
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(CounterDecrement());
            // BlocProvider.of<CounterBloc>(context).add(CounterDecrement());
          },
          child: const Icon(Icons.remove),
          backgroundColor: Colors.cyan,
        ),
      ],
    );
  }
}
