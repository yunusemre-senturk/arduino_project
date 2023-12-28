import 'package:android_project/app/data/model/tempeture/tempeture.dart';
import 'package:android_project/core/base/base_view_model.dart';
import 'package:android_project/core/source/local_data_source.dart';
import 'package:android_project/core/util/logger.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  LocalDataSource localDataSource;
  HomeViewModel(this.localDataSource);
  double _currentValue = 36;
  double get currentValue => _currentValue;
  setValue(double value) {
    _currentValue = value;
  }

  Tempeture? _tempeture;
  Tempeture? get tempeture => _tempeture;
  void setTemp(Tempeture temp) {
    _tempeture = temp;
  }

  DateTime date = DateTime.now();

  Future<void> setDate() async {
    try {
      // Ensure _tempeture is not null before updating its date
      if (_tempeture != null) {
        await FirebaseDatabase.instance
            .ref("Tempeture/value")
            .update({"date": DateFormat("dd/MM/yyyy").format(date)});

        // Update local _tempeture object's date
        _tempeture!.date = DateFormat("dd/MM/yyyy").format(date);

        // Notify listeners about the change
        notifyListeners();
      } else {
        Log.i('Tempeture object is null. Cannot update date.');
      }
    } catch (e) {
      Log.e('Error updating date: $e');
      // Handle the error as needed
    }
  }
}
