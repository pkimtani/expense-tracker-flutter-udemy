import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final Function setTransactionDate;
  const DatePicker({required this.setTransactionDate, Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  void _initDatePicker() {
    DateTime today = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(today.year - 50),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = selectedDate;
        widget.setTransactionDate(selectedDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(_selectedDate == null
              ? 'Choose a date'
              : DateFormat.yMMMd().format(_selectedDate!)),
          TextButton(
            onPressed: _initDatePicker,
            child: const Text('Choose date'),
          ),
        ],
      ),
    );
  }
}
