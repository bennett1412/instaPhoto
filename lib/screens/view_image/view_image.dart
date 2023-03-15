import 'dart:ui';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class ViewImagePage extends StatelessWidget {
  String url = "";
  ViewImagePage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back)),
      ),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.black, items: const [
        BottomNavigationBarItem(
            label: 'Star',
            icon: Icon(
              Icons.star,
              color: Colors.white,
            )),
        BottomNavigationBarItem(
            label: 'Like',
            icon: Icon(
              Icons.star,
              color: Colors.white,
            )),
        BottomNavigationBarItem(
          label: 'Dislike',
          icon: Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ]),
      body: Column(
        children: [
          Container(
              height: 500,
              child: InteractiveViewer(
                  clipBehavior: Clip.antiAlias,
                  minScale: 0.1,
                  maxScale: 2,
                  panEnabled: false,
                  child: Container(
                    child: Hero(
                        tag: url,
                        child: Image.asset(
                          'assets/images/$url',
                          // fit: BoxFit.cover,
                        )),
                  ))),
        ],
        // child: Image.asset('assets/images/$url'),
      ),
    );
  }
}
