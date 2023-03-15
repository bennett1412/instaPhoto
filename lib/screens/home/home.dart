import 'package:flutter/material.dart';
import 'package:insta_photo/screens/Home/components/masonry.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: const Center(
        child: Masonry(),
      ),
    );
  }
}
