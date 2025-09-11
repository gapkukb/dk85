import 'package:app/iconfont/index.dart';
import 'package:app/models/announcement.model.dart';
import 'package:app/services/index.dart';
import 'package:app/views_modal/base_modal/base_modal.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementModal extends StatefulWidget {
  const AnnouncementModal({super.key});

  @override
  _AnnouncementModalState createState() => _AnnouncementModalState();
}

class _AnnouncementModalState extends State<AnnouncementModal> {
  List<AnnouncementModel> get announcements => services.app.announcements;
  final actives = <int>[];
  final border = Border(bottom: BorderSide(color: AppColors.background, width: 1));

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      canPop: false,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7, minHeight: 50 * 6),
            child: Material(
              clipBehavior: Clip.hardEdge,
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              child: Obx(() => ListView.builder(shrinkWrap: true, itemCount: announcements.length, itemBuilder: buildItem)),
            ),
          ),
        ],
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
        color: AppColors.highlight,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Text(
        'announcement.title'.tr,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    final announcement = announcements[index];

    return ExpansionTile(
      collapsedShape: border,
      shape: border,
      title: Text(announcement.title),
      trailing: Icon(actives.contains(index) ? IconFont.arrow_up_circle : IconFont.arrow_down_circle, size: 16, color: AppColors.highlight), // Custom trailing icon
      initiallyExpanded: false,
      onExpansionChanged: (bool expanded) {
        expanded ? actives.add(index) : actives.remove(index);
        setState(() {});
      },
      childrenPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      children: <Widget>[Text(announcement.content, style: TextStyle(fontSize: 14, color: AppColors.label))],
    );
  }
}
