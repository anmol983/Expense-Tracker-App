import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';
import 'chartbar.dart';

class chart extends StatelessWidget {
  final List<Transaction> updateTransaction;
  chart(this.updateTransaction);
  List<Map<String, Object>> get groundupdatevale {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalsum = 0.0;
      for (var i = 0; i < updateTransaction.length; i++) {
        if (updateTransaction[i].date?.day == weekday.day &&
            updateTransaction[i].date?.month == weekday.month &&
            updateTransaction[i].date?.year == weekday.year) {
          totalsum += updateTransaction[i].amount!;
        }
      }
      //print(DateFormat.E().format(weekday).substring(0, 1));
      //print(totalsum);
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalsum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groundupdatevale.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(groundupdatevale);
    return Card(
      elevation: 6.0,
      margin: EdgeInsets.all(6.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groundupdatevale.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: chartbar(data['day'] as String, data['amount'] as double,
                  (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
