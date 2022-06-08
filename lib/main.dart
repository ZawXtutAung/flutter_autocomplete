import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autocomplete',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedAnimal;

  final List<String> _suggestions = [
    'KyawKyaw',
    'AungAung',
    'MaungMaung',
    'PyaePyae',
    'AyeAye',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Bodys(),
    );
  }

  Widget Bodys() {
    return Column(children: [
      Autocomplete<String>(
        optionsBuilder: (TextEditingValue tvalue) {
          if (tvalue.text.isEmpty) {
            return [];
          }

          return _suggestions.where((element) =>
              element.toLowerCase().contains(tvalue.text.toLowerCase()));
        },
        onSelected: (v) {
          setState(() {
            _selectedAnimal = v.toString();
          });
        },
      ),
      SizedBox(
        height: 10,
      ),
      Text(_selectedAnimal ?? 'Type something (a, b, c, etc)'),
    ]);
  }
}
