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
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarContrastEnforced: false, systemNavigationBarColor: Colors.transparent));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: TextButton(
          onPressed: () {
            launchUrl(Uri.parse('https://flutter.dev'));
          },
          child: Text('联系客服', style: TextStyle(color: AppColors.highlight)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage("assets/images/splash.webp"), fit: BoxFit.cover),
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
