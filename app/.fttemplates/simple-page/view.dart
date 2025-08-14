part of 'index.dart';

class [FTName | pascalcase]View extends GetView<[FTName | pascalcase]Controller> {
  const [FTName | pascalcase]View({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<[FTName | pascalcase]Controller>(
      init: [FTName | pascalcase]Controller(),
      id: "[FTName]",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("[FTName | pascalcase]")),
          body: SafeArea(
            child: ListView(
              children:[
                
              ]
            ),
          ),
        );
      },
    );
  }
}
