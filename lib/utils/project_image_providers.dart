import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class ProjectsImageProvider extends EasyImageProvider {
  @override
  final int initialIndex;
  final int count;

  ProjectsImageProvider({this.initialIndex = 0, required this.count});

  @override
  ImageProvider<Object> imageBuilder(BuildContext context, int index) {
    ImageProvider imageProvider =
        AssetImage("assets/images/diziyleogren/ss$index.png");

    return imageProvider;
  }

  @override
  int get imageCount => count;
}
