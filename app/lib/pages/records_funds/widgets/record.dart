import 'package:flutter/material.dart';
import '../../../theme/index.dart';

class RecordWidget extends StatelessWidget {
  const RecordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      isThreeLine: true,
      minTileHeight: 84,
      titleAlignment: ListTileTitleAlignment.titleHeight,
      title: Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Badge(
          alignment: Alignment.topRight,
          child: Text("ငွေပေးချေမှု မပြုလုပ်ရသေး", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ),
      ),
      subtitle: Text("လုပ်ငန်းစဉ်နံပါတ်\n2025081313004030076114", style: TextStyle(fontSize: 12, color: AppColors.description, height: 1)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "2000",
            style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(height: 16),
          Text("2025-08-31 00:00:00", style: TextStyle(fontSize: 12, color: AppColors.description)),
        ],
      ),
    );
  }
}
