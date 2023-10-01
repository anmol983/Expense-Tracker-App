import 'package:expenses_app/chart.dart';
import 'package:flutter/material.dart';

class chartbar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingpctoftotal;
  chartbar(this.label, this.spendingAmount, this.spendingpctoftotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20.0,
            child: FittedBox(
                child: Text('₹${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4.0,
        ),
        Container(
          height: 60.0,
          width: 10.0,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingpctoftotal.clamp(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(label),
      ],
    );
  }
}
