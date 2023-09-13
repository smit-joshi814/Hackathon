import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myText = "Hello world";

  void _changeText() {
    setState(() {
      if (myText.startsWith("H")) {
        myText = "Welcome To My App";
      } else {
        myText = "Hello World";
      }
    });
  }

  Widget _bodyWidget() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              myText,
              style: TextStyle(fontSize: 22.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Bar')),
      body: _bodyWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeText,
        child: Icon(Icons.add),
      ),
    );
  }
}
