import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, child: Text("data"));
  }
}
