import 'package:flutter/material.dart';
import 'package:insta_photo/screens/Home/components/masonry.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 53, 107),
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: Color.fromARGB(255, 17, 53, 107),
        title: const Text('instaPhoto'),
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return Masonry(constraints: constraints);
      }),
    );
  }
}
