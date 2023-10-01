import 'package:flutter/material.dart';

class Transaction {
  String? title;
  double? amount;

  String? id;
  DateTime? date;
  Transaction({this.title, this.amount, this.id, this.date});
}
