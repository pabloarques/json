import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cargar datos desde archivo JSON',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _dataList = [];

  Future<void> _fetchDataFromJson() async {
    final jsonString = await rootBundle.loadString('archivo.json');
    final jsonData = json.decode(jsonString);
    setState(() {
      _dataList = jsonData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cargar datos desde archivo JSON'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _fetchDataFromJson();
              },
              child: Text('Cargar datos desde JSON'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _dataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(_dataList[index]['foto']),
                    title: Text(_dataList[index]['usuario']),
                    subtitle: Text(_dataList[index]['mensaje']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


