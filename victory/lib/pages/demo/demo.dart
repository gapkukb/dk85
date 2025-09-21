import 'package:flutter/material.dart';
import '../../shared/dialog/dialog.dart';
import '../../stores/stores.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      VicDialog.confirm(title: 'xxxx', content: 'yyy');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: ListView(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          stores.app.toHomePage();
        },
      ),
    );
  }
}
