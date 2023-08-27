import 'package:demo/screens/bill_page.dart';
import 'package:demo/screens/test_area.dart';
import 'package:flutter/material.dart';
import 'screens/credit_score.dart';
import 'screens/expenses.dart';
import 'screens/signup.dart';

enum Screen { auth, expenses, bill, score, testarea }

class Screens {
  final Map<String, Widget Function(BuildContext)> _routes = {
    Screen.auth.name : (context) => const SignIn(),
    Screen.expenses.name: (context) => const Expenses(),
    Screen.bill.name: (context) => const BillsPage(),
    Screen.score.name: (context) => CreditScore(),
    Screen.testarea.name: (context) => const TestArea()
  };

  Map<String, Widget Function(BuildContext)> get routes => _routes;
}