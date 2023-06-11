import 'package:flutter/material.dart';
import 'package:pariwisata_flutter/view/component/app_bar.dart';
import 'package:pariwisata_flutter/view/component/bottom_navigation.dart';
import 'package:pariwisata_flutter/view/screen/onBoardScreen.dart';
import 'package:pariwisata_flutter/view/screen/registerScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HOME",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnBoardScreen() ,
      // routes: {
      //   '/onBoard' : (BuildContext ctx) => OnBoardScreen(),
      //   '/register'  : (BuildContext ctx) => RegisterScreen(),
      // },
    );
  }
}

class MyHomePageDummy extends StatefulWidget {
  const MyHomePageDummy({super.key, required this.title});
  final String title;
  @override
  State<MyHomePageDummy> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePageDummy> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
