import 'package:android_project/core/res/colors.dart';
import 'package:android_project/core/res/dimens.dart';
import 'package:android_project/route.routes.dart';
import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:android_project/core/base/base_widget.dart';
import 'package:android_project/app/page/home/home_vm.dart';
import 'package:data_table_2/data_table_2.dart';

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
          actions: [
            IconButton(
                onPressed: () {
                  NotificationRoute().push(context);
                },
                icon: const Icon(Icons.notifications))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(Dimens.s),
                    child: Column(
                      children: [
                        const SizedBox(height: Dimens.s),
                        const Text(
                          "En Son Ölçülen Sıcaklık",
                          style: TextStyle(
                              fontSize: Dimens.m, fontWeight: FontWeight.w600),
                        ),
                        Slider(
                          divisions: 10,
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
                          "Vücut sıcaklığı: ${viewModel.currentValue}",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: Dimens.m),
                Expanded(
                  child: Card(
                    child: Column(
                      children: [
                        const SizedBox(height: Dimens.s),
                        const Text(
                          "Ölçülen Sıcaklıklar",
                          style: TextStyle(
                              fontSize: Dimens.m, fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: DataTable2(columns: const [
                            DataColumn(label: Text("Tarih")),
                            DataColumn(label: Text("Sıcaklıklar")),
                          ], rows: const [
                            DataRow(cells: [
                              DataCell(Text("02.08.2023")),
                              DataCell(Text("38.7 °C")),
                            ]),
                            DataRow(cells: [
                              DataCell(Text("10.09.2023")),
                              DataCell(Text("35.7 °C")),
                            ])
                          ]),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
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
