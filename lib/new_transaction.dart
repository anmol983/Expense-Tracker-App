import 'package:flutter/material.dart';
import 'transaction.dart';
import 'transaction_List.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final inputcontroller = TextEditingController();

  final amountController = TextEditingController();
  DateTime? selectedDate;

  void osubmit() {
    final String titleinput = inputcontroller.text;
    final double amountinput = double.parse(amountController.text);
    if (amountController.text.isEmpty) {
      return;
    }

    //titleinput;
    //amountinput;
    if (amountinput <= 0 || titleinput.isEmpty || selectedDate == null) {
      return;
    }
    widget.addtx(titleinput, amountinput, selectedDate);
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickeddate) {
      if (pickeddate == null) {
        return;
      }
      setState(() {
        selectedDate = pickeddate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: inputcontroller,
              onSubmitted: (_) => osubmit(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => osubmit(),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 70.0,
              child: Row(
                children: [
                  Text(
                    selectedDate == null
                        ? 'NO DATE CHOOSEN! '
                        : DateFormat.yMd().format(selectedDate!),
                  ),
                  TextButton(
                    onPressed: presentDatePicker,
                    child: Text('CHOOSE THE DATE'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: osubmit,
              child: Text(
                'ADD TRANSACTION',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
