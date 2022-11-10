import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

// TODO: any workaround?
// ignore: must_be_immutable
class WeeklyReportChart extends StatelessWidget {
  List<Transaction> weeklyTransactions = [];
  double _totalTxValue = 0;

  WeeklyReportChart({required List<Transaction> weekTx, super.key}) {
    weeklyTransactions = weekTx;

    for (var tx in weeklyTransactions) {
      _totalTxValue += tx.amount;
    }
  }

  Map<String, List<Transaction>> get sortedAndGroupedWeeklyTransactions {
    weeklyTransactions.sort((a, b) => a.date.compareTo(b.date));
    Map<String, List<Transaction>> groupedWeeklyTransactions = {
      'Mon': [],
      'Tue': [],
      'Wed': [],
      'Thu': [],
      'Fri': [],
      'Sat': [],
      'Sun': [],
    };

    for (var tx in weeklyTransactions) {
      final String weekDay = DateFormat.E().format(tx.date);
      groupedWeeklyTransactions[weekDay]?.add(tx);
    }

    return groupedWeeklyTransactions;
  }

  double getTotalForTxs(List<Transaction> txs) {
    double tot = 0;
    txs.map((e) => tot += e.amount).toList();
    return tot;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 6,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: const Text(
              'This week',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...sortedAndGroupedWeeklyTransactions.entries.map((e) {
                return ChartBar(
                  xAxisLabel: e.key,
                  valueToDisplay: getTotalForTxs(e.value),
                  fillPercentage: (_totalTxValue > 0 ? getTotalForTxs(e.value) / _totalTxValue : 0),
                );
              }).toList(),
            ],
          ),
        ],
      ),
    );
  }
}
