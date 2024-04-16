import 'package:connectivity_app/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            centerTitle: true,
          ),
          body: Center(
            child: BlocConsumer<InternetBloc, InternetState>(
              listener: (context, state) {
                if (state is ConnectedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(state.message),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                } else if (state is NotConnectedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.message),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is ConnectedState) {
                  return Text(
                    state.message,
                    style: const TextStyle(fontSize: 20),
                  );
                } else if (state is NotConnectedState) {
                  return Text(
                    state.message,
                    style: const TextStyle(fontSize: 20),
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
