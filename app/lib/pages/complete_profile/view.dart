part of 'index.dart';

class CompleteProfileView extends GetView<CompleteProfileController> {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteProfileController>(
      init: CompleteProfileController(),
      id: "complete_profile",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("CompleteProfile")),
          body: SafeArea(
            child: ListView(
              children: [
                Text("完善资料获好礼"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [const Text("手机号码")],
                ),
                BaseInput(
                  placeholder: "手机号码",
                  onSaved: (value) {},
                  validator: (value) {
                    return null;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
