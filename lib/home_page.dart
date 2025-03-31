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
      if (contador < 10) {
        contador++;
      }
    });
  }

  void decrementar() {
    setState(() {
      if (contador > 0) {
        contador--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$contador', style: TextStyle(fontSize: 40))),
      floatingActionButton: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: decrementar,
            backgroundColor: Colors.red,
            child: Icon(Icons.remove, color: Colors.white, size: 30),
          ),
          FloatingActionButton(
            onPressed: incrementar,
            backgroundColor: Colors.blue,
            child: Icon(Icons.add, color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  }
}
