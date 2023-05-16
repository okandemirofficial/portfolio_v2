import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class ProjectsImageProvider extends EasyImageProvider {
  @override
  final int initialIndex;
  final int count;
  final String imageFolder;

  ProjectsImageProvider({
    this.initialIndex = 0,
    required this.count,
    required this.imageFolder,
  });

  @override
  ImageProvider<Object> imageBuilder(BuildContext context, int index) {
    ImageProvider imageProvider = AssetImage("assets/images/$imageFolder/ss$index.png");

    return imageProvider;
  }

  @override
  int get imageCount => count;
}
