import 'package:demo/constants.dart';
import 'package:demo/routes.dart';
import 'package:demo/widgets/bills.dart';
import 'package:demo/widgets/nav_bar.dart';
import 'package:demo/widgets/total_bills.dart';
import 'package:flutter/material.dart';
import '../widgets/expense_item.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  int monthlyBudget = 2550;
  int remainder = 738;
  int transport = 700;
  int utilities = 320;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.navigate_before),
        ),
        title: const Text('Expenses'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Screen.bill.name),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Align(
              child: Column(
                children: [
                  DropdownButton(
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        child: Text(
                          'September 2020',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                    onChanged: (val) {},
                  ),
                  Text(
                    "\$${monthlyBudget - remainder}",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 48, color: AppColors.neutral),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            TotalBills(monthlyBudget: monthlyBudget, remainder: remainder),
            const SizedBox(height: 20),
            Bills(
              billIconWidget: Icons.emoji_transportation_rounded,
              widgetColor: AppColors.primary,
              widgetName: 'Auto & Transport',
              totalBudget: 700,
              expenses: [
                ExpenseItem(
                    expenseItemColor: AppColors.primary,
                    totalAllowance: 350,
                    remainder: 90,
                    expense: 'Auto & Transport'),
                const SizedBox(height: 40),
                ExpenseItem(
                    expenseItemColor: AppColors.primary,
                    totalAllowance: 250,
                    remainder: 120,
                    expense: 'Auto insurance'),
              ],
            ),
            const SizedBox(height: 20),
            Bills(
              billIconWidget: Icons.payment,
              widgetColor: AppColors.secondary,
              widgetName: 'Bills & Utilities',
              totalBudget: 320,
              expenses: [
                ExpenseItem(
                    expenseItemColor: AppColors.secondary,
                    totalAllowance: 52,
                    remainder: 0,
                    expense: 'Subscriptions'),
                const SizedBox(height: 40),
                ExpenseItem(
                    expenseItemColor: AppColors.secondary,
                    totalAllowance: 138,
                    remainder: 10,
                    expense: 'House service'),
                const SizedBox(height: 40),
                ExpenseItem(
                    expenseItemColor: AppColors.secondary,
                    totalAllowance: 130,
                    remainder: 30,
                    expense: 'Maintenance'),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar()
    );
  }
}
