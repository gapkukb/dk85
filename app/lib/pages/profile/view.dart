part of 'index.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ProfilePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      id: "profile",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("Profile")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
