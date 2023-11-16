import 'package:android_project/core/base/base_view_model.dart';
import 'package:android_project/core/source/local_data_source.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  LocalDataSource localDataSource;
  HomeViewModel(this.localDataSource);
}
