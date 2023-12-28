import 'package:android_project/app/data/model/notification_controller.dart';
import 'package:android_project/app/data/model/tempeture/tempeture.dart';
import 'package:android_project/core/res/dimens.dart';
import 'package:firebase_database/firebase_database.dart';
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

//TODO Yapılacaklar .::.  Tarih set etmeyi ayarla ||  Bildirim kısmına bak || Derecenin doğruluğunu bul bir şekilde
//TODO Yapılacaklar .::.  Lcd ekranı bağla || Sliderın renklerini gelen veriye göre güncelle || Verileri tek bir satıra değil alt alta eklemeyi öğren
class _HomePageState extends BaseState<HomeViewModel, HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hoşgeldiniz"),
          actions: [
            IconButton(
                onPressed: () async {
                  await NotificationService.showNotification(
                      title: "Selamlar", body: "İlk bildirim");
                  /* NotificationRoute().push(context); */
                },
                icon: const Icon(Icons.notifications))
          ],
        ),
        body: StreamBuilder<DatabaseEvent>(
            stream: FirebaseDatabase.instance.ref("Tempeture/value").onValue,
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                Map<Object?, Object?> data =
                    snapshot.data!.snapshot.value as Map<Object?, Object?>;
                viewModel.setTemp(Tempeture(
                    data['deviceuid'] as String,
                    data['location'] as String,
                    data['type'] as String,
                    data['value'] as double));
                viewModel.setDate();
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 8),
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
                                      fontSize: Dimens.m,
                                      fontWeight: FontWeight.w600),
                                ),
                                Slider(
                                  divisions: 10,
                                  max: 42,
                                  min: 20,
                                  value: viewModel.tempeture!.value!,
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.setValue(value);
                                      if (viewModel.tempeture!.value! > 38) {
                                        NotificationService.showNotification(
                                            title: "Çok sıcak çok sıcakk",
                                            body: "Yanıyorum su getirr");
                                      }
                                    });
                                  },
                                ),
                                Divider(
                                    color: getColorForTemperature(
                                        viewModel.tempeture!.value!)),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Vücut sıcaklığı: ${viewModel.tempeture!.value!}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
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
                                      fontSize: Dimens.m,
                                      fontWeight: FontWeight.w600),
                                ),
                                Expanded(
                                  child: DataTable2(columns: const [
                                    DataColumn(label: Text("Tarih")),
                                    DataColumn(label: Text("Sıcaklıklar")),
                                  ], rows: [
                                    DataRow(cells: [
                                      const DataCell(Text("02.08.2023")),
                                      DataCell(Text(
                                          "${viewModel.tempeture?.value} °C")),
                                    ]),
                                    const DataRow(cells: [
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
                );
              } else {
                return const Center(
                  child: Text("Loading"),
                );
              }
            }));
  }
}

Color getColorForTemperature(double temperature) {
  if (temperature >= 20 && temperature < 36) {
    // Mavi ile yeşil arasında geçiş
    double normalizedTemperature = (temperature - 20) / (36 - 20);
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
