part of 'main_header.dart';

class Auth extends StatelessWidget {
  static final _auth = AuthService.to;
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 36,
      highlightElevation: 0,
      color: AppColors.primary,
      elevation: 0,
      shape: StadiumBorder(),
      child: Text("SIGN UP | LOG IN", style: TextStyle(color: Colors.white)),
      onPressed: () {
        Get.toNamed(Routes.auth);
      },
    );
  }
}
