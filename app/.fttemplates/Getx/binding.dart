part of 'index.dart';

class [FTName | pascalcase]Binding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<[FTName | pascalcase]Controller>(
        () => [FTName | pascalcase]Controller(),
      )
    ];
  }
}
