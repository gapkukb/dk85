part of 'index.dart';

// class ChooserMutiple<T> extends StatefulWidget {
//   final List<T> initValue;
//   final ChooserOptions<T> options;
//   final void Function(T values, T? current)? onChanged;

//   const ChooserMutiple({
//     super.key,
//     required this.initValue,
//     required this.options,
//     this.onChanged,
//   });

//   @override
//   _ChooserMutipleState createState() => _ChooserMutipleState<T>();
// }

// class _ChooserMutipleState<T> extends State<ChooserMutiple<T>> {
//   late List<T> value;
//   late List<Choose<T>> options;

//   @override
//   void initState() {
//     value = widget.initValue.toList();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: show,
//       child: Container(child: Text('test')),
//     );
//   }

//   void show() {
//     Get.bottomSheet<T>(
//       ChooserBody<T>(
//         initValue: value,
//         options: widget.options,
//         onTap: (values, current, changed) async {
//           if (changed) {
//             Get.back();
//             widget.onChanged?.call(values[0], current);
//           }
//         },
//       ),
//     );
//   }
// }
