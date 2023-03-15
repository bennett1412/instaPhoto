import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:insta_photo/screens/view_image/view_image.dart';

class ImageCard extends StatefulWidget {
  final String imgSrc;
  const ImageCard({Key? key, required this.imgSrc}) : super(key: key);

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            // _active = !_active;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                print(widget.imgSrc);
                return ViewImagePage(url: widget.imgSrc);
              }),
            );
          });
        },
        splashColor: Colors.white,
        child: Container(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Hero(
                  tag: widget.imgSrc,
                  child: Image.asset(
                    'assets/images/${widget.imgSrc}',

                    // width: 30,
                    // height: 400,
                  )),
            )));
  }
}
