// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:network_info_plus/network_info_plus.dart';

// Project imports:
import 'package:android_project/core/interceptor/error_interceptor.dart';
import 'package:android_project/core/interceptor/log_interceptor.dart';

@module
abstract class AppModule {
  @Environment(Environment.dev)
  @lazySingleton
  Dio get injectRetrofitAPI {
    Dio dio = Dio(
      BaseOptions(baseUrl: "", headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      }
          // connectTimeout: 10000,
          // receiveTimeout: 10000,
          // sendTimeout: 10000,
          ),
    );
    // dio.interceptors.add(CertificatePinningInterceptor2(
    //     allowedSHAFingerprints: [
    //       getIt<AppConfig>().certificateFingerprintSHA256
    //     ]));
    if (kDebugMode) {
      dio.interceptors.add(LoggerInterceptor());
      // dio.interceptors.add(PrettyDioLogger(
      //   requestHeader: true,
      //   requestBody: true,
      //   responseHeader: true,
      // ));
    }

    dio.interceptors.add(ErrorInterceptor());

    return dio;
  }

  @Environment(Environment.dev)
  @preResolve
  Future<GetStorage> get initializeGetStorage async {
    // init future olarak tanımladığı için önce init edip sonra objeyi çağrıyoruz.
    var storageName = "";
    await GetStorage.init(storageName);
    return GetStorage(storageName);
  }

  @Environment(Environment.dev)
  @preResolve
  Future<FirebaseApp> get initializeApp {
    WidgetsFlutterBinding.ensureInitialized();
    return Firebase.initializeApp();
  }

  NetworkInfo get networkInfo => NetworkInfo();
}
