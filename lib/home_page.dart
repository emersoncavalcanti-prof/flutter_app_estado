import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Lista', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.network(
                'https://static.vecteezy.com/system/resources/thumbnails/004/607/791/small_2x/man-face-emotive-icon-smiling-male-character-in-blue-shirt-flat-illustration-isolated-on-white-happy-human-psychological-portrait-positive-emotions-user-avatar-for-app-web-design-vector.jpg',
              ),
              accountName: Text('Emerson'),
              accountEmail: Text('emerson@ete.com'),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(title: Text('Menu 1'), leading: Icon(Icons.add)),
                  ListTile(title: Text('Menu 1'), leading: Icon(Icons.add)),
                  ListTile(title: Text('Menu 1'), leading: Icon(Icons.add)),
                  ListTile(title: Text('Menu 1'), leading: Icon(Icons.add)),
                  ListTile(title: Text('Menu 1'), leading: Icon(Icons.add)),
                  ListTile(title: Text('Menu 1'), leading: Icon(Icons.add)),
                  ListTile(title: Text('Menu 1'), leading: Icon(Icons.add)),
                  ListTile(title: Text('Menu 1'), leading: Icon(Icons.add)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
