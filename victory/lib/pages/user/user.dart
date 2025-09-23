import 'package:flutter/material.dart';

class VicUserPage extends StatefulWidget {
  const VicUserPage({super.key});

  @override
  _VicUserPageState createState() => _VicUserPageState();
}

class _VicUserPageState extends State<VicUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.amber, child: const Text('User')),
      ),
    );
  }
}
