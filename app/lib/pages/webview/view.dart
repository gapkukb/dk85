part of 'index.dart';

class WebviewView extends GetView<WebviewController> {
  const WebviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Webview")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("data"),
      ),
      body: const Text("data"),
    );
  }
}
