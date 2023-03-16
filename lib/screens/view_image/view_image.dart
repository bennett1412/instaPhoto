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
      body: Column(
        children: [
          SizedBox(
              height: 500,
              width: double.maxFinite,
              child: InteractiveViewer(
                  clipBehavior: Clip.antiAlias,
                  minScale: 0.1,
                  maxScale: 2,
                  panEnabled: false,
                  child: Container(
                    child: Hero(tag: url, child: Image.network(url)),
                  ))),
        ],
      ),
    );
  }
}
