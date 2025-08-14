part of 'index.dart';

class RecordsFundsBinding extends Bindings {
  @override
    void dependencies() {
    Get.lazyPut(() =>  RecordsFundsController());
  }
}
