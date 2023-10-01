import 'package:flutter/material.dart';
import 'transaction.dart';
// import 'package:intl/intl.dart';
import 'transaction_List.dart';
import 'new_transaction.dart';
import 'chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          cardColor: Colors.white70,
          primarySwatch: Colors.purple,
          appBarTheme: AppBarTheme(
            shadowColor: Color(0xFF1111),
            color: Colors.black,
          )),
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final List<Transaction> userTransaction = [];
  List<Transaction> get recentTransaction {
    return userTransaction.where((tx) {
      return tx.date!.isAfter(
        DateTime.now().subtract(const Duration(days: 7)),
      );
    }).toList();
  }

  void addnew(String title, double amount, DateTime choosenDate) {
    final nwtx = Transaction(
      title: title,
      amount: amount,
      date: choosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      userTransaction.add(nwtx);
    });
  }

  void newtransactionpage(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(addnew));
        });
  }

  void deleteTransaction(String id) {
    setState(() {
      userTransaction.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              newtransactionpage(context);
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
        title: Text(
          'EXPENSES',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            chart(recentTransaction),
            TransactionList(userTransaction, deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newtransactionpage(context);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
