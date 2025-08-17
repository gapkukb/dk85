import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../ui/game/index.dart';
import '../index.dart';

class SearchingContentWidget extends GetView<SearchingController> {
  final String kind;
  const SearchingContentWidget({super.key, required this.kind});

  @override
  Widget build(BuildContext context) {
    return GameGridView(gameList: List.generate(10, (index) => null));
  }
}
