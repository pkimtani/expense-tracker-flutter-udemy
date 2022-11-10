import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String xAxisLabel;
  final double valueToDisplay;
  final double fillPercentage;

  const ChartBar({
    required this.xAxisLabel,
    required this.valueToDisplay,
    required this.fillPercentage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(valueToDisplay.toStringAsFixed(2)),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 80,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: const Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: fillPercentage / 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(xAxisLabel),
      ],
    );
  }
}
