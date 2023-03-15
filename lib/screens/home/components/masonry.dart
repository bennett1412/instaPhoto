import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';
import './image_card.dart';

class Masonry extends StatefulWidget {
  const Masonry({super.key});

  @override
  State<Masonry> createState() => _MasonryState();
}

class _MasonryState extends State<Masonry> {
  final List<String> photos = [
    'test1.jpeg',
    'test2.jpeg',
    'test3.jpeg',
    'test4.jpeg',
  ];

  void _addPhotos() {
    setState(() {
      print('setting state');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: photos.length,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      crossAxisCount: 2,
      mainAxisSpacing: 3,
      crossAxisSpacing: 2,
      itemBuilder: (context, index) {
        return ImageCard(imgSrc: photos[index]);
      },
    );
  }
}
