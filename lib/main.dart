import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mmo_mobile/entities.dart';
import 'package:mmo_mobile/firebase_options.dart';
import 'package:mmo_mobile/home.dart';
import 'package:mmo_mobile/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UFA!',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MyHomePage(title: 'UFA!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    ProfileView(),
    ItemList(),
    Entities(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Perfil'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Cursos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.group), label: 'Entidades'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
          backgroundColor: Colors.green),
    );
  }
}
