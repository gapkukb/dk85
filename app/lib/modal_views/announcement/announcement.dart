import 'package:app/iconfont/index.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementModal extends StatefulWidget {
  const AnnouncementModal({super.key});

  @override
  _AnnouncementModalState createState() => _AnnouncementModalState();
}

class _AnnouncementModalState extends State<AnnouncementModal> {
  final actives = [];
  final border = Border(
    bottom: BorderSide(color: AppColors.background, width: 1),
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: Get.back,
                icon: Icon(IconFont.guanbi, size: 36, color: AppColors.white),
              ),
            ),
            buildTitle(),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.7,
              ),
              child: Material(
                clipBehavior: Clip.hardEdge,
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: buildItem,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 4),
      alignment: Alignment(0, 0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Text(
        'Announcement',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return ExpansionTile(
      collapsedShape: border,
      shape: border,
      title: Text('More Information'),
      trailing: Icon(
        actives.contains(index)
            ? IconFont.arrow_up_circle
            : IconFont.arrow_down_circle,
        size: 16,
        color: AppColors.highlight,
      ), // Custom trailing icon
      initiallyExpanded: false,
      onExpansionChanged: (bool expanded) {
        expanded ? actives.add(index) : actives.remove(index);
        setState(() {});
      },
      childrenPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      children: <Widget>[
        Text(
          'This is the detailed content revealed upon expansion.',
          style: TextStyle(fontSize: 14, color: AppColors.label),
        ),
      ],
    );
  }
}
