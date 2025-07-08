import 'package:coursera__counter_provider/providers/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CounterModel>(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text(
          'Counter Provider App',
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: model.increment,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        child: Icon(Icons.add, color: colorScheme.onPrimary),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Your current count is",
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              Consumer<CounterModel>(
                builder: (
                  BuildContext context,
                  CounterModel value,
                  Widget? child,
                ) {
                  return Text(
                    value.counter.toString(),
                    style: textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
