import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      navigatorKey: navigatorKey,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  void navigateToPage1(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ShowPopUpDemo()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Experiments',
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => {
            navigateToPage1(context),
          },
          child: const Text(
            'Open Popup without using BuildContext',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}

// Document to follow: https://hariomsinha.notion.site/Show-PopUp-in-Flutter-without-using-BuildContext-14e568aa69a280cd819ac05fdccfffcd?pvs=4
class ShowPopUpDemo extends StatelessWidget {
  const ShowPopUpDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Show Pop Up without using BuildContext"),
      ),
      body: const SafeArea(
          child: Center(
              child: Text(
                  'Click on the Floating Icon On Bottom to Open the Popup. This will open without using Build Context.'))),
      floatingActionButton: const FloatingActionButton(
        onPressed: showMyDialog,
      ),
    );
  }
}

void showMyDialog() {
  showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => Center(
          child: Material(
              color: Colors.transparent,
              child: Container(
                width: 200.0,
                height: 200.0,
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    "I am a Dialog",
                    textAlign: TextAlign.center,
                  ),
                ),
              ))));
}
