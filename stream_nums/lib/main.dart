import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Streams'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool generateNumber = false;

  StreamController<int> streamController = StreamController();

  int generateRandomNumber() {
    final random = Random();
    return random.nextInt(100001);
  }

  void startGeneratingNumbers() async {
    while (generateNumber) {
      final newValue = generateRandomNumber();
      await Future.delayed(Duration(milliseconds: 1000));
      streamController.add(newValue);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } else {
                    return Text(
                      "Start Running",
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                }),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            generateNumber = !generateNumber;
          });
          if (generateNumber) {
            startGeneratingNumbers();
          } else {
            streamController.close();
          }
        },
        child: Icon(generateNumber ? Icons.stop : Icons.play_arrow),
      ),
    
    );
  }
}
