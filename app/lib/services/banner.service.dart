// import 'package:get/get.dart';

// mixin BannerService {
//   final List<dynamic> banners = [].obs;

//   void queryBanners({required String type, required String position}) async {
//     try {
//       final res = await queryAdList(
//         payload: {"type": type, "position": position},
//       );
//       if (res != null && res is List) {
//         banners.clear();
//         banners.addAll(res);
//       }
//     } catch (e) {
//       print("queryBanners error:$e");
//     }
//   }
// }
