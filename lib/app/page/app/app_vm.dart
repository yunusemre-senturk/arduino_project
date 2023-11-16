// Dart imports:

// Package imports:
import 'package:android_project/core/source/local_data_source.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:android_project/core/base/base_view_model.dart';

@lazySingleton
class AppViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  AppViewModel(this._localDataSource);
  bool get isDark => _localDataSource.isDark;
  void switchTheme() {
    _localDataSource.setIsDark(!isDark);
    notifyListeners();
  }
}
