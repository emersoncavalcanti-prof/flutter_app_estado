import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$contador', style: TextStyle(fontSize: 40))),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementar,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
