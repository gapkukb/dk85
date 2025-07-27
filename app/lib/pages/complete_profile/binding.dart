part of 'index.dart';

class CompleteProfileBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<CompleteProfileController>(
        () => CompleteProfileController(),
      )
    ];
  }
}
