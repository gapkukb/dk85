import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:victory/constants/cs_url.dart';
import 'package:victory/helper/loading.dart';
import 'package:victory/startup/bot_toast.dart';
import 'package:victory/theme/theme.dart';

class VicSplashPage extends StatefulWidget {
  final String? erorr;
  const VicSplashPage(this.erorr, {super.key});

  @override
  _VicSplashPageState createState() => _VicSplashPageState();
}

class _VicSplashPageState extends State<VicSplashPage> {
  @override
  void initState() {
    setupBotToast(context, widget);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: TextButton(
          onPressed: () {
            launchUrl(Uri.parse(customerServiceUrl));
          },
          child: const Text('Customer Service', style: TextStyle(color: AppColors.highlight)),
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
            style: widget.erorr == null ? null : const TextStyle(color: AppColors.danger),
            text: widget.erorr ?? 'Initializing...\nPlease wait',
          ),
        ),
      ),
    );
  }
}
