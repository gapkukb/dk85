part of 'main_header.dart';

class SimpleUser extends StatelessWidget {
  const SimpleUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 36,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            foregroundImage: AssetImage("assets/icons/logo-white.webp"),
          ),
          SizedBox(width: 8),
          buildUser(),
          Spacer(),
          buildButton(),
        ],
      ),
    );
  }

  buildUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          spacing: 4,
          children: [
            const Text(
              "ID:123456",
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: const Color(0xfffffac4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "VIP1",
                style: TextStyle(
                  fontSize: 8,
                  color: AppColors.primary,
                  height: 1.2,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Balance(spacing: 8),
      ],
    );
  }

  buildButton() {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      onPressed: () {},
      minWidth: 78,
      height: 32,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: const Color(0xffffeddd),
      child: Text(
        "app.deposit".tr,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
