part of 'index.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(child: Text("DashboardPage"));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      id: "dashboard",
      builder: (_) {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              titleSpacing: 8,
              title: SizedBox(
                height: 32,
                child: FilledButton.tonal(
                  style: FilledButton.styleFrom(backgroundColor: AppColor.main),
                  onPressed: () {},
                  child: Text(
                    "登录 | 注册",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              actionsPadding: EdgeInsets.symmetric(horizontal: 8),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    SizedBox.square(
                      dimension: 32,
                      child: IconButton(
                        padding: EdgeInsets.all(0.0),
                        icon: Icon(Icons.support_agent),
                        onPressed: () {},
                      ),
                    ),

                    SizedBox.square(
                      dimension: 32,
                      child: IconButton(
                        padding: EdgeInsets.all(0.0),
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: FilledButton.tonal(
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColor.main,
                          padding: EdgeInsets.all(0),
                        ),
                        onPressed: () {},
                        child: Text(
                          "充值",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: FilledButton.tonal(
                        style: FilledButton.styleFrom(
                          backgroundColor: Color(0xffff976a),
                        ),
                        onPressed: () {},
                        child: Text(
                          "提款",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              bottom: HomeTabBar(),
            ),
            body: TabBarView(
              children: [
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
              ],
            ),
          ),
        );
      },
    );
  }
}
