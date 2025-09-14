import 'package:app/theme/index.dart';
import 'package:app/widgets/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashView extends StatefulWidget {
  final bool erorr;
  const SplashView(this.erorr, {super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: TextButton(
          onPressed: () {
            launchUrl(Uri.parse('https://flutter.dev'));
          },
          child: Text('Customer Service', style: TextStyle(color: AppColors.highlight)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage("assets/images/launch_background.webp"), fit: BoxFit.fill),
          ),
          child: AKLoading(
            style: widget.erorr ? TextStyle(color: AppColors.danger) : null,
            text: widget.erorr ? 'Server disconnected!\nPlease contact us.' : 'Initializing...\nPlease wait',
          ),
        ),
      ),
    );
  }
}
