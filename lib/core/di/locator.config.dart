// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:android_project/app/page/app/app_vm.dart' as _i9;
import 'package:android_project/app/page/home/home_vm.dart' as _i11;
import 'package:android_project/app/page/notification/notification_vm.dart'
    as _i8;
import 'package:android_project/core/di/module.dart' as _i12;
import 'package:android_project/core/source/encrypt_storage.dart' as _i10;
import 'package:android_project/core/source/local_data_source.dart' as _i6;
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_core/firebase_core.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:network_info_plus/network_info_plus.dart' as _i7;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.Dio>(
      () => appModule.injectRetrofitAPI,
      registerFor: {_dev},
    );
    await gh.factoryAsync<_i4.FirebaseApp>(
      () => appModule.initializeApp,
      registerFor: {_dev},
      preResolve: true,
    );
    await gh.factoryAsync<_i5.GetStorage>(
      () => appModule.initializeGetStorage,
      registerFor: {_dev},
      preResolve: true,
    );
    gh.lazySingleton<_i6.LocalDataSource>(
      () => _i6.TestLocalDataSourceImpl(),
      registerFor: {_test},
    );
    gh.factory<_i7.NetworkInfo>(() => appModule.networkInfo);
    gh.factory<_i8.NotificationViewModel>(
        () => _i8.NotificationViewModel(gh<_i6.LocalDataSource>()));
    gh.lazySingleton<_i9.AppViewModel>(
        () => _i9.AppViewModel(gh<_i6.LocalDataSource>()));
    gh.lazySingleton<_i10.EncryptStorage>(
        () => _i10.EncryptStorageImpl(gh<_i5.GetStorage>()));
    gh.factory<_i11.HomeViewModel>(
        () => _i11.HomeViewModel(gh<_i6.LocalDataSource>()));
    gh.lazySingleton<_i6.LocalDataSource>(
      () => _i6.LocalDataSourceImpl(gh<_i10.EncryptStorage>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    return this;
  }
}

class _$AppModule extends _i12.AppModule {}
