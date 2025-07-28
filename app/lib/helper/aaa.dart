// import 'package:app/i18n/index.dart';
// import 'package:app/theme/index.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
// import 'package:get/state_manager.dart';

// class LocalesSelector extends StatefulWidget {
//   const LocalesSelector({super.key});

//   @override
//   _LocalesSelectorState createState() => _LocalesSelectorState();
// }

// class _LocalesSelectorState extends State<LocalesSelector> {
//   var code = Languages.zh_CN.code;

//   late final List<CupertinoListTile> actions;

//   @override
//   void initState() {
//     super.initState();
//     actions = Languages.selections
//         .map(
//           (item) => CupertinoListTile(
//             backgroundColor: Colors.white,
//             title: Text(item.localeName),
//             onTap: () {
//               setState(() {
//                 code = item.code;
//               });
//               Get.backLegacy();
//             },
//             trailing: IgnorePointer(
//               child: CupertinoRadio(
//                 value: item.code,
//                 groupValue: code,
//                 onChanged: (value) {},
//               ),
//             ),
//           ),
//         )
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoActionSheet(
//       message: Text("请选择语言"),
//       cancelButton: CupertinoActionSheetAction(
//         onPressed: () {
//           Get.close(1);
//         },
//         child: Text(
//           "取消",
//           style: TextStyle(color: Color(0xff999999), fontSize: 16),
//         ),
//       ),
//       actions: Languages.selections
//           .map(
//             (item) => CupertinoListTile(
//               backgroundColor: Colors.white,
//               title: Text(
//                 item.localeName,
//                 style: TextStyle(
//                   color: code == item.code ? AppColor.main : null,
//                 ),
//               ),

//               onTap: () {
//                 setState(() {
//                   code = item.code;
//                 });
//               },
//               trailing: IgnorePointer(
//                 child: Radio(
//                   value: item.code,
//                   groupValue: code,
//                   activeColor: AppColor.main,
//                   onChanged: (value) {},
//                 ),
//               ),
//             ),
//           )
//           .toList(),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class LocalesSelectorController extends GetxController {}

class LocalesSelector extends StatelessWidget {
  const LocalesSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalesSelectorController>(
      id: "LocalesSelector",
      init: LocalesSelectorController(),
      builder: (controller) {
        return FilledButton(
          onPressed: () {
            Get.close(closeBottomSheet: true, result: "safdf");
          },
          child: Text(
            "取消",
            style: TextStyle(color: Color(0xff999999), fontSize: 16),
          ),
        );
      },
    );
  }
}
