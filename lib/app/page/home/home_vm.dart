import 'package:android_project/app/data/model/notification/notification.dart';
import 'package:android_project/app/data/model/notification_controller.dart';
import 'package:android_project/app/data/model/tempeture/tempeture.dart';
import 'package:android_project/core/base/base_view_model.dart';
import 'package:android_project/core/source/local_data_source.dart';
import 'package:android_project/core/util/logger.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  DatabaseReference? _databaseReference;
  LocalDataSource localDataSource;
  HomeViewModel(this.localDataSource);

  DateTime date = DateTime.now();

  int? _count;
  int? get count => _count;
  setCount(int value) {
    _count = value;
  }

  double _currentValue = 36;
  double get currentValue => _currentValue;
  setValue(double value) {
    _currentValue = value;
  }

  final List<Tempeture> _tempeture = [];
  List<Tempeture> get tempeture => _tempeture;
  void setTemp(Map<dynamic, dynamic> data) {
    data.forEach((key, value) {
      Tempeture temperatureData = Tempeture(
          value['deviceuid'],
          value['location'],
          value['type'],
          value["value"].toDouble(),
          value["date"]);

      // Aynı özelliklere sahip bir öğe listeye eklenmemişse, ekleyin
      if (!_tempeture.any((element) =>
          element.value == temperatureData.value &&
          element.date == temperatureData.date)) {
        _tempeture.add(temperatureData);
      }
    });
    //_tempeture.last.date = DateFormat("dd/MM/yyyy").format(date);
  }

  void setNotification(double temp) {
    NotificationService.showNotification(
        title: "Ateşi çıkmış olabilir", body: "Sıcaklık $temp°C ' yi geçti");
    NotificationnModel notificationnModel = NotificationnModel(
        date: DateFormat("dd/MM/yyyy").format(DateTime.now()),
        subtitle: "Ateşi çıkmış olabilir",
        title: "Sıcaklık $temp°C' yi geçti");
    _databaseReference = FirebaseDatabase.instance.ref().child("Notification");
    _databaseReference!.push().set(notificationnModel.toJson()).then((value) {
      Log.i("Bildirim kaydedilmiştir");
    }).onError((error, stackTrace) {
      Log.i(error.toString());
    });
  }
  /* Future<void> setDate() async {
    try {
      // Ensure _tempeture is not null before updating its date
      if (_tempeture != null) {
        _tempeture!.date = DateFormat("dd/MM/yyyy").format(date);
        await FirebaseDatabase.instance
            .ref("Tempeture/value")
            .update({"date": DateFormat("dd/MM/yyyy").format(date)});

        // Update local _tempeture object's date

        // Notify listeners about the change
        notifyListeners();
      } else {
        Log.i('Tempeture object is null. Cannot update date.');
      }
    } catch (e) {
      Log.e('Error updating date: $e');
      // Handle the error as needed
    }
  }  */
}
