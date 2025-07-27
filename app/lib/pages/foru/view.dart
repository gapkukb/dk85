part of 'index.dart';

class ForuView extends GetView<ForuController> {
  const ForuView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForuController>(
      init: ForuController(),
      id: "foru",
      builder: (_) {
        return SmartRefresher(
          controller: controller.refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onLoading: controller.onLoadMore,
          onRefresh: controller.onRefresh,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 90.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    pauseAutoPlayOnTouch: true,
                    viewportFraction: 0.8,
                    enlargeFactor: 0.2,
                    enlargeCenterPage: true,
                    // enableInfiniteScroll: false,
                  ),

                  items: [1, 2].map((i) {
                    return PhysicalModel(
                      color: Colors.transparent,
                      borderRadius: AppBorderRadius.small,
                      clipBehavior: Clip.hardEdge,
                      child: NetworkPicture(
                        imageUrl:
                            "https://c66hkp.s3.ap-east-1.amazonaws.com/57e4d3ea-9655-41b1-8c9f-31f187fd880f1",
                      ),
                    );
                  }).toList(),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 20,
                  padding: EdgeInsets.only(left: 8),
                  margin: EdgeInsets.only(
                    left: 8,
                    right: 0,
                    top: 16,
                    bottom: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: AppColor.main, width: 4),
                    ),
                  ),
                  child: Text(
                    "Most Popular",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsetsGeometry.all(8),
                sliver: SliverGrid.builder(
                  itemCount: 100,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 70 / 100,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Game();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
