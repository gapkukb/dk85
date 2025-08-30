import 'package:flutter/material.dart';
import 'package:app/hooks/useForm.dart';
import 'package:app/widgets/input_mobile/input_mobile.dart';

class DemoView extends StatefulWidget {
  const DemoView({super.key});

  @override
  _DemoViewState createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  final form = Useform((values) {
    print('values$values');
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo')),
      body: ListView(
        children: [
          Form(
            key: form.key,
            child: Column(
              children: [
                AKMobileInput(onSaved: form.saveAs('asdfsf')),
                ElevatedButton(onPressed: form.submit, child: Text('data')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
