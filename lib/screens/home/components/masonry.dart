import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_photo/api/classes/posts.dart';
import 'package:insta_photo/api/services/fetchPosts.dart';
import './image_card.dart';

class Masonry extends StatefulWidget {
  BoxConstraints constraints;

  Masonry({super.key, required this.constraints});

  @override
  State<Masonry> createState() => _MasonryState();
}

class _MasonryState extends State<Masonry> {
  late ScrollController scrollController;

  late List<Post>? posts = [];
  bool isLoading = false;
  void _getData(int page) async {
    if (isLoading == false) {
      setState(() {
        isLoading = true;
      });
      List<Post>? newPosts = await APIService().fetchPosts(page);
      print(posts);
      print('getting posts');
      setState(() {
        posts!.addAll(newPosts!);
        isLoading = false;
      });
    }
  }

  int page = 1;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(_scrollListener);
    _getData(page);
    setState(() {
      page += 1;
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: null,
        child: posts!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : MasonryGridView.count(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                itemCount: posts!.length + 1,
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                crossAxisSpacing: 2,
                itemBuilder: (context, index) {
                  if (index < posts!.length) {
                    return ImageCard(imgSrc: posts![index].image);
                  } else {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 22),
                      width: double.maxFinite,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ));
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 200) {
      _getData(page);
      setState(() {
        page += 1;
      });
    }
  }
}
