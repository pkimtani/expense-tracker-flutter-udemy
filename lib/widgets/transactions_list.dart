import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  final _noTransactions =
      Transaction(title: 'No transaction', amount: 0, date: DateTime.now());

  TransactionsList({required this.transactions, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? TransactionItem(
              title: _noTransactions.title,
              amount: _noTransactions.amount,
              date: DateFormat.yMMMd().format(_noTransactions.date),
            )
          : Column(
              children: [
                ...transactions
                    .map((tx) => TransactionItem(
                          title: tx.title,
                          amount: tx.amount,
                          date: DateFormat.yMMMd().format(tx.date),
                        ))
                    .toList()
              ],
            ),
    );
  }
}
