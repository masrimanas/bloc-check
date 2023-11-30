import 'package:cubo/counter/cubit/counter_cubit.dart';
import 'package:cubo/counter/view/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(
            builder: (context) {
              return Text(
                'Main \n hash:${context.watch<CounterCubit>().hashCode}',
                textAlign: TextAlign.center,
              );
            },
          ),
          const SizedBox(height: 32),
          const _CounterText(),
          Builder(
            builder: (context) {
              return Center(
                child: TextButton(
                  child: const Text('Counter Page'),
                  onPressed: () => Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const CounterPage(),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, int>(
      listener: (context, state) {},
      child: Builder(
        builder: (context) {
          final cubit = context.watch<CounterCubit>();
          return Text(
            '${cubit.state} \nhash: ${cubit.hashCode}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          );
        },
      ),
    );
  }
}
