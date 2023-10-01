import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deletetx;
  TransactionList(this.transaction, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: transaction.isEmpty
          ? Column(
              children: [
                Center(
                  child: Text(
                    'NO DATA OF TRANSACTION',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/images/wait.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('₹${transaction[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title.toString(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMEd().add_Hm().format(DateTime.now()),
                      style: TextStyle(
                        color: Colors.pinkAccent,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => deletetx(transaction[index].id),
                      icon: Icon(
                        color: Colors.red,
                        Icons.delete,
                      ),
                    ),
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
