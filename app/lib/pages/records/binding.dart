part of 'index.dart';

class RecordsBinding extends Bindings {
  @override
    void dependencies() {
    Get.lazyPut(() =>  RecordsController());
  }
}
