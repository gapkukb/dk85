import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cell extends StatelessWidget {
  const Cell({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Playr 12312"),
      subtitle: Row(children: [Text("id:1231233")]),
    );
  }
}
