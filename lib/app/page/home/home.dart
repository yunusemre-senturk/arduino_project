import 'package:android_project/core/res/dimens.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.s),
                  child: Column(
                    children: [
                      const Text("Vücut Sıcaklığı ayarla"),
                      Slider(
                        divisions: 6,
                        max: 42,
                        min: 34,
                        value: viewModel.currentValue,
                        onChanged: (value) {
                          setState(() {
                            viewModel.setValue(value);
                          });
                        },
                      ),
                      Divider(
                          color:
                              getColorForTemperature(viewModel.currentValue)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                          "Vücut sıcaklığı: ${viewModel.currentValue.round()}"),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: Dimens.s,
                    mainAxisSpacing: Dimens.s),
                children: const [
                  Card(
                    child: Center(
                      child: Text("Bildirimler"),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text("Veri tablosu"),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text("Kamera"),
                    ),
                  )
                ],
              ))
            ],
          ),
        ));
  }
}

Color getColorForTemperature(double temperature) {
  if (temperature >= 34 && temperature < 36) {
    // Mavi ile yeşil arasında geçiş
    double normalizedTemperature = (temperature - 34) / (36 - 34);
    return Color.lerp(Colors.blue, Colors.green, normalizedTemperature)!;
  } else if (temperature >= 36 && temperature < 38) {
    // Yeşil ile turuncu arasında geçiş
    double normalizedTemperature = (temperature - 36) / (38 - 36);
    return Color.lerp(Colors.green, Colors.orange, normalizedTemperature)!;
  } else if (temperature >= 38 && temperature < 40) {
    // Turuncu
    double normalizedTemperature = (temperature - 39) / (42 - 39);
    return Color.lerp(Colors.orange, Colors.red, normalizedTemperature)!;
  } else if (temperature >= 39 && temperature <= 42) {
    // Turuncu ile kırmızı arasında geçiş
    return Colors.red;
  } else {
    // Varsayılan renk
    return Colors.transparent;
  }
}
