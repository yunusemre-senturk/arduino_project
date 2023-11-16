// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:android_project/core/base/base_view_model.dart';
import 'package:android_project/core/di/locator.dart';

abstract class BaseState<T extends BaseViewModel, P extends StatefulWidget>
    extends State<P> {
  T viewModel = getIt<T>();

  @override
  void initState() {
    viewModel.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}
