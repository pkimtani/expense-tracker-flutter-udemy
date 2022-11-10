import 'package:flutter/material.dart';

import './date_picker.dart';

// TODO: need styling
// TODO: better alternative?
// ignore: must_be_immutable
class NewTransaction extends StatelessWidget {
  final Function recordTransaction;
  DateTime? transactionDate;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({Key? key, required this.recordTransaction}) : super(key: key);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    recordTransaction(
      enteredTitle,
      enteredAmount,
      transactionDate
    );

    titleController.text = '';
    amountController.text = '';
  }

  void setTransactionDate(txDate) {
    transactionDate = txDate;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: amountController,
            onSubmitted: (_) => submitData(),
          ),
          DatePicker(
            setTransactionDate: setTransactionDate,
          ),
          TextButton(
            style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.purple)),
            onPressed: submitData,
            child: const Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
