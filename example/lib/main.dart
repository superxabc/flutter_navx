
import 'package:flutter/material.dart';
import 'package:flutter_navx/flutter_navx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter NavX Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = BottomNavController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter NavX Example'),
      ),
      body: BottomNavX(
        controller: _controller,
        items: const [
          BottomNavItem(
            icon: Icon(Icons.home),
            title: 'Home',
          ),
          BottomNavItem(
            icon: Icon(Icons.search),
            title: 'Search',
          ),
          BottomNavItem(
            icon: Icon(Icons.person),
            title: 'Profile',
          ),
        ],
        pageBuilder: (index) {
          return Center(
            child: Text('Page $index'),
          );
        },
      ),
    );
  }
}
