class Transaction {
  int id = 0;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({ required this.title, required this.amount, required this.date });
}