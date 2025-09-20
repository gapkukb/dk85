import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/cs_url.dart';
import '/helper/loading.dart';
import '/styles/styles.dart';

class SplashPage extends StatefulWidget {
  final String? erorr;
  const SplashPage(this.erorr, {super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: TextButton(
          onPressed: () {
            launchUrl(Uri.parse(customerServiceUrl));
          },
          child: Text('Customer Service', style: TextStyle(color: AppColor.highlight)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage("assets/images/launch_background.webp"), fit: BoxFit.fill),
          ),
          child: VicLoading(
            style: widget.erorr == null ? TextStyle(color: AppColor.danger) : null,
            text: widget.erorr ?? 'Initializing...\nPlease wait',
          ),
        ),
      ),
    );
  }
}
