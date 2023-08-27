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
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'September 2020',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontFamily: 'Averta',
                                    color: AppColors.neutral),
                          ),
                        ),
                      ],
                      onChanged: (val) {},
                    ),
                    Text(
                      "\$${monthlyBudget - remainder}",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 48,
                          color: AppColors.neutral,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              TotalBills(monthlyBudget: monthlyBudget, remainder: remainder),
              const SizedBox(height: 10),
              Bills(
                billIconWidget: 'assets/icons/car.png',
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
              const SizedBox(height: 10),
              Bills(
                billIconWidget: 'assets/icons/receipt-text.png',
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
              ),
              const SizedBox(width: 12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 2),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 2),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar());
  }
}
