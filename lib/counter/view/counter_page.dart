// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cubo/counter/counter.dart';
import 'package:cubo/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CounterView();
  }
}

class CounterView extends StatelessWidget {
  const CounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.watch<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.counterAppBarTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: CounterText(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              cubit.increment();
              debugPrint('hash: ${cubit.hashCode}');
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              cubit.decrement();
              debugPrint('hash: ${cubit.hashCode}');
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.watch<CounterCubit>();

    return Text(
      '${cubit.state} \nhash: ${cubit.hashCode}',
      textAlign: TextAlign.center,
      style: theme.textTheme.displayLarge,
    );
  }
}
