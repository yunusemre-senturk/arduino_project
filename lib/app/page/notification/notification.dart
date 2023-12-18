import 'package:android_project/core/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:android_project/core/base/base_widget.dart';
import 'package:android_project/app/page/notification/notification_vm.dart';

@RouteMap()
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState
    extends BaseState<NotificationViewModel, NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bildirimler"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const Card(
            child: ListTile(
              leading: Icon(
                Icons.whatshot,
                color: AppColors.red,
              ),
              title: Text("En son gelen bildirim 38 derece"),
            ),
          );
        },
      ),
    );
  }
}
