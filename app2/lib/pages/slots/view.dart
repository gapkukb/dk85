part of 'index.dart';

class SlotsPage extends GetView<SlotsController> {
  const SlotsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SlotsController>(
      init: SlotsController(),
      id: "foru",
      builder: (_) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 90.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  pauseAutoPlayOnTouch: true,
                  // enableInfiniteScroll: false,
                ),
                items: [1, 2].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://c66hkp.s3.ap-east-1.amazonaws.com/57e4d3ea-9655-41b1-8c9f-31f187fd880f",
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 20,
                padding: EdgeInsets.only(left: 8),
                margin: EdgeInsets.only(left: 8, right: 0, top: 16, bottom: 8),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Color(0xffff5800), width: 4),
                  ),
                ),
                child: Text(
                  "Most Popular",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.all(16),
              sliver: SliverGrid.builder(
                itemCount: 100,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 70 / 100,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return GameCard();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
