import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_apps/e_commerce_backend/controller/orders_starts_model.dart';
import 'package:flutter_apps/e_commerce_backend/controller/orders_stats_controller.dart';
import 'package:flutter_apps/e_commerce_backend/screens/order_screen.dart';
import 'package:flutter_apps/e_commerce_backend/screens/product_screen_back.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreenBack extends StatelessWidget {
  HomeScreenBack({Key? key}) : super(key: key);

  final OrderStatsController orderStatsController =
      Get.put(OrderStatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "E-commerce back",
        ),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
                future: orderStatsController.stats.value,
                builder: (BuildContext context,
                    AsyncSnapshot<List<OrderStats>> snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                        padding: EdgeInsets.all(10.0),
                        height: 250,
                        child: CustomBarChart(
                          orderStats: OrderStats.data,
                        ));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  );
                }),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => ProductScreenBack());
                },
                child: Card(
                  child: Center(
                    child: Text("Go to product"),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => OrderScreen());
                },
                child: Card(
                  child: Center(
                    child: Text("Go to orders"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({Key? key, required this.orderStats}) : super(key: key);

  final List<OrderStats> orderStats;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<OrderStats, String>> series = [
      charts.Series(
        id: "orders",
        data: orderStats,
        domainFn: (series, _) =>
            DateFormat.d().format(series.dateTime).toString(),
        //series.index.toString(),
        measureFn: (series, _) => series.orders,
        colorFn: (series, _) => series.barColor!,
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
