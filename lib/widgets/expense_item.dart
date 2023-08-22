import 'package:flutter/material.dart';

import '../constants.dart';

class ExpenseItem extends StatelessWidget {
  final Color expenseItemColor;
  final String expense;
  final int totalAllowance;
  final int remainder;

  const ExpenseItem(
      {super.key,
      required this.expenseItemColor,
      required this.totalAllowance,
      required this.remainder,
      required this.expense,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 222,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.neutral,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                  color: expenseItemColor,
                  value: (totalAllowance - remainder) / totalAllowance,
                  backgroundColor: AppColors.neutralLight1)
            ],
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$$totalAllowance',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.neutral,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'Left \$$remainder',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColors.neutralLight3, fontSize: 12),
              ),
            ],
          ),
        )
      ],
    );
  }
}
