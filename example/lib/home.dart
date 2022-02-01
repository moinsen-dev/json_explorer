import 'package:flutter/material.dart';
import 'package:json_explorer/json_explorer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JsonExplorer',
        ),
      ),
      body: const JsonExplorer(
        {
          'test': 'test',
        },
      ),
    );
  }
}
