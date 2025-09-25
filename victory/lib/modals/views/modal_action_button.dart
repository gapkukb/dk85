import 'package:flutter/material.dart';

class VicModalActionButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const VicModalActionButton({super.key, required this.text, this.width = 248.0, this.height = 48.0, this.onTap});

  @override
  Widget build(BuildContext context) {
    const radius = BorderRadius.all(Radius.circular(100));
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: const Alignment(0, -1),
        decoration: const BoxDecoration(
          borderRadius: radius,
          gradient: LinearGradient(
            colors: [Color(0xffe07d49), Color(0xffd34a01)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          height: height - 4,
          width: double.infinity,
          alignment: const Alignment(0, 0),
          decoration: const BoxDecoration(
            borderRadius: radius,
            gradient: LinearGradient(
              colors: [Color(0xffffa677), Color(0xffFF8240)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Color(0xffFFFECD), fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
