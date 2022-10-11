import 'package:flutter/material.dart';

class LikestLayout extends StatelessWidget {
  const LikestLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Likest'),
          backgroundColor: Colors.green,
        ),
        body: const Center(child: Text('List of likest tracks')));
  }
}
