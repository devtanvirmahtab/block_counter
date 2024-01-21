import 'package:block_counter/bloc/counter/counter_bloc.dart';
import 'package:block_counter/bloc/counter/counter_event.dart';
import 'package:block_counter/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Column(
        children: [
          BlocBuilder<CounterBloc,CounterState>(
            builder: (context, state) {
              return  Text(
                state.counter.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounter());
            },
            child: const Text("Increase"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounter());
            },
            child: const Text("Decrease"),
          ),
        ],
      ),
    );
  }
}
