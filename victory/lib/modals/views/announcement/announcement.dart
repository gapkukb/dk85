import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/models/announcement.model.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/modals/views/modal_template.dart';

class VicAnnouncementModal extends StatefulWidget {
  const VicAnnouncementModal({super.key});

  @override
  _VicAnnouncementModalState createState() => _VicAnnouncementModalState();
}

class _VicAnnouncementModalState extends State<VicAnnouncementModal> {
  final actives = <int>[];
  final border = const Border(bottom: BorderSide(color: AppColors.background, width: 1));
  final announcements = <VicAnnouncementModel>[].obs;
  void queryAnnouncements() async {
    final r = await apis.app.queryAnnouncements();
    if (r == null) return;
    announcements.value = r;
    setState(() {});
  }

  @override
  void initState() {
    queryAnnouncements();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VicModalTemplate(
      canPop: false,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(0),
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
              child: Obx(
                () => ListView.builder(
                  padding: AppSizes.zero,
                  shrinkWrap: true,
                  itemCount: announcements.length,
                  itemBuilder: buildItem,
                ),
              ),
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
      margin: const EdgeInsets.symmetric(horizontal: 4),
      alignment: const Alignment(0, 0),
      decoration: const BoxDecoration(
        color: AppColors.highlight,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Text(
        'announcement.title'.tr,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    final announcement = announcements[index];

    return ExpansionTile(
      collapsedShape: border,
      shape: border,
      title: Text(announcement.title),
      trailing: Icon(
        actives.contains(index) ? IconFont.arrow_up_circle : IconFont.arrow_down_circle,
        size: 16,
        color: AppColors.highlight,
      ), // Custom trailing icon
      initiallyExpanded: false,
      onExpansionChanged: (bool expanded) {
        expanded ? actives.add(index) : actives.remove(index);
        setState(() {});
      },
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

      children: <Widget>[
        Align(
          alignment: AlignmentGeometry.topLeft,
          child: Text(
            announcement.content,
            style: const TextStyle(fontSize: 14, color: AppColors.label),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
