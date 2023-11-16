import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:android_project/core/base/base_widget.dart';
import 'package:android_project/app/page/home/home_vm.dart';

@RouteMap()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomeViewModel, HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hoşgeldiniz"),
        ),
        body: const Center(
          child: Text("Selamlar arduino çalışmalarına hoş geldiniz"),
        ));
  }
}
