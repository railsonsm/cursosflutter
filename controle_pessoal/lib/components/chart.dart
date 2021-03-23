import 'package:controle_pessoal/components/chart_bar.dart';
import 'package:controle_pessoal/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({Key key, this.recentTrasaction}) : super(key: key);

  final List<Transaction> recentTrasaction;

  List<Map<String, Object>> get groupedTransacations {
    return List.generate(7, (index) {
      final weekDaay = DateTime.now().subtract(Duration(days: index));
      double totaSum = recentTrasaction
          .where((e) => e.date.day == weekDaay.day)
          .map((e) => e.value)
          .toList()
          .fold(0, (v1, v2) => v1 + v2);

      return {'day': DateFormat.E().format(weekDaay)[0], 'value': totaSum};
    });
  }

  double get _weekTotalValue {
    return groupedTransacations.fold(
        0.0, (previousValue, element) => previousValue + element['value']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransacations.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr['day'],
                value: tr['value'],
                perc: (tr['value'] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
