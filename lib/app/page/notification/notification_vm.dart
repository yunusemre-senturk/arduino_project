import 'package:android_project/app/data/model/notification/notification.dart';
import 'package:android_project/core/base/base_view_model.dart';
import 'package:android_project/core/source/local_data_source.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationViewModel extends BaseViewModel {
  LocalDataSource localDataSource;
  NotificationViewModel(this.localDataSource);

  DateTime date = DateTime.now();
  final List<NotificationnModel> _notification = [];
  List<NotificationnModel> get notification => _notification;
  void setNotification(Map<dynamic, dynamic> data) {
    data.forEach((key, value) {
      NotificationnModel notificationnModel = NotificationnModel(
          date: value["date"],
          subtitle: value["subtitle"],
          title: value["title"]);
      if (!_notification
          .any((element) => element.title == notificationnModel.title)) {
        _notification.add(notificationnModel);
      }
    });
  }
}
