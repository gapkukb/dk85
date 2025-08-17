import 'package:flutter/material.dart';

import '/iconfont/index.dart';
import '/theme/index.dart';

class Annoucementitem extends StatefulWidget {
  const Annoucementitem({super.key});

  @override
  _AnnoucementitemState createState() => _AnnoucementitemState();
}

class _AnnoucementitemState extends State<Annoucementitem> {
  static const border = Border(bottom: BorderSide(color: Color(0xfff1f1f1)));
  var expanded = false;

  void onchange(bool value) {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      // minTileHeight: 56,
      shape: border,
      collapsedShape: border,
      title: const Text('Question 1: What is Flutter?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      collapsedTextColor: AppColors.title,
      textColor: AppColors.title,
      iconColor: AppColors.title,
      onExpansionChanged: onchange,
      collapsedIconColor: AppColors.title,
      trailing: Icon(expanded ? IconFont.arrow_up_circle : IconFont.arrow_down_circle, color: AppColors.primary, size: 18),
      children: const <Widget>[
        Divider(color: Color(0xfff1f1f1), thickness: 0, height: 1),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text('Flutter is a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.'),
        ),
      ],
    );
  }
}
