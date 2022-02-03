import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_explorer/json_explorer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Map<String, dynamic>> loadAssetJson(String assetFilename) async {
    String data = await rootBundle.loadString(assetFilename);

    return json.decode(data) as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JsonExplorer',
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: loadAssetJson('assets/json/petstore.swagger.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return JsonExplorer(
              snapshot.data!,
              filter: const ['post', 'put', 'delete', 'security', 'responses'],
              show: const ['paths'],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
