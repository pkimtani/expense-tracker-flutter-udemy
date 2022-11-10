// Core packages
import 'package:flutter/material.dart';

// Third-party packages

// Custom packages
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transactions_list.dart';
import './widgets/weekly_report_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TrackerHome(title: 'Personal expense tracker'),
    );
  }
}

class TrackerHome extends StatefulWidget {
  final String title;

  const TrackerHome({super.key, required this.title});

  @override
  State<TrackerHome> createState() => _TrackerHomeState();
}

class _TrackerHomeState extends State<TrackerHome> {
  final List<Transaction> _transactions = [];

  void _recordNewExpense(String title, double amount, DateTime txDate) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: txDate,
    );

    setState(() {
      _transactions.add(newTx);
    });
    Navigator.pop(context);
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(
            recordTransaction: _recordNewExpense,
          ),
        );
      },
    );
  }

  List<Transaction> get thisWeekTransactions {
    DateTime today = DateTime.now();
    DateTime thisWeek = today.subtract(Duration(days: today.weekday - 1));

    return _transactions.where((tx) => tx.date.isAfter(thisWeek)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              alignment: Alignment.center,
              child: WeeklyReportChart(
                weekTx: thisWeekTransactions,
              )
            ),
            TransactionsList(transactions: _transactions),
          ],
        ),
      ),
      // TODO: make the button visible well. Like a proper FAB
      floatingActionButton: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
