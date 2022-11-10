import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final double amount;
  final String date;

  const TransactionItem({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: handle more than 4 digits ex 45.54. Probably use flex or find better solution
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: Text(
              '€${amount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
